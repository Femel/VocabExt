USE [VX]
GO
/****** Object:  StoredProcedure [dbo].[AspNet_SqlCacheUnRegisterTableStoredProcedure]    Script Date: 06/27/2012 08:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AspNet_SqlCacheUnRegisterTableStoredProcedure] 
             @tableName NVARCHAR(450) 
         AS
         BEGIN

         BEGIN TRAN
                  DECLARE @triggerName AS NVARCHAR(3000)
         DECLARE @fullTriggerName AS NVARCHAR(3000)
         
                

--Vivek Start --Added A
 DECLARE @schemaName NVARCHAR(3000)
                IF(CHARINDEX('.',@tableName) <> 0)
                BEGIN
                        SET @schemaName = SUBSTRING(@tableName,0,CHARINDEX('.',@tableName))
                        SET @tableName =  SUBSTRING(@tableName,CHARINDEX('.',@tableName) + 1,LEN(@tableName) - CHARINDEX('.',@tableName))
                END
--Vivek END A
                



         /* Create the trigger name */
         SET @triggerName = REPLACE(@tableName, '[', '__o__')
         SET @triggerName = REPLACE(@triggerName, ']', '__c__')
         SET @triggerName = @triggerName + '_AspNet_SqlCacheNotification_Trigger'
         --Vivek Commented --SET @fullTriggerName = 'dbo[' + @triggerName + ']'
 IF(@schemaName IS NOT NULL)
                        SET @fullTriggerName ='[' + @schemaName + '].[' + @triggerName + ']'
                 ELSE
                        SET @fullTriggerName = 'dbo.[' + @triggerName + ']'

         /* Remove the table-row from the notification table */ 
         IF EXISTS (SELECT name FROM sysobjects WITH (NOLOCK) WHERE name = 'AspNet_SqlCacheTablesForChangeNotification' AND type = 'U') 
             IF EXISTS (SELECT name FROM sysobjects WITH (TABLOCKX) WHERE name = 'AspNet_SqlCacheTablesForChangeNotification' AND type = 'U') 
             DELETE FROM dbo.AspNet_SqlCacheTablesForChangeNotification WHERE tableName = @tableName 

         /* Remove the trigger */ 
         IF EXISTS (SELECT name FROM sysobjects WITH (NOLOCK) WHERE name = @triggerName AND type = 'TR') 
             IF EXISTS (SELECT name FROM sysobjects WITH (TABLOCKX) WHERE name = @triggerName AND type = 'TR') 
             EXEC('DROP TRIGGER ' + @fullTriggerName) 

         COMMIT TRAN
         END
   