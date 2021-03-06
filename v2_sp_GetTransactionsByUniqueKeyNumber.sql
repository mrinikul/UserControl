USE [FRS_Workforce]
GO
/****** Object:  StoredProcedure [dbo].[v2_sp_GetTransactionsByUniqueKeyNumber]    Script Date: 09/17/2018 17:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Irina NIK
-- Create date: 05/07/2010
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[v2_sp_GetTransactionsByUniqueKeyNumber]
	-- Add the parameters for the stored procedure here
	@TableName [varchar](50) = NULL,
	@FieldName [varchar](50) = NULL,
	@UniqueKeyNumber [char](14) = NULL
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @SQLstatement NVARCHAR(MAX)
    -- Insert statements for procedure here
	SET @SQLstatement = 'SELECT ' +
		' RecKey, OldValue, NewValue, UserID, ' +
		' CONVERT(VARCHAR,CONVERT(DATETIME, ChangeDate),101) ChangeDate, ' +
		' CONVERT(DATETIME,CONVERT(VARCHAR,CONVERT(DATETIME, ChangeDate),101)) ChangeDate1, ' +
		' CONVERT(VARCHAR,CONVERT(TIME, ChangeTime),108) ChangeTime, ' +
		' CONVERT(time,CONVERT(VARCHAR,CONVERT(TIME, ChangeTime),108)) ChangeTime1 ' +
		' FROM Transactions WHERE ISNULL(OldValue,' + CHAR(39) + CHAR(39) + ') <>' + CHAR(39) + 'INSERT'  + CHAR(39) + ' AND ' +
		' TableName=' + CHAR(39) + @TableName + CHAR(39) + ' AND ' +
		' FieldName=' + CHAR(39) + @FieldName + CHAR(39) + ' AND ' +
		' UniqueKeyNumber=' + CHAR(39) + @UniqueKeyNumber + CHAR(39) +
		' ORDER BY CONVERT(DATETIME,CONVERT(VARCHAR,CONVERT(DATETIME, ChangeDate),101)) +  CONVERT(TIME,CONVERT(VARCHAR,CONVERT(TIME, ChangeTime),108)) '
		
	EXECUTE sp_executesql @SQLstatement 
	
END



