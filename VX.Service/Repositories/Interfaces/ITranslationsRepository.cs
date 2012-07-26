﻿using System.Collections.Generic;
using VX.Domain.DataContracts.Interfaces;

namespace VX.Service.Repositories.Interfaces
{
    public interface ITranslationsRepository
    {
        IList<ITranslation> GetTranslations(int vocabBankId);

        IServiceOperationResponse SaveTranslation(ITranslation translation, int vocabBankId);
    }
}