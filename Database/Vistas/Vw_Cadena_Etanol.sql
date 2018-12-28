USE [ZSINO]
GO

/****** Object:  View [dbo].[Vw_Cadena_Etanol]    Script Date: 12/28/2018 09:38:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[Vw_Cadena_Etanol]
AS
	SELECT a.SINOXCarga008_Año			AS AÑO
		 , a.SINOXCarga008_Etanol		AS ETANO
		 , a.SINOXCarga008_Etileno		AS ETILENO
		 , a.SINOXCarga008_OxidoEtileno	AS OXIDOETILENO	
		 , b.SINOX003_UDM			AS UDM
	FROM SINOXCarga008_CadenaEtanol a
	LEFT OUTER JOIN SINOX003_Catalogo_UDM b ON a.SINOXCarga008_UDM = B.SINOX003_Id


GO

