﻿using System.Collections.Generic;
using System.Linq;
using VX.Domain;
using VX.Domain.DataContracts.Interfaces;
using VX.Service.Factories.Interfaces;
using VX.Service.Infrastructure.Interfaces;
using VX.Service.Repositories.Interfaces;

namespace VX.Service.Repositories
{
    public class VocabBanksRepository : IVocabBanksRepository
    {
        private readonly IServiceSettings serviceSettings;
        private readonly IEntitiesFactory entitiesFactory;
        
        public VocabBanksRepository(
            IServiceSettings serviceSettings,
            IEntitiesFactory entitiesFactory)
        {
            this.serviceSettings = serviceSettings;
            this.entitiesFactory = entitiesFactory;
        }

        public IList<IVocabBank> GetVocabBanks()
        {
            IList<IVocabBank> result;
            using (Entities context = new Entities(serviceSettings.ConnectionString))
            {
                result = context.VocabBanks
                    .ToList()
                    .Select(entity => entitiesFactory.BuildVocabBank(entity))
                    .ToList();
            }

            return result;
        }

        public IVocabBank GetVocabBank(int vocabularyId)
        {
            IVocabBank result;
            using(Entities context = new Entities(serviceSettings.ConnectionString))
            {
                result = context.VocabBanks.Where(item => item.Id == vocabularyId)
                    .Select(entity => entitiesFactory.BuildVocabBank(entity))
                    .FirstOrDefault();
            }
            return result;
        }
    }
}