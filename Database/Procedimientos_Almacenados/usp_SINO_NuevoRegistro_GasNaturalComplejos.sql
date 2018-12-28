USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_NuevoRegistro_GasNaturalComplejos]    Script Date: 12/28/2018 10:12:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco Herrera
-- Create date: 16-11-2018
-- Description:	Añade un registro a gases complejos
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_NuevoRegistro_GasNaturalComplejos]
	(	
		 @AÑO INT
		,@MES INT
		,@ORIGEN VARCHAR(20)
		,@TIPO VARCHAR(50)
		,@REGION VARCHAR(50)
		,@COMPLEJO VARCHAR(50)
		,@VOL DECIMAL(18,2)
		,@UNIDAD_DE_MEDIDA DECIMAL(18,2)
	)
AS
BEGIN
-------------INICIO TRANSACCION
IF (SELECT COUNT(*) FROM SINOXCarga007_GasNatualComplejos 
		WHERE SINOXCarga007_Año = @AÑO 
		AND SINOXCarga007_Mes = @MES
		AND SINOXCarga007_Origen = @ORIGEN
		AND SINOXCarga007_Tipo = @TIPO 
		AND SINOXCarga007_Region = @REGION
		AND SINOXCarga007_Complejo = @COMPLEJO) = 0
	BEGIN TRANSACTION ACTUALIZA_REG_GNC;
		BEGIN TRY
		INSERT INTO SINOXCarga007_GasNatualComplejos
		VALUES(	 @AÑO
				,@MES
				,@ORIGEN
				,@TIPO
				,@REGION
				,@COMPLEJO
				,@VOL
				,@UNIDAD_DE_MEDIDA)
	COMMIT TRANSACTION ACTUALIZA_REG_GNC;
		END TRY

		BEGIN CATCH
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION ACTUALIZA_REG_GNC;
		END
		END CATCH
END

GO

