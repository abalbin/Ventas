USE [VentasAppBD]
GO
/****** Object:  Table [dbo].[Documento]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Documento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Descripcion] [varchar](500) NULL,
	[Ruta] [varchar](100) NULL,
 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentoLinea]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentoLinea](
	[IdDocumento] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
 CONSTRAINT [PK_DocumentoLinea] PRIMARY KEY CLUSTERED 
(
	[IdDocumento] ASC,
	[IdLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Estado]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Examen]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Examen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[Titulo] [varchar](400) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaEjecucion] [datetime] NULL,
	[TiempoMaximo] [time](7) NULL,
	[IdEstado] [int] NOT NULL,
	[PuntajeMaximo] [int] NULL,
	[TiempoTranscurrido] [time](7) NULL,
	[IdTipo] [int] NULL,
 CONSTRAINT [PK_Examen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExamenUsuario]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamenUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdExamen] [int] NULL,
	[IdEjecutivo] [int] NULL,
	[IdAster] [int] NULL,
	[Puntaje] [decimal](18, 2) NULL,
	[Tiempo] [time](7) NULL,
	[FechaTermino] [datetime] NULL,
	[FechaInicio] [datetime] NULL,
	[Estado] [int] NULL,
	[IdPreguntaActual] [int] NULL,
 CONSTRAINT [PK_ExamenUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Linea]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Linea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Linea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NombreTabla]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NombreTabla](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tabla] [varchar](200) NULL,
	[NombreMostrar] [varchar](200) NULL,
 CONSTRAINT [PK_NombreTabla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pregunta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Texto] [varchar](400) NULL,
	[IdTipoPregunta] [int] NULL,
	[IdExamen] [int] NULL,
	[CantidadRespuesta] [int] NULL,
	[Puntaje] [decimal](18, 0) NULL,
	[Orden] [int] NULL,
	[Habilitada] [bit] NULL,
 CONSTRAINT [PK_Pregunta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PreguntaUsuario]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreguntaUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NULL,
	[IdUsuario] [int] NULL,
	[IdExamenUsuario] [int] NULL,
	[Puntaje] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PreguntaUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[IdLinea] [int] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductoLinea]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoLinea](
	[IdProducto] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
 CONSTRAINT [PK_ProductoLinea] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC,
	[IdLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PuntajeAsesoria]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntajeAsesoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[D] [decimal](18, 2) NULL,
	[A] [decimal](18, 2) NULL,
	[B] [decimal](18, 2) NULL,
	[S] [decimal](18, 2) NULL,
	[IdExamen] [int] NULL,
 CONSTRAINT [PK_PuntajeAsesoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Respuesta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Texto] [varchar](400) NULL,
	[Orden] [int] NULL,
	[IdPregunta] [int] NULL,
	[EsCorrecta] [int] NULL,
	[Marcada] [bit] NOT NULL,
	[Puntaje] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Respuesta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RespuestaUsuario]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RespuestaUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRespuesta] [int] NULL,
	[IdUsuario] [int] NULL,
	[IdExamenUsuario] [int] NULL,
	[Texto] [varchar](400) NULL,
	[Marcada] [bit] NOT NULL,
 CONSTRAINT [PK_RespuestaUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [nvarchar](128) NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
 CONSTRAINT [PK_sysdiagrams] PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoExamen]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoExamen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
 CONSTRAINT [PK_TipoExamen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoPregunta]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoPregunta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[NombreControl] [varchar](50) NULL,
 CONSTRAINT [PK_TipoPregunta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserMigration]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMigration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [float] NULL,
	[IdLinea] [float] NULL,
	[Nombres] [nvarchar](255) NULL,
	[Apellidos] [nvarchar](255) NULL,
	[Mail] [nvarchar](255) NULL,
 CONSTRAINT [PK_UserMigration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Mail] [varchar](100) NULL,
	[IdLinea] [int] NULL,
	[UrlImagen] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 24/06/2013 01:32:39 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Pregunta] ADD  CONSTRAINT [DF_Pregunta_Habilitada]  DEFAULT ((1)) FOR [Habilitada]
GO
ALTER TABLE [dbo].[Respuesta] ADD  CONSTRAINT [DF_Respuesta_Marcada]  DEFAULT ((0)) FOR [Marcada]
GO
ALTER TABLE [dbo].[RespuestaUsuario] ADD  CONSTRAINT [DF_RespuestaUsuario_Marcada]  DEFAULT ((0)) FOR [Marcada]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[DocumentoLinea]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoLinea_Documento] FOREIGN KEY([IdDocumento])
REFERENCES [dbo].[Documento] ([Id])
GO
ALTER TABLE [dbo].[DocumentoLinea] CHECK CONSTRAINT [FK_DocumentoLinea_Documento]
GO
ALTER TABLE [dbo].[DocumentoLinea]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoLinea_Linea] FOREIGN KEY([IdLinea])
REFERENCES [dbo].[Linea] ([Id])
GO
ALTER TABLE [dbo].[DocumentoLinea] CHECK CONSTRAINT [FK_DocumentoLinea_Linea]
GO
ALTER TABLE [dbo].[Examen]  WITH CHECK ADD  CONSTRAINT [FK_Examen_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([Id])
GO
ALTER TABLE [dbo].[Examen] CHECK CONSTRAINT [FK_Examen_Estado]
GO
ALTER TABLE [dbo].[Examen]  WITH CHECK ADD  CONSTRAINT [FK_Examen_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[Examen] CHECK CONSTRAINT [FK_Examen_Producto]
GO
ALTER TABLE [dbo].[Examen]  WITH CHECK ADD  CONSTRAINT [FK_Examen_TipoExamen] FOREIGN KEY([IdTipo])
REFERENCES [dbo].[TipoExamen] ([Id])
GO
ALTER TABLE [dbo].[Examen] CHECK CONSTRAINT [FK_Examen_TipoExamen]
GO
ALTER TABLE [dbo].[ExamenUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ExamenUsuario_Examen] FOREIGN KEY([IdExamen])
REFERENCES [dbo].[Examen] ([Id])
GO
ALTER TABLE [dbo].[ExamenUsuario] CHECK CONSTRAINT [FK_ExamenUsuario_Examen]
GO
ALTER TABLE [dbo].[ExamenUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ExamenUsuario_UserProfile] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[ExamenUsuario] CHECK CONSTRAINT [FK_ExamenUsuario_UserProfile]
GO
ALTER TABLE [dbo].[ExamenUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ExamenUsuario_UserProfile1] FOREIGN KEY([IdEjecutivo])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[ExamenUsuario] CHECK CONSTRAINT [FK_ExamenUsuario_UserProfile1]
GO
ALTER TABLE [dbo].[ExamenUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ExamenUsuario_UserProfile2] FOREIGN KEY([IdAster])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[ExamenUsuario] CHECK CONSTRAINT [FK_ExamenUsuario_UserProfile2]
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Examen] FOREIGN KEY([IdExamen])
REFERENCES [dbo].[Examen] ([Id])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Pregunta_Examen]
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_TipoPregunta] FOREIGN KEY([IdTipoPregunta])
REFERENCES [dbo].[TipoPregunta] ([Id])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Pregunta_TipoPregunta]
GO
ALTER TABLE [dbo].[PreguntaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PreguntaUsuario_ExamenUsuario] FOREIGN KEY([IdExamenUsuario])
REFERENCES [dbo].[ExamenUsuario] ([Id])
GO
ALTER TABLE [dbo].[PreguntaUsuario] CHECK CONSTRAINT [FK_PreguntaUsuario_ExamenUsuario]
GO
ALTER TABLE [dbo].[PreguntaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PreguntaUsuario_Pregunta] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Pregunta] ([Id])
GO
ALTER TABLE [dbo].[PreguntaUsuario] CHECK CONSTRAINT [FK_PreguntaUsuario_Pregunta]
GO
ALTER TABLE [dbo].[PreguntaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PreguntaUsuario_UserProfile] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[PreguntaUsuario] CHECK CONSTRAINT [FK_PreguntaUsuario_UserProfile]
GO
ALTER TABLE [dbo].[ProductoLinea]  WITH CHECK ADD  CONSTRAINT [FK_ProductoLinea_Linea] FOREIGN KEY([IdLinea])
REFERENCES [dbo].[Linea] ([Id])
GO
ALTER TABLE [dbo].[ProductoLinea] CHECK CONSTRAINT [FK_ProductoLinea_Linea]
GO
ALTER TABLE [dbo].[ProductoLinea]  WITH CHECK ADD  CONSTRAINT [FK_ProductoLinea_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[ProductoLinea] CHECK CONSTRAINT [FK_ProductoLinea_Producto]
GO
ALTER TABLE [dbo].[PuntajeAsesoria]  WITH NOCHECK ADD  CONSTRAINT [FK_PuntajeAsesoria_Examen] FOREIGN KEY([IdExamen])
REFERENCES [dbo].[Examen] ([Id])
GO
ALTER TABLE [dbo].[PuntajeAsesoria] NOCHECK CONSTRAINT [FK_PuntajeAsesoria_Examen]
GO
ALTER TABLE [dbo].[Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_Respuesta_Pregunta] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Pregunta] ([Id])
GO
ALTER TABLE [dbo].[Respuesta] CHECK CONSTRAINT [FK_Respuesta_Pregunta]
GO
ALTER TABLE [dbo].[RespuestaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RespuestaUsuario_ExamenUsuario] FOREIGN KEY([IdExamenUsuario])
REFERENCES [dbo].[ExamenUsuario] ([Id])
GO
ALTER TABLE [dbo].[RespuestaUsuario] CHECK CONSTRAINT [FK_RespuestaUsuario_ExamenUsuario]
GO
ALTER TABLE [dbo].[RespuestaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RespuestaUsuario_Respuesta] FOREIGN KEY([IdRespuesta])
REFERENCES [dbo].[Respuesta] ([Id])
GO
ALTER TABLE [dbo].[RespuestaUsuario] CHECK CONSTRAINT [FK_RespuestaUsuario_Respuesta]
GO
ALTER TABLE [dbo].[RespuestaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RespuestaUsuario_UserProfile] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[RespuestaUsuario] CHECK CONSTRAINT [FK_RespuestaUsuario_UserProfile]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Linea] FOREIGN KEY([IdLinea])
REFERENCES [dbo].[Linea] ([Id])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Linea]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
