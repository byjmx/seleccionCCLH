SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Persona](
	[ID_Persona] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[DireccionParticular] [varchar](100) NULL,
	[DireccionLaboral] [varchar](100) NULL,
	[NumeroContacto] [varchar](20) NULL,
	[CorreoElectronico] [varchar](100) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_Persona] ADD PRIMARY KEY CLUSTERED 
(
	[ID_Persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Credito](
	[ID_Credito] [int] NOT NULL,
	[Tipo] [varchar](50) NULL,
	[Descripción] [varchar](200) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_Credito] ADD PRIMARY KEY CLUSTERED 
(
	[ID_Credito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Ingresos](
	[ID_Ingreso] [int] NOT NULL,
	[ID_Persona] [int] NULL,
	[TipoIngreso] [varchar](50) NULL,
	[Valor] [decimal](18, 2) NULL,
	[Fecha] [date] NULL,
	[Estado] [varchar](20) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_Ingresos] ADD PRIMARY KEY CLUSTERED 
(
	[ID_Ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_Ingresos]  WITH CHECK ADD FOREIGN KEY([ID_Persona])
REFERENCES [dbo].[TBL_Persona] ([ID_Persona])
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Endeudamiento](
	[ID_Endeudamiento] [int] NOT NULL,
	[ID_Persona] [int] NULL,
	[TipoEndeudamiento] [varchar](50) NULL,
	[Valor] [decimal](18, 2) NULL,
	[Fecha] [date] NULL,
	[Estado] [varchar](20) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_Endeudamiento] ADD PRIMARY KEY CLUSTERED 
(
	[ID_Endeudamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_Endeudamiento]  WITH CHECK ADD FOREIGN KEY([ID_Persona])
REFERENCES [dbo].[TBL_Persona] ([ID_Persona])
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_CajaCompensacion](
	[ID_CajaCompensacion] [int] NOT NULL,
	[Nombre] [varchar](100) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_CajaCompensacion] ADD PRIMARY KEY CLUSTERED 
(
	[ID_CajaCompensacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Promotor](
	[ID_Promotor] [int] NOT NULL,
	[ID_CajaCompensacion] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_Promotor] ADD PRIMARY KEY CLUSTERED 
(
	[ID_Promotor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_Promotor]  WITH CHECK ADD FOREIGN KEY([ID_CajaCompensacion])
REFERENCES [dbo].[TBL_CajaCompensacion] ([ID_CajaCompensacion])
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_REL_Afiliacion_Caja](
	[ID_Persona] [int] NULL,
	[ID_CajaCompensacion] [int] NULL,
	[TipoAfiliación] [varchar](50) NULL,
	[Estado] [varchar](20) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_REL_Afiliacion_Caja]  WITH CHECK ADD FOREIGN KEY([ID_CajaCompensacion])
REFERENCES [dbo].[TBL_CajaCompensacion] ([ID_CajaCompensacion])
GO
ALTER TABLE [dbo].[TBL_REL_Afiliacion_Caja]  WITH CHECK ADD FOREIGN KEY([ID_Persona])
REFERENCES [dbo].[TBL_Persona] ([ID_Persona])
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_REL_Descuento_Pers_Credito](
	[ID_Persona] [int] NULL,
	[ID_Credito] [int] NULL,
	[ValorCuota] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_REL_Descuento_Pers_Credito]  WITH CHECK ADD FOREIGN KEY([ID_Credito])
REFERENCES [dbo].[TBL_Credito] ([ID_Credito])
GO
ALTER TABLE [dbo].[TBL_REL_Descuento_Pers_Credito]  WITH CHECK ADD FOREIGN KEY([ID_Persona])
REFERENCES [dbo].[TBL_Persona] ([ID_Persona])
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_REL_Solicitud_Credito_Persona](
	[ID_Solicitud] [int] NOT NULL,
	[ID_Persona] [int] NULL,
	[ID_Credito] [int] NULL,
	[ID_Promotor] [int] NULL,
	[FechaSolicitud] [date] NULL,
	[Estado] [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_REL_Solicitud_Credito_Persona] ADD PRIMARY KEY CLUSTERED 
(
	[ID_Solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_REL_Solicitud_Credito_Persona]  WITH CHECK ADD FOREIGN KEY([ID_Credito])
REFERENCES [dbo].[TBL_Credito] ([ID_Credito])
GO
ALTER TABLE [dbo].[TBL_REL_Solicitud_Credito_Persona]  WITH CHECK ADD FOREIGN KEY([ID_Persona])
REFERENCES [dbo].[TBL_Persona] ([ID_Persona])
GO
ALTER TABLE [dbo].[TBL_REL_Solicitud_Credito_Persona]  WITH CHECK ADD FOREIGN KEY([ID_Promotor])
REFERENCES [dbo].[TBL_Promotor] ([ID_Promotor])
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_REL_Evaluacion_Solicitud_Credito](
	[ID_Evaluacion] [int] NOT NULL,
	[ID_Solicitud] [int] NULL,
	[Comentarios] [varchar](200) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_REL_Evaluacion_Solicitud_Credito] ADD PRIMARY KEY CLUSTERED 
(
	[ID_Evaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_REL_Evaluacion_Solicitud_Credito]  WITH CHECK ADD FOREIGN KEY([ID_Solicitud])
REFERENCES [dbo].[TBL_REL_Solicitud_Credito_Persona] ([ID_Solicitud])
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_REL_Adjuntos_Solicitud](
	[ID_Adjunto] [int] NOT NULL,
	[ID_Solicitud] [int] NULL,
	[NombreArchivo] [varchar](100) NULL,
	[RutaArchivo] [varchar](200) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_REL_Adjuntos_Solicitud] ADD PRIMARY KEY CLUSTERED 
(
	[ID_Adjunto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_REL_Adjuntos_Solicitud]  WITH CHECK ADD FOREIGN KEY([ID_Solicitud])
REFERENCES [dbo].[TBL_REL_Solicitud_Credito_Persona] ([ID_Solicitud])
GO