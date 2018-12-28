USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_Solicita_Mes_Año]    Script Date: 12/28/2018 10:14:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco Herrera
-- Create date: 8-11-2018
-- Description:	Selecciona el ultimo registro segun la tabla solicitada para su modificacion
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_Solicita_Mes_Año] 
(
	@TABLA_CONSULTA NVARCHAR(200)
)
AS
BEGIN
	DECLARE @ULTIMO_AÑO INT
	DECLARE @ULTIMO_MES INT
	------------------
	IF @TABLA_CONSULTA = 'SINOXCarga001_ProduccionHidrocarburosLiquidos'
	BEGIN
		--ELEGIMOS ULTIMO AÑO REGISTRO
		SELECT @ULTIMO_AÑO = MAX([SINOXCarga001_Año])  
		FROM [ZSINO].[dbo].[SINOXCarga001_ProduccionHidrocarburosLiquidos]
		--ELEGIMOS ULTIMO MES DEL AÑO DEL ULTIMO REGISTRO
		SELECT @ULTIMO_MES = MAX([SINOXCarga001_Mes])   
		FROM [ZSINO].[dbo].[SINOXCarga001_ProduccionHidrocarburosLiquidos] 
		WHERE [SINOXCarga001_Año] = @ULTIMO_AÑO
		-- BUSCAMOS ESE REGISTRO
		SELECT  
		[SINOXCarga001_Año], 
		[SINOXCarga001_Mes] 
		FROM [ZSINO].[dbo].[SINOXCarga001_ProduccionHidrocarburosLiquidos] 
		WHERE [SINOXCarga001_Año] = @ULTIMO_AÑO AND [SINOXCarga001_Mes] = @ULTIMO_MES
	END
	------------------
	IF @TABLA_CONSULTA = 'SINOXCarga002_ProduccionGasNatual'
	BEGIN
		--ELEGIMOS ULTIMO AÑO REGISTRO
		SELECT @ULTIMO_AÑO = MAX([SINOXCarga002_Año])  
		FROM [ZSINO].[dbo].[SINOXCarga002_ProduccionGasNatual]
		--ELEGIMOS ULTIMO MES DEL AÑO DEL ULTIMO REGISTRO
		SELECT @ULTIMO_MES = MAX([SINOXCarga002_Mes])   
		FROM [ZSINO].[dbo].[SINOXCarga002_ProduccionGasNatual]
		WHERE [SINOXCarga002_Año] = @ULTIMO_AÑO
		-- BUSCAMOS ESE REGISTRO
		SELECT 
		SINOXCarga002_Año,
		SINOXCarga002_Mes 
		FROM [ZSINO].[dbo].[SINOXCarga002_ProduccionGasNatual]
		WHERE [SINOXCarga002_Año] = @ULTIMO_AÑO AND [SINOXCarga002_Mes] = @ULTIMO_MES
	END
	------------------
	IF @TABLA_CONSULTA = 'SINOXCarga003_Proceso_GasLiquidosFraccionados'
	BEGIN
		--ELEGIMOS ULTIMO AÑO REGISTRO
		SELECT @ULTIMO_AÑO = MAX([SINOXCarga003_Año])  
		FROM [ZSINO].[dbo].[SINOXCarga003_Proceso_GasLiquidosFraccionados]
		--ELEGIMOS ULTIMO MES DEL AÑO DEL ULTIMO REGISTRO
		SELECT @ULTIMO_MES = MAX([SINOXCarga003_Mes])   
		FROM [ZSINO].[dbo].[SINOXCarga003_Proceso_GasLiquidosFraccionados]
		WHERE [SINOXCarga003_Año] = @ULTIMO_AÑO
		-- BUSCAMOS ESE REGISTRO
		SELECT 
		SINOXCarga003_Año,
		SINOXCarga003_Mes
		FROM [ZSINO].[dbo].[SINOXCarga003_Proceso_GasLiquidosFraccionados]
		WHERE [SINOXCarga003_Año] = @ULTIMO_AÑO AND [SINOXCarga003_Mes] = @ULTIMO_MES
	END
	------------------
	IF @TABLA_CONSULTA = 'SINOXCarga004_Proceso_Gas'
	BEGIN
		--ELEGIMOS ULTIMO AÑO REGISTRO
		SELECT @ULTIMO_AÑO = MAX([SINOXCarga004_Año])  
		FROM [ZSINO].[dbo].[SINOXCarga004_Proceso_Gas]
		--ELEGIMOS ULTIMO MES DEL AÑO DEL ULTIMO REGISTRO
		SELECT @ULTIMO_MES = MAX([SINOXCarga004_Mes])   
		FROM [ZSINO].[dbo].[SINOXCarga004_Proceso_Gas]
		WHERE [SINOXCarga004_Año] = @ULTIMO_AÑO
		-- BUSCAMOS ESE REGISTRO
		SELECT  
		SINOXCarga004_Año,
		SINOXCarga004_Mes
		FROM [ZSINO].[dbo].[SINOXCarga004_Proceso_Gas]
		WHERE [SINOXCarga004_Año] = @ULTIMO_AÑO AND [SINOXCarga004_Mes] = @ULTIMO_MES
	END
	------------------
	IF @TABLA_CONSULTA = 'SINOXCarga005_ProductoPetroquimicos'
	BEGIN
		--ELEGIMOS ULTIMO AÑO REGISTRO
		SELECT @ULTIMO_AÑO = MAX([SINOXCarga005_Año])  
		FROM [ZSINO].[dbo].[SINOXCarga005_ProductoPetroquimicos]
		--ELEGIMOS ULTIMO MES DEL AÑO DEL ULTIMO REGISTRO
		SELECT @ULTIMO_MES = MAX([SINOXCarga005_Mes])   
		FROM [ZSINO].[dbo].[SINOXCarga005_ProductoPetroquimicos]
		WHERE [SINOXCarga005_Año] = @ULTIMO_AÑO
		-- BUSCAMOS ESE REGISTRO
		SELECT 
		SINOXCarga005_Año,
		SINOXCarga005_Mes
		FROM [ZSINO].[dbo].[SINOXCarga005_ProductoPetroquimicos]
		WHERE [SINOXCarga005_Año] = @ULTIMO_AÑO AND [SINOXCarga005_Mes] = @ULTIMO_MES
	END
	------------------
	IF @TABLA_CONSULTA = 'SINOXCarga006_ImportacionEtanol'
	BEGIN
		--ELEGIMOS ULTIMO AÑO REGISTRO
		SELECT @ULTIMO_AÑO = MAX([SINOXCarga006_Año])  
		FROM [ZSINO].[dbo].[SINOXCarga006_ImportacionEtanol]
		--ELEGIMOS ULTIMO MES DEL AÑO DEL ULTIMO REGISTRO
		SELECT @ULTIMO_MES = MAX([SINOXCarga006_Mes])   
		FROM [ZSINO].[dbo].[SINOXCarga006_ImportacionEtanol]
		WHERE [SINOXCarga006_Año] = @ULTIMO_AÑO
		-- BUSCAMOS ESE REGISTRO
		SELECT
		SINOXCarga006_Año,
		SINOXCarga006_Mes
		FROM [ZSINO].[dbo].[SINOXCarga006_ImportacionEtanol]
		WHERE [SINOXCarga006_Año] = @ULTIMO_AÑO AND [SINOXCarga006_Mes] = @ULTIMO_MES
	END
	--------------------
	IF @TABLA_CONSULTA = 'SINOXCarga007_GasNatualComplejos'
	BEGIN
		--ELEGIMOS ULTIMO AÑO REGISTRO
		SELECT @ULTIMO_AÑO = MAX([SINOXCarga007_Año])  
		FROM [ZSINO].[dbo].[SINOXCarga007_GasNatualComplejos]
		--ELEGIMOS ULTIMO MES DEL AÑO DEL ULTIMO REGISTRO
		SELECT @ULTIMO_MES = MAX([SINOXCarga007_Mes])   
		FROM [ZSINO].[dbo].[SINOXCarga007_GasNatualComplejos]
		WHERE [SINOXCarga007_Año] = @ULTIMO_AÑO
		-- BUSCAMOS ESE REGISTRO
		SELECT DISTINCT [SINOXCarga007_Año], [SINOXCarga007_Mes]
		FROM [ZSINO].[dbo].[SINOXCarga007_GasNatualComplejos]
		WHERE [SINOXCarga007_Año] = @ULTIMO_AÑO AND [SINOXCarga007_Mes] = @ULTIMO_MES
	END
END
--EXEC [usp_SINO_Solicita_Mes_Año] 'SINOXCarga007_GasNatualComplejos'
GO

