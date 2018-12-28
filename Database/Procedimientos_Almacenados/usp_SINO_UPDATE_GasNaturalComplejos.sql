USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_UPDATE_GasNaturalComplejos]    Script Date: 12/28/2018 10:14:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco Herrera
-- Create date: 16-11-2018
-- Description:	Actualiza un registro de la tabla de gases complejos
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_UPDATE_GasNaturalComplejos]
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
-------------------------------
--DECLARE @TOTAL DECIMAL(18,2)
--SET @TOTAL = @DICLORETANO + @AMONIACO + @BENCENO + @C_VINILO + @ESTIRENO + @_ETILENO + @O_ETILENO + @PAD + @PBD + @PLBD + @PROPILENOb + @TOLUENO + @OTROS 
-------------INICIO TRANSACCION
IF (SELECT COUNT(*) FROM SINOXCarga007_GasNatualComplejos 
		WHERE SINOXCarga007_Año = @AÑO 
		AND SINOXCarga007_Mes = @MES
		AND SINOXCarga007_Origen = @ORIGEN
		AND SINOXCarga007_Tipo = @TIPO 
		AND SINOXCarga007_Region = @REGION
		AND SINOXCarga007_Complejo = @COMPLEJO) = 1 
	BEGIN TRANSACTION ACTUALIZA_REG_GNC;
		BEGIN TRY
			UPDATE SINOXCarga007_GasNatualComplejos
			SET	   [SINOXCarga007_Año] = @AÑO
			      ,[SINOXCarga007_Mes] = @MES
			      ,[SINOXCarga007_Origen] = @ORIGEN
			      ,[SINOXCarga007_Tipo] = @TIPO
			      ,[SINOXCarga007_Region] = @REGION
			      ,[SINOXCarga007_Complejo] = @COMPLEJO
			      ,[SINOXCarga007_Vol] = @VOL
			      ,[SINOXCarga007_UDM] = @UNIDAD_DE_MEDIDA
			WHERE SINOXCarga007_Año = @AÑO 
				AND SINOXCarga007_Mes = @MES
				AND SINOXCarga007_Origen = @ORIGEN
				AND SINOXCarga007_Tipo = @TIPO 
				AND SINOXCarga007_Region = @REGION
				AND SINOXCarga007_Complejo = @COMPLEJO
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

