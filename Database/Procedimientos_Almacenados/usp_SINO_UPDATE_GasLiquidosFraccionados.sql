USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_UPDATE_GasLiquidosFraccionados]    Script Date: 12/28/2018 10:14:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco Herrera
-- Create date: 09-11-2018
-- Description:	Actualiza registro solicitado
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_UPDATE_GasLiquidosFraccionados]
(
	@AÑO INT,
	@MES INT,
	@ETANOL DECIMAL(18,2),
	@GAS_LICUADO DECIMAL(18,2),
	@GASOLINA DECIMAL(18,2),
	@OTROS DECIMAL(18,2),
	@UNIDAD_MEDIDA INT
)
AS
BEGIN
--Para conseguir el total y el total crudo
DECLARE @TOTAL DECIMAL(18,2)
SET @TOTAL = @ETANOL + @GAS_LICUADO + @GASOLINA + @OTROS
----------------INICIO TRANSACCION 
IF (SELECT COUNT(*) FROM [ZSINO].[dbo].[SINOXCarga003_Proceso_GasLiquidosFraccionados] 
	WHERE	SINOXCarga003_Año = @AÑO 
	AND	SINOXCarga003_Mes = @MES ) = 1
BEGIN TRANSACTION ACTUALIZA_REGISTRO_GLF;
	BEGIN TRY
	--Actualizamos los valores en la base de datos
	UPDATE [ZSINO].[dbo].[SINOXCarga003_Proceso_GasLiquidosFraccionados]
		SET [SINOXCarga003_Año] = @AÑO
	      ,[SINOXCarga003_Mes] = @MES
	      ,[SINOXCarga003_LiquidosFraccionados] = @TOTAL
	      ,[SINOXCarga003_LF_Etano] = @ETANOL
	      ,[SINOXCarga003_LF_GasLicuado] = @GAS_LICUADO
	      ,[SINOXCarga003_LF_Gasolina] = @GASOLINA
	      ,[SINOXCarga003_LF_Otros] = @OTROS
	      ,[SINOXCarga003_UDM] = @UNIDAD_MEDIDA
	WHERE [SINOXCarga003_Año] = @AÑO AND [SINOXCarga003_Mes] = @MES
	COMMIT TRANSACTION ACTUALIZA_REGISTRO_GLF;
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
		ROLLBACK TRANSACTION ACTUALIZA_REGISTRO_GLF;
	END
END	 CATCH
END
GO

