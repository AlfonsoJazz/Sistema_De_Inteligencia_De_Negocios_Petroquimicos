USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_Solicita_Ultimo_Registro]    Script Date: 12/28/2018 10:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco Herrera
-- Create date: 8-11-2018
-- Description:	Selecciona el ultimo registro segun la tabla solicitada para su modificacion
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_Solicita_Ultimo_Registro] 
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
		SELECT * FROM [ZSINO].[dbo].[SINOXCarga001_ProduccionHidrocarburosLiquidos] 
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
		SELECT * FROM [ZSINO].[dbo].[SINOXCarga002_ProduccionGasNatual]
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
		SELECT * FROM [ZSINO].[dbo].[SINOXCarga003_Proceso_GasLiquidosFraccionados]
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
		SELECT * FROM [ZSINO].[dbo].[SINOXCarga004_Proceso_Gas]
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
		SELECT * FROM [ZSINO].[dbo].[SINOXCarga005_ProductoPetroquimicos]
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
		SELECT * FROM [ZSINO].[dbo].[SINOXCarga006_ImportacionEtanol]
		WHERE [SINOXCarga006_Año] = @ULTIMO_AÑO AND [SINOXCarga006_Mes] = @ULTIMO_MES
	END
	--------------------
--ESTE SE REALIZO APARTE YA QUE ES BAJO DEMANDA DEL REGISTRO A MODIFICAR 
	IF @TABLA_CONSULTA = 'SINOXCarga007_GasNatualComplejos'
	BEGIN
	--DECLARE @ORIGEN VARCHAR(20)
	--DECLARE @TIPO VARCHAR(50)
	--DECLARE @REGION VARCHAR(50)
	--DECLARE @COMPLEJO VARCHAR(50)
		--ELEGIMOS ULTIMO AÑO REGISTRO
		SELECT @ULTIMO_AÑO = MAX([SINOXCarga007_Año])  
		FROM [ZSINO].[dbo].[SINOXCarga007_GasNatualComplejos]
		--ELEGIMOS ULTIMO MES DEL AÑO DEL ULTIMO REGISTRO
		SELECT @ULTIMO_MES = MAX([SINOXCarga007_Mes])   
		FROM [ZSINO].[dbo].[SINOXCarga007_GasNatualComplejos]
		WHERE [SINOXCarga007_Año] = @ULTIMO_AÑO
		----ELEGIMOS AHORA ORIGEN
		--SELECT @ORIGEN = MAX([SINOXCarga007_Origen])
		--FROM [ZSINO].[dbo].[SINOXCarga007_GasNatualComplejos]
		--WHERE [SINOXCarga007_Año] = @ULTIMO_AÑO AND [SINOXCarga007_Mes] = @ULTIMO_MES
		----ELEGIMOS AHORA TIPO 
		--SELECT @TIPO = MAX([SINOXCarga007_Tipo])
		--FROM [ZSINO].[dbo].[SINOXCarga007_GasNatualComplejos]
		--WHERE [SINOXCarga007_Año] = @ULTIMO_AÑO AND [SINOXCarga007_Mes] = @ULTIMO_MES AND [SINOXCarga007_Origen] = @ORIGEN
		----ELEGIMOS REGION 
		--SELECT @REGION = MAX([SINOXCarga007_Region])
		--FROM [ZSINO].[dbo].[SINOXCarga007_GasNatualComplejos]
		--WHERE [SINOXCarga007_Año] = @ULTIMO_AÑO AND [SINOXCarga007_Mes] = @ULTIMO_MES AND [SINOXCarga007_Origen] = @ORIGEN AND [SINOXCarga007_Tipo] = @TIPO
		----POR ULTIMO ELEGIMOS COMPLEJO PARA REALIZAR LA BUSQUEDA
		--SELECT @COMPLEJO = MAX([SINOXCarga007_Complejo]) 
		--FROM [ZSINO].[dbo].[SINOXCarga007_GasNatualComplejos]
		--WHERE [SINOXCarga007_Año] = @ULTIMO_AÑO AND [SINOXCarga007_Mes] = @ULTIMO_MES AND [SINOXCarga007_Origen] = @ORIGEN AND [SINOXCarga007_Tipo] = @TIPO AND [SINOXCarga007_Region] = @REGION
		-- BUSCAMOS ESE REGISTRO
		SELECT * FROM [ZSINO].[dbo].[SINOXCarga007_GasNatualComplejos]
		WHERE [SINOXCarga007_Año] = @ULTIMO_AÑO AND [SINOXCarga007_Mes] = @ULTIMO_MES 
		--AND [SINOXCarga007_Origen] = @ORIGEN AND [SINOXCarga007_Tipo] = @TIPO AND [SINOXCarga007_Region] = @REGION AND [SINOXCarga007_Complejo] = @COMPLEJO
	END

END

--EXEC usp_SINO_Solicita_Ultimo_Registro 'SINOXCarga007_GasNatualComplejos'
GO

