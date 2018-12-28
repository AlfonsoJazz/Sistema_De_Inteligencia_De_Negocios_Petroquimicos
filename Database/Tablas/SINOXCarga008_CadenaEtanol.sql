USE [ZSINO]
GO

/****** Object:  Table [dbo].[SINOXCarga008_CadenaEtanol]    Script Date: 12/28/2018 09:37:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SINOXCarga008_CadenaEtanol](
	[SINOXCarga008_Año] [int] NOT NULL,
	[SINOXCarga008_Etanol] [int] NOT NULL,
	[SINOXCarga008_Etileno] [int] NOT NULL,
	[SINOXCarga008_OxidoEtileno] [int] NOT NULL,
	[SINOXCarga008_UDM] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SINOXCarga008_Año] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

