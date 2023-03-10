Nombre: Carlos Jose Soto 21-MIIN-1-007 Seccion:0541 
/****** Object:  Database [WorldFitness]    Script Date: 21/12/2022 8:12:13 a. m. Carlos jose Soto 21-MIIN-1-007 ******/
CREATE DATABASE [WorldFitness]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorldFitness', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WorldFitness.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WorldFitness_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WorldFitness_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WorldFitness] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorldFitness].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorldFitness] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorldFitness] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorldFitness] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorldFitness] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorldFitness] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorldFitness] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorldFitness] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorldFitness] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorldFitness] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorldFitness] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorldFitness] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorldFitness] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorldFitness] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorldFitness] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorldFitness] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorldFitness] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorldFitness] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorldFitness] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorldFitness] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorldFitness] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorldFitness] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorldFitness] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorldFitness] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WorldFitness] SET  MULTI_USER 
GO
ALTER DATABASE [WorldFitness] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorldFitness] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorldFitness] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorldFitness] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WorldFitness] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WorldFitness] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WorldFitness] SET QUERY_STORE = OFF
GO
USE [WorldFitness]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planes](
	[PlanesWorlFitnessID] [int] IDENTITY(1,1) NOT NULL,
	[Tipodeplan] [varchar](50) not NULL,
	[Costo] [int] not NULL,
    [Fecha_creacion] [datetime] NULL,
	[Usuario_creacion] [varchar](150) NULL,
 CONSTRAINT [PK_Planes] PRIMARY KEY CLUSTERED 
(
	[PlanesWorlFitnessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 21/12/2022 8:12:13 a. m. ******/
/****** Object:  Table [dbo].[Cliente]    Script Date: 21/12/2022 8:12:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) not NULL,
	[Sexo] [char](10) NULL,
	[PlanesWorlFitnessID] [int] not NULL,
	[Email] [varchar](150) NULL,
	[edad] [int] NULL,
    [Fecha_creacion] [datetime] NULL,
	[Usuario_creacion] [varchar](150) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[FacturaID] [int] IDENTITY(1,1) NOT NULL,
	[NCF] [varchar](10) not NULL,
	[Fecha] [datetime] not NULL,
	[ClienteID] [int] not NULL,
	[PersonalID] [int] NULL,
	[Total] [float] NULL,
	[Termino_pago] [varchar](10) NULL,
	[Fecha_creacion] [datetime] NULL,
	[Usuario_creacion] [varchar](150) NULL,
	[Estado_factura] [varchar](20) NULL,
	[Estado_registro] [varchar](20) NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[FacturaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura detalle]    Script Date: 21/12/2022 8:12:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura_detalle](
	[Factura_detalle] [int] IDENTITY(1,1) NOT NULL,
	[Secuencia] [int] not NULL,
	[ProductosID] [int] not NULL,
	[FacturaID] [int] not NULL,
	[Cantidad] [int] not NULL,
	[Precio] [float] not NULL,
	[ITBIS] [float] not NULL,
	[Subtotal] [float] not NULL,
	[Fecha_creacion] [datetime] NULL,
	[Usuario_creacion] [varchar](10) NULL,
 CONSTRAINT [PK_Factura detalle] PRIMARY KEY CLUSTERED 
(
	[Factura_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Membresia]    Script Date: 21/12/2022 8:12:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Membresia](
	[MembresiaID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NULL,
	[PlanesWolfitnessID] [int] NULL,
	[Costo] [varchar](10) NULL,
	[Fecha_membresia] [datetime] NULL,
	[Fecha_renovacion] [datetime] NULL,
	[Fecha_creacion] [datetime] NULL,
	[Usuario_creacion] [varchar](10) NULL,
	[Estado_membresia] [varchar](20) NULL,
 CONSTRAINT [PK_Membresia] PRIMARY KEY CLUSTERED 
(
	[MembresiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 21/12/2022 8:12:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[PersonalID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_completo] [varchar](150) not NULL,
	[Sexo] [char](10) NULL,
	[Fecha_ingreso] [datetime] not NULL,
	[Fecha_creacion] [datetime] not NULL,
	[Tipo_personalID] [int] not NULL,
	[Usuario_creacion] [varchar](100) NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[PersonalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planes]    Script Date: 21/12/2022 8:12:13 a. m. ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ProductosID] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_barra] [varchar](50) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](250) NULL,
	[Precio] [float] NOT NULL,
	[Costo] [float] NOT NULL,
	[Existencia] [int] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[Fecha_creacion] [datetime] NOT NULL,
	[Usuario_creacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[ProductosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibo_cobro](
	[Recibo_cobro] [int] NOT NULL,
	[ReciboID] [varchar](10) NOT NULL,
	[ClienteID] [int] NOT NULL,
	[FacturaID] [int] NOT NULL,
	[PersonalID] [int] NOT NULL,
	[Concepto] [varchar](250) NOT NULL,
	[Monto] [varchar](10) NOT NULL,
	[Fecha_creacion] [datetime] NOT NULL,
	[Usuario_creacion] [varchar](150) NOT NULL,
	[Estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Recibo cobro] PRIMARY KEY CLUSTERED 
(
	[Recibo_cobro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recibo cobro membresia]    Script Date: 21/12/2022 8:12:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibo_cobro_membresia](
	[Recibo_cobro_membresiaID] [int] NOT NULL,	
	[ClienteID] [int] NOT NULL,
	[MembresiaID] [int] NOT NULL,
	[PersonalID] [int] NOT NULL,
	[Concepto] [varchar](100) NOT NULL,
	[Monto] [varchar](10) NOT NULL,
	[Fecha_creacion] [datetime] NOT NULL,
	[Usuraio_creacion] [varchar](10) NOT NULL,
	[Estado] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Recibo cobro membresia] PRIMARY KEY CLUSTERED 
(
	[Recibo_cobro_membresiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarifa entrenador]    Script Date: 21/12/2022 8:12:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifa_entrenador](
	[Tarifa_entrenadorID] [int] IDENTITY(1,1) NOT NULL,
	[PersonalID] [int] NOT NULL,
	[Fecha_creacion] [datetime] NOT NULL,
	[Usuario_creacion] [varchar](10) NOT NULL,
	[Estado] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Tarifa entrenador] PRIMARY KEY CLUSTERED 
(
	[Tarifa_entrenadorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo personal]    Script Date: 21/12/2022 8:12:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_personal](
	[Tipo_personalID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Tipo_personal] PRIMARY KEY CLUSTERED 
(
	[Tipo_personalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Planes] FOREIGN KEY([PlanesWorlFitnessID])
REFERENCES [dbo].[Planes] ([PlanesWorlFitnessID])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Planes]
GO
USE [master]
GO
ALTER DATABASE [WorldFitness] SET  READ_WRITE 
GO
