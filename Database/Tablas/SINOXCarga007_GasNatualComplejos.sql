USE [ZSINO]
GO

/****** Object:  Table [dbo].[SINOXCarga007_GasNatualComplejos]    Script Date: 12/28/2018 09:37:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SINOXCarga007_GasNatualComplejos](
	[SINOXCarga007_Año] [int] NOT NULL,
	[SINOXCarga007_Mes] [int] NOT NULL,
	[SINOXCarga007_Origen] [varchar](20) NOT NULL,
	[SINOXCarga007_Tipo] [varchar](50) NOT NULL,
	[SINOXCarga007_Region] [varchar](50) NOT NULL,
	[SINOXCarga007_Complejo] [varchar](50) NOT NULL,
	[SINOXCarga007_Vol] [decimal](18, 2) NOT NULL,
	[SINOXCarga007_UDM] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SINOXCarga007_Año] ASC,
	[SINOXCarga007_Mes] ASC,
	[SINOXCarga007_Origen] ASC,
	[SINOXCarga007_Tipo] ASC,
	[SINOXCarga007_Region] ASC,
	[SINOXCarga007_Complejo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

