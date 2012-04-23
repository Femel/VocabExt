IF EXISTS(SELECT name FROM sys.databases WHERE name = 'VX')     
	DROP DATABASE VX;
CREATE DATABASE VX COLLATE SQL_Latin1_General_CP1_CI_AS;
GO
USE VX;
GO
CREATE SCHEMA domain;
GO

CREATE TABLE VX.domain.Languages
(
	[PK_ID] int primary key clustered IDENTITY(1,1),
	[NAME] nvarchar(50),
	[ABBREVIATION] varchar(2)
);

CREATE TABLE VX.domain.Words
(
	[PK_ID] int primary key clustered IDENTITY (1,1),
	[SPELLING] nvarchar(50),
	[TRANSCRIPTION] nvarchar(50),
	[LANGUAGE_ID] int NOT NULL REFERENCES VX.domain.Languages([PK_ID])
);

CREATE TABLE VX.domain.Translations
(
	[PK_ID] int primary key clustered IDENTITY(1,1),
	[SOURCE_ID] int NOT NULL REFERENCES VX.domain.Words([PK_ID]),
	[TARGET_ID] int NOT NULL REFERENCES VX.domain.Words([PK_ID])
);

CREATE TABLE VX.domain.Tags
(
	[PK_ID] int primary key clustered IDENTITY(1,1),
	[Name] nvarchar(50),
	[Description] nvarchar(4000)
);

CREATE TABLE VX.domain.VocabBanks
(
	[PK_ID] int primary key clustered IDENTITY(1,1),
	[Name] nvarchar(100),
	[Description] nvarchar(4000)
);

CREATE TABLE VX.domain.VocabBanksTags
(
	[PK_ID] int primary key clustered IDENTITY(1,1),
	[VOCABULARY_ID] int NOT NULL REFERENCES VX.domain.VocabBanks([PK_ID]),
	[TAG_ID] int NOT NULL REFERENCES VX.domain.Tags([PK_ID])
);

CREATE TABLE VX.domain.VocabBanksTranslations
(
	[PK_ID] int primary key clustered IDENTITY(1,1),
	[VOCABULARY_ID] int NOT NULL REFERENCES VX.domain.VocabBanks([PK_ID]),
	[TRANSLATION_ID] int NOT NULL REFERENCES VX.domain.Translations([PK_ID])
);
	
INSERT INTO VX.domain.Languages (NAME, ABBREVIATION) VALUES('english', 'en');
INSERT INTO VX.domain.Languages (NAME, ABBREVIATION) VALUES('russian', 'ru');

DECLARE @LangRu_ID int,
		@LangEn_ID int;
SELECT @LangEn_ID = PK_ID FROM VX.domain.Languages WHERE ABBREVIATION = 'en';
SELECT @LangRu_ID = PK_ID FROM VX.domain.Languages WHERE ABBREVIATION = 'ru';

DECLARE @SourceId int,
		@TargetId int,
		@TargetId2 int,
		@targetId3 int;
--ambitious
INSERT INTO VX.domain.Words VALUES('ambitious', N'æm''bɪʃəs', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'честолюбивый', N'ч''истал''уб''`ивый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
--arrogant
INSERT INTO VX.domain.Words VALUES('arrogant', N'''ærəgənt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'высокомерный', N'высакам''`эрный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'заносчивый', N'зан`ощ''ивый''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
--assertive
INSERT INTO VX.domain.Words VALUES('assertive', N'ə''sɜːtɪv', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'напористый', N'нап`ор''истый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
--bad-tempered
INSERT INTO VX.domain.Words VALUES('bad-tempered', N'ˌbæd''tempəd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'вздорный', N'взд`орный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'раздражительный', NULL, @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
--Calm
INSERT INTO VX.domain.Words VALUES('calm', N'kɑːm', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'спокойный', N'спак`ой''ный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'невозмутимый', N'н''ивазмут''`имый''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'мирный', N'м''`ирный''', @LangRu_ID);
SELECT @targetId3 = @@IDENTITY;
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @targetId3);
--cheerful
INSERT INTO VX.domain.Words VALUES('cheerful', N'''ʧɪəf(ə)l], [-ful', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'весёлый', N'в''ис''олый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
--concientious
INSERT INTO VX.domain.Words VALUES('conscientious', N'ˌkɔn(t)ʃɪ''en(t)ʃəs', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'добросовестный', N'дабрас`ов''издный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
--easy-going
INSERT INTO VX.domain.Words VALUES('easy-going', N'''iːzɪˌgəuɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'естественный', N'й''эст''`эздв''инный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'легкий', N'л''окк''ий''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
--eccentric
INSERT INTO VX.domain.Words VALUES('eccentric', N'ɪk''sentrɪk], [ek-', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'эксцентричный', N'эксциндр''`ич''ный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
--funny
INSERT INTO VX.domain.Words VALUES('funny', N'''fʌnɪ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO VX.domain.Words VALUES(N'забавный', N'заб`авный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO VX.domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);

--INSERT INTO VX.domain.Words VALUES('immature', N'', @LangEn_ID);
--INSERT INTO VX.domain.Words VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.Words VALUES('impulsive', N'', @LangEn_ID);
--INSERT INTO VX.domain.Words VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.Words VALUES('insecure', N'', @LangEn_ID);
--INSERT INTO VX.domain.Words VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.Words VALUES('insincere', N'', @LangEn_ID);
--INSERT INTO VX.domain.Words VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.Words VALUES('loyal', N'', @LangEn_ID);
--INSERT INTO VX.domain.Words VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.Words VALUES('open-minded', N'', @LangEn_ID);
--INSERT INTO VX.domain.Words VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.Words VALUES('optimistic', N'', @LangEn_ID);
--INSERT INTO VX.domain.Words VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.WORDS VALUES('possessive', N'', @LangEn_ID);
--INSERT INTO VX.domain.WORDS VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.WORDS VALUES('reserved', N'', @LangEn_ID);
--INSERT INTO VX.domain.WORDS VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.WORDS VALUES('self-confident', N'', @LangEn_ID);
--INSERT INTO VX.domain.WORDS VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.WORDS VALUES('stubborn', N'', @LangEn_ID);
--INSERT INTO VX.domain.WORDS VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.WORDS VALUES('vain', N'', @LangEn_ID);
--INSERT INTO VX.domain.WORDS VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.WORDS VALUES('well-balanced', N'', @LangEn_ID);
--INSERT INTO VX.domain.WORDS VALUES('--emptyRUS--', N'', @LangRu_ID);
--INSERT INTO VX.domain.WORDS VALUES('wise', N'', @LangEn_ID);
--INSERT INTO VX.domain.WORDS VALUES('--emptyRUS--', N'', @LangRu_ID);

INSERT INTO VX.domain.Tags VALUES('Personality', 'Tag personality');
SELECT @SourceId = @@IDENTITY;
INSERT INTO VX.domain.VocabBanks VALUES('Personality', 'Vocabulary bank about personality');
SELECT @TargetId = @@IDENTITY;
INSERT INTO VX.domain.VocabBanksTags VALUES(@SourceId, @TargetId);

INSERT INTO VX.domain.VocabBanksTranslations (TRANSLATION_ID, VOCABULARY_ID) 
	SELECT PK_ID as TRANSLATION_ID, @TargetId AS VOCABULARY_ID FROM VX.domain.Translations;


