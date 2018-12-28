USE [ZSINO]
GO

/****** Object:  Table [dbo].[SINOXCarga001_ProduccionHidrocarburosLiquidos]    Script Date: 12/28/2018 09:36:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SINOXCarga001_ProduccionHidrocarburosLiquidos](
	[SINOXCarga001_Año] [int] NOT NULL,
	[SINOXCarga001_Mes] [int] NOT NULL,
	[SINOXCarga001_Total] [decimal](18, 2) NOT NULL,
	[SINOXCarga001_TotalCrudo] [decimal](18, 2) NOT NULL,
	[SINOXCarga001_CrudoPesado] [decimal](18, 2) NOT NULL,
	[SINOXCarga001_CrudoLigero] [decimal](18, 2) NOT NULL,
	[SINOXCarga001_CrudoSuperLigero] [decimal](18, 2) NOT NULL,
	[SINOXCarga001_AguasSineras] [decimal](18, 2) NOT NULL,
	[SINOXCarga001_CrudoSur] [decimal](18, 2) NOT NULL,
	[SINOXCarga001_CrudoNorte] [decimal](18, 2) NOT NULL,
	[SINOXCarga001_LiquidoGas] [decimal](18, 2) NOT NULL,
	[SINOXCarga001_UDM] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SINOXCarga001_Año] ASC,
	[SINOXCarga001_Mes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

