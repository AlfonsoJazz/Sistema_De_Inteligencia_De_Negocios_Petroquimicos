USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_NuevoRegistro_ProduccionHidrocarburosLiquidos]    Script Date: 12/28/2018 10:13:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco H
-- Create date: 05-11-2018
-- Description:	Inserta en hidrocarburos liquidos
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_NuevoRegistro_ProduccionHidrocarburosLiquidos]
(
	@AÑO INT,
	@MES INT,
	--@TOTAL DECIMAL(18,2),
	--@TOTAL_CRUDO DECIMAL(18,2),
	@CRUDO_PESADO DECIMAL(18,2),
	@CRUDO_LIGERO DECIMAL(18,2),
	@CRUDO_SUPER_LIGERO DECIMAL(18,2),
	@AGUAS_SOMERAS DECIMAL(18,2),
	@CRUDO_SUR DECIMAL(18,2),
	@CRUDO_NORTE DECIMAL(18,2),
	@LIQ_GAS DECIMAL(18,2),
	@UNIDAD_MEDIDA INT
)
AS
BEGIN
IF (SELECT COUNT(*) FROM [ZSINO].[dbo].[SINOXCarga001_ProduccionHidrocarburosLiquidos] 
	WHERE	SINOXCarga001_Año = @AÑO 
			AND	SINOXCarga001_Mes = @MES ) = 0 

BEGIN TRANSACTION NUEVO_REGISTRO_HL;
BEGIN TRY
	--Para conseguir el total y el total crudo
	DECLARE @TOTAL DECIMAL(18,2)
	DECLARE @TOTAL_CRUDO DECIMAL(18,2)
	SET @TOTAL_CRUDO = @CRUDO_PESADO + @CRUDO_LIGERO + @CRUDO_SUPER_LIGERO
	SET @TOTAL = @TOTAL_CRUDO + @LIQ_GAS
	--Insertamos los valores en la base de datos
	INSERT INTO [ZSINO].[dbo].[SINOXCarga001_ProduccionHidrocarburosLiquidos]
	VALUES(	@AÑO, 
			@MES, 
			@TOTAL, 
			@TOTAL_CRUDO, 
			@CRUDO_PESADO, 
			@CRUDO_LIGERO, 
			@CRUDO_SUPER_LIGERO, 
			@AGUAS_SOMERAS, 
			@CRUDO_SUR, 
			@CRUDO_NORTE, 
			@LIQ_GAS, 
			@UNIDAD_MEDIDA)
	COMMIT TRANSACTION NUEVO_REGISTRO_HL;
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0
	BEGIN
		ROLLBACK TRANSACTION NUEVO_REGISTRO_HL;
	END
END	 CATCH
END
GO

