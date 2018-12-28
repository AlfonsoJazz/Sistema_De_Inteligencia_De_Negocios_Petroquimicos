USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_NuevoRegistro_CadenaEtanol]    Script Date: 12/28/2018 10:12:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco He
-- Create date: 23-11-2018
-- Description:	Inserta un nuevo registro en cadena de etranol
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_NuevoRegistro_CadenaEtanol] 
(
	@AÑO INT,
	@ETANOL INT,
	@ETILENO INT,
	@O_ETILENO INT,
	@UNIDAD_MEDIDA INT
)
AS
BEGIN
IF (SELECT COUNT(*) FROM SINOXCarga008_CadenaEtanol 
	WHERE [SINOXCarga008_Año] = @AÑO) = 0
	BEGIN TRANSACTION NUEVO_REGISTRO_CADENA_E;
		BEGIN TRY
			INSERT INTO SINOXCarga008_CadenaEtanol
			VALUES (@AÑO,
					@ETANOL,
					@ETILENO,
					@O_ETILENO,
					@UNIDAD_MEDIDA)
	COMMIT TRANSACTION NUEVO_REGISTRO_CADENA_E;
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				BEGIN
					ROLLBACK TRANSACTION NUEVO_REGISTRO_CADENA_E;
				END
		END CATCH
END

GO

