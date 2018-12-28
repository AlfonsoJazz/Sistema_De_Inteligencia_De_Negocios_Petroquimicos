USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_UPDATE_ProductoPetroquimicos]    Script Date: 12/28/2018 10:15:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco
-- Create date: 13-11-2018
-- Description:	actualiza registro recuperado de productos pretroquimicos
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_UPDATE_ProductoPetroquimicos]
	(	
		 @AÑO INT
		,@MES INT
		--TOTAL
		,@DICLORETANO DECIMAL(18,2)
		,@AMONIACO DECIMAL(18,2)
		,@BENCENO DECIMAL(18,2)
		,@C_VINILO DECIMAL(18,2)
		,@ESTIRENO DECIMAL(18,2)
		,@_ETILENO DECIMAL(18,2)
		,@O_ETILENO DECIMAL(18,2)
		,@PAD DECIMAL(18,2)
		,@PBD DECIMAL(18,2)
		,@PLBD DECIMAL(18,2)
		,@PROPILENOb DECIMAL(18,2)
		,@TOLUENO DECIMAL(18,2)
		,@OTROS DECIMAL(18,2)
		,@UNIDAD_DE_MEDIDA DECIMAL(18,2)
	)
AS
BEGIN
-------------------------------
DECLARE @TOTAL DECIMAL(18,2)
SET @TOTAL = @DICLORETANO + @AMONIACO + @BENCENO + @C_VINILO + @ESTIRENO + @_ETILENO + @O_ETILENO + @PAD + @PBD + @PLBD + @PROPILENOb + @TOLUENO + @OTROS 
-------------INICIO TRANSACCION
IF (SELECT COUNT(*) FROM SINOXCarga005_ProductoPetroquimicos 
		WHERE SINOXCarga005_Año = @AÑO 
		AND SINOXCarga005_Mes = @MES) = 1 
	BEGIN TRANSACTION ACTUALIZA_REG_pp;
		BEGIN TRY
			UPDATE SINOXCarga005_ProductoPetroquimicos
			SET	 SINOXCarga005_Año = @AÑO
				,SINOXCarga005_Mes = @MES
				,SINOXCarga005_Total = @TOTAL
				,SINOXCarga005_Dicloroetano = @DICLORETANO
				,SINOXCarga005_Amoniaco = @AMONIACO
				,SINOXCarga005_Benceno = @BENCENO
				,SINOXCarga005_ClorurodeVinilo = @C_VINILO
				,SINOXCarga005_Estireno = @ESTIRENO
				,SINOXCarga005_Etileno = @_ETILENO
				,SINOXCarga005_OxidodeEtileno = @O_ETILENO
				,SINOXCarga005_PolietilenoAltaDensidad = @PAD
				,SINOXCarga005_PolietilenoBajaDensidad = @PBD
				,SINOXCarga005_PolietilenoLinealBajaDensidad = @PLBD
				,SINOXCarga005_Propilenob = @PROPILENOb
				,SINOXCarga005_Tolueno = @TOLUENO
				,SINOXCarga005_Otros = @OTROS
				,SINOXCarga005_UDM = @UNIDAD_DE_MEDIDA
			WHERE SINOXCarga005_Año = @AÑO AND SINOXCarga005_Mes = @MES
	COMMIT TRANSACTION ACTUALIZA_REG_pp;
		END TRY

		BEGIN CATCH
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION ACTUALIZA_REG_pp;
		END
		END CATCH
END

GO

