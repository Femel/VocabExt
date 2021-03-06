﻿using VX.Model;
using VX.Service.Infrastructure.Factories.Context;

namespace VX.Tests.Mocks
{
    public class ContextFactoryMock : IContextFactory
    {
        public EntitiesContext Build()
        {
            return new EntitiesContext("metadata=res://*/VocabModel.csdl|res://*/VocabModel.ssdl|res://*/VocabModel.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.;Initial Catalog=VXTest;User ID=sa;Password=sa;MultipleActiveResultSets=True\"");
        }
    }
}
