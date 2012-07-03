﻿using System.Collections.Generic;
using System.IO;
using Autofac;
using VX.Domain.DataContracts.Interfaces;
using VX.Service.Factories.Interfaces;
using VX.Service.Infrastructure.Interfaces;
using VX.Service.Repositories.Interfaces;

namespace VX.Service
{
    public class VocabExtService : IVocabExtService
    {
        private readonly ITasksFactory tasksFactory;
        private readonly IVocabBanksRepository vocabBanksRepository;
        private readonly ITranslationsRepository translationsRepository;
        private readonly IWordsRepository wordsRepository;
        private readonly IServiceSettings serviceSettings;
        private readonly IInputDataConverter inputDataConverter;

        public VocabExtService()
        {
            tasksFactory = Initializer.Container.Resolve<ITasksFactory>();
            vocabBanksRepository = Initializer.Container.Resolve<IVocabBanksRepository>();
            translationsRepository = Initializer.Container.Resolve<ITranslationsRepository>();
            serviceSettings = Initializer.Container.Resolve<IServiceSettings>();
            wordsRepository = Initializer.Container.Resolve<IWordsRepository>();
            inputDataConverter = Initializer.Container.Resolve<IInputDataConverter>();
        }

        public ITask GetTask()
        {
            var vocabBanks = vocabBanksRepository.GetVocabBanks();
            return tasksFactory.BuildTask(vocabBanks);
        }

        public IList<ITask> GetTasks()
        {
            var vocabBanks = vocabBanksRepository.GetVocabBanks();
            return tasksFactory.BuildTasks(vocabBanks, serviceSettings.DefaultTasksCount);
        }

        public IList<ITask> GetTasks(int[] vocabBanksIds)
        {
            var vocabBanks = vocabBanksRepository.GetVocabBanks(vocabBanksIds);
            return tasksFactory.BuildTasks(vocabBanks, serviceSettings.DefaultTasksCount);
        }

        public IList<IVocabBank> GetVocabBanksList()
        {
            return vocabBanksRepository.GetVocabBanksList();
        }

        public IList<ITranslation> GetTranslations(string vocabBankId)
        {
            return translationsRepository.GetTranslations(inputDataConverter.Convert(vocabBankId));
        }

        public IList<IWord> GetWords(string searchString)
        {
            return wordsRepository.GetWords(searchString);
        }

        public IServiceOperationResponse UpdateTranslation(Stream data)
        {
            return translationsRepository.UpdateTranslation(inputDataConverter.Convert(data));
        }

        public IServiceOperationResponse DetachTranslation(Stream data)
        {
            var parsedPair = inputDataConverter.ParsePair(data);
            // TODO: think of moving mapping login to somewhere else
            return vocabBanksRepository.DetachTranslation(
                parsedPair["vocabbank"], 
                parsedPair["translation"]);
        }
    }
}
