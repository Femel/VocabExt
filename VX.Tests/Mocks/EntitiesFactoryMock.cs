﻿using System.Collections.Generic;
using VX.Domain;
using VX.Domain.DataContracts;
using VX.Domain.DataContracts.Interfaces;
using VX.Model;
using VX.Service.Factories.Interfaces;

namespace VX.Tests.Mocks
{
    public class EntitiesFactoryMock : IEntitiesFactory
    {
        public ILanguage BuildLanguage(Language language)
        {
            return language == null
                       ? null
                       : new LanguageContract();

        }

        public ILanguage BuildLanguage(IDictionary<string, object> language)
        {
            return new LanguageContract
            {
                Id = (int)language["Id"],
                Name = language["Name"].ToString(),
                Abbreviation = language["Abbreviation"].ToString()
            };
        }

        public IWord BuildWord(IDictionary<string, object> word)
        {
            return new WordContract
            {
                Id = (int)word["Id"],
                Spelling = word["Spelling"].ToString(),
                Transcription = word["Transcription"].ToString(),
                Language = BuildLanguage((IDictionary<string, object>)word["Language"])
            };
        }

        public IWord BuildWord(Word word)
        {
            return word == null
                       ? null
                       : new WordContract
                             {
                                 Id = word.Id,
                                 Spelling = word.Spelling
                             };
        }

        public ITranslation BuildTranslation(IDictionary<string, object> translation)
        {
            throw new System.NotImplementedException();
        }

        public ITranslation BuildTranslation(Translation translation)
        {
            return translation == null
                       ? null
                       : new TranslationContract
                             {
                                 Id = translation.Id,
                                 Source = new WordContract
                                              {
                                                  Id = translation.Source.Id
                                              },
                                 Target = new WordContract
                                              {
                                                  Id = translation.Target.Id
                                              }
                             };
        }

        public IVocabBank BuildVocabBank(VocabBank vocabBank)
        {
            return vocabBank == null
                       ? null
                       : new VocabBankContract
                             {
                                 Id = vocabBank.Id,
                                 Name = vocabBank.Name,
                                 Description = vocabBank.Description,
                                 Tags =
                                     vocabBank.VocabBanksTags.Count == 0
                                         ? new List<ITag>()
                                         : new List<ITag> {new TagContract()},
                                 Translations =
                                     vocabBank.VocabBanksTranslations.Count == 0
                                         ? new List<ITranslation>()
                                         : new List<ITranslation> {new TranslationContract()}
                             };
        }

        public IVocabBank BuildVocabBankHeaders(IDictionary<string, object> vocabBank)
        {
            return new VocabBankContract
                       {
                           Name = vocabBank["Name"].ToString(),
                           Description = vocabBank["Description"].ToString()
                       };
        }

        public IManyToManyRelationship BuildManyToManyRelationship(int id, int sourceId, int targetId)
        {
            return new ManyToManyRelationship
                       {
                           Id = id,
                           SourceId = sourceId,
                           TargetId = targetId
                       };
        }

        public ITag BuildTag(Tag tag)
        {
            throw new System.NotImplementedException();
        }
    }
}