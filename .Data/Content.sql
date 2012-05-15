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