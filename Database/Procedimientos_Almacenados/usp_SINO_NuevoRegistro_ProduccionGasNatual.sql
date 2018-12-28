USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_NuevoRegistro_ProduccionGasNatual]    Script Date: 12/28/2018 10:13:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco H
-- Create date: 07-11-2018
-- Description:	Inserta en Produccion gas natural
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_NuevoRegistro_ProduccionGasNatual]
(
	@AÑO INT,
	@MES INT,
	--@TOTAL DECIMAL(18,2),
	@A_HIDROCARBURO DECIMAL(18,2),
	@A_NITROGENO DECIMAL(18,2),
	@NO_ASOCIADO DECIMAL(18,2),
	@AGUAS_SOMERAS DECIMAL(18,2),
	@SUR DECIMAL(18,2),
	@NORTE DECIMAL(18,2),
	@UNIDAD_MEDIDA INT
)
AS
BEGIN 

DECLARE @TOTAL DECIMAL(18,2)
SET @TOTAL = @AGUAS_SOMERAS + @SUR + @NORTE

	IF (SELECT COUNT(*) FROM [ZSINO].[dbo].[SINOXCarga002_ProduccionGasNatual] 
		WHERE	SINOXCarga002_Año = @AÑO 
			AND	SINOXCarga002_Mes = @MES) = 0  
BEGIN TRANSACTION NUEVO_REGISTRO_GN
BEGIN TRY
INSERT INTO [ZSINO].[dbo].[SINOXCarga002_ProduccionGasNatual]
	VALUES(	@AÑO, 
			@MES, 
			@TOTAL, 
			@A_HIDROCARBURO, 
			@A_NITROGENO, 
			@NO_ASOCIADO, 
			@AGUAS_SOMERAS, 
			@SUR, 
			@NORTE, 
			@UNIDAD_MEDIDA)
COMMIT TRANSACTION NUEVO_REGISTRO_GN
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION NUEVO_REGISTRO_GN
END	 CATCH
END
GO

