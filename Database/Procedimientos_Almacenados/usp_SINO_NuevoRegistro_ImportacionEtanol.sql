USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_NuevoRegistro_ImportacionEtanol]    Script Date: 12/28/2018 10:13:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_NuevoRegistro_ImportacionEtanol]
	(	
		@AÑO INT
		,@MES INT
		,@ETANOL_MT INT
		,@ETANOL_MDB INT
		,@DENSIDAD DECIMAL(18,2)
		,@FACTOR DECIMAL(18,2)
		,@DIAS INT
		,@UNIDAD_DE_MEDIDA INT
	)
AS
BEGIN
-------------------------------
IF (SELECT COUNT(*) FROM SINOXCarga006_ImportacionEtanol 
		WHERE SINOXCarga006_Año = @AÑO 
		AND SINOXCarga006_Mes = @MES) = 0 

	BEGIN TRANSACTION NUEVO_REGISTRO_IE;
		BEGIN TRY
			INSERT INTO SINOXCarga006_ImportacionEtanol
			VALUES(	 @AÑO
					,@MES
					,@ETANOL_MT
					,@ETANOL_MDB
					,@DENSIDAD
					,@FACTOR
					,@DIAS
					,@UNIDAD_DE_MEDIDA)
	COMMIT TRANSACTION NUEVO_REGISTRO_IE;
		END TRY

		BEGIN CATCH
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION NUEVO_REGISTRO_IE;
		END
		END CATCH
END

GO

