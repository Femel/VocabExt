﻿using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using VX.Domain;
using VX.Domain.DataContracts.Interfaces;
using VX.Model;
using VX.Service.Factories.Interfaces;
using VX.Service.Infrastructure.Interfaces;
using VX.Service.Repositories.Interfaces;

namespace VX.Service.Repositories
{
    public class VocabBanksRepository : RepositoryBase, IVocabBanksRepository
    {
        private const string ServiceName = "vocabBanksRepositoy";
        private const string TagsQueryPath = "VocabBanksTags.Tag";

        public VocabBanksRepository(
            IServiceSettings serviceSettings, 
            IEntitiesFactory entitiesFactory, 
            ICacheFacade cacheFacade, 
            ICacheKeyFactory cacheKeyFactory,
            IServiceOperationResponseFactory serviceOperationResponseFactory,
            IInputDataConverter inputDataConverter) 
            : base(serviceSettings, entitiesFactory, cacheFacade, cacheKeyFactory, serviceOperationResponseFactory, inputDataConverter)
        {
        }

        public IList<IVocabBank> GetVocabBanks()
        {
            var cacheKey = CacheKeyFactory.BuildKey(ServiceName, string.Empty);
            Func<ObjectSet<VocabBank>, IList<IVocabBank>> retrievingFunction = 
                vocabBanks => vocabBanks
                    .ToList()
                    .Select(entity => EntitiesFactory.BuildVocabBank(entity))
                    .ToList();
            
            return GetMultipleBanks(cacheKey, retrievingFunction, true);
        }

        public IList<IVocabBank> GetVocabBanks(int[] vocabBanksIds)
        {
            var cacheKey = CacheKeyFactory.BuildKey(ServiceName, vocabBanksIds);
            Func<ObjectSet<VocabBank>, IList<IVocabBank>> retrievingFunction =
                vocabBanks => vocabBanks
                                  .Where(bank => vocabBanksIds.Contains(bank.Id))
                                  .ToList()
                                  .Select(entity => EntitiesFactory.BuildVocabBank(entity))
                                  .ToList();

            return GetMultipleBanks(cacheKey, retrievingFunction, true);
        }

        public IList<IVocabBank> GetVocabBanksList()
        {
            var cacheKey = CacheKeyFactory.BuildKey(ServiceName, string.Empty);
            Func<ObjectSet<VocabBank>, IList<IVocabBank>> retrievingFunction =
                vocabBanks => vocabBanks.Include(TagsQueryPath)
                    .ToList()
                    .Select(bank => EntitiesFactory.BuildVocabBank(bank))
                    .ToList();

            return GetMultipleBanks(cacheKey, retrievingFunction, false);
        }

        public IServiceOperationResponse DetachTranslation(int vocabBankId, int translationId)
        {
            using (var context = new Entities(ServiceSettings.ConnectionString))
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
                    return ServiceOperationResponseFactory.Build(false, "item not found");
                }

                return ServiceOperationResponseFactory.Build(true, string.Empty);
            }
        }

        public IServiceOperationResponse AttachTranslation(int vocabBankId, int translationId)
        {
            using (var context = new Entities(ServiceSettings.ConnectionString))
            {
                var translationToAttach = context.VocabBanksTranslations.CreateObject<VocabBanksTranslation>();
                translationToAttach.VocabularyId = vocabBankId;
                translationToAttach.TranslationId = translationId;
                context.VocabBanksTranslations.AddObject(translationToAttach);
                context.SaveChanges();
            }

            return ServiceOperationResponseFactory.Build(true, string.Empty);
        }

        private IList<IVocabBank> GetMultipleBanks(
            string cacheKey, 
            Func<ObjectSet<VocabBank>, IList<IVocabBank>> retrievingFunction,
            bool useLazyLoading)
        {
            IList<IVocabBank> result;
            if (!CacheFacade.GetFromCache(cacheKey, out result))
            {
                using (var context = new Entities(ServiceSettings.ConnectionString))
                {
                    context.ContextOptions.LazyLoadingEnabled = useLazyLoading;
                    result = retrievingFunction(context.VocabBanks);
                }

                CacheFacade.PutIntoCache(result, cacheKey);
            }
            
            return result;
        }
    }
}