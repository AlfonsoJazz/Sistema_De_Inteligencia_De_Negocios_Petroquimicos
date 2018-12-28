USE [ZSINO]
GO

/****** Object:  View [dbo].[VW_ProduccionHidrocarburosLiquidos]    Script Date: 12/28/2018 09:46:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[VW_ProduccionHidrocarburosLiquidos]
AS
Select A.SINOXCarga001_Año				AS AÑO
	 , A.SINOXCarga001_Mes				AS MES
	 , A.SINOXCarga001_Total			AS TOTAL
	 , A.SINOXCarga001_TotalCrudo		AS TOT_CRUDO
	 , A.SINOXCarga001_CrudoPesado		AS CRUDO_PESADO
	 , A.SINOXCarga001_CrudoLigero		AS CRUDO_LIGERO
	 , A.SINOXCarga001_CrudoSuperLigero	AS CRUDO_SUPERLIGERO
	 , A.SINOXCarga001_AguasSineras		AS MARINAS
	 , A.SINOXCarga001_CrudoSur			AS SUR
	 , A.SINOXCarga001_CrudoNorte		AS NORTE
	 , A.SINOXCarga001_LiquidoGas		AS LIQUIDO_GAS
	 , b.SINOX003_UDM					AS UDM
From SINOXCarga001_ProduccionHidrocarburosLiquidos A
left outer join SINOX003_Catalogo_UDM B ON A.SINOXCarga001_UDM = B.SINOX003_Id
--Order by 1, 2


GO

