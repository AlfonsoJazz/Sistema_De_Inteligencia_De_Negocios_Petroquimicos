USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_UPDATE_CadenaEtanol]    Script Date: 12/28/2018 10:14:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco Herrera
-- Create date: 23-11-2018
-- Description:	Actualiza registro Cadena de etanol
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_UPDATE_CadenaEtanol] 
	-- Add the parameters for the stored procedure here
(
	@AÑO INT,
	@ETANOL INT,
	@ETILENO INT,
	@O_ETILENO INT,
	@UNIDAD_MEDIDA INT
)
AS
BEGIN
-- inicio	
IF (SELECT COUNT(*) FROM SINOXCarga008_CadenaEtanol 
	WHERE [SINOXCarga008_Año] = @AÑO) = 1
	BEGIN TRANSACTION ACTUALIZA_CADENA_E;
		BEGIN TRY
			UPDATE SINOXCarga008_CadenaEtanol
				SET	 [SINOXCarga008_Año] = @AÑO
					,[SINOXCarga008_Etanol] = @ETANOL
					,[SINOXCarga008_Etileno] = @ETILENO
					,[SINOXCarga008_OxidoEtileno] = @O_ETILENO
					,[SINOXCarga008_UDM] = @UNIDAD_MEDIDA
			WHERE [SINOXCarga008_Año] = @AÑO
	COMMIT TRANSACTION ACTUALIZA_CADENA_E;
		END TRY
		
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				BEGIN
					ROLLBACK TRANSACTION ACTUALIZA_CADENA_E;
				END
		END CATCH
END

GO

