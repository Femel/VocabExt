﻿using System.Collections.Generic;
using System.Linq;
using VX.Domain;
using VX.Domain.DataContracts;
using VX.Domain.DataContracts.Interfaces;
using VX.Model;
using VX.Service.Factories.Interfaces;

namespace VX.Service.Factories
{
    public class EntitiesFactory : IEntitiesFactory
    {
        public ILanguage BuildLanguage(Language language)
        {
            return language == null
                       ? null
                       : new LanguageContract
                             {
                                 Id = language.Id,
                                 Name = language.Name,
                                 Abbreviation = language.Abbreviation
                             };
        }

        public ILanguage BuildLanguage(IDictionary<string, object> language)
        {
            return new LanguageContract
                       {
                           Id = (int) language["Id"],
                           Name = language["Name"].ToString(),
                           Abbreviation = language["Abbreviation"].ToString()
                       };
        }

        public IWord BuildWord(Word word)
        {
            return word == null
                       ? null
                       : new WordContract
                             {
                                 Id = word.Id,
                                 Spelling = word.Spelling,
                                 Transcription = word.Transcription,
                                 Language = BuildLanguage(word.Language)
                             };
        }

        public IWord BuildWord(IDictionary<string, object> word)
        {
            const string idKey = "Id";
            const string spellingKey = "Spelling";
            const string transciptionKey = "Transcription";
            const string languageKey = "Language";

            return new WordContract
            {
                Id = word.ContainsKey(idKey) 
                    ? (int)word[idKey] 
                    : -1,
                Spelling = word.ContainsKey(spellingKey) 
                    ? word[spellingKey].ToString()
                    : null,
                Transcription = word.ContainsKey(transciptionKey) 
                    ? word[transciptionKey].ToString() 
                    : null,
                Language = word.ContainsKey(languageKey) 
                    ? BuildLanguage((IDictionary<string, object>)word[languageKey])
                    : null
            };
        }

        public ITranslation BuildTranslation(IDictionary<string, object> translation)
        {
            return new TranslationContract
                    {
                        Id = (int)translation["Id"],
                        Source = BuildWord((IDictionary<string, object>)translation["Source"]),
                        Target = BuildWord((IDictionary<string, object>)translation["Target"])
                    };
        }

        public ITranslation BuildTranslation(Translation translation)
        {
            return translation == null
                       ? null
                       : new TranslationContract
                             {
                                 Id = translation.Id,
                                 Source = BuildWord(translation.Source),
                                 Target = BuildWord(translation.Target)
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
                                 Tags = vocabBank.VocabBanksTags
                                    .Select(item => BuildTag(item.Tag))
                                    .ToList(),
                                 Translations = vocabBank.VocabBanksTranslations
                                    .Select(item => BuildTranslation(item.Translation))
                                    .ToList()
                             };
        }

        public IVocabBank BuildVocabBankHeaders(IDictionary<string, object> vocabBank)
        {
            return new VocabBankContract
                       {
                           Id = (int)vocabBank["VocabBankId"],
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
            return tag == null
                       ? null
                       : new TagContract
                             {
                                 Id = tag.Id,
                                 Name = tag.Name,
                                 Description = tag.Description
                             };
        }
    }
}