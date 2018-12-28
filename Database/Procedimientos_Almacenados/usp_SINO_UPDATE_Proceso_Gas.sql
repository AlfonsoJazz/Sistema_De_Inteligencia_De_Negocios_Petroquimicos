USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_UPDATE_Proceso_Gas]    Script Date: 12/28/2018 10:15:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco Herrera
-- Create date: 12-10-2018
-- Description:	Actualiza registro proceso Gas
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_UPDATE_Proceso_Gas]
(
	@AÑO INT,
	@MES INT,
	@GAS_HUMEDO_AMARGO DECIMAL(18,2),
	@GAS_HUMEDO_DULCE DECIMAL(18,2),
	@GAS_SECO DECIMAL(18,2),
	--@AGUAS_SOMERAS DECIMAL(18,2),
	--@SUR DECIMAL(18,2),
	--@NORTE DECIMAL(18,2),
	@UNIDAD_MEDIDA INT
)
AS
BEGIN 
-------------------------------
--DECLARE @TOTAL DECIMAL(18,2)
--SET @TOTAL = @AGUAS_SOMERAS + @SUR + @NORTE
-------------------------------
IF (SELECT COUNT(*) FROM [ZSINO].[dbo].[SINOXCarga004_Proceso_Gas] 
		WHERE	[SINOXCarga004_Año] = @AÑO 
		AND	[SINOXCarga004_Mes] = @MES) = 1 

BEGIN TRANSACTION ACTUALIZA_PROCESO_GAS;
BEGIN TRY
UPDATE [ZSINO].[dbo].[SINOXCarga004_Proceso_Gas]
	SET [SINOXCarga004_Año] = @AÑO
      ,[SINOXCarga004_Mes] = @MES
      ,[SINOXCarga004_GasHumedoAmardo] = @GAS_HUMEDO_AMARGO
      ,[SINOXCarga004_GasHumedoDulce] = @GAS_HUMEDO_DULCE
      ,[SINOXCarga004_GasSeco] = @GAS_SECO
      ,[SINOXCarga004_UDM] = @UNIDAD_MEDIDA
      WHERE [SINOXCarga004_Año] = @AÑO AND [SINOXCarga004_Mes] = @MES
COMMIT TRANSACTION ACTUALIZA_PROCESO_GAS;
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
		ROLLBACK TRANSACTION ACTUALIZA_PROCESO_GAS;
	END
END	 CATCH
END

GO

