USE [ZSINO]
GO

/****** Object:  View [dbo].[Vw_PemexGasEtano]    Script Date: 12/28/2018 09:45:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[Vw_PemexGasEtano]
AS	

	SELECT 2000 as Año
		 , 1 as UDM
		 , 156 as Produce_Etano
		 , 0 as Importa_Etano
	UNION ALL
	SELECT 2001, 1, 147, 0
	UNION ALL
	SELECT 2002, 1, 127, 0
	UNION ALL
	SELECT 2003, 1, 125, 0
	UNION ALL
	SELECT 2004, 1, 133, 0
	UNION ALL
	SELECT 2005, 1, 129, 0
	UNION ALL
	SELECT 2006, 1, 127, 0
	UNION ALL
	SELECT 2007, 1, 119, 0
	UNION ALL
	SELECT 2008, 1, 117, 0
	UNION ALL
	SELECT 2009, 1, 121, 0
	UNION ALL
	SELECT 2010, 1, 120, 0
	UNION ALL
	SELECT 2011, 1, 121, 0
	UNION ALL
	SELECT a.SINOXCarga003_Año												AS Año
		 , a.SINOXCarga003_UDM												as UDM
		 , Convert(int,Round(AVG(a.SINOXCarga003_LF_Etano),0,1))			as Produce_Etano
		 , ISNULL(Convert(int,Round(AVG(b.SINOXCarga006_EtanolMDB),0,1)),0) as Importa_Etano 
	  FROM SINOXCarga003_Proceso_GasLiquidosFraccionados A
	  LEFT OUTER JOIN SINOXCarga006_ImportacionEtanol b ON a.SINOXCarga003_Año = b.SINOXCarga006_Año
	Group BY a.SINOXCarga003_Año, a.SINOXCarga003_UDM, b.SINOXCarga006_Año
--Order by 1, 2

GO

