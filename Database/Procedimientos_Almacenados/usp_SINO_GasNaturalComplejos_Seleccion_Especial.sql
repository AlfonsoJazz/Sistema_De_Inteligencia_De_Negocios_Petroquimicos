USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_GasNaturalComplejos_Seleccion_Especial]    Script Date: 12/28/2018 10:09:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		ALFONSO MOSCO H.
-- Create date: 15-11-2018
-- Description:	SELECCIONA REGISTRO ESPECIFICO DE GAS NATURAL COMPLEJOS
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_GasNaturalComplejos_Seleccion_Especial] 
(
	@ORDEN_RECIBIDA VARCHAR(100)
)
AS
BEGIN
	IF @ORDEN_RECIBIDA = 'DAME_COMPLEJO'
	BEGIN
		SELECT DISTINCT SINOXCarga007_Complejo FROM SINOXCarga007_GasNatualComplejos
	END 
	
	ELSE IF @ORDEN_RECIBIDA = 'DAME_REGION'
	BEGIN
		SELECT DISTINCT SINOXCarga007_Region  FROM SINOXCarga007_GasNatualComplejos
	END
	
	ELSE IF @ORDEN_RECIBIDA = 'DAME_TIPO'
	BEGIN
		SELECT DISTINCT SINOXCarga007_Tipo  FROM SINOXCarga007_GasNatualComplejos
	END
END

GO

