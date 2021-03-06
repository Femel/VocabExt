﻿using System.Collections.Generic;
using Autofac;
using Moq;
using NUnit.Framework;
using VX.Domain.Entities;
using VX.Domain.Entities.Impl;
using VX.Domain.Responses;
using VX.Domain.Responses.Impl;
using VX.Domain.Surrogates;
using VX.Service;
using VX.Service.Infrastructure.Factories.Entities;
using VX.Service.Infrastructure.Factories.Responses;
using VX.Service.Infrastructure.Factories.Surrogates;
using VX.Service.Infrastructure.Factories.Tasks;
using VX.Service.Infrastructure.Interfaces;
using VX.Service.Repositories.Interfaces;
using VX.Service.Validators.Interfaces;
using VX.Tests.Mocks;

namespace VX.Tests.VocabExtServiceTests
{
    public abstract class VocabExtServiceBaseFixture : TestsBase<IVocabExtService, VocabExtService>
    {
        protected VocabExtServiceBaseFixture()
        {
            ContainerBuilder.RegisterInstance(MockTasksFactory())
                .As<ITasksFactory>().SingleInstance();

            ContainerBuilder.RegisterInstance(MockWordsRepository())
                .As<IWordsRepository>().SingleInstance();

            ContainerBuilder.RegisterInstance(MockServiceSettings())
                .As<IServiceSettings>().SingleInstance();

            ContainerBuilder.RegisterType<EntitiesFactoryMock>()
                .As<IAbstractEntitiesFactory>().InstancePerLifetimeScope();

            ContainerBuilder.RegisterInstance(MockLanguageRepository())
                .As<ILanguagesRepository>().SingleInstance();

            ContainerBuilder.RegisterInstance(MockWordsValidator())
                .As<IWordValidator>().SingleInstance();

            ContainerBuilder.RegisterType<ResponsesFactoryMock>()
                .As<IResponsesFactory>().InstancePerLifetimeScope();
        }

        protected static void CheckResponse(
            bool expectedStatus,
            ServiceOperationAction expectedAction,
            IOperationResponse actual)
        {
            Assert.AreEqual(expectedStatus, actual.Status);
            Assert.AreEqual((int)expectedAction, actual.OperationActionCode);
        }

        private static ITasksFactory MockTasksFactory()
        {
            var mock = new Mock<ITasksFactory>();
            mock.Setup(item => item.BuildTask(It.IsAny<IList<IVocabBank>>())).Returns(new TaskContract());
            mock.Setup(factory => factory.BuildTasks(It.IsAny<IList<IVocabBank>>(), It.IsAny<int>())).Returns(
                new List<ITask> {new TaskContract()});
            return mock.Object;
        }

        private static IWordsRepository MockWordsRepository()
        {
            var mock = new Mock<IWordsRepository>();
            mock.Setup(repo => repo.GetWords(It.IsAny<string>())).Returns(new List<IWord> {new WordContract()});
            mock.Setup(repo => repo.SaveWord(It.IsAny<IWord>())).Returns(true);
            return mock.Object;
        }

        private static IServiceSettings MockServiceSettings()
        {
            var mock = new Mock<IServiceSettings>();
            return mock.Object;
        }

        private static ILanguagesRepository MockLanguageRepository()
        {
            var mock = new Mock<ILanguagesRepository>();
            mock.Setup(repo => repo.GetLanguages()).Returns(new List<ILanguage> {new LanguageContract()});
            return mock.Object;
        }

        private static IWordValidator MockWordsValidator()
        {
            var mock = new Mock<IWordValidator>();
            mock.Setup(validator => validator.Validate(It.IsAny<IWord>(), It.IsAny<IWordsRepository>()))
                .Returns(new ServiceOperationResponse(true, ServiceOperationAction.Validate));
            return mock.Object;
        }
    }
}
