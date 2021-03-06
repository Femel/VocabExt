IF EXISTS(SELECT name FROM sys.databases WHERE name = 'VX')     
	DROP DATABASE VX;
CREATE DATABASE VX COLLATE SQL_Latin1_General_CP1_CI_AS;
GO
USE VX;
GO
CREATE SCHEMA domain;
GO

CREATE TABLE domain.Languages
(
	[PK_ID] int primary key clustered IDENTITY(1,1),
	[Name] nvarchar(50),
	[Abbreviation] varchar(2)
);

CREATE TABLE domain.Words
(
	[PK_ID] int primary key clustered IDENTITY (1,1),
	[Spelling] nvarchar(50),
	[Transcription] nvarchar(50),
	[LANGUAGE_ID] int NOT NULL REFERENCES domain.Languages([PK_ID])
);

CREATE TABLE domain.Translations
(
	[PK_ID] int primary key clustered IDENTITY(1,1),
	[SOURCE_ID] int NOT NULL REFERENCES domain.Words([PK_ID]),
	[TARGET_ID] int NOT NULL REFERENCES domain.Words([PK_ID])
);

CREATE TABLE domain.Tags
(
	[PK_ID] int primary key clustered IDENTITY(1,1),
	[Name] nvarchar(50),
	[Description] nvarchar(4000)
);

CREATE TABLE domain.VocabBanks
(
	[PK_ID] int primary key clustered IDENTITY(1,1),
	[Name] nvarchar(100),
	[Description] nvarchar(4000)
);

CREATE TABLE domain.VocabBanksTags
(
	[PK_ID] int primary key clustered IDENTITY(1,1),
	[VOCABULARY_ID] int NOT NULL REFERENCES domain.VocabBanks([PK_ID]) ON DELETE CASCADE,
	[TAG_ID] int NOT NULL REFERENCES domain.Tags([PK_ID]) ON DELETE CASCADE
);

CREATE TABLE domain.VocabBanksTranslations
(
	[PK_ID] int primary key clustered IDENTITY(1,1),
	[VOCABULARY_ID] int NOT NULL REFERENCES domain.VocabBanks([PK_ID]) ON DELETE CASCADE,
	[TRANSLATION_ID] int NOT NULL REFERENCES domain.Translations([PK_ID]) ON DELETE CASCADE
);