﻿using System.Collections.Generic;
using System.IO;
using System.ServiceModel;
using System.ServiceModel.Web;
using VX.Domain;
using VX.Domain.Entities;
using VX.Domain.Entities.Impl;
using VX.Domain.Surrogates;
using VX.Domain.Surrogates.Impl;

namespace VX.Service
{
    [ServiceContract]
    [ServiceKnownType(typeof(TaskContract))]
    [ServiceKnownType(typeof(VocabBankContract))]
    [ServiceKnownType(typeof(TranslationContract))]
    [ServiceKnownType(typeof(WordContract))]
    [ServiceKnownType(typeof(ServiceOperationResponse))]
    public interface IVocabExtService
    {
        [OperationContract]
        ITask GetTask();

        [OperationContract(Name="GetTasksAllVocabBanks")]
        IList<ITask> GetTasks();

        [OperationContract(Name="GetTasksSpecifiedVocabBanks")]
        IList<ITask> GetTasks(int[] vocabBanksIds);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        IList<IVocabBank> GetVocabBanksList();

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, UriTemplate = "GetTranslations/{vocabBankId}")]
        IList<ITranslation> GetTranslations(string vocabBankId);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, UriTemplate = "GetWords/{searchString}")]
        IList<IWord> GetWords(string searchString);

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        IVocabBank CreateNewVocabularyBank();

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        IList<ILanguage> GetLanguages();

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json, UriTemplate = "DeleteVocabularyBank/{vocabBankId}")]
        IServiceOperationResponse DeleteVocabularyBank(string vocabBankId);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        IServiceOperationResponse SaveTranslation(Stream data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        IServiceOperationResponse DetachTranslation(Stream data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        IServiceOperationResponse UpdateBankHeaders(Stream data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        IServiceOperationResponse SaveWord(Stream data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        IServiceOperationResponse ValidateWord(Stream data);
    }
}
