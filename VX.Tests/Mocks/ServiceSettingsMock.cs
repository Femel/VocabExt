﻿using VX.Service;
using VX.Service.Infrastructure.Interfaces;

namespace VX.Tests.Mocks
{
    internal class ServiceSettingsMock : IServiceSettings
    {
        public string ConnectionString
        {
            get { return "metadata=res://*/VocabModel.csdl|res://*/VocabModel.ssdl|res://*/VocabModel.msl;provider=System.Data.SqlClient;provider connection string=\"Data Source=.\\SQLEXPRESS;Initial Catalog=VXTest;User ID=sa;Password=sasasa;MultipleActiveResultSets=True\""; }
        }
    }
}
