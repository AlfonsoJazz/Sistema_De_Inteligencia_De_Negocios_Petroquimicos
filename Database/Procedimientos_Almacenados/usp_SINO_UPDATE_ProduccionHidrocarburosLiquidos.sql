USE [ZSINO]
GO

/****** Object:  StoredProcedure [dbo].[usp_SINO_UPDATE_ProduccionHidrocarburosLiquidos]    Script Date: 12/28/2018 10:15:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alfonso Mosco H
-- Create date: 09-11-2018
-- Description:	Actualiza ultimo registro
-- =============================================
CREATE PROCEDURE [dbo].[usp_SINO_UPDATE_ProduccionHidrocarburosLiquidos]
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
--Para conseguir el total y el total crudo
DECLARE @TOTAL DECIMAL(18,2)
DECLARE @TOTAL_CRUDO DECIMAL(18,2)
SET @TOTAL_CRUDO = @CRUDO_PESADO + @CRUDO_LIGERO + @CRUDO_SUPER_LIGERO
SET @TOTAL = @TOTAL_CRUDO + @LIQ_GAS
----------------INICIO TRANSACCION 
	
	IF (SELECT COUNT(*) FROM [ZSINO].[dbo].[SINOXCarga001_ProduccionHidrocarburosLiquidos] 
		WHERE	SINOXCarga001_Año = @AÑO 
			AND	SINOXCarga001_Mes = @MES ) = 1
	BEGIN TRANSACTION ACTUALIZA_REGISTRO_HL;
		BEGIN TRY
		--Actualizamos los valores en la base de datos
		UPDATE [ZSINO].[dbo].[SINOXCarga001_ProduccionHidrocarburosLiquidos]
			SET  [SINOXCarga001_Año] = @AÑO
		      	,[SINOXCarga001_Mes] = @MES
		      	,[SINOXCarga001_Total] = @TOTAL
		      	,[SINOXCarga001_TotalCrudo] = @TOTAL_CRUDO
		      	,[SINOXCarga001_CrudoPesado] = @CRUDO_PESADO
		      	,[SINOXCarga001_CrudoLigero] = @CRUDO_LIGERO
		      	,[SINOXCarga001_CrudoSuperLigero] = @CRUDO_SUPER_LIGERO
		      	,[SINOXCarga001_AguasSineras] = @AGUAS_SOMERAS
		      	,[SINOXCarga001_CrudoSur] = @CRUDO_SUR
		      	,[SINOXCarga001_CrudoNorte] = @CRUDO_NORTE
		      	,[SINOXCarga001_LiquidoGas] = @LIQ_GAS
		      	,[SINOXCarga001_UDM] = @UNIDAD_MEDIDA
		WHERE [SINOXCarga001_Año] = @AÑO AND [SINOXCarga001_Mes] = @MES
	COMMIT TRANSACTION ACTUALIZA_REGISTRO_HL;
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
		ROLLBACK TRANSACTION ACTUALIZA_REGISTRO_HL;
	END
END	 CATCH
END

GO

