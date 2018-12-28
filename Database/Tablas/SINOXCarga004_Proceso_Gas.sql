USE [ZSINO]
GO

/****** Object:  Table [dbo].[SINOXCarga004_Proceso_Gas]    Script Date: 12/28/2018 09:36:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SINOXCarga004_Proceso_Gas](
	[SINOXCarga004_Año] [int] NOT NULL,
	[SINOXCarga004_Mes] [int] NOT NULL,
	[SINOXCarga004_GasHumedoAmardo] [decimal](18, 2) NOT NULL,
	[SINOXCarga004_GasHumedoDulce] [decimal](18, 2) NOT NULL,
	[SINOXCarga004_GasSeco] [decimal](18, 2) NOT NULL,
	[SINOXCarga004_UDM] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SINOXCarga004_Año] ASC,
	[SINOXCarga004_Mes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

