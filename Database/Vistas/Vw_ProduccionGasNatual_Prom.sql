USE [ZSINO]
GO

/****** Object:  View [dbo].[Vw_ProduccionGasNatual_Prom]    Script Date: 12/28/2018 09:46:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[Vw_ProduccionGasNatual_Prom]
AS
	
	SELECT a.SINOXCarga002_Año													AS AÑO
		 --, a.SINOXCarga002_Mes
		 , Convert(int,Round(AVG(a.SINOXCarga002_Total),0,1))					AS TOTAL
		 , Convert(int,Round(AVG(a.SINOXCarga002_AsociadoHidrocarburo),0,1))	AS "GAS ASOCIADO HIDROCARBURO"
		 , Convert(int,Round(AVG(a.SINOXCarga002_AsociadoNitrogeno),0,1))		AS "GAS ASOCIADO NITROGENO"
		 , Convert(int,Round(AVG(a.SINOXCarga002_NoAsociado),0,1))				AS "GAS NO ASOCIADO"
		 , Convert(int,Round(AVG(a.SINOXCarga002_Marinas),0,1))					AS MARINA
		 , Convert(int,Round(AVG(a.SINOXCarga002_Sur),0,1))						AS SUR
		 , Convert(int,Round(AVG(a.SINOXCarga002_Norte),0,1))					AS NORTE	
		 , b.SINOX003_UDM														AS UDM
	FROM SINOXCarga002_ProduccionGasNatual a
	LEFT OUTER JOIN SINOX003_Catalogo_UDM b ON a.SINOXCarga002_UDM = B.SINOX003_Id
	GROUP BY A.SINOXCarga002_Año, b.SINOX003_UDM
--	ORDER BY 1, 2


GO

