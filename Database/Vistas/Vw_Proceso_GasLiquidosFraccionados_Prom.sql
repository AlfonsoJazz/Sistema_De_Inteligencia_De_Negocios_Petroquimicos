USE [ZSINO]
GO

/****** Object:  View [dbo].[Vw_Proceso_GasLiquidosFraccionados_Prom]    Script Date: 12/28/2018 09:46:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[Vw_Proceso_GasLiquidosFraccionados_Prom]
AS  
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT a.SINOXCarga004_Año				AS AÑO
      ,a.SINOXCarga004_Mes				AS MES
      ,a.SINOXCarga004_GasHumedoAmardo	AS GAS_HUMEDO_AMARGO
      ,a.SINOXCarga004_GasHumedoDulce	AS GAS_HUMEDO_DULCE
      ,a.SINOXCarga004_GasSeco			AS GAS_SECO	
      ,b.SINOX003_UDM					AS UDM
  FROM SINOXCarga004_Proceso_Gas  A
  LEFT OUTER JOIN SINOX003_Catalogo_UDM B ON a.SINOXCarga004_UDM = b.SINOX003_Id
  

GO

