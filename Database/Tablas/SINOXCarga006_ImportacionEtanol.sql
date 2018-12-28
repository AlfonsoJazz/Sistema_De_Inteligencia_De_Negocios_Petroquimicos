USE [ZSINO]
GO

/****** Object:  Table [dbo].[SINOXCarga006_ImportacionEtanol]    Script Date: 12/28/2018 09:37:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SINOXCarga006_ImportacionEtanol](
	[SINOXCarga006_Año] [int] NOT NULL,
	[SINOXCarga006_Mes] [int] NOT NULL,
	[SINOXCarga006_EtanolMT] [int] NOT NULL,
	[SINOXCarga006_EtanolMDB] [int] NOT NULL,
	[SINOXCarga006_Densidad] [decimal](18, 3) NOT NULL,
	[SINOXCarga006_Factor] [decimal](18, 6) NOT NULL,
	[SINOXCarga006_Dias] [int] NOT NULL,
	[SINOXCarga003_UDM] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SINOXCarga006_Año] ASC,
	[SINOXCarga006_Mes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

