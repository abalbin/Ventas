USE [VentasAppBD]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Farmacia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Farmacia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](20) NULL,
	[Ruc] [varchar](12) NULL,
	[Nombre] [varchar](500) NULL,
	[IdUbigeo] [int] NULL,
	[Direccion] [varchar](500) NULL,
	[Telefono] [varchar](15) NULL,
	[Propietario] [varchar](300) NULL,
	[EncargadoCompra] [varchar](300) NULL,
 CONSTRAINT [PK_Farmacia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Farmacia_Proveedor]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Farmacia_Proveedor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Farmacia_Proveedor](
	[IdFarmacia] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
 CONSTRAINT [PK_Farmacia_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdFarmacia] ASC,
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Linea]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Linea]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Linea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Linea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Llamada]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Llamada]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Llamada](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFarmacia] [int] NULL,
	[IdPedido] [int] NULL,
	[Observaciones] [varchar](500) NULL,
	[Fecha] [datetime] NULL,
	[IdEstado] [int] NULL,
	[FechaAgenda] [datetime] NULL,
 CONSTRAINT [PK_Llamada_Farmacia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NombreTabla]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NombreTabla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NombreTabla](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tabla] [varchar](200) NULL,
	[NombreMostrar] [varchar](200) NULL,
 CONSTRAINT [PK_NombreTabla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pedido](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPresentacion] [int] NULL,
	[IdProveedor] [int] NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Producto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[IdLinea] [int] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductoLinea]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductoLinea]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductoLinea](
	[IdProducto] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
 CONSTRAINT [PK_ProductoLinea] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC,
	[IdLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proveedor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Proveedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[Mail] [varchar](100) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoExamen]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoExamen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoExamen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
 CONSTRAINT [PK_TipoExamen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserMigration]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMigration]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserProfile]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_Membership]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_OAuthMembership]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 03/07/2013 09:42:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Estado] ON 

GO
INSERT [dbo].[Estado] ([Id], [Nombre]) VALUES (1, N'Activo')
GO
INSERT [dbo].[Estado] ([Id], [Nombre]) VALUES (2, N'Inactivo')
GO
INSERT [dbo].[Estado] ([Id], [Nombre]) VALUES (3, N'Listo')
GO
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[Linea] ON 

GO
INSERT [dbo].[Linea] ([Id], [Nombre]) VALUES (5, N'Alivio')
GO
INSERT [dbo].[Linea] ([Id], [Nombre]) VALUES (6, N'Salud Mujer')
GO
INSERT [dbo].[Linea] ([Id], [Nombre]) VALUES (7, N'Respiratoria')
GO
INSERT [dbo].[Linea] ([Id], [Nombre]) VALUES (8, N'Salud Digestiva')
GO
INSERT [dbo].[Linea] ([Id], [Nombre]) VALUES (9, N'Corporativo')
GO
INSERT [dbo].[Linea] ([Id], [Nombre]) VALUES (10, N'Acceso')
GO
SET IDENTITY_INSERT [dbo].[Linea] OFF
GO
SET IDENTITY_INSERT [dbo].[NombreTabla] ON 

GO
INSERT [dbo].[NombreTabla] ([Id], [Tabla], [NombreMostrar]) VALUES (1, N'Linea', N'Solución')
GO
INSERT [dbo].[NombreTabla] ([Id], [Tabla], [NombreMostrar]) VALUES (2, N'Aster', N'Aster')
GO
SET IDENTITY_INSERT [dbo].[NombreTabla] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (1, N'Previne D Geltabs - Previbe D Fort ', 5)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (2, N'Bonese', 5)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (3, N'Flexure - MSM', 5)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (4, N'Betaduo', 5)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (5, N'Dolantag', 5)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (6, N'Meloxx', 5)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (7, N'Tamin', 5)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (10, N'Albisec', 6)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (11, N'Vaxigel', 6)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (12, N'Gestafer', 6)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (13, N'Vitesol E', 6)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (14, N'Vitesol B6', 6)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (15, N'Lactinese', 6)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (16, N'Tusiclox', 7)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (17, N'Levaler/Alercet D', 7)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (18, N'Xalar', 7)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (19, N'Menistin', 7)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (20, N'Inedol', 7)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (21, N'Bianos', 7)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (22, N'Ezolium', 8)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (23, N'Ifaxim', 8)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (24, N'Alercet', 8)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (25, N'Nytasoft', 8)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (26, N'Muvett/Muvett S', 8)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (27, N'Equiplen', 8)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (29, N'Levaler', 9)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (32, N'Alercet D', 9)
GO
INSERT [dbo].[Producto] ([Id], [Nombre], [IdLinea]) VALUES (57, N'Producto de Prueba', 6)
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (1, 5)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (1, 6)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (1, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (2, 5)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (2, 6)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (2, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (3, 5)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (3, 9)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (3, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (4, 5)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (4, 9)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (4, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (5, 5)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (5, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (6, 5)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (6, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (7, 5)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (7, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (10, 6)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (10, 9)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (11, 6)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (11, 9)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (12, 6)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (13, 6)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (14, 6)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (15, 6)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (16, 7)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (16, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (17, 7)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (17, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (18, 7)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (18, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (19, 7)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (19, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (20, 7)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (20, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (21, 7)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (21, 9)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (21, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (22, 8)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (22, 9)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (22, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (23, 8)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (23, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (24, 8)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (24, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (25, 8)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (25, 9)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (25, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (26, 8)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (26, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (27, 8)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (27, 10)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (29, 9)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (32, 9)
GO
INSERT [dbo].[ProductoLinea] ([IdProducto], [IdLinea]) VALUES (57, 6)
GO
SET IDENTITY_INSERT [dbo].[TipoExamen] ON 

GO
INSERT [dbo].[TipoExamen] ([Id], [Nombre]) VALUES (1, N'Evaluación Aster')
GO
INSERT [dbo].[TipoExamen] ([Id], [Nombre]) VALUES (2, N'Asesoría en Terreno')
GO
SET IDENTITY_INSERT [dbo].[TipoExamen] OFF
GO
SET IDENTITY_INSERT [dbo].[UserMigration] ON 

GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (1, 2, 10, N'Ana', N'Rocha Malqui', N'arocha@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (2, 2, 10, N'Patricia', N'Del Castillo Alcedo', N'ddelcastillo@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (3, 2, 10, N'Rennier', N'Yañez Farfan', N'ryanez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (4, 2, 10, N'Juan', N'Olivera Guerra', N'jolivera@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (5, 2, 10, N'Encarnita', N'Zegarra Ruíz', N'ezegarra@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (6, 4, 10, N'Juan Carlos', N'Guajardo Mendez', N'jguajardo@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (7, 3, 5, N'Sandro', N'Salazar Sanez', N'ssalazar@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (8, 5, 5, N'Guillermo', N'Cubas Giudice', N'gcubas@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (9, 2, 5, N'Diana', N'Mostacero Rodríguez', N'dmostacero@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (10, 2, 5, N'Lis Faride', N'Augusto Vega', N'laugusto@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (11, 2, 5, N'Zoila', N'Sánchez Collantes', N'zsanchez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (12, 2, 5, N'Maria Isabel', N'Tocto Geraldo', N'mtocto@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (13, 2, 5, N'José', N'Freyre Morales', N'jfreyre@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (14, 2, 5, N'Delia', N'Zapata Coral', N'dzapata@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (15, 2, 5, N'Maribel', N'Pisconte Guerreros', N'mpisconte@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (16, 2, 5, N'Cristina', N'Cier Guzmán', N'icier@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (17, 2, 5, N'Jandira', N'Paredes Dueñas', N'jparedes@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (18, 2, 5, N'Jesús', N'Gonzáles Peralta', N'jgonzales@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (19, 2, 5, N'Roxana', N'Sosa Angulo', N'rsosa@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (20, 2, 5, N'Yasmine', N'Garrido Vargas', N'ygarrido@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (21, 2, 5, N'Cintia Kateryn', N'Sanchez Campos', N'csanchezc@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (22, 3, 9, N'Henry', N'Ross Accame', N'hross@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (23, 2, 9, N'Carmen Luz', N'Tiburcio Alguiar', N'ctiburcio@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (24, 2, 9, N'Tadeo', N'Eduardo Meyer', N'tmeyer@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (25, 2, 9, N'Karín', N'Noriega Najar', N'knoriega@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (26, 2, 9, N'Davis', N'Gutiérrez Orgeda', N'dgutierrez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (27, 2, 9, N'Marisol', N'Chacón Montañez', N'mchacon@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (28, 2, 9, N'Alejandra', N'Cribillero Muchotrigo', N'ecribillero@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (29, 2, 9, N'Jonathan', N'Suarez Salas', N'jsuarez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (30, 3, 6, N'Calixto', N'Castro Sipan', N'ccastro@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (31, 6, 9, N'Eliza Virginia', N'Falla Huambo', N'vfalla@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (32, 6, 9, N'Maria Magdalena', N'Oré Gonzales', N'more@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (33, 6, 9, N'Patricia', N'Vernal Sirvas', N'pvernal@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (34, 6, 9, N'Ana Patricia', N'Alcazar Seijas', N'aalcazar@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (35, 6, 9, N'Ana Angella', N'Alvarado Guzman', N'aalvarado@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (36, 6, 9, N'Margareth Sabella', N'Reyes Becerra', N'sreyes@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (37, 6, 9, N'Verónica Carmen', N'Vidal Valladares', N'vvidal@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (38, 6, 9, N'Karol', N'Caruajulca', NULL)
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (39, 6, 9, N'Dina', N'Armas', NULL)
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (40, 6, 9, N'Rosa', N'Skrinjaric', NULL)
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (41, 6, 9, N'María', N'Delgado', NULL)
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (42, 6, 9, N'Eva', N'Ascencio', NULL)
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (43, 6, 9, N'Erika Yanina', N'Ramirez Zevallos', N'eramirez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (44, 7, 9, N'Hector', N'Alvarez Garcia', N'halvarez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (45, 8, 9, N'Williams', N'Romero  Cáceres', N'wromero@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (46, 3, 9, N'Víctor', N'Vásquez Claudet', N'vvasquez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (47, 3, 9, N'Fredy', N'Murillo Begazo', N'fmurillo@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (48, 9, 9, N'Antonio', N'Ríos Noriega', N'arios@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (49, 9, 9, N'Rosario', N'Cabrera Sirlupu', N'rcabrera@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (50, 10, 9, N'Elke', N'Gutiérrez Merino', N'egutierrez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (51, 10, 9, N'Yanina Sarita', N'Vilela Céspedes', N'yvilela@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (52, 10, 9, N'Ursula', N'Martínez Guevara', N'umartinez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (53, 10, 9, N'Gina', N'Gonzáles Nuñez', N'ggonzales@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (54, 10, 9, N'Inés', N'Camargo Salazar', N'icamargo@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (55, 10, 9, N'María', N'Chi Raa', N'mchi@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (56, 11, 9, N'Gisella', N'Ramirez Barrionuevo', N'gramirez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (57, 11, 9, N'Maritza', N'Navarro Price', N'mnavarro@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (58, 10, 9, N'Ivette', N'Rodriguez Mendoza', N'irodriguez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (59, 10, 9, N'Laura', N'Saldaña Leyton', N'lsaldana@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (60, 10, 9, N'Lizeth ', N'Ramírez Herrea', NULL)
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (61, 10, 9, N'Lili', N'Perez', NULL)
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (62, 10, 9, N'Carla', N'Torres Rondón', NULL)
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (63, 10, 9, N'Juliet', N'Espíritu Muñoz', NULL)
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (64, 10, 9, N'Neri', N'Sabogal Martinez', N'nsabogal@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (65, 10, 9, N'Gilda Karina', N'Sanchez Barrera ', N'gsanchez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (66, 10, 9, N'Gustavo Alonso', N'Hinostroza Aguilar', N'ghinostroza@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (67, 2, 7, N'José Luis', N'Tello Melendez', N'jtello@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (68, 2, 7, N'Rosa', N'Gonzales García', N'smorote@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (69, 2, 7, N'Melisa', N'Sime Burga', N'msime@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (70, 2, 7, N'Andrea', N'Tejada', N'atejada@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (71, 2, 7, N'Aldo', N'Suarez Mosaurieta', N'asuarez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (72, 2, 7, N'Keti', N'Almirón Domínguez', N'kalmiron@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (73, 2, 7, N'Doris', N'Quintos Silva', N'dquintos@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (74, 2, 7, N'Fredi', N'Sanchez Trujillo', N'fsanchez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (75, 2, 7, N'Yovanna', N'Puchuri Martínez', N'ypuchuri@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (76, 2, 7, N'Cynthia ', N'Dioses Herrera', N'cdioses@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (77, 2, 7, N'Giannina', N'Toro Saavedra', N'etoro@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (78, 2, 7, N'Eduardo', N'Cabezudo Tovar', N'ecabezudo@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (79, 2, 7, N'Manuel', N'Guerrero Guardia', N'mguerrerro@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (80, 12, 7, N'Daniel', N'Vasquez Alvarado', N'dvasquez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (81, 2, 8, N'Mariana', N'Leon Medina', N'mleon@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (82, 2, 8, N'América ', N'Ávila Román', N'aavila@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (83, 2, 8, N'Manuela', N'Esquen Vasquez', N'mesquen@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (84, 2, 8, N'César', N'Manzaneda Luna', N'cmanzaneda@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (85, 2, 8, N'Rocío', N'Egusquiza Peña', N'regusquiza@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (86, 2, 8, N'Karina', N'Chavez Guevara', N'kchavez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (87, 2, 8, N'Vanessa', N'Rodriguez Castillo', N'vrodriguez@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (88, 2, 8, N'María del Carmen', N'Cherre Espejo', N'mcherre@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (89, 2, 8, N'Daniela', N'Surca Vilchez', N'csurca@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (90, 2, 8, N'Mabel', N'Succar Medina', N'msuccar@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (91, 2, 8, N'Ana', N'Vallejos Mendoza', N'avallejos@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (92, 2, 8, N'Vilma', N'Infante Gomez', N'vinfante@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (93, 2, 8, N'Francy', N'Vera Fort', N'fvera@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (94, 12, 8, N'Philippe', N'Lafosse Masías', N'plafosse@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (95, 3, 8, N'Julio César', N'Reyer Gonzales', N'jreyes@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (96, 2, 6, N'Luz', N'Belen Reto', N'lreto@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (97, 2, 6, N'Claudia', N'Benavente Riega', N'cbenavente@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (98, 2, 6, N'Lila', N'Apolo Arrieta', N'lapolo@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (99, 2, 6, N'Gisela', N'Calderón Alcalde', N'gcalderon@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (100, 2, 6, N'Brenda', N'Calderón Soria', N'bcalderon@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (101, 2, 6, N'Kony', N'Cuellar De La Cruz', N'kcuellar@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (102, 2, 6, N'Lucy', N'Onofre Escurra', N'lonofre@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (103, 2, 6, N'José', N'Priano Gervasi', N'jpriano@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (104, 2, 6, N'Maria Luzmila', N'Campos Urbina', N'mcampos@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (105, 2, 6, N'Stefany', N'Franco Reyna', N'sfranco@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (106, 2, 6, N'Verónica', N'Estacio Naveda', N'vestacio@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (107, 2, 6, N'Gloria', N'Cuadra Bianchi', N'gcuadra@unimed.com.pe')
GO
INSERT [dbo].[UserMigration] ([Id], [RoleId], [IdLinea], [Nombres], [Apellidos], [Mail]) VALUES (108, 12, 6, N'Marisol', N'Rubio Estrada', N'mrubio@unimed.com.pe')
GO
SET IDENTITY_INSERT [dbo].[UserMigration] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (10, N'abalbin', N'Arturo', N'Balbin Rojas', N'r2d2klapa@gmail.com', 10, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (119, N'arocha', N'Ana', N'Rocha Malqui', N'r2d2klapa@gmail.com', 10, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (120, N'ddelcastillo', N'Patricia', N'Del Castillo Alcedo', N'r2d2klapa@gmail.com', 10, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (121, N'ryanez', N'Rennier', N'Yañez Farfan', N'r2d2klapa@gmail.com', 10, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (122, N'jolivera', N'Juan', N'Olivera Guerra', N'r2d2klapa@gmail.com', 10, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (123, N'ezegarra', N'Encarnita', N'Zegarra Ruíz', N'r2d2klapa@gmail.com', 10, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (124, N'jguajardo', N'Juan Carlos', N'Guajardo Mendez', N'r2d2klapa@gmail.com', 10, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (125, N'ssalazar', N'Sandro', N'Salazar Sanez', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (126, N'gcubas', N'Guillermo', N'Cubas Giudice', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (127, N'dmostacero', N'Diana', N'Mostacero Rodríguez', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (128, N'laugusto', N'Lis Faride', N'Augusto Vega', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (129, N'zsanchez', N'Zoila', N'Sánchez Collantes', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (130, N'mtocto', N'Maria Isabel', N'Tocto Geraldo', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (131, N'jfreyre', N'José', N'Freyre Morales', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (132, N'dzapata', N'Delia', N'Zapata Coral', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (133, N'mpisconte', N'Maribel', N'Pisconte Guerreros', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (134, N'icier', N'Cristina', N'Cier Guzmán', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (135, N'jparedes', N'Jandira', N'Paredes Dueñas', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (136, N'jgonzales', N'Jesús', N'Gonzáles Peralta', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (137, N'rsosa', N'Roxana', N'Sosa Angulo', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (138, N'ygarrido', N'Yasmine', N'Garrido Vargas', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (139, N'csanchezc', N'Cintia Kateryn', N'Sanchez Campos', N'r2d2klapa@gmail.com', 5, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (140, N'hross', N'Henry', N'Ross Accame', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (141, N'ctiburcio', N'Carmen Luz', N'Tiburcio Alguiar', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (142, N'tmeyer', N'Tadeo', N'Eduardo Meyer', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (143, N'knoriega', N'Karín', N'Noriega Najar', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (144, N'dgutierrez', N'Davis', N'Gutiérrez Orgeda', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (145, N'mchacon', N'Marisol', N'Chacón Montañez', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (146, N'ecribillero', N'Alejandra', N'Cribillero Muchotrigo', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (147, N'jsuarez', N'Jonathan', N'Suarez Salas', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (148, N'ccastro', N'Calixto', N'Castro Sipan', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (149, N'vfalla', N'Eliza Virginia', N'Falla Huambo', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (150, N'more', N'Maria Magdalena', N'Oré Gonzales', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (151, N'pvernal', N'Patricia', N'Vernal Sirvas', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (152, N'aalcazar', N'Ana Patricia', N'Alcazar Seijas', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (153, N'aalvarado', N'Ana Angella', N'Alvarado Guzman', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (154, N'sreyes', N'Margareth Sabella', N'Reyes Becerra', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (155, N'vvidal', N'Verónica Carmen', N'Vidal Valladares', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (156, N'kCaruajulca', N'Karol', N'Caruajulca', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (157, N'dArmas', N'Dina', N'Armas', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (158, N'rSkrinjaric', N'Rosa', N'Skrinjaric', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (159, N'mDelgado', N'María', N'Delgado', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (160, N'eAscencio', N'Eva', N'Ascencio', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (161, N'eramirez', N'Erika Yanina', N'Ramirez Zevallos', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (162, N'halvarez', N'Hector', N'Alvarez Garcia', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (163, N'wromero', N'Williams', N'Romero  Cáceres', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (164, N'vvasquez', N'Víctor', N'Vásquez Claudet', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (165, N'fmurillo', N'Fredy', N'Murillo Begazo', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (166, N'arios', N'Antonio', N'Ríos Noriega', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (167, N'rcabrera', N'Rosario', N'Cabrera Sirlupu', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (168, N'egutierrez', N'Elke', N'Gutiérrez Merino', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (169, N'yvilela', N'Yanina Sarita', N'Vilela Céspedes', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (170, N'umartinez', N'Ursula', N'Martínez Guevara', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (171, N'ggonzales', N'Gina', N'Gonzáles Nuñez', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (172, N'icamargo', N'Inés', N'Camargo Salazar', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (173, N'mchi', N'María', N'Chi Raa', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (174, N'gramirez', N'Gisella', N'Ramirez Barrionuevo', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (175, N'mnavarro', N'Maritza', N'Navarro Price', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (176, N'irodriguez', N'Ivette', N'Rodriguez Mendoza', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (177, N'lsaldana', N'Laura', N'Saldaña Leyton', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (178, N'lRamírez', N'Lizeth ', N'Ramírez Herrea', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (179, N'lPerez', N'Lili', N'Perez', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (180, N'cTorres', N'Carla', N'Torres Rondón', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (181, N'jEspíritu', N'Juliet', N'Espíritu Muñoz', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (182, N'nsabogal', N'Neri', N'Sabogal Martinez', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (183, N'gsanchez', N'Gilda Karina', N'Sanchez Barrera ', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (184, N'ghinostroza', N'Gustavo Alonso', N'Hinostroza Aguilar', N'r2d2klapa@gmail.com', 9, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (185, N'jtello', N'José Luis', N'Tello Melendez', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (186, N'smorote', N'Rosa', N'Gonzales García', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (187, N'msime', N'Melisa', N'Sime Burga', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (188, N'atejada', N'Andrea', N'Tejada', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (189, N'asuarez', N'Aldo', N'Suarez Mosaurieta', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (190, N'kalmiron', N'Keti', N'Almirón Domínguez', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (191, N'dquintos', N'Doris', N'Quintos Silva', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (192, N'fsanchez', N'Fredi', N'Sanchez Trujillo', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (193, N'ypuchuri', N'Yovanna', N'Puchuri Martínez', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (194, N'cdioses', N'Cynthia ', N'Dioses Herrera', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (195, N'etoro', N'Giannina', N'Toro Saavedra', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (196, N'ecabezudo', N'Eduardo', N'Cabezudo Tovar', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (197, N'mguerrerro', N'Manuel', N'Guerrero Guardia', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (198, N'dvasquez', N'Daniel', N'Vasquez Alvarado', N'r2d2klapa@gmail.com', 7, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (199, N'mleon', N'Mariana', N'Leon Medina', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (200, N'aavila', N'América ', N'Ávila Román', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (201, N'mesquen', N'Manuela', N'Esquen Vasquez', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (202, N'cmanzaneda', N'César', N'Manzaneda Luna', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (203, N'regusquiza', N'Rocío', N'Egusquiza Peña', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (204, N'kchavez', N'Karina', N'Chavez Guevara', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (205, N'vrodriguez', N'Vanessa', N'Rodriguez Castillo', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (206, N'mcherre', N'María del Carmen', N'Cherre Espejo', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (207, N'csurca', N'Daniela', N'Surca Vilchez', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (208, N'msuccar', N'Mabel', N'Succar Medina', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (209, N'avallejos', N'Ana', N'Vallejos Mendoza', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (210, N'vinfante', N'Vilma', N'Infante Gomez', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (211, N'fvera', N'Francy', N'Vera Fort', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (212, N'plafosse', N'Philippe', N'Lafosse Masías', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (213, N'jreyes', N'Julio César', N'Reyer Gonzales', N'r2d2klapa@gmail.com', 8, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (214, N'lreto', N'Luz', N'Belen Reto', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (215, N'cbenavente', N'Claudia', N'Benavente Riega', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (216, N'lapolo', N'Lila', N'Apolo Arrieta', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (217, N'gcalderon', N'Gisela', N'Calderón Alcalde', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (218, N'bcalderon', N'Brenda', N'Calderón Soria', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (219, N'kcuellar', N'Kony', N'Cuellar De La Cruz', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (220, N'lonofre', N'Lucy', N'Onofre Escurra', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (221, N'jpriano', N'José', N'Priano Gervasi', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (222, N'mcampos', N'Maria Luzmila', N'Campos Urbina', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (223, N'sfranco', N'Stefany', N'Franco Reyna', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (224, N'vestacio', N'Verónica', N'Estacio Naveda', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (225, N'gcuadra', N'Gloria', N'Cuadra Bianchi', N'r2d2klapa@gmail.com', 6, NULL)
GO
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Mail], [IdLinea], [UrlImagen]) VALUES (226, N'mrubio', N'Marisol', N'Rubio Estrada', N'r2d2klapa@gmail.com', 6, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(0x0000A17A01522858 AS DateTime), NULL, 1, NULL, 0, N'AMxL1C4Dnzy5b64vn9oAnVIEpDzkotlb7zBZ6ue+hhCfEJ1MJHFSyOXQNh/soaWiUQ==', CAST(0x0000A17A01522858 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (2, CAST(0x0000A17A0152F947 AS DateTime), NULL, 1, NULL, 0, N'AD5r+GKqkI05MGl7uQJDH9+4d+2qTyuqAR+KA1NuGKazwTKxOQlMs1mFvbdFon9jPg==', CAST(0x0000A17A0152F947 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (3, CAST(0x0000A17B0106164D AS DateTime), NULL, 1, NULL, 0, N'ABSeFKrDurYDLQEQDxQ5ZUOIhilKq72LLhd6CRbYLFBWgAzt+D0aud83ONBX5XP2fQ==', CAST(0x0000A17B0106164D AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (4, CAST(0x0000A17B0107FD23 AS DateTime), NULL, 1, NULL, 0, N'ADVTpzphAiRPGPRyAk926RTS1vnGBd+mo3iFknXWbWzDh7zOqkJ0Jbz1V+9lq4ne4g==', CAST(0x0000A17B0107FD23 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (5, CAST(0x0000A17B010B53FF AS DateTime), NULL, 1, NULL, 0, N'ADezSppSI8a25ESr9APJxBXjfDJCRjSSaKIVcdzffwB2vxSMSC8SnpZQncryPxsHHw==', CAST(0x0000A17B010B53FF AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (6, CAST(0x0000A17B0111CA3E AS DateTime), NULL, 1, NULL, 0, N'ALDWI1rj3BFAb80sJvaaihWwIawifq6Da0eBcdqyLupY8+OKXu2OcyDpAIIVQRxjDA==', CAST(0x0000A17B0111CA3E AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (7, CAST(0x0000A17B01126337 AS DateTime), NULL, 1, NULL, 0, N'AHEk+yAqBEsoaLUISJ5bKcqqRDmz8GcozO/5HHi3fj9KBuuNYfMIxxlTKq2w4Kq9pA==', CAST(0x0000A17B01126337 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (8, CAST(0x0000A18000032F6A AS DateTime), NULL, 1, NULL, 0, N'ABlQ1G1rcHOA0vzOVSa8rTO7U7S5tFzhRNfLo9RkxhS0W2jJ0IX+N0sg7Mbe0iChDA==', CAST(0x0000A18000032F6A AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (9, CAST(0x0000A1800003E0C4 AS DateTime), NULL, 1, NULL, 0, N'AMJhMym8GuRqhJa9y8c61ZtTwY7ZiYpTgqr4p84Zyryz/ZM/CrO7Hm9tWtBqfkVxww==', CAST(0x0000A1800003E0C4 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (10, CAST(0x0000A19401088306 AS DateTime), NULL, 1, CAST(0x0000A1B401246F1E AS DateTime), 0, N'ANuOqFHjFBMBcU9sYe2ZCxPGNbpH1NhwHNOohsjqkR2GHK2RcNxrQWxxs+LprrgDsw==', CAST(0x0000A1B40123BB1F AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (119, CAST(0x0000A1A1003241B2 AS DateTime), NULL, 1, CAST(0x0000A1B401340A53 AS DateTime), 0, N'APCIbIGzj/I+aPAxhNmXtGv0v3hg3l/G4MhdRf/dMloPvtOr5z9tKMIbUT60F/qO8Q==', CAST(0x0000A1B40124DC2A AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (120, CAST(0x0000A1A100324374 AS DateTime), NULL, 1, NULL, 0, N'ALKOXokMzPSve7GGAt4o4HsiB841L2ktQlCbQkwfXyB1AJeLszUy0jr3FvWIAndjYg==', CAST(0x0000A1A100324374 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (121, CAST(0x0000A1A10032438B AS DateTime), NULL, 1, NULL, 0, N'AJ2gV4nfLeg2m8iKCxURO+XySGRptFczV/S62tpjVUdS0TOfRUPL5gAmkbltmNt0wQ==', CAST(0x0000A1A10032438B AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (122, CAST(0x0000A1A100324394 AS DateTime), NULL, 1, NULL, 0, N'AC8SdXIc8p70jiq3ih5AhhOvNCQYL9pcBIZt8JgW9+pzy6wqX/q30jDGh3ahONhiHA==', CAST(0x0000A1A100324394 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (123, CAST(0x0000A1A10032439C AS DateTime), NULL, 1, NULL, 0, N'APwY98XPg2uVvaP6HPTKvgUnl+rWq6XnTq7GtTyuGWVuFFo9HJdIDNdtbJQIvGCy2Q==', CAST(0x0000A1A10032439C AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (124, CAST(0x0000A1A1003243A4 AS DateTime), NULL, 1, NULL, 0, N'AKY6L2TJnaOvdzpO+rBqX8MQ7S7RWiX4rsU6lOTfKr5KuLcMmdyDiWo2kecp+bMLKQ==', CAST(0x0000A1A1003243A4 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (125, CAST(0x0000A1A1003243CB AS DateTime), NULL, 1, NULL, 0, N'AMxcx94ijEzd8D+/5ms+xNBa2cP4WYR3NuhvMVtE34Ki9AKalOZDcCLR2+h6Kx7jxQ==', CAST(0x0000A1A1003243CB AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (126, CAST(0x0000A1A1003243D4 AS DateTime), NULL, 1, NULL, 0, N'AJZDVMoGyaDwvkpnAGef4iHoZudv8oErxXA/vkArGULHkUfNeRqYgNEmVEMjs0+U6g==', CAST(0x0000A1A1003243D4 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (127, CAST(0x0000A1A1003243EE AS DateTime), NULL, 1, NULL, 0, N'AOPFuLrQFi18XMVr8AmuFhlLd4acUIT7FIeJoRj7X2RGm+RP7VJmsySd+/awkjdJ8Q==', CAST(0x0000A1A1003243EE AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (128, CAST(0x0000A1A1003243F7 AS DateTime), NULL, 1, NULL, 0, N'AGHiq/sdi8DyT2i7JSJRUm34sue36gv0QthsWRPfXnnT4hZCU3NUEmS2RAL7/BPn7Q==', CAST(0x0000A1A1003243F7 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (129, CAST(0x0000A1A1003243FD AS DateTime), NULL, 1, NULL, 0, N'ANwPwws9Gcx20apCLaWUeksdQF4Rs8HnNRYiFktVcIBM/EmIvFoFAkYHWgP6CUX8gQ==', CAST(0x0000A1A1003243FD AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (130, CAST(0x0000A1A100324404 AS DateTime), NULL, 1, NULL, 0, N'AEHK15quipzBZq70WfGF38bqXTY6eRsxMedvjvItlv7JzpTi/I2BW965C47IsMT8JA==', CAST(0x0000A1A100324404 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (131, CAST(0x0000A1A100324410 AS DateTime), NULL, 1, NULL, 0, N'AOSyJ9AVZf8tnJB3pbnySJPr1tQrmQOEQt0AKjyTMXez7XOkbGuFkmAYdS/uzKOGZA==', CAST(0x0000A1A100324410 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (132, CAST(0x0000A1A10032443F AS DateTime), NULL, 1, NULL, 0, N'AE7lJ670quoJp88jUPG0m0TPHsA1d0ujBOKxr4u4IO89tmI22P7uEVsLqPC1fFgXeg==', CAST(0x0000A1A10032443F AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (133, CAST(0x0000A1A100324447 AS DateTime), NULL, 1, NULL, 0, N'AA3uo7r6Aj/H+GwRH99QkcyYccMswYwI6p+W8qVdXacDRYADGBGcopGs4m6MYAmSWA==', CAST(0x0000A1A100324447 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (134, CAST(0x0000A1A100324453 AS DateTime), NULL, 1, NULL, 0, N'ALxF7gcxNbRC1sNMuEhp44UjzZwiRZdfd0vZravPCdOaw3VRy3KoPwM3yVDB57vk1Q==', CAST(0x0000A1A100324453 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (135, CAST(0x0000A1A10032445A AS DateTime), NULL, 1, NULL, 0, N'AFMhZHFnRab9oNZ2yaijc8cDb4puWn/IKxW4FexpwQYB8OdOi6K0vXbug7Qg7KAL+w==', CAST(0x0000A1A10032445A AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (136, CAST(0x0000A1A100324460 AS DateTime), NULL, 1, NULL, 0, N'AGYDh0uoiVZrJ09r9CUQ2oyiu7SOc1DPR/52yfKrYBDndVyk8KdE5OKT2MkMnfSVtg==', CAST(0x0000A1A100324460 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (137, CAST(0x0000A1A10032446D AS DateTime), NULL, 1, NULL, 0, N'AD7hG/FJkk8tdT8IyzrkyY8mR2h/m63NVc9O9TsnmXuVElJgTaxlSmbge/4BZYe6rw==', CAST(0x0000A1A10032446D AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (138, CAST(0x0000A1A100324474 AS DateTime), NULL, 1, NULL, 0, N'AFh5B/GeQ5sV+fha6Km5kZqlN1BMgzqEw4JweoUtXfRiGwWsSnQzTO5dY4/YLe+O3w==', CAST(0x0000A1A100324474 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (139, CAST(0x0000A1A10032447E AS DateTime), NULL, 1, NULL, 0, N'AF/E7zkWm5o6bJoolrUgAJSIZWWhjd/rLr+FTE1SvNB5uJAYlxkYMMmLmZkq28h0aw==', CAST(0x0000A1A10032447E AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (140, CAST(0x0000A1A100324484 AS DateTime), NULL, 1, NULL, 0, N'AAOotueUBpebDQJaiICBdDLgSYq0xsgtszHeDRfSPmjUPgwTRVqpSziAj6bZYjkb2Q==', CAST(0x0000A1A100324484 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (141, CAST(0x0000A1A10032448B AS DateTime), NULL, 1, NULL, 0, N'ALYfqjlrbeymZVh9gKDRKxLqCck0fDeHEwqgvV8hoF1hYqZwx61QZtNb9kzy6HZQOw==', CAST(0x0000A1A10032448B AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (142, CAST(0x0000A1A100324491 AS DateTime), NULL, 1, NULL, 0, N'AFTWbCzRkpEksIG+XhrEnFZHLMXPymsbHzY0Gdo5EBudJH0CGgWqjjt4DqpVhluo+Q==', CAST(0x0000A1A100324491 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (143, CAST(0x0000A1A100324497 AS DateTime), NULL, 1, NULL, 0, N'AJOG9JZJmKJFITq5RXKkr+m5+uCya4uI76x8TVUz0av35Fp4/LM3HoIRL1tLGy//9w==', CAST(0x0000A1A100324497 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (144, CAST(0x0000A1A10032449D AS DateTime), NULL, 1, NULL, 0, N'APnwJAt43J1n+TmJ+vS4Lz1bYStykOqo8RrSdssA4jTXxRPc4+w5xbIAhpwOt9bjRw==', CAST(0x0000A1A10032449D AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (145, CAST(0x0000A1A1003244A3 AS DateTime), NULL, 1, NULL, 0, N'AL5PEIVoWeJKNEWN/rZxW2DUBCJXpwCiVAUT3/+fvp9uckY02d8MGAKcGSVdxe7QtQ==', CAST(0x0000A1A1003244A3 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (146, CAST(0x0000A1A1003244AA AS DateTime), NULL, 1, NULL, 0, N'AFwYGTgzk0UW4yc3Xxl4nB0AbiV7I3lzeCMYFZODw91IFrsIIOX8A1laojUbH6THgA==', CAST(0x0000A1A1003244AA AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (147, CAST(0x0000A1A1003244B1 AS DateTime), NULL, 1, NULL, 0, N'AHwQ0ekSEQBt3FNtyBdSJo8F+jldJ1cNepCceyIW0cc4dFyKwEUqcj5AUISljEUu+A==', CAST(0x0000A1A1003244B1 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (148, CAST(0x0000A1A1003244B7 AS DateTime), NULL, 1, NULL, 0, N'ANfMhr9dbyhdThPN25rt9EYWUi3tpMRX0w+ibbpxD84bmqTZMupG+2UfGyauemZwaw==', CAST(0x0000A1A1003244B7 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (149, CAST(0x0000A1A1003244C6 AS DateTime), NULL, 1, NULL, 0, N'AMkFAeds/rQr79qAoCbpnTswW6WMDxUbkxRfzRYYnPzwBGTMq9G1VibGomlTyhgT4Q==', CAST(0x0000A1A1003244C6 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (150, CAST(0x0000A1A1003244CF AS DateTime), NULL, 1, NULL, 0, N'ACfqkJszJAJxG5pjGtfYT3UhnC40r0dERtgyWTNkuPqVzE7wXCkZfwCwwDtXE3RPgA==', CAST(0x0000A1A1003244CF AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (151, CAST(0x0000A1A1003244DD AS DateTime), NULL, 1, NULL, 0, N'AEOoG44BLBDfjtLnTjrk028dtXTmsoQQXPlhuF+xN9+UyJzwWQWmrv702t2zw0JDPQ==', CAST(0x0000A1A1003244DD AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (152, CAST(0x0000A1A1003244ED AS DateTime), NULL, 1, NULL, 0, N'AHEreESQVYtnFfZOCxRHJOm7U1GQTEJO8vdKTzssYgtCELQpmb/rvFG7WXdfLHZDNg==', CAST(0x0000A1A1003244ED AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (153, CAST(0x0000A1A1003244FE AS DateTime), NULL, 1, NULL, 0, N'AGJpLlC1H45fJ0/X5cvmKMfbrexFz9LJdNamfsiIi5XDDZztYl5jHZDQSLjTNbWB6g==', CAST(0x0000A1A1003244FE AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (154, CAST(0x0000A1A100324506 AS DateTime), NULL, 1, NULL, 0, N'ANRIhZXJh0iZgY1snunSr86IYmTNsuGnQb11WVKdZ20sk8B4kQK6gNlTLP81MWx5GQ==', CAST(0x0000A1A100324506 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (155, CAST(0x0000A1A10032450D AS DateTime), NULL, 1, NULL, 0, N'ADyICDfOHpR9xQZ1RcyHGEU/jro1z54YxI5Mw4NLdeImCCkmRQGgd3YsTd/iLQ0mhQ==', CAST(0x0000A1A10032450D AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (156, CAST(0x0000A1A100324514 AS DateTime), NULL, 1, NULL, 0, N'AB5MI+9OjVwTtHMNxSi2fg6FkRsltsBuCzVQF+cL1jR+5HR4bm2xmpbAQeO7CHJBiw==', CAST(0x0000A1A100324514 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (157, CAST(0x0000A1A10032451B AS DateTime), NULL, 1, NULL, 0, N'AAVGgq6dzvDKrk4ogHa7bkNurdYQVceGBz8wbfyzPBnJoul6GuNwcq9QlC3A+FOXmg==', CAST(0x0000A1A10032451B AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (158, CAST(0x0000A1A100324522 AS DateTime), NULL, 1, NULL, 0, N'AChS/H74ak3F1B4f8GG8XLxLHTspBn7P5iVOFN9I9K4vnyrwu/rsbHw1yQgDID1l7g==', CAST(0x0000A1A100324522 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (159, CAST(0x0000A1A100324529 AS DateTime), NULL, 1, NULL, 0, N'AFmrWiMT0wCg66AKVmCz8go1/fmXJDn2xmhA4/ybra+mSd9CKh3Ee8c+8cAn4z22Ow==', CAST(0x0000A1A100324529 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (160, CAST(0x0000A1A10032452F AS DateTime), NULL, 1, NULL, 0, N'ALBxbYiYmYg/m31T7zJcG8mmURYlrs6URTLUM38/xsyr0R+rH2eJLmShs2z3g+tj+A==', CAST(0x0000A1A10032452F AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (161, CAST(0x0000A1A100324536 AS DateTime), NULL, 1, NULL, 0, N'ABTJr1UVuPP+IdHqx74iir1evwdAVtA3QXaN9PKyGwOnp0PiRe6p0phKVW13Wsr9FA==', CAST(0x0000A1A100324536 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (162, CAST(0x0000A1A10032453C AS DateTime), NULL, 1, NULL, 0, N'ALCJ6CDB/JOLVRfLoRmj+F7SoI9Tb9Ga1ZLjRj3zYsm1QLai5n+JF9qG2WT/D006vA==', CAST(0x0000A1A10032453C AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (163, CAST(0x0000A1A100324544 AS DateTime), NULL, 1, NULL, 0, N'ACpFANYT62gc9bBakH/8U/O2FrJz7gGqpwRFl0++G+QnrNcL8vgTGGC7jtUDHCiToQ==', CAST(0x0000A1A100324544 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (164, CAST(0x0000A1A10032454C AS DateTime), NULL, 1, NULL, 0, N'ALpxv3YnqpfGVBwy6lBG0oiPgWoQHY3MKDbmDtrjlx20AgSUAAntfAtKLHycBrZuKA==', CAST(0x0000A1A10032454C AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (165, CAST(0x0000A1A100324552 AS DateTime), NULL, 1, NULL, 0, N'ACBgYgaMzxj8s1q6UmEwZ2ZG0WIf3JudLbBF7Q6QCe9yH/VU58/9lP9FWLObt2CvRw==', CAST(0x0000A1A100324552 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (166, CAST(0x0000A1A100324559 AS DateTime), NULL, 1, NULL, 0, N'AJCV8GVnv4R078TrEV750Epa+CiwkwokvMaAKBUODqHpd1keThsuPMO8q2HSo5aMcw==', CAST(0x0000A1A100324559 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (167, CAST(0x0000A1A100324561 AS DateTime), NULL, 1, NULL, 0, N'ADLjiyh/SSb+Ew24Qu7W0aVXVZ80BLdK78W1z362/WZ82oO+IwPPPLcoT0dddrSx3A==', CAST(0x0000A1A100324561 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (168, CAST(0x0000A1A100324569 AS DateTime), NULL, 1, NULL, 0, N'ABkMgFo3fgow7o3Ll7ZklEoslsXILIO3z1D1dHnSGoTkuKpJBtgCPAvV32e26HoGWA==', CAST(0x0000A1A100324569 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (169, CAST(0x0000A1A100324571 AS DateTime), NULL, 1, NULL, 0, N'AAgEkUKZ6CjkZH7hQnqoft5cQ/jEZLVZwh0e7KCZ2KNXwVe8lOr0XUaxRNC0+AFmDg==', CAST(0x0000A1A100324571 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (170, CAST(0x0000A1A10032457F AS DateTime), NULL, 1, NULL, 0, N'ACkzuZY7vlKb4jjichlmkxO57EHpYGc+yXh5dXcd2pwe3xSLx8uCQ3uAqqe6js2mYw==', CAST(0x0000A1A10032457F AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (171, CAST(0x0000A1A10032458C AS DateTime), NULL, 1, NULL, 0, N'ALTN2wSNx7q1ZZcEZhjWcnK33nhpP+OE4ufHS096FNKn192QvIiBDVx2OSH6S7XfDQ==', CAST(0x0000A1A10032458C AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (172, CAST(0x0000A1A100324593 AS DateTime), NULL, 1, NULL, 0, N'AKkK1WXtNIUmT1u5gUqAQAYuJ8QB8PbcAVVXkdVhTlJCCutbsxBOKx37TOyIk4ra0g==', CAST(0x0000A1A100324593 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (173, CAST(0x0000A1A10032459B AS DateTime), NULL, 1, NULL, 0, N'AM3NyKgXAXCIE08E7rURY6fMKeM1CKA0oNIrVut0B5ZWfiPLuOsY5ep+Ch6oPVIr0A==', CAST(0x0000A1A10032459B AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (174, CAST(0x0000A1A1003245A3 AS DateTime), NULL, 1, NULL, 0, N'AGIJxZ8WgqdRjbyim/GnZXRGocIJ5o3LCp/qJKKEJyWzVYs+bSR5SHcGQZougdv6Og==', CAST(0x0000A1A1003245A3 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (175, CAST(0x0000A1A1003245AA AS DateTime), NULL, 1, NULL, 0, N'ANsG0MkEzAr8XSEiIjzAIXmIbs8mih7QUpdJDTKNipWEyXT1uRxQIKOxwvOAK9hB4Q==', CAST(0x0000A1A1003245AA AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (176, CAST(0x0000A1A1003245B0 AS DateTime), NULL, 1, NULL, 0, N'ACqqHwKXx/IPGNlxmj95oh5AM8a+Y8e/sCmefWi6cVM3mtPGO1p6JQSnodgqbhzxaA==', CAST(0x0000A1A1003245B0 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (177, CAST(0x0000A1A1003245B7 AS DateTime), NULL, 1, NULL, 0, N'AEbBdL8CUDtjTt7zZEAP1J/Zc+Ts15W8bbjhj3ALilKENwQXlluf1dNujocM/Qy0bA==', CAST(0x0000A1A1003245B7 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (178, CAST(0x0000A1A1003245BD AS DateTime), NULL, 1, NULL, 0, N'ABnzoar7D27aG2r26PRmBSW/AoiC69j8oUyHOrr0nKIxaaAMYQwnbUpuReyv6dHDsg==', CAST(0x0000A1A1003245BD AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (179, CAST(0x0000A1A1003245D4 AS DateTime), NULL, 1, NULL, 0, N'AIsg+J3njQjsZ/eBoqitq3gi+yv2PD3thGUGiHMSrXBzRN1yqPkj0X1VKtI6WnFe9Q==', CAST(0x0000A1A1003245D4 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (180, CAST(0x0000A1A1003245DF AS DateTime), NULL, 1, NULL, 0, N'APtQfu7Bkfe0Yi5tTz/GWuDXTwrZmCijgz7WDufewnj8/Iy4Bp6Tcpj20D0hcUWKRw==', CAST(0x0000A1A1003245DF AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (181, CAST(0x0000A1A1003245E5 AS DateTime), NULL, 1, NULL, 0, N'AIBst7K257uqHBbUHiRBAvkTYVW2YWGefO7vIaG7NjpzBMU8xHUTn4NYijrlyBod4w==', CAST(0x0000A1A1003245E5 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (182, CAST(0x0000A1A1003245F5 AS DateTime), NULL, 1, NULL, 0, N'AJ5IJXlBkesG7JVZgJ7bNvFY1OPKBQhFfz62zePZfPv74+T5KO2wZz3pNU3Xu6051A==', CAST(0x0000A1A1003245F5 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (183, CAST(0x0000A1A1003245FC AS DateTime), NULL, 1, NULL, 0, N'AAz+ZX3g3smdeU9YPyqDEnyxbB5jKhB8weIRwgDypxt1Pf10BRjCh1q33wIY9XhTpA==', CAST(0x0000A1A1003245FC AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (184, CAST(0x0000A1A100324619 AS DateTime), NULL, 1, NULL, 0, N'ANuSP8x6BDOBc8OMJ2irEwAOhoJxuaQJblM/cPARa0RMgND8uJk8/VRBgFeRqu7h5Q==', CAST(0x0000A1A100324619 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (185, CAST(0x0000A1A100324622 AS DateTime), NULL, 1, NULL, 0, N'AGd2gYi26PB18zkIkVI6DdNjg5ZRTbqgTr1GnMJFCHfwkV7aJy8HvjXmxzLfrDPxPA==', CAST(0x0000A1A100324622 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (186, CAST(0x0000A1A100324629 AS DateTime), NULL, 1, NULL, 0, N'AC/wZievKKEiecNJ1Z/TwBHsM09PmW1IjGnc39r4/OleuVY8rOEdAZni6+L4Bjy41g==', CAST(0x0000A1A100324629 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (187, CAST(0x0000A1A10032462F AS DateTime), NULL, 1, NULL, 0, N'ABieBGvkn59qhU4olSUAfPTKEOoF3TrTvJX6N2oEeXB0urzaxKCFJrwgHXEz7giNmQ==', CAST(0x0000A1A10032462F AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (188, CAST(0x0000A1A100324636 AS DateTime), NULL, 1, NULL, 0, N'AB/P4VXL3E+cQQGfBmZWj4sEMfs8gxPLUu/ni/5ZuGk0/CYrmRIitFmGDddYJrn9UQ==', CAST(0x0000A1A100324636 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (189, CAST(0x0000A1A10032463D AS DateTime), NULL, 1, NULL, 0, N'AHlKClgIgVR4TjydCW225L39GvhDHI3L7rLGDFXhTVkVWrCjL9d0wkK4KQxIbd4iSQ==', CAST(0x0000A1A10032463D AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (190, CAST(0x0000A1A100324643 AS DateTime), NULL, 1, NULL, 0, N'ANccML7QcVzdgK57uB5lVgR95vIirEMWfvBA1dnj6bGphGQ3/MUIbwsq8uR5gBwcnA==', CAST(0x0000A1A100324643 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (191, CAST(0x0000A1A100324649 AS DateTime), NULL, 1, NULL, 0, N'AO9Lq21QBH5jkf7va5l1OMtFCy83bprKmOqA+tuTCJkT7KPg3kylG5Fwuz2Sz52rAg==', CAST(0x0000A1A100324649 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (192, CAST(0x0000A1A100324653 AS DateTime), NULL, 1, NULL, 0, N'AHHaacquMOyBrzrVKhvn9BdwMO1wcmUoGcYAbpvuf8YRyH0sW/Fd/Z7mRw8f9IrdpQ==', CAST(0x0000A1A100324653 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (193, CAST(0x0000A1A100324659 AS DateTime), NULL, 1, NULL, 0, N'APNNndGOIRwmRSgV6Wvhjf5M7gPbjVHc0Lbo0VkVz4fQQuWkSt4312j2BqTToPm/nQ==', CAST(0x0000A1A100324659 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (194, CAST(0x0000A1A100324660 AS DateTime), NULL, 1, NULL, 0, N'AJgzcd0kiJgma/5/De0jccPsGj8D5KW2WXn8+jj55IjbHV4JT9P4CsdGCLwXoNC2IQ==', CAST(0x0000A1A100324660 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (195, CAST(0x0000A1A100324666 AS DateTime), NULL, 1, NULL, 0, N'AG2k8lgqhX0vahutxUZEtZyurtWQvSR/SobL3wEZCCY427H+giJxckyjUGdHe3Ne/g==', CAST(0x0000A1A100324666 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (196, CAST(0x0000A1A10032466D AS DateTime), NULL, 1, NULL, 0, N'AKCz309apWq6PaxIHBsCjXb0/Bc2omiv4pj1YRKRPbtUrI7RBDZuo97Z83E5AgqH1Q==', CAST(0x0000A1A10032466D AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (197, CAST(0x0000A1A100324673 AS DateTime), NULL, 1, NULL, 0, N'AOqr8213T5DgWFlORIXoZXUSkwl+NCDDdxPCxuOaplWgQPxXsZEm4YYZ/HT2C5RKxg==', CAST(0x0000A1A100324673 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (198, CAST(0x0000A1A100324679 AS DateTime), NULL, 1, NULL, 0, N'AFupxW+FLKnmJM5NqE64p6nHq6GdJTPNRHhd97DkMsZvXL0v0Hqj8/qSlbIkpcKqNg==', CAST(0x0000A1A100324679 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (199, CAST(0x0000A1A100324680 AS DateTime), NULL, 1, NULL, 0, N'AO2ktTSwwitoO3afHq2Mid3kH5l2Zziwl3PGW4jEoUgQefZHdRJXpCI7mquFsc2Sjw==', CAST(0x0000A1A100324680 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (200, CAST(0x0000A1A100324686 AS DateTime), NULL, 1, NULL, 0, N'AP+WTn9HcNfdClqkQRYisknx402P8N9DMUPDBKjCzQFWg5DJflFLK5tSdp7rOy3foA==', CAST(0x0000A1A100324686 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (201, CAST(0x0000A1A10032468D AS DateTime), NULL, 1, NULL, 0, N'ABkg7BVDZ9Spyg6d+Dmw8cTxB65aVzeg4Ibyot81zmP0U53E5/F3mJJSq2pd91aQVA==', CAST(0x0000A1A10032468D AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (202, CAST(0x0000A1A100324694 AS DateTime), NULL, 1, NULL, 0, N'AGvCzfci0f1fI9uDyn0y8u9RKhX073w+P0SxXBRB7pzlF3HHbdOcYoT8CC86dsV+hQ==', CAST(0x0000A1A100324694 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (203, CAST(0x0000A1A10032469A AS DateTime), NULL, 1, NULL, 0, N'ANT+o3FDi/DoGknzJlGSvdxzMl1pY13j1JUxvUnp1mHGr7VpnB5zcjrRJ4lpzcPhGw==', CAST(0x0000A1A10032469A AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (204, CAST(0x0000A1A1003246A0 AS DateTime), NULL, 1, NULL, 0, N'APMJE0+rBwVHHEDN/U4AgZtLFOM0/FBX8dcEpAWOE0wvln7ezqsACZ0+chUpY04ZZw==', CAST(0x0000A1A1003246A0 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (205, CAST(0x0000A1A1003246A7 AS DateTime), NULL, 1, NULL, 0, N'AKDVowyFZ0+NAUllnTj/CKzm7O4vw9Ar+G9k/d1u7B7XQGUtCwyrG6+AwCGuYl5YUQ==', CAST(0x0000A1A1003246A7 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (206, CAST(0x0000A1A1003246AE AS DateTime), NULL, 1, NULL, 0, N'AKFrJpub7tgksXNUkgyqmhruij92iQfYH2svOWszVhmfCMHq1nrn6fGET9Eh+Ku4rA==', CAST(0x0000A1A1003246AE AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (207, CAST(0x0000A1A1003246B5 AS DateTime), NULL, 1, NULL, 0, N'AIcVIgnWIMoKyTRQvJ7+pZNEM6NFYySui6gB2FfmAuhSysLnUpTIni4Vo7gaxUtgZQ==', CAST(0x0000A1A1003246B5 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (208, CAST(0x0000A1A1003246BC AS DateTime), NULL, 1, NULL, 0, N'AFOOh3/OUgDdZ9CgH49lCn/8JRoWHidZR7F1pLCSuYQrdLrbuDG/dtImFdOOxePYvw==', CAST(0x0000A1A1003246BC AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (209, CAST(0x0000A1A1003246C2 AS DateTime), NULL, 1, NULL, 0, N'AB/gQ90MAoLWwztHwGTk8QbrHA9dRkz/+9cBGX5PbSwblDZ9smSp2GXfU3DYjxQ1Mw==', CAST(0x0000A1A1003246C2 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (210, CAST(0x0000A1A1003246C9 AS DateTime), NULL, 1, NULL, 0, N'AGf81kkLSh5Z6FxnZmV5+wojXEXxDsEPvU5+ReG0LIj0hJhgtyhwcnTvOLrJQHuFcQ==', CAST(0x0000A1A1003246C9 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (211, CAST(0x0000A1A1003246E6 AS DateTime), NULL, 1, NULL, 0, N'AF5fE+v2rK/nqN1Zt/c2dfsR+LE31Vpt8CX7kIzLTGM8tx0HI6rWBo/NRKGcwd2iSA==', CAST(0x0000A1A1003246E6 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (212, CAST(0x0000A1A1003246F4 AS DateTime), NULL, 1, NULL, 0, N'ANS2INX8gD7/IJgtnXtpMQq/D93ubAs8eEE126mR7XBMlny/5nPpV1s1Kf9T/sVzEw==', CAST(0x0000A1A1003246F4 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (213, CAST(0x0000A1A1003246FC AS DateTime), NULL, 1, NULL, 0, N'AKtdCnkuVVvCQlKEiwuJR1P0Ib2imd3BOYEYYCuRWsWcQkLw6a1MQUWPPOsiuUhKkQ==', CAST(0x0000A1A1003246FC AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (214, CAST(0x0000A1A100324703 AS DateTime), NULL, 1, NULL, 0, N'AHV4J7th8lPIDbRbZ7GyjP8r7T0UCyQVWLzypWertUWcSPdlPB9YHSH70DCTCSEU6w==', CAST(0x0000A1A100324703 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (215, CAST(0x0000A1A10032470A AS DateTime), NULL, 1, NULL, 0, N'ANof9qoofHk9EAphqA9cOt/bwIvC7pLILcMeQ1NGhOosHsSYRq7sXDERqBIwX2u3jg==', CAST(0x0000A1A10032470A AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (216, CAST(0x0000A1A100324711 AS DateTime), NULL, 1, NULL, 0, N'ABk7F0RLNKOsmqv4rPk+WbKS3rFvDmzd0+k8mw+MjmSWsWp3Ny8CX0hoT9oAKTcRGw==', CAST(0x0000A1A100324711 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (217, CAST(0x0000A1A100324718 AS DateTime), NULL, 1, NULL, 0, N'AAMIAmBMtnUlA/JIkfcuB71AoLd5i0SgTr26hDeUbSTGyFr3/PYbIuhVg/MuP8/cnA==', CAST(0x0000A1A100324718 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (218, CAST(0x0000A1A10032471E AS DateTime), NULL, 1, NULL, 0, N'ACFe1jWvl7jdqrD/oh66IjPniteOWEMn8lvHAIZNJNpWURp4gjZSCL9mt5gRydTJ9g==', CAST(0x0000A1A10032471E AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (219, CAST(0x0000A1A100324725 AS DateTime), NULL, 1, NULL, 0, N'AEN+7QuAxaM41Kc6Sa0lUcWZqziqwTmYqfCeR+0r9YxaqZKdfNLj2XZC4Wj/hFi8lA==', CAST(0x0000A1A100324725 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (220, CAST(0x0000A1A10032472C AS DateTime), NULL, 1, NULL, 0, N'AI5MGH74tRqF6xK1IuguC+Q7lssLTUa7SYA7w/z69Wh/PGwp06nuHmH2K8oZIgepGA==', CAST(0x0000A1A10032472C AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (221, CAST(0x0000A1A100324733 AS DateTime), NULL, 1, NULL, 0, N'AD1HulFAVSaQZ0TQSuOjJXVnTwla/Ifr4c2XRs6keuYxnhxLr/51Kp+4shlFUI0gAA==', CAST(0x0000A1A100324733 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (222, CAST(0x0000A1A100324739 AS DateTime), NULL, 1, NULL, 0, N'AMy6GGXJIm2/SEbHPtdHkriYE1+p2/FB9NplcY+0dlGXAp+08o+E51XyBAVx50ByAA==', CAST(0x0000A1A100324739 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (223, CAST(0x0000A1A100324740 AS DateTime), NULL, 1, NULL, 0, N'AJUZJi39VB1KlFRC5p/tFwE7mkjUQajWGMZWwIsKVkyGIuLhz4jUnwg+ukg5L+93mg==', CAST(0x0000A1A100324740 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (224, CAST(0x0000A1A100324747 AS DateTime), NULL, 1, NULL, 0, N'AOZvWhS3QXiWt5hEYwnRI7MxSxta4nRmtBhQ4AmYK9uIB5eCzPj8jqky96H4Txd78w==', CAST(0x0000A1A100324747 AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (225, CAST(0x0000A1A10032474E AS DateTime), NULL, 1, NULL, 0, N'ABCQelkfGiTQYFVmg60vwKDXXQVULEOCVcOtwi836y1AbFQ5qizXYLB3oN3N4TxRYg==', CAST(0x0000A1A10032474E AS DateTime), N'', NULL, NULL)
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (226, CAST(0x0000A1A100324755 AS DateTime), NULL, 1, NULL, 0, N'AIfLoZfaBEOO0TpnnXsiGNijma/2BNDOdrskd1YHhSNjbpC9LOlUb14sG2CbSI24Vw==', CAST(0x0000A1A100324755 AS DateTime), N'', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'Aster')
GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (6, N'EAP')
GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (4, N'Gerente Acceso')
GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (7, N'Gerente Cial y Prom.Md.')
GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (8, N'Gerente de Etto')
GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (12, N'Gerente de Línea')
GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (3, N'Gerente Regional')
GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (5, N'Gerente ST')
GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (9, N'Key Account Manager')
GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (10, N'Líder Comercial')
GO
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (11, N'Líder Comercial  (CAD.)')
GO
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (10, 1)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (119, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (120, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (121, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (122, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (123, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (124, 4)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (125, 3)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (126, 5)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (127, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (128, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (129, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (130, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (131, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (132, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (133, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (134, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (135, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (136, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (137, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (138, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (139, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (140, 3)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (141, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (142, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (143, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (144, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (145, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (146, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (147, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (148, 3)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (149, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (150, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (151, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (152, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (153, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (154, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (155, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (156, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (157, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (158, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (159, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (160, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (161, 6)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (162, 7)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (163, 8)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (164, 3)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (165, 3)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (166, 9)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (167, 9)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (168, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (169, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (170, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (171, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (172, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (173, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (174, 11)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (175, 11)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (176, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (177, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (178, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (179, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (180, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (181, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (182, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (183, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (184, 10)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (185, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (186, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (187, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (188, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (189, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (190, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (191, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (192, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (193, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (194, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (195, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (196, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (197, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (198, 12)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (199, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (200, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (201, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (202, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (203, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (204, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (205, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (206, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (207, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (208, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (209, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (210, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (211, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (212, 12)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (213, 3)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (214, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (215, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (216, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (217, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (218, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (219, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (220, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (221, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (222, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (223, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (224, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (225, 2)
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (226, 12)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B616044B385A4]    Script Date: 03/07/2013 09:42:26 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[webpages_Roles]') AND name = N'UQ__webpages__8A2B616044B385A4')
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__webpages___IsCon__3E52440B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__webpages___Passw__3F466844]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Farmacia_Proveedor_Farmacia1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Farmacia_Proveedor]'))
ALTER TABLE [dbo].[Farmacia_Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Farmacia_Proveedor_Farmacia1] FOREIGN KEY([IdFarmacia])
REFERENCES [dbo].[Farmacia] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Farmacia_Proveedor_Farmacia1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Farmacia_Proveedor]'))
ALTER TABLE [dbo].[Farmacia_Proveedor] CHECK CONSTRAINT [FK_Farmacia_Proveedor_Farmacia1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Farmacia_Proveedor_Proveedor1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Farmacia_Proveedor]'))
ALTER TABLE [dbo].[Farmacia_Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Farmacia_Proveedor_Proveedor1] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Farmacia_Proveedor_Proveedor1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Farmacia_Proveedor]'))
ALTER TABLE [dbo].[Farmacia_Proveedor] CHECK CONSTRAINT [FK_Farmacia_Proveedor_Proveedor1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Llamada_Farmacia_Farmacia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Llamada]'))
ALTER TABLE [dbo].[Llamada]  WITH CHECK ADD  CONSTRAINT [FK_Llamada_Farmacia_Farmacia] FOREIGN KEY([IdFarmacia])
REFERENCES [dbo].[Farmacia] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Llamada_Farmacia_Farmacia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Llamada]'))
ALTER TABLE [dbo].[Llamada] CHECK CONSTRAINT [FK_Llamada_Farmacia_Farmacia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Llamada_Farmacia_Pedido]') AND parent_object_id = OBJECT_ID(N'[dbo].[Llamada]'))
ALTER TABLE [dbo].[Llamada]  WITH CHECK ADD  CONSTRAINT [FK_Llamada_Farmacia_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Llamada_Farmacia_Pedido]') AND parent_object_id = OBJECT_ID(N'[dbo].[Llamada]'))
ALTER TABLE [dbo].[Llamada] CHECK CONSTRAINT [FK_Llamada_Farmacia_Pedido]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pedido_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedido]'))
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Proveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pedido_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedido]'))
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Proveedor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoLinea_Linea]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductoLinea]'))
ALTER TABLE [dbo].[ProductoLinea]  WITH CHECK ADD  CONSTRAINT [FK_ProductoLinea_Linea] FOREIGN KEY([IdLinea])
REFERENCES [dbo].[Linea] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoLinea_Linea]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductoLinea]'))
ALTER TABLE [dbo].[ProductoLinea] CHECK CONSTRAINT [FK_ProductoLinea_Linea]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoLinea_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductoLinea]'))
ALTER TABLE [dbo].[ProductoLinea]  WITH CHECK ADD  CONSTRAINT [FK_ProductoLinea_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductoLinea_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductoLinea]'))
ALTER TABLE [dbo].[ProductoLinea] CHECK CONSTRAINT [FK_ProductoLinea_Producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserProfile_Linea]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserProfile]'))
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Linea] FOREIGN KEY([IdLinea])
REFERENCES [dbo].[Linea] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserProfile_Linea]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserProfile]'))
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Linea]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
