USE [ZSINO]
GO

/****** Object:  Table [dbo].[SINOXCarga003_Proceso_GasLiquidosFraccionados]    Script Date: 12/28/2018 09:36:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SINOXCarga003_Proceso_GasLiquidosFraccionados](
	[SINOXCarga003_Año] [int] NOT NULL,
	[SINOXCarga003_Mes] [int] NOT NULL,
	[SINOXCarga003_LiquidosFraccionados] [decimal](18, 2) NOT NULL,
	[SINOXCarga003_LF_Etano] [decimal](18, 2) NOT NULL,
	[SINOXCarga003_LF_GasLicuado] [decimal](18, 2) NOT NULL,
	[SINOXCarga003_LF_Gasolina] [decimal](18, 2) NOT NULL,
	[SINOXCarga003_LF_Otros] [decimal](18, 2) NOT NULL,
	[SINOXCarga003_UDM] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SINOXCarga003_Año] ASC,
	[SINOXCarga003_Mes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

