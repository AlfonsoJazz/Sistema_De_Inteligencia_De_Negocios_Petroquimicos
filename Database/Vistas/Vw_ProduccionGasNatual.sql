USE [ZSINO]
GO

/****** Object:  View [dbo].[Vw_ProduccionGasNatual]    Script Date: 12/28/2018 09:46:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[Vw_ProduccionGasNatual]
AS 
	SELECT a.SINOXCarga002_Año						AS AÑO
		 , a.SINOXCarga002_Mes						AS MES
		 , a.SINOXCarga002_Total					AS TOTAL
		 , a.SINOXCarga002_AsociadoHidrocarburo		AS "GAS ASOCIADO HIDROCARBURO"
		 , a.SINOXCarga002_AsociadoNitrogeno		AS "GAS ASOCIADO NITROGENO"
		 , a.SINOXCarga002_NoAsociado				AS "GAS NO ASOCIADO"
		 , a.SINOXCarga002_Marinas					AS MARINA
		 , a.SINOXCarga002_Sur						AS SUR
		 , a.SINOXCarga002_Norte					AS NORTE
		 , b.SINOX003_UDM							AS UDM
	FROM SINOXCarga002_ProduccionGasNatual a
	LEFT OUTER JOIN SINOX003_Catalogo_UDM b ON a.SINOXCarga002_UDM = B.SINOX003_Id
--	ORDER BY 1, 2

GO

