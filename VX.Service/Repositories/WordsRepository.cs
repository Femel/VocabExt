﻿using System;
using System.Collections.Generic;
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
using VX.Service.Validators.Interfaces;

namespace VX.Service.Repositories
{
    [RegisterService]
    public class WordsRepository : RepositoryBase, IWordsRepository
    {
        private readonly ISearchStringBuilder searchStringBuilder;
        private readonly IWordValidator wordValidator;

        public WordsRepository(
            IContextFactory contextFactory, 
            IAbstractFactory factory, 
            ICacheFacade cacheFacade, 
            ICacheKeyFactory cacheKeyFactory, 
            ISearchStringBuilder searchStringBuilder,
            IWordValidator wordValidator) : base(contextFactory, factory, cacheFacade, cacheKeyFactory)
        {
            this.searchStringBuilder = searchStringBuilder;
            this.wordValidator = wordValidator;
        }

        public IList<IWord> GetWords(string searchString)
        {
            List<IWord> result;
            var cacheKey = CacheKeyFactory.BuildKey("WordsRepository.GetWords", searchString);
            if (!CacheFacade.GetFromCache(cacheKey, out result))
            {
                var actualSearchString = searchStringBuilder.BuildSearchString(searchString);
                if (!string.IsNullOrEmpty(actualSearchString))
                {
                    using (EntitiesContext context = ContextFactory.Build())
                    {
                        result = context.Words
                            .Where(word => word.Spelling.StartsWith(actualSearchString))
                            .ToList()
                            .Select(item => Factory.Create<IWord, Word>(item))
                            .ToList();
                    }
                }
                else
                {
                    result = new List<IWord>();
                }

                CacheFacade.PutIntoCache(result, cacheKey, new[] {"Words"});
            }
            
            return result;
        }

        public IWord GetWord(int id)
        {
            var cacheKey = CacheKeyFactory.BuildKey("WordsRepository.GetWord", id);
            Func<EntitiesContext, int, IWord> retrievalFunction = (context, parameter) => Factory.Create<IWord, Word>(
                context.Words.FirstOrDefault(item => item.Id == id));

            return Retrieve(retrievalFunction, cacheKey, id);
        }

        public bool CheckWordExists(string spelling)
        {
            var cacheKey = CacheKeyFactory.BuildKey("WordsRepository.CheckWord", spelling);
            Func<EntitiesContext, string, bool> retrievalFunction = (context, parameter) => 
                context.Words.FirstOrDefault(item => item.Spelling == spelling) != null;
            
            return Retrieve(retrievalFunction, cacheKey, spelling);
        }

        public IServiceOperationResponse SaveWord(IWord word)
        {
            var validationResult = wordValidator.Validate(word, this);
            if (!validationResult.Status)
            {
                return validationResult;
            }

            using (EntitiesContext context = ContextFactory.Build())
            {
                var newWord = context.Words.CreateObject();
                newWord.LanguageId = word.Language.Id;
                newWord.Spelling = word.Spelling;
                newWord.Transcription = word.Transcription;
                context.Words.AddObject(newWord);
                context.SaveChanges();
                return Factory.Create<IServiceOperationResponse>(
                    true, 
                    ServiceOperationAction.Create, 
                    newWord.Id.ToString(CultureInfo.InvariantCulture));
            }
        }

        private TResult Retrieve<TParameter, TResult>(Func<EntitiesContext, TParameter, TResult> retrievalFunction, string cacheKey, TParameter parameter)
        {
            TResult result;
            if (!CacheFacade.GetFromCache(cacheKey, out result))
            {
                using (var context = ContextFactory.Build())
                {
                    result = retrievalFunction(context, parameter);
                }

                CacheFacade.PutIntoCache(result, cacheKey, new[] {"Words"});
            }

            return result;
        }
    }
}