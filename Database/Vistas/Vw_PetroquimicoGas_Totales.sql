USE [ZSINO]
GO

/****** Object:  View [dbo].[Vw_PetroquimicoGas_Totales]    Script Date: 12/28/2018 09:46:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[Vw_PetroquimicoGas_Totales]
AS
--select * from SINOXCarga001_ProduccionHidrocarburosLiquidos
	SELECT a.SINOXCarga001_Año																	AS AÑO
	     , AVG(a.SINOXCarga001_Total)															AS CRUDO
	     , AVG(a.SINOXCarga001_LiquidoGas)														AS "LIQUIDO GAS"
	     , AVG(a.SINOXCarga001_Total) + AVG(a.SINOXCarga001_LiquidoGas)							AS "TOTAL CRUDO"
--	     , a.SINOXCarga001_UDM				AS "UDM CRUDO"
	     , c.SINOX003_UDM																		AS "UDM CRUDO"	     
		 , AVG(B.SINOXCarga002_AsociadoHidrocarburo) + AVG(b.SINOXCarga002_AsociadoNitrogeno)	AS "GAS ASOCIADO"
	     , AVG(B.SINOXCarga002_NoAsociado)														AS "GAS NO ASOCIADO"
	     , AVG(B.SINOXCarga002_Total)															AS "TOTAL GAS"
--	     , B.SINOXCarga002_UDM				AS "UDM GAS"
	     , d.SINOX003_UDM																		AS "UDM GAS"
	  FROM SINOXCarga001_ProduccionHidrocarburosLiquidos A
	  LEFT OUTER JOIN SINOXCarga002_ProduccionGasNatual B ON a.SINOXCarga001_Año = B.SINOXCarga002_Año
	  LEFT OUTER JOIN SINOX003_Catalogo_UDM C ON c.SINOX003_Id = a.SINOXCarga001_UDM 
	  LEFT OUTER JOIN SINOX003_Catalogo_UDM D ON  d.SINOX003_Id = B.SINOXCarga002_UDM 
  Group by a.SINOXCarga001_Año, B.SINOXCarga002_Año, a.SINOXCarga001_UDM, B.SINOXCarga002_UDM, c.SINOX003_UDM, d.SINOX003_UDM 	  

--select 365.00 + 4474.00 + 1910.00


GO

