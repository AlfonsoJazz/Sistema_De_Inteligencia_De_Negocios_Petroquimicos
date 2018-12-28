USE [ZSINO]
GO

/****** Object:  View [dbo].[Vw_GasNatualComplejos_Previa]    Script Date: 12/28/2018 09:45:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Vw_GasNatualComplejos_Previa]
AS

	SELECT a.SINOXCarga007_Año			AS AÑO	
		 , Case When a.SINOXCarga007_Mes < 10 
				THEN CONVERT(Varchar(4),a.SINOXCarga007_Año) + '/0' + CONVERT(varchar(2),a.SINOXCarga007_Mes)
				ELSE CONVERT(Varchar(4),a.SINOXCarga007_Año) + '/' + CONVERT(varchar(2),a.SINOXCarga007_Mes)
			END									AS An_Ms
		 , a.SINOXCarga007_Origen		AS ORIGEN	
		 , a.SINOXCarga007_Tipo			AS TIPO
		 , a.SINOXCarga007_Region		AS REGION
		 , a.SINOXCarga007_Complejo		AS COMPLEJO
		 , a.SINOXCarga007_Vol			AS VOL
		 , b.SINOX003_UDM				AS UDM
	FROM SINOXCarga007_GasNatualComplejos a
	LEFT OUTER JOIN SINOX003_Catalogo_UDM b ON a.SINOXCarga007_UDM = B.SINOX003_Id





GO

