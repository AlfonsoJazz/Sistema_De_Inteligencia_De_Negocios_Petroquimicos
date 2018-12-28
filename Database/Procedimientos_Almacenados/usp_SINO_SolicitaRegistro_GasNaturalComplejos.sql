USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_SolicitaRegistro_GasNaturalComplejos]    Script Date: 12/28/2018 10:14:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_SolicitaRegistro_GasNaturalComplejos] 
	-- Add the parameters for the stored procedure here
	(
	 @ANIO INT
	,@MES INT
	,@ORIGEN VARCHAR(20)
	,@TIPO VARCHAR(50)
	,@REGION VARCHAR(50)
	,@COMPLEJO VARCHAR(50)
	)
AS
BEGIN
	SELECT * 
	FROM SINOXCarga007_GasNatualComplejos
	WHERE 	[SINOXCarga007_Año] = @ANIO 
		AND [SINOXCarga007_Mes] = @MES 
		AND [SINOXCarga007_Origen] = @ORIGEN 
		AND [SINOXCarga007_Tipo] = @TIPO 
		AND [SINOXCarga007_Region] = @REGION 
		AND [SINOXCarga007_Complejo] = @COMPLEJO
END


GO

