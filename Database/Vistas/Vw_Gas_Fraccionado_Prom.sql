USE [ZSINO]
GO

/****** Object:  View [dbo].[Vw_Gas_Fraccionado_Prom]    Script Date: 12/28/2018 09:45:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Vw_Gas_Fraccionado_Prom]
as
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT a.SINOXCarga003_Año						AS AÑO
      ,a.SINOXCarga003_Mes						AS MES
      ,a.SINOXCarga003_LiquidosFraccionados		AS LIQUIDOS_FRACCIONADOS
      ,a.SINOXCarga003_LF_Etano					AS ETANO
      ,a.SINOXCarga003_LF_GasLicuado			AS GAS_LICUADO
      ,a.SINOXCarga003_LF_Gasolina				AS GASOLINA
      ,a.SINOXCarga003_LF_Otros					AS OTROS
--      ,[SINOXCarga003_UDM]
      , b.SINOX003_UDM							AS UDM
  FROM [SINOXCarga003_Proceso_GasLiquidosFraccionados] A
  LEFT OUTER JOIN SINOX003_Catalogo_UDM B ON a.SINOXCarga003_UDM = b.SINOX003_Id
  

GO

