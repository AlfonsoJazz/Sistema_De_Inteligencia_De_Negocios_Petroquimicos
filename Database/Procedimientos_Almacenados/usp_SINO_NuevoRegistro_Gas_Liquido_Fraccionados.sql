USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_NuevoRegistro_Gas_Liquido_Fraccionados]    Script Date: 12/28/2018 10:12:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco H
-- Create date: 07-11-2018
-- Description:	Inserta en Gas liquido Fraccionados
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_NuevoRegistro_Gas_Liquido_Fraccionados]
(
	@AÑO INT,
	@MES INT,
	@ETANO DECIMAL(18,2),
	@GAS_LICUADO DECIMAL(18,2),
	@GASOLINA DECIMAL(18,2),
	@OTROS DECIMAL(18,2),
	@UNIDAD_MEDIDA INT
)
AS
BEGIN 

DECLARE @TOTAL DECIMAL(18,2)
SET @TOTAL = @ETANO + @GAS_LICUADO + @GASOLINA + @OTROS

IF (SELECT COUNT(*) FROM [ZSINO].[dbo].[SINOXCarga003_Proceso_GasLiquidosFraccionados] 
	WHERE	SINOXCarga003_Año = @AÑO 
		AND	SINOXCarga003_Mes = @MES) = 0  
BEGIN TRANSACTION NUEVO_REGISTRO_GLF
BEGIN TRY

INSERT INTO [ZSINO].[dbo].[SINOXCarga003_Proceso_GasLiquidosFraccionados]
	VALUES(	@AÑO, 
			@MES, 
			@TOTAL, 
			@ETANO, 
			@GAS_LICUADO, 
			@GASOLINA, 
			@OTROS,  
			@UNIDAD_MEDIDA)
COMMIT TRANSACTION NUEVO_REGISTRO_GLF
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION NUEVO_REGISTRO_GLF
END	 CATCH
END
GO

