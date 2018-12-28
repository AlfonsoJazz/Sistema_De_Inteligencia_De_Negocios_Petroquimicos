USE [ZSINO]
GO

/****** Object:  Table [dbo].[SINOXCarga005_ProductoPetroquimicos]    Script Date: 12/28/2018 09:36:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SINOXCarga005_ProductoPetroquimicos](
	[SINOXCarga005_Año] [int] NOT NULL,
	[SINOXCarga005_Mes] [int] NOT NULL,
	[SINOXCarga005_Total] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_Dicloroetano] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_Amoniaco] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_Benceno] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_ClorurodeVinilo] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_Estireno] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_Etileno] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_OxidodeEtileno] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_PolietilenoAltaDensidad] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_PolietilenoBajaDensidad] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_PolietilenoLinealBajaDensidad] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_Propilenob] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_Tolueno] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_Otros] [decimal](18, 2) NOT NULL,
	[SINOXCarga005_UDM] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SINOXCarga005_Año] ASC,
	[SINOXCarga005_Mes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

