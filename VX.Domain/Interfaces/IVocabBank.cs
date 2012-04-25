﻿using System.Collections.Generic;

namespace VX.Domain.Interfaces
{
    public interface IVocabBank
    {
        string Name { get; set; }

        string Description { get; set; }

        IList<ITranslation> Translations { get; set; }

        IList<ITag> Tags { get; set; }
    }
}
