USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_NuevoRegistro_Proceso_Gas]    Script Date: 12/28/2018 10:13:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco Herrera
-- Create date: 12-11-2018
-- Description:	Crea registro Proceso Gas
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_NuevoRegistro_Proceso_Gas]
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
IF (SELECT COUNT(*) FROM SINOXCarga004_Proceso_Gas 
		WHERE	[SINOXCarga004_Año] = @AÑO 
		AND	[SINOXCarga004_Mes] = @MES) = 0

BEGIN TRANSACTION NUEVO_PROCESO_GAS;
BEGIN TRY
INSERT INTO SINOXCarga004_Proceso_Gas
VALUES(@AÑO,
		@MES,
		@GAS_HUMEDO_AMARGO,
		@GAS_HUMEDO_DULCE,
		@GAS_SECO,
		@UNIDAD_MEDIDA)

COMMIT TRANSACTION NUEVO_PROCESO_GAS;
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
		ROLLBACK TRANSACTION NUEVO_PROCESO_GAS;
	END
END	 CATCH
END

GO

