USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_Solicita_Año_CadenaEtanol]    Script Date: 12/28/2018 10:13:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco Herrera
-- Create date: 23-11-2018
-- Description:	Selecciona el año de cadena de etanol
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_Solicita_Año_CadenaEtanol] 
	(
	@DAME_ORDEN VARCHAR(50)
	)
AS
BEGIN
IF @DAME_ORDEN = 'DAME_FECHA'
BEGIN
	SELECT MAX([SINOXCarga008_Año]) FROM [ZSINO].[dbo].[SINOXCarga008_CadenaEtanol]	
END

IF @DAME_ORDEN = 'ULTIMO_REGISTRO'
BEGIN
DECLARE @ULTIMO_AÑO INT

	SELECT @ULTIMO_AÑO = MAX([SINOXCarga008_Año]) FROM [ZSINO].[dbo].[SINOXCarga008_CadenaEtanol]	
	
	SELECT * FROM [ZSINO].[dbo].[SINOXCarga008_CadenaEtanol]
	WHERE [SINOXCarga008_Año] = @ULTIMO_AÑO
END
END

--EXEC usp_SINO_Solicita_Año_CadenaEtanol 'DAME_FECHA'
GO

