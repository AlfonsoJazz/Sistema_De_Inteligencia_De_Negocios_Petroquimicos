USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_UPDATE_ImportacionEtanol]    Script Date: 12/28/2018 10:15:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_UPDATE_ImportacionEtanol]
	(	
		 @AÑO INT
		,@MES INT
		,@ETANOL_MT INT
		,@ETANOL_MDB INT
		,@DENSIDAD DECIMAL(18,3)
		,@FACTOR DECIMAL(18,6)
		,@DIAS INT
		,@UNIDAD_DE_MEDIDA INT
	)
AS
BEGIN
-------------INICIO TRANSACCION
IF (SELECT COUNT(*) FROM SINOXCarga006_ImportacionEtanol 
		WHERE SINOXCarga006_Año = @AÑO 
		AND SINOXCarga006_Mes = @MES) = 1 
	BEGIN TRANSACTION ACTUALIZA_REG_IE;
		BEGIN TRY
			UPDATE SINOXCarga006_ImportacionEtanol
			SET	   [SINOXCarga006_Año] = @AÑO
			      ,[SINOXCarga006_Mes] = @MES
			      ,[SINOXCarga006_EtanolMT] = @ETANOL_MT
			      ,[SINOXCarga006_EtanolMDB] = @ETANOL_MDB
			      ,[SINOXCarga006_Densidad] = @DENSIDAD
			      ,[SINOXCarga006_Factor] = @FACTOR
			      ,[SINOXCarga006_Dias] = @DIAS
			      ,[SINOXCarga003_UDM] = @UNIDAD_DE_MEDIDA
			WHERE SINOXCarga006_Año = @AÑO AND SINOXCarga006_Mes = @MES
	COMMIT TRANSACTION ACTUALIZA_REG_IE;
		END TRY

		BEGIN CATCH
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION ACTUALIZA_REG_IE;
		END
		END CATCH
END

GO

