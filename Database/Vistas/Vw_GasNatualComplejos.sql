USE [ZSINO]
GO

/****** Object:  View [dbo].[Vw_GasNatualComplejos]    Script Date: 12/28/2018 09:45:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Vw_GasNatualComplejos]
AS

	SELECT a.SINOXCarga007_Año			AS AÑO	
		 , Case When a.SINOXCarga007_Mes < 10 
				THEN CONVERT(Varchar(4),a.SINOXCarga007_Año) + '/0' + CONVERT(varchar(2),a.SINOXCarga007_Mes)
				ELSE CONVERT(Varchar(4),a.SINOXCarga007_Año) + '/' + CONVERT(varchar(2),a.SINOXCarga007_Mes)
			END							AS An_Ms
		 , Case c.SINOX001_Trimestre
				WHEN 1 THEN '1er'
				WHEN 2 THEN '2do'
				WHEN 3 THEN '3er'
				WHEN 4 THEN '4to'
			END							AS Trimestre
		 , a.SINOXCarga007_Origen		AS ORIGEN	
		 , a.SINOXCarga007_Tipo			AS TIPO
		 , a.SINOXCarga007_Region		AS REGION
		 , a.SINOXCarga007_Complejo		AS COMPLEJO
		 , a.SINOXCarga007_Vol			AS VOL
		 
		 , (SELECT P.VOL 
		      FROM Vw_GasNatualComplejos_Previa P
	         WHERE P.An_Ms = (Select MAX(an_ms) from Vw_GasNatualComplejos_Previa)
	           AND P.ORIGEN = a.SINOXCarga007_Origen
	           AND P.TIPO = a.SINOXCarga007_Tipo
	           AND P.REGION = a.SINOXCarga007_Region
	           AND P.COMPLEJO = a.SINOXCarga007_Complejo) AS VOLFIN
	           
		 , b.SINOX003_UDM				AS UDM
	FROM SINOXCarga007_GasNatualComplejos a
	LEFT OUTER JOIN SINOX003_Catalogo_UDM b ON a.SINOXCarga007_UDM = B.SINOX003_Id
	LEFT OUTER JOIN SINOX009_Trimestres c ON a.SINOXCarga007_Mes = c.SINOX001_Mes
	


GO

