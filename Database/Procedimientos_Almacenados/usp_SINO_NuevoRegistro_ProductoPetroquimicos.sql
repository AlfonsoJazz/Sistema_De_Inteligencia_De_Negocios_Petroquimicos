USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_NuevoRegistro_ProductoPetroquimicos]    Script Date: 12/28/2018 10:13:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco H
-- Create date: 13-11-2018
-- Description:	añade registro a la tabla productos petroquimicos
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_NuevoRegistro_ProductoPetroquimicos]
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
		AND SINOXCarga005_Mes = @MES) = 0 

	BEGIN TRANSACTION NUEVO_REGISTRO_pp;
		BEGIN TRY
			INSERT INTO SINOXCarga005_ProductoPetroquimicos
			VALUES(	 @AÑO
					,@MES
					,@TOTAL
					,@DICLORETANO
					,@AMONIACO
					,@BENCENO
					,@C_VINILO
					,@ESTIRENO
					,@_ETILENO
					,@O_ETILENO
					,@PAD
					,@PBD
					,@PLBD
					,@PROPILENOb
					,@TOLUENO
					,@OTROS
					,@UNIDAD_DE_MEDIDA)
	COMMIT TRANSACTION NUEVO_REGISTRO_pp;
		END TRY

		BEGIN CATCH
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION NUEVO_REGISTRO_pp;
		END
		END CATCH
END

GO

