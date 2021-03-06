﻿using System.Collections.Generic;
using System.IO;
using Autofac;
using Moq;
using NUnit.Framework;
using VX.Domain.Entities;
using VX.Domain.Entities.Impl;
using VX.Domain.Surrogates;
using VX.Domain.Surrogates.Impl;
using VX.Service.Infrastructure.Exceptions;
using VX.Service.Infrastructure.Factories.Surrogates;
using VX.Service.Repositories.Interfaces;

namespace VX.Tests.VocabExtServiceTests
{
    [TestFixture]
    public class VocabExtServiceMainFixture : VocabExtServiceBaseFixture
    {
        private readonly ITranslation testTranslation = new TranslationContract {Id = 1};
        private ServiceOperationAction action = ServiceOperationAction.Create;
        
        public VocabExtServiceMainFixture()
        {
            ContainerBuilder.RegisterInstance(MockVocabBankRepository())
                .As<IVocabBanksRepository>().SingleInstance();

            ContainerBuilder.RegisterInstance(MockTranslationsRepository())
                .As<ITranslationsRepository>().SingleInstance();

            ContainerBuilder.RegisterInstance(MockSurrogatesFactory())
                .As<ISurrogatesFactory>().SingleInstance();
            
            BuildContainer();
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("GetTasks gets not empty tasks list")]
        public void GetTasksTest()
        {
            Assert.AreEqual(1, SystemUnderTest.GetTasks().Count); 
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("GetTasks with parameters Gets not empty tasks list")]
        public void GetTasksParatersTest()
        {
            Assert.AreEqual(1, SystemUnderTest.GetTasks(new []{1}).Count);
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("GetVocabBanksSummary returns summary")]
        public void GetVocabBanksSummaryTest()
        {
            var actual = SystemUnderTest.GetVocabBanksSummary();
            Assert.AreEqual(1, actual.Count);
            Assert.AreEqual(1, actual[0].Id);
            Assert.AreEqual("testName", actual[0].Name);
            Assert.AreEqual("testDescription", actual[0].Description);
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("GetTranslations returns translations")]
        public void GetTranslationsTest()
        {
            Assert.AreEqual(1, SystemUnderTest.GetTranslations("1").Count);
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("GetTranslations returns empty list if input id is incorrect")]
        public void GetTranslationsEmptyListTest()
        {
            Assert.AreEqual(0, SystemUnderTest.GetTranslations("").Count);
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("GetWords returns not empty list of words")]
        public void GetWordsTest()
        {
            Assert.AreEqual(1, SystemUnderTest.GetWords("test").Count);
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("GetLanguages returns not empty list of languages")]
        public void GetLanguagesTest()
        {
            Assert.AreEqual(1, SystemUnderTest.GetLanguages().Count);
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("DeleteVocabularyBank creates positive response")]
        public void DeleteVocabulatyBankTest()
        {
            var actual = SystemUnderTest.DeleteVocabularyBank("1");
            CheckResponse(true, ServiceOperationAction.Delete, actual);
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("DeleteVocabularyBank creates negative response if input is incorrect")]
        public void DeleteVocabularyBankEmptyTest()
        {
            var actual = SystemUnderTest.DeleteVocabularyBank("asdf");
            CheckResponse(false, ServiceOperationAction.Delete, actual);
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("SaveTranslation creates update success response without attaching")]
        public void SaveTranslationErrorTest()
        {
            var actual = SystemUnderTest.SaveTranslation(new MemoryStream());
            CheckResponse(true, ServiceOperationAction.Create, actual);
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("Detach translation return success on detach")]
        public void DetachTranslationTest()
        {
            var actual = SystemUnderTest.DetachTranslation(new MemoryStream());
            CheckResponse(true, ServiceOperationAction.Detach, actual);
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("Update bank summary returns success update")]
        public void UpdateBankSummaryTest()
        {
            var actual = SystemUnderTest.UpdateBankSummary(new MemoryStream());
            CheckResponse(true, ServiceOperationAction.Update, actual);
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("SaveWord returns success create status")]
        public void SaveWordTest()
        {
            var actual = SystemUnderTest.SaveWord(new MemoryStream());
            CheckResponse(true, ServiceOperationAction.Create, actual);
        }

        [Test]
        [Category("VocabExtServiceTests.Main")]
        [Description("ValidateWord returns success validate status")]
        public void ValidateWordTest()
        {
            var actual = SystemUnderTest.ValidateWord(new MemoryStream());
            CheckResponse(true, ServiceOperationAction.Validate, actual);
        }

        private static IVocabBanksRepository MockVocabBankRepository()
        {
            var mock = new Mock<IVocabBanksRepository>();
            mock.Setup(repo => repo.GetWithTranslationsOnly())
                .Returns(new List<IVocabBank> {new VocabBankContract()} );

            mock.Setup(repo => repo.GetWithTranslationsOnly(It.IsAny<int[]>()))
                .Returns(new List<IVocabBank> {new VocabBankContract()});

            mock.Setup(repo => repo.GetSummary()).Returns(new List<IVocabBankSummary>
                                                              {
                                                                  new VocabBankSummary
                                                                      {
                                                                          Id = 1,
                                                                          Name = "testName",
                                                                          Description = "testDescription"
                                                                      }
                                                              });

            mock.Setup(repo => repo.Delete(0)).Returns(false);
            mock.Setup(repo => repo.Delete(It.IsInRange(0, int.MaxValue, Range.Exclusive)))
                .Returns(true);
            mock.Setup(repo => repo.DetachTranslation(It.IsAny<int>(), It.IsAny<int>()))
                .Returns(true);
            mock.Setup(repo => repo.UpdateSummary(It.IsAny<IVocabBankSummary>())).Returns(true);
            mock.Setup(repo => repo.AttachTranslation(It.IsAny<int>(), It.IsAny<int>())).Throws
                <ItemAlreadyExistsException>();
            
            return mock.Object;
        }   

        private ITranslationsRepository MockTranslationsRepository()
        {
            var mock = new Mock<ITranslationsRepository>();
            mock.Setup(repo => repo.GetTranslations(1)).Returns(new List<ITranslation> { new TranslationContract() });
            mock.Setup(repo => repo.GetTranslations(0)).Returns(new List<ITranslation>());
            mock.Setup(repo => repo.SaveTranslation(testTranslation, out action)).Returns(new ManyToManyRelationship {Id = 1});
            return mock.Object;
        }

        private ISurrogatesFactory MockSurrogatesFactory()
        {
            var mock = new Mock<ISurrogatesFactory>();
            mock.Setup(factory => factory.CreateBankTranslationPair(It.IsAny<Stream>()))
                .Returns(new BankTranslationPair(1, testTranslation));
            mock.Setup(repo => repo.CreateParentChildIdPair(It.IsAny<Stream>()))
                .Returns(new ParentChildIdPair(1, 1));
            return mock.Object;
        }
    }
}
