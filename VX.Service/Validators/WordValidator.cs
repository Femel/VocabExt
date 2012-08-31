﻿using System;
using VX.Domain.Entities;
using VX.Domain.Surrogates;
using VX.Service.Infrastructure.Factories;
using VX.Service.Repositories.Interfaces;
using VX.Service.Validators.Interfaces;

namespace VX.Service.Validators
{
    [RegisterService]
    public class WordValidator : ValidatorBase, IWordValidator
    {
        private readonly ILanguagesRepository languagesRepository;

        private const string EmptyWordErrorCode = "0";
        private const string EmptySpellingErrorCode = "1";
        private const string WrongLanguageErrorCode = "2";
        private const string WordAlreadyExistsErrorCode = "3";

        public WordValidator(IAbstractFactory factory, ILanguagesRepository languagesRepository) : base(factory)
        {
            this.languagesRepository = languagesRepository;
        }

        public IServiceOperationResponse ValidateExist(IWord word, IWordsRepository wordsRepository)
        {
            Func<IWord, IServiceOperationResponse> validationFunction =
                parameter =>
                    {
                        if (wordsRepository.GetWord(parameter.Id) == null)
                        {
                            return wordsRepository.CheckWordExists(parameter.Spelling)
                                       ? BuildWordExistsResponse()
                                       : BuildValidationPassedResponse();
                        }

                        return BuildWordExistsResponse();
                    };

            return PerformValidation(validationFunction, word);
        }

        public IServiceOperationResponse ValidateSpelling(IWord word)
        {
            Func<IWord, IServiceOperationResponse> validationFunction =
                parameter =>
                    {
                        if (parameter.Spelling != null)
                        {
                            if (parameter.Spelling.Trim() != string.Empty)
                            {
                                return BuildValidationPassedResponse();
                            }
                        }

                        return BuildEmptySpellingResponse();
                    };

            return PerformValidation(validationFunction, word);
        }

        public IServiceOperationResponse ValidateLanguage(IWord word)
        {
            Func<IWord, IServiceOperationResponse> validationFunction =
                parameter =>
                    {
                        if (parameter.Language == null)
                            return BuildWrongLanguageResponse();

                        var language = languagesRepository.GetLanguage(parameter.Language.Id);
                        return language == null
                                   ? BuildWrongLanguageResponse()
                                   : BuildValidationPassedResponse();
                    };

            return PerformValidation(validationFunction, word);
        }

        public IServiceOperationResponse Validate(IWord word, IWordsRepository wordsRepository)
        {
            Func<IWord, IServiceOperationResponse> validationFunction =
                parameter =>
                    {
                        var result = ValidateSpelling(parameter);
                        if (result.Status)
                        {
                            result = ValidateLanguage(parameter);
                            if (result.Status)
                            {
                                result = ValidateExist(parameter, wordsRepository);
                                if (result.Status)
                                {
                                    return BuildValidationPassedResponse();
                                }
                            }
                        }

                        return result;
                    };

            return PerformValidation(validationFunction, word);
        }

        private IServiceOperationResponse PerformValidation(
            Func<IWord, IServiceOperationResponse> validationFunction, 
            IWord word)
        {
            return word == null 
                ? BuildEmptyWordResponse() 
                : validationFunction(word);
        }

        private IServiceOperationResponse BuildEmptyWordResponse()
        {
            return Factory.Create<IServiceOperationResponse>(
                false, 
                ServiceOperationAction.Validate, 
                EmptyWordErrorCode);
        }

        private IServiceOperationResponse BuildWrongLanguageResponse()
        {
            return Factory.Create<IServiceOperationResponse>(
                false, 
                ServiceOperationAction.Validate, 
                WrongLanguageErrorCode);
        }

        private IServiceOperationResponse BuildWordExistsResponse()
        {
            return Factory.Create<IServiceOperationResponse>(
                false, 
                ServiceOperationAction.Validate, 
                WordAlreadyExistsErrorCode);
        }

        private IServiceOperationResponse BuildEmptySpellingResponse()
        {
            return Factory.Create<IServiceOperationResponse>(
                false, 
                ServiceOperationAction.Validate, 
                EmptySpellingErrorCode);
        }

        private IServiceOperationResponse BuildValidationPassedResponse()
        {
            return Factory.Create<IServiceOperationResponse>(true, ServiceOperationAction.Validate);
        }
    }
}