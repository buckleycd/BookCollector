USE [BookCollector]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSchemaDDL]    Script Date: 9/3/2022 10:21:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--#################################################################################################
-- Real World DBA Toolkit Version 2019-08-01 Lowell Izaguirre lowell@stormrage.com
--#################################################################################################
CREATE   PROCEDURE [dbo].[sp_GetSchemaDDL]
  @SCHNAME              VARCHAR(255)
AS
BEGIN
SET NOCOUNT ON;
DECLARE @SavedSchema TABLE ( [ScriptDefinition] VARCHAR(max) NULL);
DECLARE @QualifiedObjectName  VARCHAR(260),
        @SchemaName           VARCHAR(128),
        @ObjectName           VARCHAR(128),
        @ObjectType           VARCHAR(128);
DECLARE [c1] CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR
--###############################################################################################
--cursor definition
--###############################################################################################
  SELECT
    QUOTENAME(SCHEMA_NAME([schema_id])) + '.' + QUOTENAME([name]) AS [QualifiedObjectName],
    SCHEMA_NAME([schema_id]) AS [SchemaName],
    [name] AS [ObjectName],
    [type_desc] FROM [sys].[objects]
  WHERE [type_desc] IN('USER_TABLE' ) AND SCHEMA_NAME([schema_id]) = @SCHNAME
                     --'SYNONYM','SQL_STORED_PROCEDURE','VIEW','SQL_INLINE_TABLE_VALUED_FUNCTION','SQL_SCALAR_FUNCTION', 'SQL_TABLE_VALUED_FUNCTION'
                     ORDER BY [QualifiedObjectName];
--###############################################################################################
--DELETE FROM @SavedSchema;
OPEN [c1];
FETCH NEXT FROM [c1] INTO @QualifiedObjectName,@SchemaName,@ObjectName,@ObjectType;
WHILE @@fetch_status <> -1
  BEGIN
      INSERT INTO @SavedSchema([ScriptDefinition])
        EXECUTE [dbo].[sp_GetDDL] @QualifiedObjectName;
    FETCH NEXT FROM [c1] INTO @QualifiedObjectName,@SchemaName,@ObjectName,@ObjectType;
  END;
CLOSE [c1];
DEALLOCATE [c1];
SELECT * FROM @SavedSchema
END;
GO
