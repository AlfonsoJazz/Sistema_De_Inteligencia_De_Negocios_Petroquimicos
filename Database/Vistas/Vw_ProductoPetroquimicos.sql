USE [ZSINO]
GO

/****** Object:  View [dbo].[Vw_ProductoPetroquimicos]    Script Date: 12/28/2018 09:47:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[Vw_ProductoPetroquimicos]
AS
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT a.SINOXCarga005_Año								AS AÑO
      ,a.SINOXCarga005_Mes								AS MES
      ,a.SINOXCarga005_Total							AS Total
      ,a.SINOXCarga005_Dicloroetano						AS Dicloroetano
      ,a.SINOXCarga005_Amoniaco							AS Amoniaco
      ,a.SINOXCarga005_Benceno							AS Benceno
      ,a.SINOXCarga005_ClorurodeVinilo					AS ClorurodeVinilo
      ,a.SINOXCarga005_Estireno							AS Estireno
      ,a.SINOXCarga005_Etileno							AS Etileno
      ,a.SINOXCarga005_OxidodeEtileno					AS OxidodeEtileno
      ,a.SINOXCarga005_PolietilenoAltaDensidad			AS PolietilenoAltaDensidad
      ,a.SINOXCarga005_PolietilenoBajaDensidad			AS PolietilenoBajaDensidad
      ,a.SINOXCarga005_PolietilenoLinealBajaDensidad	AS PolietilenoLinealBajaDensidad
      ,a.SINOXCarga005_Propilenob						AS Propilenob
      ,a.SINOXCarga005_Tolueno							AS Tolueno
      ,a.SINOXCarga005_Otros							AS Otros
      ,b.SINOX003_UDM									AS UDM
  FROM [SINOXCarga005_ProductoPetroquimicos] A
  LEFT OUTER JOIN SINOX003_Catalogo_UDM B ON a.SINOXCarga005_UDM = b.SINOX003_Id
  

GO

