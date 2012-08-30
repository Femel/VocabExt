﻿using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Globalization;
using System.Linq;
using VX.Domain.Entities;
using VX.Domain.Surrogates;
using VX.Model;
using VX.Service.Infrastructure.Factories;
using VX.Service.Infrastructure.Factories.CacheKeys;
using VX.Service.Infrastructure.Factories.Context;
using VX.Service.Infrastructure.Interfaces;
using VX.Service.Repositories.Interfaces;

namespace VX.Service.Repositories
{
    public class VocabBanksRepository : RepositoryBase, IVocabBanksRepository
    {
        private const string ServiceName = "vocabBanksRepositoy";
        private const string TagsQueryPath = "VocabBanksTags.Tag";

        public VocabBanksRepository(
            IContextFactory contextFactory, 
            IAbstractFactory factory, 
            ICacheFacade cacheFacade, 
            ICacheKeyFactory cacheKeyFactory
            ) : base(contextFactory, factory, cacheFacade, cacheKeyFactory)
        {
        }

        public string NewVocabBankName
        {
            get { return "New Vocab Bank"; }
        }

        public IList<IVocabBank> Get()
        {
            return Get(new int[] {}, true);
        }

        public IList<IVocabBank> GetWithTranslationsOnly()
        {
            return Get(new int[] {}, false);
        }

        public IList<IVocabBank> Get(int[] vocabBanksIds)
        {
            return Get(vocabBanksIds, true);
        }

        public IList<IVocabBank> GetWithTranslationsOnly(int[] vocabBanksIds)
        {
            return Get(vocabBanksIds, false);
        }

        public IList<IVocabBank> GetListWithoutTranslations()
        {
            var cacheKey = CacheKeyFactory.BuildKey(ServiceName, string.Empty);
            Func<ObjectSet<VocabBank>, IList<IVocabBank>> retrievingFunction =
                vocabBanks => vocabBanks.Include(TagsQueryPath)
                    .ToList()
                    .Select(bank => Factory.Create<IVocabBank, VocabBank>(bank))
                    .ToList();

            return GetMultipleBanks(cacheKey, retrievingFunction, false);
        }

        public IVocabBank Create()
        {
            IVocabBank result;
            using (var context = ContextFactory.Build())
            {
                var newVocabBank = context.VocabBanks.CreateObject();
                newVocabBank.Name = NewVocabBankName;
                context.VocabBanks.AddObject(newVocabBank);
                context.SaveChanges();
                result = Factory.Create<IVocabBank, VocabBank>(newVocabBank);
            }

            return result;
        }

        public IServiceOperationResponse Delete(int vocabBankId)
        {
            IServiceOperationResponse result;
            using (var context = ContextFactory.Build())
            {
                var bankToDelete = context.VocabBanks.FirstOrDefault(item => item.Id == vocabBankId);
                if (bankToDelete != null)
                {
                    context.VocabBanks.DeleteObject(bankToDelete);
                    context.SaveChanges();
                    result = Factory.Create<IServiceOperationResponse>(
                        true, 
                        ServiceOperationAction.Delete, 
                        vocabBankId.ToString(CultureInfo.InvariantCulture));
                }
                else
                {
                    result = Factory.Create<IServiceOperationResponse>(
                        false,
                        ServiceOperationAction.Delete,
                        "Vocabulary bank is not found");
                }
            }

            return result;
        }

        public IServiceOperationResponse UpdateHeaders(IVocabBank vocabBank)
        {
            using (var context = ContextFactory.Build())
            {
                var bankToUpdate = context.VocabBanks.FirstOrDefault(bank => bank.Id == vocabBank.Id);
                if (bankToUpdate != null)
                {
                    bankToUpdate.Name = vocabBank.Name;
                    bankToUpdate.Description = vocabBank.Description;
                    context.SaveChanges();
                }
            }

            return Factory.Create<IServiceOperationResponse>(true, ServiceOperationAction.Update);
        }

        public IServiceOperationResponse DetachTranslation(int vocabBankId, int translationId)
        {
            using (var context = ContextFactory.Build())
            {
                try
                {
                    context.VocabBanksTranslations.DeleteObject(
                        context.VocabBanksTranslations.FirstOrDefault(
                            item => item.VocabularyId == vocabBankId && item.TranslationId == translationId));
                    context.SaveChanges();
                }
                catch(Exception)
                {
                    return Factory.Create<IServiceOperationResponse>(
                        false, 
                        ServiceOperationAction.Detach, 
                        "item not found");
                }

                return Factory.Create<IServiceOperationResponse>(
                    true, 
                    ServiceOperationAction.Detach, 
                    "detached successfully");
            }
        }

        public IServiceOperationResponse AttachTranslation(int vocabBankId, int translationId)
        {
            var action = ServiceOperationAction.None;
            using (var context = ContextFactory.Build())
            {
                var translation =
                    context.VocabBanksTranslations.FirstOrDefault(
                        item => item.VocabularyId == vocabBankId && item.TranslationId == translationId);
                if (translation == null)
                {
                    action = ServiceOperationAction.Attach;
                    translation = context.VocabBanksTranslations.CreateObject<VocabBanksTranslation>();
                    translation.VocabularyId = vocabBankId;
                    translation.TranslationId = translationId;
                    context.VocabBanksTranslations.AddObject(translation);
                    context.SaveChanges();
                }
            }

            return Factory.Create<IServiceOperationResponse>(true, action);
        }

        private IList<IVocabBank> Get(int[] vocabBanksIds, bool keepEmptyTranslations)
        {
            var cacheKey = CacheKeyFactory.BuildKey(ServiceName, vocabBanksIds, keepEmptyTranslations);
            Func<VocabBank, bool> emptyTranslationsFilterExpression = 
                bank => keepEmptyTranslations || (bank.VocabBanksTranslations.Any());

            Func<ObjectSet<VocabBank>, IList<IVocabBank>> retrievingFunction;
            if (vocabBanksIds.Any())
            {
                retrievingFunction = vocabBanks => vocabBanks
                                                       .Where(bank => vocabBanksIds.Contains(bank.Id))
                                                       .ToList()
                                                       .Where(emptyTranslationsFilterExpression)
                                                       .Select(entity => Factory.Create<IVocabBank, VocabBank>(entity))
                                                       .ToList();
            }
            else
            {
                retrievingFunction = vocabBanks => vocabBanks
                                                       .ToList()
                                                       .Where(emptyTranslationsFilterExpression)
                                                       .Select(entity => Factory.Create<IVocabBank, VocabBank>(entity))
                                                       .ToList();
            }

            return GetMultipleBanks(cacheKey, retrievingFunction, true);
        }

        private IList<IVocabBank> GetMultipleBanks(
            string cacheKey, 
            Func<ObjectSet<VocabBank>, IList<IVocabBank>> retrievingFunction,
            bool useLazyLoading)
        {
            IList<IVocabBank> result;
            if (!CacheFacade.GetFromCache(cacheKey, out result))
            {
                using (var context = ContextFactory.Build())
                {
                    context.ContextOptions.LazyLoadingEnabled = useLazyLoading;
                    result = retrievingFunction(context.VocabBanks);
                }

                CacheFacade.PutIntoCache(result, cacheKey, new[] { "VocabBanks" });
            }
            
            return result;
        }
    }
}