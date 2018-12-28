USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_UPDATE_ProduccionGasNatual]    Script Date: 12/28/2018 10:15:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco H
-- Create date: 12-11-2018
-- Description:	actualiza registro produccion ga natural
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_UPDATE_ProduccionGasNatual]
(
	@AÑO INT,
	@MES INT,
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
-------------------------------
DECLARE @TOTAL DECIMAL(18,2)
SET @TOTAL = @AGUAS_SOMERAS + @SUR + @NORTE
-------------------------------
	IF (SELECT COUNT(*) FROM [ZSINO].[dbo].[SINOXCarga002_ProduccionGasNatual] 
		WHERE	SINOXCarga002_Año = @AÑO 
			AND	SINOXCarga002_Mes = @MES) = 1  
BEGIN TRANSACTION ACTUALIZA_PGN;
BEGIN TRY
UPDATE [ZSINO].[dbo].[SINOXCarga002_ProduccionGasNatual]
	SET [SINOXCarga002_Año] = @AÑO
      ,[SINOXCarga002_Mes] = @MES
      ,[SINOXCarga002_Total] = @TOTAL
      ,[SINOXCarga002_AsociadoHidrocarburo] = @A_HIDROCARBURO
      ,[SINOXCarga002_AsociadoNitrogeno] = @A_NITROGENO
      ,[SINOXCarga002_NoAsociado] = @NO_ASOCIADO
      ,[SINOXCarga002_Marinas] = @AGUAS_SOMERAS
      ,[SINOXCarga002_Sur] = @SUR
      ,[SINOXCarga002_Norte] = @NORTE
      ,[SINOXCarga002_UDM] = @UNIDAD_MEDIDA
      WHERE [SINOXCarga002_Año] = @AÑO AND [SINOXCarga002_Mes] = @MES
COMMIT TRANSACTION ACTUALIZA_PGN;
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
		ROLLBACK TRANSACTION ACTUALIZA_PGN;
	END
END	 CATCH
END

GO

