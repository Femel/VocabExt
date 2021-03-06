USE VX;

DELETE FROM domain.[VocabBanksTranslations];
DELETE FROM domain.[VocabBanksTags];
DELETE FROM domain.[VocabBanks];
DELETE FROM domain.[Translations];
DELETE FROM domain.[Words];
DELETE FROM domain.[Languages];
DELETE FROM domain.[Tags];

DBCC CHECKIDENT ('domain.VocabBanksTranslations', RESEED, 0);
DBCC CHECKIDENT ('domain.VocabBanksTags', RESEED, 0);
DBCC CHECKIDENT ('domain.VocabBanks', RESEED, 0);
DBCC CHECKIDENT ('domain.Translations', RESEED, 0);
DBCC CHECKIDENT ('domain.Words', RESEED, 0);
DBCC CHECKIDENT ('domain.Languages', RESEED, 0);
DBCC CHECKIDENT ('domain.Tags', RESEED, 0);

DECLARE @LangRu_ID int,
		@LangEn_ID int;
		
DECLARE	@Translations TABLE (
	[PK_ID] int	
);

INSERT INTO domain.Languages (Name, Abbreviation) VALUES('english', 'en');
SELECT @LangEn_ID = @@IDENTITY;
INSERT INTO domain.Languages (Name, Abbreviation) VALUES('russian', 'ru');
SELECT @LangRu_ID = @@IDENTITY;

DECLARE @SourceId int,
		@TargetId int,
		@TargetId2 int,
		@targetId3 int;
--****************************		
--PERSONALITY
--****************************
--ambitious
INSERT INTO domain.Words VALUES('ambitious', N'æm''bɪʃəs', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'честолюбивый', N'ч''истал''уб''`ивый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--arrogant
INSERT INTO domain.Words VALUES('arrogant', N'''ærəgənt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'высокомерный', N'высакам''`эрный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'заносчивый', N'зан`ощ''ивый''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--assertive
INSERT INTO domain.Words VALUES('assertive', N'ə''sɜːtɪv', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'напористый', N'нап`ор''истый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--bad-tempered
INSERT INTO domain.Words VALUES('bad-tempered', N'ˌbæd''tempəd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'вздорный', N'взд`орный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'раздражительный', NULL, @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--Calm
INSERT INTO domain.Words VALUES('calm', N'kɑːm', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'спокойный', N'спак`ой''ный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'невозмутимый', N'н''ивазмут''`имый''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'мирный', N'м''`ирный''', @LangRu_ID);
SELECT @targetId3 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @targetId3);
INSERT INTO @Translations VALUES(@@IDENTITY);
--cheerful
INSERT INTO domain.Words VALUES('cheerful', N'''ʧɪəf(ə)l], [-ful', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'весёлый', N'в''ис''олый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--concientious
INSERT INTO domain.Words VALUES('conscientious', N'ˌkɔn(t)ʃɪ''en(t)ʃəs', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'добросовестный', N'дабрас`ов''издный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--easy-going
INSERT INTO domain.Words VALUES('easy-going', N'''iːzɪˌgəuɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'естественный', N'й''эст''`эздв''инный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'легкий', N'л''окк''ий''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--eccentric
INSERT INTO domain.Words VALUES('eccentric', N'ɪk''sentrɪk], [ek-', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'эксцентричный', N'эксциндр''`ич''ный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--funny
INSERT INTO domain.Words VALUES('funny', N'''fʌnɪ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'забавный', N'заб`авный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--immature
INSERT INTO domain.Words VALUES('immature', N'ˌɪmə''tjuə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'незрелый', N'н''изр''`элый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--impulsive
INSERT INTO domain.Words VALUES('impulsive', N'ɪm''pʌlsɪv', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'импульсивный', N'импул''с''`ивный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--insecure
INSERT INTO domain.Words VALUES('insecure', N'ˌɪnsɪ''kjuə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'неуверенный', N'н''иув''`эр''инный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--insincere
INSERT INTO domain.Words VALUES('insincere', N'ˌɪnsɪn''sɪə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'неискренний', N'н''и`изгр''инн''ий''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--loyal
INSERT INTO domain.Words VALUES('loyal', N'''lɔɪəl', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'верный', N'в''`эрный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--open-minded
INSERT INTO domain.Words VALUES('open-minded', N'ˌəup(ə)n''maɪndɪd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'широких взглядов', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--optimistic
INSERT INTO domain.Words VALUES('optimistic', N'ˌɔptɪ''mɪstɪk', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'оптимистичный', N'апт''им''ист''`ич''ный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--possessive
INSERT INTO domain.WORDS VALUES('possessive', N'pə''zesɪv', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.WORDS VALUES(N'собственнический', N'с`опздв''инн''ич''иск''ий''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--reserved
INSERT INTO domain.WORDS VALUES('reserved', N'rɪ''zɜːvd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.WORDS VALUES(N'замкнутый', N'з`амгнутый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--self-confident
INSERT INTO domain.WORDS VALUES('self-confident', N'ˌself''kɔnfɪd(ə)nt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.WORDS VALUES(N'самоуверенный', N'самаув''`эр''инный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--stubborn
INSERT INTO domain.WORDS VALUES('stubborn', N'''stʌbən', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.WORDS VALUES(N'упрямый', N'убр''`амый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--vain
INSERT INTO domain.WORDS VALUES('vain', N'veɪn', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.WORDS VALUES(N'тщеславный', N'тщ''изл`авный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--well-balanced
INSERT INTO domain.WORDS VALUES('well-balanced', N'ˌwel''bælən(t)st', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.WORDS VALUES(N'уравновешенный', N'уравнав''`эшинный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--wise
INSERT INTO domain.WORDS VALUES('wise', N'waɪz', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.WORDS VALUES(N'мудрый', N'м`удрый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);

INSERT INTO domain.Tags VALUES('Personality', 'Tag personality');
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.VocabBanks VALUES('Personality', 'Vocabulary bank about personality');
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.VocabBanksTags VALUES(@SourceId, @TargetId);

INSERT INTO domain.VocabBanksTranslations (TRANSLATION_ID, VOCABULARY_ID) 
	SELECT PK_ID as TRANSLATION_ID, @TargetId AS VOCABULARY_ID FROM @Translations;

DELETE FROM @Translations;
--**************************
-- ILLNESS and TREATMENT
--**************************
--temperature
INSERT INTO domain.Words VALUES('temperature', N'''temp(ə)rəʧə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'температура', N'т''имп''ират`ура', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--cough 
INSERT INTO domain.Words VALUES('cough', N'kɔf', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'кашель', N'к`ашил''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--headache
INSERT INTO domain.Words VALUES('headache', N'''hedeɪk', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'головная боль', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--rash
INSERT INTO domain.Words VALUES('rash', N'ræʃ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'сыпь', N'сып''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--blister
INSERT INTO domain.Words VALUES('blister', N'''blɪstə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'волдырь', N'валд`ыр''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--pain
INSERT INTO domain.Words VALUES('pain', N'peɪn', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'боль', N'бал''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--sick
INSERT INTO domain.Words VALUES('sick', N'sɪk', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'больной', N'бал''н`ой''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--sneezing
INSERT INTO domain.Words VALUES('sneezing', N'''sniːzɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'чиханье', N'ч''их`ан''й''э', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--bleeding
INSERT INTO domain.Words VALUES('bleeding', N'''bliːdɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'кровотечение', N'грават''ич''`эн''ий''э', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--swollen
INSERT INTO domain.Words VALUES('swollen', N'''swəulən', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'опухший', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'вздутый', N'взд`утый''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'раздутый', N'разд`утый''', @LangRu_ID);
SELECT @targetId3 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @targetId3);
INSERT INTO @Translations VALUES(@@IDENTITY);
--flu
INSERT INTO domain.Words VALUES('flu', N'fluː', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'грипп', N'гр''ипп', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--allergic
INSERT INTO domain.Words VALUES('allergic', N'ə''leʤɪk', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'аллергический', N'алл''ирг''`ич''иск''ий''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--asthma
INSERT INTO domain.Words VALUES('asthma', N'''æsθmə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'астма', N'`аздма', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--stroke
INSERT INTO domain.Words VALUES('stroke', N'strəuk', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'удар', N'уд`ар', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--twisted
INSERT INTO domain.Words VALUES('twisted', N'''twɪstɪd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'смещенный', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--bruise
INSERT INTO domain.Words VALUES('bruise', N'bruːz', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'синяк', N'с''ин''`ак', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'кровоподтёк', N'гравапатт''ок', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'ушиб', NULL, @LangRu_ID);
SELECT @targetId3 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @targetId3);
INSERT INTO @Translations VALUES(@@IDENTITY);
--bandage
INSERT INTO domain.Words VALUES('bandage', N'''bændɪʤ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'бинт', N'б''инт', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'бандаж', N'банд`аш', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--injection
INSERT INTO domain.Words VALUES('injection', N'ɪn''ʤekʃ(ə)n', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'инъекция', N'инй''экций''а', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--medicine
INSERT INTO domain.Words VALUES('medicine', N'''medɪsɪn', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'лекарство', N'л''`экарздва', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'медикамент', N'м''ид''икам''`энт', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--operation
INSERT INTO domain.Words VALUES('operation', N'ˌɔp(ə)''reɪʃ(ə)n', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'операция', N'ап''ир`аций''а', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--rest
INSERT INTO domain.Words VALUES('rest', N'rest', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'покой', N'пак`ой''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--specialist
INSERT INTO domain.Words VALUES('specialist', N'''speʃ(ə)lɪst', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'специалист', N'сп''ициал''`ист', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--stitch
INSERT INTO domain.Words VALUES('stitch', N'stɪʧ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'шов', N'шаф', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--X-ray
INSERT INTO domain.Words VALUES('X-ray', N'''eksreɪ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'рентген', N'р''индг''`эн', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);

INSERT INTO domain.Tags VALUES('Illness and treatment', 'Tag illness and treatment');
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.VocabBanks VALUES('Illness and treatment', 'Vocabulary bank about illness and treatment');
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.VocabBanksTags VALUES(@SourceId, @TargetId);

INSERT INTO domain.VocabBanksTranslations (TRANSLATION_ID, VOCABULARY_ID) 
	SELECT PK_ID as TRANSLATION_ID, @TargetId AS VOCABULARY_ID FROM @Translations;

DELETE FROM @Translations;
--**************************
-- CLOTHES
--**************************
--vest
INSERT INTO domain.Words VALUES('vest', N'vest', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'майка', N'м`ай''ка', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--scarf
INSERT INTO domain.Words VALUES('scarf', N'skɑːf', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'шарф', N'шарф', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--sandal
INSERT INTO domain.Words VALUES('sandal', N'''sænd(ə)l', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'сандалия', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--stockings
INSERT INTO domain.Words VALUES('stockings', N'''stɔkɪŋs', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'чулки', N'ч''улк''`и', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--suit
INSERT INTO domain.Words VALUES('suit', N's(j)uːt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'костюм', N'каст''`ум', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--swimsuit
INSERT INTO domain.Words VALUES('swimsuit', N'swɪms(j)uːt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'купальник', N'куп`ал''н''ик', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--slippers
INSERT INTO domain.Words VALUES('slippers', N'''slɪpəs', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'тапочки', N'т`апач''к''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--backpack
INSERT INTO domain.Words VALUES('backpack', N'''bækpæk', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'рюкзак', N'р''угз`ак', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--bow
INSERT INTO domain.Words VALUES('bow', N'bəu', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'бант', N'бант', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--collar
INSERT INTO domain.Words VALUES('collar', N'''kɔlə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'воротник', N'варадн''`ик', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--cardigan
INSERT INTO domain.Words VALUES('cardigan', N'''kɑːdɪgən', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'кардиган', N'кард''иг`ан', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'джемпер', N'дж`эмп''ир', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);

INSERT INTO domain.Tags VALUES('Clothes', 'Tag Clothes');
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.VocabBanks VALUES('Clothes', 'Vocabulary bank about clothes');
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.VocabBanksTags VALUES(@SourceId, @TargetId);

INSERT INTO domain.VocabBanksTranslations (TRANSLATION_ID, VOCABULARY_ID) 
	SELECT PK_ID as TRANSLATION_ID, @TargetId AS VOCABULARY_ID FROM @Translations;

DELETE FROM @Translations;
--**************************
-- Fashion
--**************************
--tight
INSERT INTO domain.Words VALUES('tight', N'taɪt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'тесный', N'т''`эзный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--loose
INSERT INTO domain.Words VALUES('loose', N'luːs', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'свободный', N'зваб`одный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'просторный', N'браст`орный''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--sleeveless
INSERT INTO domain.Words VALUES('sleeveless', N'''sliːvləs', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'без рукавов', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--long-sleeved
INSERT INTO domain.Words VALUES('long-sleeved', N'ˌlɔŋ''sliːvd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'с длинными рукавами', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--short-sleeved
INSERT INTO domain.Words VALUES('short-sleeved', N'ˌʃɔːt''sliːvd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'с короткими рукавами', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--hooded
INSERT INTO domain.Words VALUES('hooded', N'hʊdɪd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'с капюшоном', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--V-neck
INSERT INTO domain.Words VALUES('V-neck', N'ˌviː''nek', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'в форме буквы V', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--spotted
INSERT INTO domain.Words VALUES('spotted', N'''spɔtɪd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'пятнистый', N'п''идн''`истый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--plain
INSERT INTO domain.Words VALUES('plain', N'pleɪn', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'одноцветный', N'аднацв''`эдный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--striped
INSERT INTO domain.Words VALUES('striped', N'straɪpt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'полосатый', N'палас`атый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--checked
INSERT INTO domain.Words VALUES('checked', N'ʧekt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'клетчатый', N'гл''`этч''атый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--patterned
INSERT INTO domain.Words VALUES('patterned', N'''pæt(ə)nd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'узорчатый', N'уз`орч''атый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--old-fashioned
INSERT INTO domain.Words VALUES('old-fashioned', N'ˌəuld''fæʃ(ə)nd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'старомодный', N'старам`одный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--scruffy
INSERT INTO domain.Words VALUES('scruffy', N'''skrʌfɪ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'грязный', N'гр''`азный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'неряшливый', N'н''ир''`ажл''ивый''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--smart
INSERT INTO domain.Words VALUES('smart', N'smɑːt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'нарядный', N'нар''`адный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'опрятный', N'абр''`адный''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--stylish
INSERT INTO domain.Words VALUES('stylish', N'''staɪlɪʃ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'стильный', N'ст''`ил''ный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--trendy
INSERT INTO domain.Words VALUES('trendy', N'''trendɪ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'модный', N'м`одный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);

INSERT INTO domain.Tags VALUES('Fashion', 'Tag Fashion');
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.VocabBanks VALUES('Fashion', 'Vocabulary bank about fashion');
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.VocabBanksTags VALUES(@SourceId, @TargetId);

INSERT INTO domain.VocabBanksTranslations (TRANSLATION_ID, VOCABULARY_ID) 
	SELECT PK_ID as TRANSLATION_ID, @TargetId AS VOCABULARY_ID FROM @Translations;

DELETE FROM @Translations;
--**************************
-- Air travel
--**************************
--terminal
INSERT INTO domain.Words VALUES('terminal', N'''tɜːmɪn(ə)l', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'терминал', N'т''ирм''ин`ал', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--arrivals
INSERT INTO domain.Words VALUES('arrival', N'ə''raɪv(ə)l', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'прибытие', N'', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--departures
INSERT INTO domain.Words VALUES('departure', N'dɪ''pɑːʧə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'отправление', N'адбравл''`эн''ий''э', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--checkin
INSERT INTO domain.Words VALUES('check in', N'ʧek ɪn', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'регистрация', N'р''иг''издр`аций''а', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--luggage
INSERT INTO domain.Words VALUES('luggage', N'''lʌgɪʤ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'багаж', N'баг`аш', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--baggage
INSERT INTO domain.Words VALUES('baggage', N'''bægɪʤ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--customs
INSERT INTO domain.Words VALUES('customs', N'''kʌstəm', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'таможня', N'там`ожн''й''а', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--porter
INSERT INTO domain.Words VALUES('porter', N'''pɔːtə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'носильщик', N'нас''`ил''щ''ик', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--airline
INSERT INTO domain.Words VALUES('airline', N'''ɛəlaɪn', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'авиалиния', N'ав''иал''`ин''ий''а', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--crew
INSERT INTO domain.Words VALUES('crew', N'kruː', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'экипаж', N'эк''ип`аш', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--passenger
INSERT INTO domain.Words VALUES('passenger', N'''pæs(ə)nʤə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'пассажир', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--flight attendant
INSERT INTO domain.Words VALUES('flight attendant', N'flaɪt ə''tendənt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'стюардесса', N'ст''уард''`эсса', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--flight
INSERT INTO domain.Words VALUES('flight', N'flaɪt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'полёт', N'пал''от', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--seat
INSERT INTO domain.Words VALUES('seat', N'siːt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'место', N'м''`эста', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--take off
INSERT INTO domain.Words VALUES('take off', N'teɪk ɔf', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'взлететь', N'взл''ит''`эт''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--landing
INSERT INTO domain.Words VALUES('landing', N'''lændɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'посадка', N'пас`атка', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'приземление', N'бр''из''имл''`эн''ий''э', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);

INSERT INTO domain.Tags VALUES('Air travel', 'Tag air travel');
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.VocabBanks VALUES('Air travel', 'Vocabulary bank about air travel');
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.VocabBanksTags VALUES(@SourceId, @TargetId);

INSERT INTO domain.VocabBanksTranslations (TRANSLATION_ID, VOCABULARY_ID) 
	SELECT PK_ID as TRANSLATION_ID, @TargetId AS VOCABULARY_ID FROM @Translations;

DELETE FROM @Translations;
--**************************
-- Crime and punishment
--**************************
--blackmail
INSERT INTO domain.Words VALUES('blackmail', N'''blækmeɪl', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'шантаж', N'шант`аш', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'вымогательство', N'вымаг`ат''ил''здва', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--bribery
INSERT INTO domain.Words VALUES('bribery', N'''braɪbərɪ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'взяточничество', N'вз''`атач''н''ич''издва', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--burglary
INSERT INTO domain.Words VALUES('burglary', N'''bɜːglərɪ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'обокрасть помещение', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--drug dealing
INSERT INTO domain.Words VALUES('drug dealing', N'drʌg ''diːlɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'торговля наркотиками', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--fraud
INSERT INTO domain.Words VALUES('fraud', N'frɔːd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'мошенничество', N'маш`энн''ич''издва', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'жульничество', N'ж`ул''н''ич''издва', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--hijacking
INSERT INTO domain.Words VALUES('hijacking', N'''haɪʤækɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'угон', N'уг`он', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--kidnapping
INSERT INTO domain.Words VALUES('kidnapping', N'''kɪdnæpɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'похищение людей', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--mugging
INSERT INTO domain.Words VALUES('mugging', N'''mʌgɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'хулиганство', N'хул''иг`анздва', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--murder
INSERT INTO domain.Words VALUES('murder', N'''mɜːdə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'убийство', N'уб''`ий''здва', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--rape
INSERT INTO domain.Words VALUES('rape', N'reɪp', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'изнасилование', N'изнас''`илаван''ий''э', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--robbery
INSERT INTO domain.Words VALUES('robbery', N'''rɔb(ə)rɪ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'ограбление', N'аграбл''`эн''ий''э', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'грабёж', N'граб''ош', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'разбой', N'разб`ой''', @LangRu_ID);
SELECT @targetId3 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @targetId3);
INSERT INTO @Translations VALUES(@@IDENTITY);
--smuggling
INSERT INTO domain.Words VALUES('smuggling', N'''smʌglɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'контрабанда', N'кандраб`анда', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--terrorism
INSERT INTO domain.Words VALUES('terrorism', N'''ter(ə)rɪz(ə)m', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'терроризм', N'т''иррар''`изм', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--theft
INSERT INTO domain.Words VALUES('theft', N'θeft', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'воровство', N'варафздв`о', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'кража', N'гр`ажа', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--vandalism
INSERT INTO domain.Words VALUES('vandalism', N'''vænd(ə)lɪz(ə)m', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'вандализм', N'вандал''`изм', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--acquit
INSERT INTO domain.Words VALUES('acquit', N'ə''kwɪt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'оправдывать', N'абр`авдыват''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--court
INSERT INTO domain.Words VALUES('court', N'kɔːt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'суд', N'сут', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--evidence
INSERT INTO domain.Words VALUES('evidence', N'''evɪd(ə)n(t)s', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'улика', N'ул''`ика', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--guilty
INSERT INTO domain.Words VALUES('guilty', N'''gɪltɪ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'виновный', N'в''ин`овный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--judge
INSERT INTO domain.Words VALUES('judge', N'''ʤʌʤ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'судья', N'суд''й''а', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--jury
INSERT INTO domain.Words VALUES('jury', N'''ʤuərɪ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'присяжные', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--proof
INSERT INTO domain.Words VALUES('proof', N'pruːf', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'доказательство', N'даказ`ат''ил''здва', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'подтверждение', N'патдв''иржд''`эн''ий''э', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--punishment
INSERT INTO domain.Words VALUES('punishment', N'''pʌnɪʃmənt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'наказание', N'наказ`ан''ий''э', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--verdict
INSERT INTO domain.Words VALUES('verdict', N'''vɜːdɪkt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'вердикт', N'в''ирд''`икт', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--witnesses
INSERT INTO domain.Words VALUES('witness', N'''wɪtnəs', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'свидетель', N'зв''ид''`эт''ил''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--prison
INSERT INTO domain.Words VALUES('prison', N'''prɪz(ə)n', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'тюрьма', N'т''ур''м`а', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--investigation
INSERT INTO domain.Words VALUES('investigation', N'ɪnˌvestɪ''geɪʃ(ə)n', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'расследование', N'расзл''`эдаван''ий''э', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'следствие', N'зл''`этздв''ий''э', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);

INSERT INTO domain.Tags VALUES('Crime and punishment', 'Tag crime and punishment');
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.VocabBanks VALUES('Crime and punishment', 'Vocabulary bank about crime and punishment');
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.VocabBanksTags VALUES(@SourceId, @TargetId);

INSERT INTO domain.VocabBanksTranslations (TRANSLATION_ID, VOCABULARY_ID) 
	SELECT PK_ID as TRANSLATION_ID, @TargetId AS VOCABULARY_ID FROM @Translations;

DELETE FROM @Translations;

--**************************
-- Weather
--**************************
--breeze
INSERT INTO domain.Words VALUES('breeze', N'bri:z', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'бриз', N'бр''ис', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--chilly
INSERT INTO domain.Words VALUES('chilly', N'ˈtʃɪlɪ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'холодный', N'хал`одный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--cool
INSERT INTO domain.Words VALUES('cool', N'ku:l', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'прохладный', N'брахл`адный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--damp
INSERT INTO domain.Words VALUES('damp', N'dæmp', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'влажный', N'вл`ажный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--drizzling
INSERT INTO domain.Words VALUES('drizzling', N'''drɪzlɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'мелкий дождь', N'м''`элк''ий'' дажд''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--freezing
INSERT INTO domain.Words VALUES('freezing', N'''friːzɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'ледяной', N'л''ид''ин`ой''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--gale-force
INSERT INTO domain.Words VALUES('gale-force', N'ɡeɪl fɔ:s', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'штормовой', N'штармав`ой''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--mild
INSERT INTO domain.Words VALUES('mild', N'maɪld', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'мягкий', N'м''`акк''ий''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'умеренный', N'ум''`эр''инный''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);

--pouring
INSERT INTO domain.Words VALUES('pouring', N'''pɔː(r)ɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'проливной', N'брал''ивн`ой''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--scorching
INSERT INTO domain.Words VALUES('scorching', N'''skɔːʧɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'палящий', N'пал''`ащ''ий''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'жаркий', N'ж`арк''ий''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'знойный', N'зн`ой''ный''', @LangRu_ID);
SELECT @targetId3 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @targetId3);
INSERT INTO @Translations VALUES(@@IDENTITY);
--shower
INSERT INTO domain.Words VALUES('shower', N'''ʃauə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'ливень', N'л''`ив''ин''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--warm
INSERT INTO domain.Words VALUES('warm', N'wɔːm', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'тёплый', N'т''облый''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--blizzard
INSERT INTO domain.Words VALUES('blizzard', N'''blɪzəd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'буран', N'бур`ан', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'пурга', N'пург`а', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--drought
INSERT INTO domain.Words VALUES('drought', N'draut', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'засуха', N'з`асуха', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--flood
INSERT INTO domain.Words VALUES('flood', N'flʌd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'наводнение', N'навадн''`эн''ий''э', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'потоп', N'пат`оп', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'половодье', N'палав`од''й''э', @LangRu_ID);
SELECT @targetId3 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--hailstorm
INSERT INTO domain.Words VALUES('hailstorm', N'''heɪlstɔːm', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'гроза с градом', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--heat wave
INSERT INTO domain.Words VALUES('heat wave', N'''hiːtˌweɪv', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'период сильной жары', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--hurricane
INSERT INTO domain.Words VALUES('hurricane', N'''hʌrɪkeɪn', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'ураган', N'ураг`ан', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--lightning
INSERT INTO domain.Words VALUES('lightning', N'''laɪtnɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'молния', N'м`олн''ий''а', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--monsoon
INSERT INTO domain.Words VALUES('monsoon', N'mɔn''suːn', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'муссон', N'мусс`он', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--thunder
INSERT INTO domain.Words VALUES('thunder', N'''θʌndə', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'гром', N'грам', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--tornado
INSERT INTO domain.Words VALUES('tornado', N'tɔː''neɪdəu', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'торнадо', N'тарн`ада', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'смерч', N'зм''ирч''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--slippery
INSERT INTO domain.Words VALUES('slippery', N'''slɪp(ə)rɪ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'скользкий', N'ск`ол''ск''ий''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--shivering
INSERT INTO domain.Words VALUES('shivering', N'''ʃɪvərɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'дрожание', N'драж`ан''ий''э', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'дрожь', N'драж', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
--sweating
INSERT INTO domain.Words VALUES('sweating', N'''swetɪŋ', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'потение', N'пат''`эн''ий''э', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
--humid
INSERT INTO domain.Words VALUES('humid', N'''hjuːmɪd', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'влажный', N'вл`ажный''', @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'сырой', N'сыр`ой''', @LangRu_ID);
SELECT @TargetId2 = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'мокрый', N'м`огрый''', @LangRu_ID);
SELECT @targetId3 = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId2);
INSERT INTO @Translations VALUES(@@IDENTITY);
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @targetId3);
INSERT INTO @Translations VALUES(@@IDENTITY);
--sunburnt
INSERT INTO domain.Words VALUES('sunburnt', N'''sʌnbɜːnt', @LangEn_ID);
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.Words VALUES(N'обгоревший', NULL, @LangRu_ID);
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.Translations(SOURCE_ID, TARGET_ID) VALUES(@SourceId, @TargetId);
INSERT INTO @Translations VALUES(@@IDENTITY);

INSERT INTO domain.Tags VALUES('Weather', 'Tag weather');
SELECT @SourceId = @@IDENTITY;
INSERT INTO domain.VocabBanks VALUES('Weather', 'Vocabulary bank about weather');
SELECT @TargetId = @@IDENTITY;
INSERT INTO domain.VocabBanksTags VALUES(@SourceId, @TargetId);

INSERT INTO domain.VocabBanksTranslations (TRANSLATION_ID, VOCABULARY_ID) 
	SELECT PK_ID as TRANSLATION_ID, @TargetId AS VOCABULARY_ID FROM @Translations;

DELETE FROM @Translations;