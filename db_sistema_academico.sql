USE [master]
GO
/****** Object:  Database [db_sistema_academico]    Script Date: 7/09/2023 7:33:02 p. m. ******/
CREATE DATABASE [db_sistema_academico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_sistema_academico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\db_sistema_academico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_sistema_academico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\db_sistema_academico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_sistema_academico] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_sistema_academico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_sistema_academico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_sistema_academico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_sistema_academico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_sistema_academico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_sistema_academico] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_sistema_academico] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_sistema_academico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_sistema_academico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_sistema_academico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_sistema_academico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_sistema_academico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_sistema_academico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_sistema_academico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_sistema_academico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_sistema_academico] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_sistema_academico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_sistema_academico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_sistema_academico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_sistema_academico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_sistema_academico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_sistema_academico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_sistema_academico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_sistema_academico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_sistema_academico] SET  MULTI_USER 
GO
ALTER DATABASE [db_sistema_academico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_sistema_academico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_sistema_academico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_sistema_academico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_sistema_academico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_sistema_academico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_sistema_academico] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_sistema_academico] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_sistema_academico]
GO
/****** Object:  Table [dbo].[tbl_calificaciones]    Script Date: 7/09/2023 7:33:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_calificaciones](
	[pkitem] [bigint] IDENTITY(1,1) NOT NULL,
	[fkitem_tbl_det_matriculas] [bigint] NOT NULL,
	[fecha] [date] NOT NULL,
	[nota] [float] NOT NULL,
	[concepto] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[pkitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cursos]    Script Date: 7/09/2023 7:33:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cursos](
	[pkcodigo] [varchar](10) NOT NULL,
	[curso] [varchar](50) NOT NULL,
	[creditos] [int] NOT NULL,
	[fkcodigo_tbl_estado] [int] NOT NULL,
	[valor] [float] NOT NULL,
	[contenidos] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_det_matriculas]    Script Date: 7/09/2023 7:33:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_det_matriculas](
	[pkitem] [bigint] IDENTITY(1,1) NOT NULL,
	[fkn_matricula_tbl_matriculas] [bigint] NOT NULL,
	[fkcodigo_tbl_cursos] [varchar](10) NOT NULL,
	[valor] [float] NOT NULL,
	[fkcodigo_tbl_estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pkitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estado]    Script Date: 7/09/2023 7:33:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estado](
	[pkcodigo] [int] NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[nomenclatura] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estrato]    Script Date: 7/09/2023 7:33:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estrato](
	[pkcodigo] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[nomenclatura] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estudiantes]    Script Date: 7/09/2023 7:33:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estudiantes](
	[pkid] [varchar](10) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[contacto] [varchar](10) NOT NULL,
	[correo] [varchar](80) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[acudiente] [varchar](100) NOT NULL,
	[fkcodigo_tbl_estrato] [int] NOT NULL,
	[fkcodigo_tbl_sexo] [int] NOT NULL,
	[observaciones] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[pkid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_matriculas]    Script Date: 7/09/2023 7:33:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_matriculas](
	[pkn_matricula] [bigint] IDENTITY(1,1) NOT NULL,
	[fkid_tbl_estudiantes] [varchar](10) NOT NULL,
	[fecha] [date] NOT NULL,
	[subtotal] [float] NOT NULL,
	[iva] [float] NOT NULL,
	[total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pkn_matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sexo]    Script Date: 7/09/2023 7:33:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sexo](
	[pkcodigo] [int] NOT NULL,
	[genero] [varchar](50) NOT NULL,
	[nomenclatura] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pkcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_calificaciones_tbl_det_matriculas] FOREIGN KEY([fkitem_tbl_det_matriculas])
REFERENCES [dbo].[tbl_det_matriculas] ([pkitem])
GO
ALTER TABLE [dbo].[tbl_calificaciones] CHECK CONSTRAINT [FK_tbl_calificaciones_tbl_det_matriculas]
GO
ALTER TABLE [dbo].[tbl_cursos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_cursos_tbl_estado] FOREIGN KEY([fkcodigo_tbl_estado])
REFERENCES [dbo].[tbl_estado] ([pkcodigo])
GO
ALTER TABLE [dbo].[tbl_cursos] CHECK CONSTRAINT [FK_tbl_cursos_tbl_estado]
GO
ALTER TABLE [dbo].[tbl_det_matriculas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_matriculas_tbl_cursos] FOREIGN KEY([fkcodigo_tbl_cursos])
REFERENCES [dbo].[tbl_cursos] ([pkcodigo])
GO
ALTER TABLE [dbo].[tbl_det_matriculas] CHECK CONSTRAINT [FK_tbl_det_matriculas_tbl_cursos]
GO
ALTER TABLE [dbo].[tbl_det_matriculas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_matriculas_tbl_estado] FOREIGN KEY([fkcodigo_tbl_estado])
REFERENCES [dbo].[tbl_estado] ([pkcodigo])
GO
ALTER TABLE [dbo].[tbl_det_matriculas] CHECK CONSTRAINT [FK_tbl_det_matriculas_tbl_estado]
GO
ALTER TABLE [dbo].[tbl_det_matriculas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_matriculas_tbl_matriculas] FOREIGN KEY([fkn_matricula_tbl_matriculas])
REFERENCES [dbo].[tbl_matriculas] ([pkn_matricula])
GO
ALTER TABLE [dbo].[tbl_det_matriculas] CHECK CONSTRAINT [FK_tbl_det_matriculas_tbl_matriculas]
GO
ALTER TABLE [dbo].[tbl_estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_estudiantes_tbl_estrato] FOREIGN KEY([fkcodigo_tbl_estrato])
REFERENCES [dbo].[tbl_estrato] ([pkcodigo])
GO
ALTER TABLE [dbo].[tbl_estudiantes] CHECK CONSTRAINT [FK_tbl_estudiantes_tbl_estrato]
GO
ALTER TABLE [dbo].[tbl_estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_estudiantes_tbl_sexo] FOREIGN KEY([fkcodigo_tbl_sexo])
REFERENCES [dbo].[tbl_sexo] ([pkcodigo])
GO
ALTER TABLE [dbo].[tbl_estudiantes] CHECK CONSTRAINT [FK_tbl_estudiantes_tbl_sexo]
GO
ALTER TABLE [dbo].[tbl_matriculas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_matriculas_tbl_estudiantes] FOREIGN KEY([fkid_tbl_estudiantes])
REFERENCES [dbo].[tbl_estudiantes] ([pkid])
GO
ALTER TABLE [dbo].[tbl_matriculas] CHECK CONSTRAINT [FK_tbl_matriculas_tbl_estudiantes]
GO
USE [master]
GO
ALTER DATABASE [db_sistema_academico] SET  READ_WRITE 
GO
