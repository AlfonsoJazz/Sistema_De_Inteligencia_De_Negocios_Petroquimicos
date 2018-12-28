USE [ZSINO]
GO

/****** Object:  Table [dbo].[SINOXCarga002_ProduccionGasNatual]    Script Date: 12/28/2018 09:36:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SINOXCarga002_ProduccionGasNatual](
	[SINOXCarga002_Año] [int] NOT NULL,
	[SINOXCarga002_Mes] [int] NOT NULL,
	[SINOXCarga002_Total] [decimal](18, 2) NOT NULL,
	[SINOXCarga002_AsociadoHidrocarburo] [decimal](18, 2) NOT NULL,
	[SINOXCarga002_AsociadoNitrogeno] [decimal](18, 2) NOT NULL,
	[SINOXCarga002_NoAsociado] [decimal](18, 2) NOT NULL,
	[SINOXCarga002_Marinas] [decimal](18, 2) NOT NULL,
	[SINOXCarga002_Sur] [decimal](18, 2) NOT NULL,
	[SINOXCarga002_Norte] [decimal](18, 2) NOT NULL,
	[SINOXCarga002_UDM] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SINOXCarga002_Año] ASC,
	[SINOXCarga002_Mes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

