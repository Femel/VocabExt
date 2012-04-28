﻿using Autofac;
using VX.Service.Factories;
using VX.Service.Factories.Interfaces;
using VX.Service.Infrastructure;
using VX.Service.Infrastructure.Interfaces;
using VX.Service.Repositories;
using VX.Service.Repositories.Interfaces;

namespace VX.Service
{
    internal static class Initializer
    {
        internal static IContainer Container { get; private set; }

        static Initializer()
        {
            var builder = new ContainerBuilder();

            builder.RegisterType<ServiceSettings>()
                .As<IServiceSettings>()
                .InstancePerLifetimeScope();

            builder.RegisterType<LanguagesRepository>()
                .As<ILanguagesRepository>()
                .InstancePerLifetimeScope();

            builder.RegisterType<WordRepository>()
                .As<IWordsRepository>()
                .InstancePerLifetimeScope();

            builder.RegisterType<VocabBanksRepository>()
                .As<IVocabBanksRepository>()
                .InstancePerLifetimeScope();

            builder.RegisterType<RandomFacade>()
                .As<IRandomFacade>()
                .InstancePerLifetimeScope();

            builder.RegisterType<RandomPicker>()
                .As<IRandomPicker>()
                .InstancePerLifetimeScope();

            builder.RegisterType<EntitiesFactory>()
                .As<IEntitiesFactory>()
                .InstancePerLifetimeScope();

            builder.RegisterType<TasksFactory>()
                .As<ITasksFactory>()
                .InstancePerLifetimeScope();

            Container = builder.Build();
        }
    }
}