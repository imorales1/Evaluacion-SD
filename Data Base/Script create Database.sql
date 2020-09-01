
USE [master]
GO

IF EXISTS(SELECT 1 FROM SYS.databases WHERE  name = N'DbEvaluacion')
DROP database DbEvaluacion
GO

/****** Object:  Database [DbEvaluacion]    Script Date: 31/08/2020 17:13:48 ******/
CREATE DATABASE [DbEvaluacion] ON  PRIMARY 
( NAME = N'DbEvaluacion', FILENAME = N'C:\Data\DbEvaluacion.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DbEvaluacion_log', FILENAME = N'C:\Data\DbEvaluacion_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbEvaluacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [DbEvaluacion] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [DbEvaluacion] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [DbEvaluacion] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [DbEvaluacion] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [DbEvaluacion] SET ARITHABORT OFF 
GO

ALTER DATABASE [DbEvaluacion] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [DbEvaluacion] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [DbEvaluacion] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [DbEvaluacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [DbEvaluacion] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [DbEvaluacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [DbEvaluacion] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [DbEvaluacion] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [DbEvaluacion] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [DbEvaluacion] SET  DISABLE_BROKER 
GO

ALTER DATABASE [DbEvaluacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [DbEvaluacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [DbEvaluacion] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [DbEvaluacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [DbEvaluacion] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [DbEvaluacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [DbEvaluacion] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [DbEvaluacion] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [DbEvaluacion] SET  MULTI_USER 
GO

ALTER DATABASE [DbEvaluacion] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [DbEvaluacion] SET DB_CHAINING OFF 
GO

ALTER DATABASE [DbEvaluacion] SET  READ_WRITE 
GO



USE [DbEvaluacion]
GO
/****** Object:  Table [dbo].[TblEmpresas]    Script Date: 31/08/2020 17:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM SYS.tables WHERE  object_id = OBJECT_ID(N'TblPuestos',N'U'))
DROP TABLE TblPuestos
GO

IF EXISTS(SELECT 1 FROM SYS.tables WHERE  object_id = OBJECT_ID(N'TblEmpresas',N'U'))
DROP TABLE TblEmpresas
GO


CREATE TABLE [dbo].[TblEmpresas](
	[EmpresaID] [int] IDENTITY(1,1) NOT NULL,
	[EmpresaCodigo] [char](2) NOT NULL,
	[Nombre] [varchar](70) NOT NULL,
	[CorreoElectronico] [varchar](50) NULL,
	[Telefono] [char](15) NULL,
 CONSTRAINT [PK_TblEmpresas] PRIMARY KEY CLUSTERED 
(
	[EmpresaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPuestos]    Script Date: 31/08/2020 17:07:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPuestos](
	[EmpresaID] [int] NULL,
	[PuestoID] [int] IDENTITY(1,1) NOT NULL,
	[PuestoCodigo] [char](3) NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaDeBaja] [smalldatetime] NULL,
 CONSTRAINT [PK__TblPuest__FD80EE6E0425A276] PRIMARY KEY CLUSTERED 
(
	[PuestoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


SET IDENTITY_INSERT [dbo].[TblEmpresas] ON 
GO
INSERT [dbo].[TblEmpresas] ([EmpresaID], [EmpresaCodigo], [Nombre], [CorreoElectronico], [Telefono]) VALUES (1, N'01', N'Empresa De Evaluacioenes', N'info@evaluaciones.com', N'78201600       ')
GO
INSERT [dbo].[TblEmpresas] ([EmpresaID], [EmpresaCodigo], [Nombre], [CorreoElectronico], [Telefono]) VALUES (2, N'02', N'Empresa San Diego', N'info@sandiego.com', N'78201600       ')
GO
SET IDENTITY_INSERT [dbo].[TblEmpresas] OFF
GO
SET IDENTITY_INSERT [dbo].[TblPuestos] ON 
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 1, N'001', N'Operador De Alzadora', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 2, N'002', N'Apuntador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 3, N'003', N'Op. Tractor Movimiento Interno', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 4, N'004', N'Enganchador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 5, N'005', N'Ayudante De Apuntador', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 6, N'006', N'Recolector De Caña', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 7, N'007', N'Supervisor De Corte', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 8, N'008', N'Caporal Corte De Caña', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 9, N'009', N'Supervisor De Alce', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 10, N'00E', N'Mecanico Especialista', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 11, N'010', N'Tractorista De Ruta', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 12, N'011', N'Supervisor De Campo', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 13, N'012', N'Cortador De Caña', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 14, N'013', N'Coordinador de Transporte', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 15, N'014', N'Supervisor De Transporte Ruta y Red Vial', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 16, N'015', N'Coordinador Taller Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 17, N'016', N'Encargada de Registros', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 18, N'017', N'Despuntador De Caña (Jaulas)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 19, N'018', N'Caporal Enganchador', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 20, N'019', N'Muestreador', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 21, N'020', N'Encargado De Vivero Forestal', CAST(N'2014-11-30T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 22, N'021', N'Cadenero De Frente', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 23, N'022', N'Peon de Limpieza', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 24, N'023', N'Operador de Virador 1 Grua Radial', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 25, N'024', N'Encargado (a) de Limpieza B', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 26, N'025', N'Chequeador De Frente 20', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 27, N'026', N'Coordinador de Ingeniería Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 28, N'027', N'Gerente de Operaciones Agrícolas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 29, N'028', N'Encalador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 30, N'029', N'Banderillero', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 31, N'030', N'Evaluador Agrícola I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 32, N'031', N'Lavador de Maquinaria', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 33, N'032', N'Programador Senior', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 34, N'033', N'Supervisor de Riego Producción Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 35, N'034', N'Jefe de Departamento Forestal', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 36, N'035', N'Supervisor Forestal', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 37, N'036', N'Operador de Chipiadora', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 38, N'037', N'Albañil - Fontanero', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 39, N'038', N'Ayudante de Montaje', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 40, N'039', N'Gestor de Sistemas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 41, N'040', N'Auxiliar de Planificación y Control Campo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 42, N'041', N'Coordinador de Evaluaciones Técnicas Agrícolas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 43, N'042', N'Ayudante de Tornero', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 44, N'043', N'Tornero Especializado I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 45, N'044', N'Soldador Especializado II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 46, N'045', N'Instrumentista Especializado II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 47, N'046', N'Rematador I', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 48, N'047', N'Caporal de Chipiadora', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 49, N'048', N'Asistente de Ingeniería Agrícola', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 50, N'049', N'Asistente "B" Depto. Ingeniería Agrícola', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 51, N'050', N'Operador Hidrolavadora', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 52, N'051', N'Operador Tanques de Miel', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 53, N'052', N'Operador Secado y Enfriado', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 54, N'053', N'Auxiliar Bodega de Azúcar Crudo', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 55, N'054', N'Ayudante de Limpieza', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 56, N'055', N'Auxiliar de Documentación de Procesos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 57, N'056', N'Asistente de Selección y Contratación Campo', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 58, N'057', N'Jefe de Electricistas', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 59, N'058', N'Jefe de Clarificación', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 60, N'059', N'Asistente de Maquinaria', CAST(N'2015-10-28T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 61, N'060', N'Asistente de Automatización', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 62, N'061', N'Auxiliar de Operador de Tachos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 63, N'062', N'Caporal de Bodega de Producto Terminado', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 64, N'063', N'Operador de Pachaquil', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 65, N'064', N'Operador Conductores de Bagazo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 66, N'065', N'Operador Desfibradora / Homogenizador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 67, N'066', N'Operador Core Sampler', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 68, N'067', N'Gerente Técnico', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 69, N'068', N'Supervisor B de Maquinaria', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 70, N'069', N'Operador de Motores de Molinos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 71, N'070', N'Peón Temporal de Labores Agrícolas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 72, N'071', N'Jefe de Programación', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 73, N'072', N'Supervisor Turno Cristalización', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 74, N'073', N'Operador Bombas de Inyección', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 75, N'074', N'Coordinador de Automatización', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 76, N'075', N'Operador de Maquinaria', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 77, N'076', N'Supervisor de Mecánica', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 78, N'077', N'Operador de Estación de Cal', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 79, N'078', N'Operador de Cristalizadores Vertical', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 80, N'079', N'Instrumentista III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 81, N'080', N'Ayudante de Albañil', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 82, N'081', N'Operador Torre de Enfriamiento', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 83, N'082', N'Soldador Especializado III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 84, N'083', N'Analista Especial', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 85, N'084', N'Rastreador Proceso Industrial', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 86, N'085', N'Operador de Planta Desmineralizadora', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 87, N'086', N'Analista de Azúcar', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 88, N'087', N'Auxiliar de Oficina', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 89, N'088', N'Supervisor de Mantenimiento de Instalaciones', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 90, N'089', N'Asistente de Superintendencia de Talleres', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 91, N'090', N'Supervisor de Auditoría Agrícola I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 92, N'091', N'Supervisor de Auditoría Agrícola II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 93, N'092', N'Topógrafo I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 94, N'093', N'Superintendente de Planificación y Control Agrícol', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 95, N'094', N'Ingeniero Laboratorio de Cristalografía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 96, N'095', N'Ayudante de Evaluador Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 97, N'096', N'Supervisor Centro de Control Taller', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 98, N'097', N'Dibujante Calculista', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 99, N'098', N'Trainee Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 100, N'099', N'Jardinero', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 101, N'0AT', N'Ayudante Técnico', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 102, N'100', N'Empleada Casa Patronal', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 103, N'101', N'Superintendente Fábrica de Azúcar', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 104, N'102', N'Asistente De Superintendencia Generación', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 105, N'103', N'Jefe De Turno', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 106, N'104', N'Coordinador de Laboratorios', CAST(N'2016-08-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 107, N'105', N'Jefe De Mecanicos', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 108, N'106', N'Coordinador de Producto Terminado', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 109, N'107', N'Supervisor de Mantenimiento Eléctrico', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 110, N'108', N'Operador Bacula (toledo)', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 111, N'109', N'Auxiliar de Báscula', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 112, N'110', N'Ayudante I', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 113, N'111', N'Ayudante II', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 114, N'112', N'Magmero', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 115, N'113', N'Operador de Cristalizadores', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 116, N'114', N'Albañil I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 128, N'126', N'Operador Filtros De Cachaza', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 129, N'127', N'Analista de Agua de Calderas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 130, N'128', N'Analista de Fábrica', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 131, N'129', N'Analista de Caña', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 132, N'130', N'Bodeguero de Herramientas', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 133, N'131', N'Operador Mesas De Caña', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 134, N'132', N'Operador de Molinos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 135, N'133', N'Caporal de Envasado', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 136, N'134', N'Jefe de Laboratorio', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 137, N'135', N'Operador de Centrífugas B o C', CAST(N'2014-11-30T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 138, N'136', N'Auxiliar de Caporal de Molinos', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 139, N'137', N'Mecánico III T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 140, N'138', N'Rematador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 141, N'139', N'Tornero III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 142, N'140', N'Caporal De Patio', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 143, N'141', N'Operador de Tachos II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 144, N'142', N'Operador de Centrífugas II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 145, N'143', N'Instrumentista II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 146, N'144', N'Analista Especial Caña', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 147, N'145', N'Operador De Calderas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 148, N'146', N'Supervisor de BPM', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 149, N'147', N'Electricista II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 150, N'148', N'Albañil III', CAST(N'2017-09-30T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 151, N'149', N'Electricista I o De Turno', CAST(N'2014-01-15T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 152, N'150', N'Operador de Tachos I', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 153, N'151', N'Tornero II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 154, N'152', N'Operador de Virador 2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 155, N'153', N'Mecánico II T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 156, N'154', N'Soldador II T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 157, N'155', N'Mecanico De Turno', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 158, N'156', N'Soldador De Turno', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 159, N'157', N'Mecánico I T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 160, N'158', N'Soldador I T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 161, N'159', N'Electricista I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 162, N'160', N'Tornero I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 163, N'161', N'Caporal De Molinos', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 164, N'162', N'Mecánico Especializado I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 165, N'163', N'Soldador I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 166, N'164', N'Instrumentista Especializado I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 167, N'165', N'Ayudante', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 168, N'166', N'Despachador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 169, N'167', N'Administrador Almacen Taller', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 170, N'168', N'Peón de Cosecha', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 171, N'169', N'Piloto', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 172, N'170', N'Encargado de Planificación y Control (Facturacione', NULL)
GO

INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 189, N'187', N'Supervisor de Mantenimiento', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 190, N'188', N'Instrumentista I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 191, N'189', N'Jefe de Desarrollo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 192, N'190', N'Jefe Area Mto. Mecanico', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 193, N'191', N'Líder de Fabricación', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 194, N'192', N'Despachador Melaza', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 195, N'193', N'Supervisor de Mantenimiento de Molienda', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 196, N'194', N'Supervisor Turno Mant. Eléctrico y Automatización', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 197, N'195', N'Peón de Quemas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 198, N'196', N'Operador Tractor de Quema', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 199, N'197', N'Encargado de Gasolinera', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 200, N'198', N'Auxiliar Caporal De Molienda', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 201, N'199', N'Guardian De Quema', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 202, N'200', N'Administrador De Sistema M & S', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 203, N'201', N'Auxiliar de Auditoría', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 204, N'202', N'Monitor', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 205, N'203', N'Caporal de Producción Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 206, N'204', N'Ayudante Cocina I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 207, N'205', N'Operador de Tractor Labores Varias', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 208, N'206', N'Vaquero', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 209, N'207', N'Peon Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 210, N'208', N'Gerente Administrativo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 211, N'209', N'Operador Chipeadora Agrícola', CAST(N'2017-05-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 212, N'210', N'Ingeniero de Automatización', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 213, N'211', N'Dibujante', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 214, N'212', N'Agronomo', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 215, N'213', N'Superintendente de Producción Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 216, N'214', N'Gerente de Recursos Humanos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 217, N'215', N'Supervisor De Personal', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 218, N'216', N'Coordinador de Servicios de Salud', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 219, N'217', N'Encargado De Caja', CAST(N'2018-05-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 317, N'315', N'Electromecánico III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 318, N'316', N'Mecánico I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 319, N'317', N'Mecánico II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 320, N'318', N'Mecánico III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 321, N'319', N'Receptor De Vehiculos', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 322, N'320', N'Picador', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 323, N'321', N'Electromecánico I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 324, N'322', N'Tornero', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 325, N'323', N'Llantero III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 326, N'324', N'Guardian de Ingenio', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 327, N'325', N'Ayudante De Pintor', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 328, N'326', N'Oficinista', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 329, N'327', N'Piloto Profesional', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 330, N'328', N'Operador Turbo Generador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 331, N'329', N'Ayudante De Mecánico', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 332, N'330', N'Ayudante de Mantenimiento', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 333, N'331', N'Ayudante De Soldador', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 334, N'332', N'Operador de Centrífugas I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 335, N'333', N'Operador Centrifugas Semi - Automaticas', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 336, N'334', N'Piloto Profesional (Movimientos Varios)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 337, N'335', N'Superintendente de Atención a Cañeros', CAST(N'2017-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 338, N'336', N'Piloto Profesional (Camión de Riego e Incendios)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 339, N'337', N'Electricista III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 340, N'338', N'Rematador II', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 341, N'339', N'Oficinista Fábrica', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 342, N'340', N'Limpieza de Jaulas', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 343, N'341', N'Empleada Hotel I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 344, N'342', N'Electromecánico II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 345, N'343', N'Pintor', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 346, N'344', N'Jefe De Compras', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 347, N'345', N'Administrador de Producción Agrícola Zona 1', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 348, N'346', N'Cocinero I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 349, N'347', N'Operador Maquina De Tortillas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 350, N'348', N'Oficinista I', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 351, N'349', N'Encargado (a) de Limpieza', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 352, N'350', N'Lavanderia', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 353, N'351', N'Director(a) Escuela', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 354, N'352', N'Comodin', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 355, N'353', N'Piloto Despachador de Combustible', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 356, N'354', N'Administrador Cocina Industrial', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 357, N'355', N'Mecánico Especializado II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 358, N'356', N'Mecanico De Implementos Agricolas', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 359, N'357', N'Supervisor de Cabezales, Buses y Camiones', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 360, N'358', N'Supervisor De Llantera', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 361, N'359', N'Supervisor de Implementos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 362, N'360', N'Supervisor de Maquinaria Pesada', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 363, N'361', N'Servicio Rápido', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 364, N'362', N'Dosificador de Vitamina A', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 365, N'363', N'Operador de Evaporadores', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 366, N'364', N'Validador de Salidas de Almacen', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 367, N'365', N'Despachador II', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 368, N'366', N'Auxiliar Administrativo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 369, N'367', N'Supervisor de Producto Terminado', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 370, N'368', N'Supervisor II Bodega Producto Terminado', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 371, N'369', N'Ayudante de Centrifugas A', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 372, N'370', N'Coordinador de Compensaciones y Registros', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 373, N'371', N'Coordinador de Selección y Contratación de Persona', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 374, N'372', N'Asistente Administrativo Ganadería', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 375, N'373', N'Monitor de Calidad (Cosecha Mecanizada)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 376, N'374', N'Coordinador de Mantenimiento Eléctrico', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 377, N'375', N'Peon de Labores Varias', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 378, N'376', N'Gestor de Compras II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 379, N'377', N'Operador de Ingresos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 380, N'378', N'Gestor Administrativo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 381, N'379', N'Supervisor de Molinos', CAST(N'2015-10-28T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 382, N'380', N'Operador Mezcladora de Concreto', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 383, N'381', N'Superintendente de Materiales y Suministros', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 384, N'382', N'Operador Motobomba de Riego', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 385, N'383', N'Ayudante Op. Motobomba de Riego', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 386, N'384', N'Envasador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 387, N'385', N'Operador Bombas de Agua', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 388, N'386', N'Instructor (a) de Computación', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 389, N'387', N'Jefe Mecanización Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 390, N'388', N'Analista de Planillas Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 391, N'389', N'Tecnico en Hardware I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 392, N'390', N'Piloto Profesional (Camión de Volteo)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 393, N'391', N'Verificador de Llantas', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 394, N'392', N'Operador Cosechadora', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 395, N'393', N'Ayudante Op. Hidrolizador', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 396, N'394', N'Miembro Junta Directiva', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 397, N'395', N'Coordinador de Capacitación y Desarrollo Laboral', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 398, N'396', N'Coordinador de Servicios al Cortador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 399, N'397', N'Gerente General', CAST(N'2018-05-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 400, N'398', N'Auxiliar de Oficina (Seguridad)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 401, N'399', N'Soldador Especializado I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 402, N'400', N'Auxiliar Supervisor de Electricidad', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 403, N'401', N'Monitor de Capacitación Maquinaria Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 404, N'402', N'Soldador Especializado I T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 405, N'403', N'Electricista Especializado III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 406, N'404', N'Mecánico Especializado III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 407, N'405', N'Mecánico de Centrífugas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 408, N'406', N'Supervisor de Laboratorio', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 409, N'407', N'Supervisor Almacenes Locales', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 410, N'408', N'Pintor III T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 411, N'409', N'Electromecánico Especializado III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 412, N'410', N'Soldador Especializado IV', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 413, N'411', N'Soldador Especializado III T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 414, N'412', N'Electricista Especializado II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 415, N'413', N'Electricista Especializado I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 416, N'414', N'Instrumentista Especializado IV', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 417, N'415', N'Instrumentista Especializado III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 418, N'416', N'Tornero Especializado III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 419, N'417', N'Tornero Especializado IV', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 420, N'418', N'Cocinero III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 421, N'419', N'Coordinador de Grupo', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 422, N'420', N'Coordinador de Seguridad', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 423, N'421', N'Operador de Despacho de Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 424, N'422', N'Asistente de Seguridad y Control de Riesgos', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 425, N'423', N'Encargado de Molinos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 426, N'424', N'Encargado de Patio', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 427, N'425', N'Operador Calderas II', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 428, N'426', N'Operador de Evaporadores II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 429, N'427', N'Operador de Alcalizado y Calentadores', CAST(N'2014-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 430, N'428', N'Operador de Tachos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 431, N'429', N'Operador de Tachos III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 432, N'430', N'Operador Virador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 433, N'431', N'Peon Industrial', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 434, N'432', N'Tornero Especializado II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 435, N'433', N'Tornero I T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 436, N'434', N'Pintor I T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 437, N'435', N'Soldador Especializado II T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 438, N'436', N'Electromecánico Especializado II T.A.', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 439, N'437', N'Electromecánico Especializado I T.A.', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 440, N'438', N'Asistente de Capacitación y Desarrollo Laboral', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 441, N'439', N'Asistente de Selección de Personal', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 442, N'440', N'Analista de Cristalografía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 443, N'441', N'Operador de Cristalografía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 444, N'442', N'Auxiliar de Facturaciones', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 445, N'443', N'Programador Trainee', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 446, N'444', N'Caporal de Jardineros', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 447, N'445', N'Superintendente de Talleres', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 448, N'446', N'Coordinadora de Trabajos Varios', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 449, N'447', N'Promotor en Salud', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 450, N'448', N'Soldador III T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 451, N'449', N'Analista Control de Combustible', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 452, N'450', N'Supervisor de Mantenimiento Turno', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 453, N'451', N'Asistente Gerencia Industrial', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 454, N'452', N'Supervisor de Electricistas Generación', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 455, N'453', N'Supervisor de Mecánica Turbinas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 456, N'454', N'Jefe de Hoteles y Alimentación', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 457, N'455', N'Analista Programador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 458, N'456', N'Encargado de Planificación y Control (Campo)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 459, N'457', N'Coordinador de Costos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 460, N'458', N'Jefe de Diseño y Drenaje', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 461, N'459', N'Auxiliar de Riego y Drenaje', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 462, N'460', N'Operador De Torre Taller', CAST(N'2014-04-30T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 463, N'461', N'Asistente Gerencia General', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 464, N'462', N'Operador de Limpieza (Comodin)', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 465, N'463', N'Encargado de Purificación', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 466, N'464', N'Encargado de Tachos', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 467, N'465', N'Encargado Centrifugas', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 468, N'466', N'Encargado Hidrolavadora', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 486, N'488', N'Asistente De Infraestructura', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 487, N'489', N'Técnico en Refrigeración y A/C', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 488, N'490', N'Jefe de Hidroeléctrica', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 489, N'491', N'Coordinador de Maquinaria Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 490, N'492', N'Líder de Planific. de Mantto y Control de costos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 491, N'493', N'Jefe de Controles de Tecnología', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 492, N'494', N'Riego por Gravedad', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 493, N'495', N'Coordinador Corte Mecanizado', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 494, N'496', N'Supervisor de Riego', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 495, N'497', N'Codificador Industrial', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 496, N'498', N'Jefe de Selección y Desarrollo Laboral', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 497, N'499', N'Gestor de Seguridad Industrial II', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 498, N'500', N'Receptor (Proyecto)', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 499, N'501', N'Jefe de Patio', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 500, N'502', N'Asistente de Servicios de Hotel', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 501, N'503', N'Custodio', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 502, N'504', N'Patrullero "A"', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 503, N'505', N'Ayudante De Electricista', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 504, N'506', N'Patrullero "B"', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 505, N'507', N'Agente de Seguridad "A" de Proyecto', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 506, N'508', N'Agente de Seguridad "B" de Proyecto', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 507, N'509', N'Jefe de Investigación', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 508, N'510', N'Jefe de Frente Mecanizado', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 509, N'511', N'Paramédico', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 510, N'512', N'Coordinador de Producción Agrícola Zona 2', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 511, N'513', N'Auxiliar de Activos Fijos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 512, N'514', N'Supervisor de Calidad de Corte', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 513, N'515', N'Gerente Industrial', CAST(N'2017-04-30T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 514, N'516', N'Coordinador Comercial de Energía Eléctrica', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 515, N'517', N'Coordinador Taller Automotriz', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 516, N'518', N'Supervisor de Tractores', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 517, N'519', N'Gestor de Compras III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 518, N'520', N'Verificador de Referencias', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 519, N'521', N'Encargado de Planificación y Control Cosecha', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 520, N'522', N'Jefe de Obra Civil y Ornato', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 521, N'523', N'Coordinador Maquinaria Producción Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 522, N'524', N'Encargado de Estiba', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 523, N'525', N'Operador de Telehandler', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 524, N'526', N'Ayudante de Producto Terminado', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 525, N'527', N'Encargado de Báscula', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 526, N'528', N'Auxiliar Administrativo P y C', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 527, N'529', N'Recepcionista', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 528, N'530', N'Secretaria Comercial de Energía Eléctrica', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 529, N'531', N'Supervisor de Operación y Mantenimiento', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 530, N'532', N'Evaluador Agrícola II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 531, N'533', N'Supervisor Auditoria Agrícola III', CAST(N'2015-10-15T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 532, N'534', N'Auxiliar Toma de Carga', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 533, N'535', N'Gestor de Sistemas de Calidad', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 585, N'589', N'Secretaria Administrativa Hidroeléctrica', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 586, N'590', N'Supervisor de Electromecánicos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 587, N'591', N'Mecánico Especializado III T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 588, N'592', N'Mecánico Especializado II T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 589, N'593', N'Mecánico Especializado I T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 590, N'594', N'Mecánico Especialista', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 591, N'595', N'Electromecánico Especializado II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 592, N'596', N'Electromecánico Especializado I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 593, N'597', N'Tornero II T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 594, N'598', N'Tornero Especializado III T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 595, N'599', N'Piloto de Asistencias II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 596, N'600', N'Mecánico de Asistencias II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 597, N'601', N'Mecánico de Asistencias I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 598, N'602', N'Mecánico de Asistencias Especializado III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 599, N'603', N'Llantero II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 600, N'604', N'Llantero I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 601, N'605', N'Supervisor de Vehículos Livianos y Motos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 602, N'606', N'Supervisor de Equipo Cañero', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 603, N'607', N'Encargado de Llantera', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 604, N'608', N'Emisor de Ordenes de Trabajo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 605, N'609', N'Planillero', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 606, N'610', N'Emisor de Solicitudes', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 607, N'611', N'Piloto Llantero I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 608, N'612', N'Piloto Llantero II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 609, N'613', N'Mecánico de Asistencias Especializado II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 610, N'614', N'Llantero Especializado III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 611, N'615', N'Operador de Maquinaria III T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 612, N'616', N'Operador de Maquinaria II T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 613, N'617', N'Operador de Maquinaria I T. A.', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 614, N'618', N'Caporal de Plagas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 615, N'619', N'Caporal de Investigación', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 616, N'620', N'Caporal de Siembra y Mantenimiento de Semilleros', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 617, N'621', N'Caporal Corte de Semilleros', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 618, N'622', N'Caporal Planta de Tratamiento', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 619, N'623', N'Caporal Monitoreo Madurantes', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 620, N'624', N'Op. Tractor Preparación y Adecuación de Tierras I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 621, N'625', N'Auxiliar de Oficina Zona de Producción Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 622, N'626', N'Supervisor de Quemas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 623, N'627', N'Superintendente de Cosecha', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 624, N'628', N'Supervisor de Mantenimiento de Caminos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 625, N'629', N'Piloto Profesional (Transporte de Caña) B', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 626, N'630', N'Coordinador de Corte y Alce', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 627, N'631', N'Operador Labores Varias Forestal', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 628, N'632', N'Caporal Forestal', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 629, N'633', N'Trainee Taller', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 630, N'634', N'Coordinador de Negocios de Caña', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 631, N'635', N'Ayudante de Mecánico Soldador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 632, N'636', N'Mecánico Soldador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 633, N'637', N'Jefe de Desarrollo (Automatización)', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 634, N'638', N'Coordinador De Mantenimiento Mecanico En Generacio', CAST(N'2016-08-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 635, N'639', N'Técnico Intecap', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 636, N'640', N'Practicante', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 637, N'641', N'Coordinador de Proyectos Nuevos y Mejora', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 638, N'642', N'Analista de Microbiología', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 639, N'643', N'Practicante Ejercicio Profesional Supervisado', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 640, N'644', N'Coordinador de Investigación Industrial', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 641, N'645', N'Coordinador Laboratorio de fabrica y cristalografí', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 642, N'646', N'Encargado de Servicios Varios', CAST(N'2016-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 643, N'647', N'Asistente de Negocios de Caña', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 644, N'648', N'Metrólogo (a)', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 645, N'649', N'Carpintero Fábrica', CAST(N'2014-11-30T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 646, N'650', N'Analista de Costos y Presupuesto', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 647, N'651', N'Coordinador de Inocuidad', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 648, N'652', N'Monitor de Seguridad Industrial', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 649, N'653', N'Auxiliar Administrativa Taller', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 650, N'654', N'Analista de Datos I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 651, N'655', N'Analista de Datos II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 652, N'656', N'Electromecánico Especialista', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 653, N'657', N'Soldador Especialista', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 654, N'658', N'Pintor Especializado III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 655, N'659', N'Topógrafo II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 656, N'660', N'Coordinador de Combustibles y Tratamiento de Aguas', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 657, N'661', N'Superintendente de Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 658, N'662', N'Jefe de Control de Calidad (Energía)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 659, N'663', N'Emisor de Ordenes de Trabajo (Industrial)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 660, N'664', N'Supervisor Eléctrico Cogeneración', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 661, N'665', N'Coordinador de Compensaciones', CAST(N'2014-10-30T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 662, N'666', N'Auxiliar de Selección y Contratación', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 663, N'667', N'Coordinador de Planificación y Control', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 664, N'668', N'Supervisor de Pagos', CAST(N'2018-05-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 665, N'669', N'Supervisor de Proyecto', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 666, N'670', N'Gestor de Sistemas de Calidad', CAST(N'2015-08-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 667, N'671', N'Supervisor de Turno Bloque 3', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 668, N'672', N'Auxiliar de Activos Fijos II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 669, N'673', N'Líder de Ingeniería y Proyectos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 670, N'674', N'Analista de Operación y Mercado', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 671, N'675', N'Supervisor Mantenimiento Automatización', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 672, N'676', N'Piloto Profesional (Low boy)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 673, N'677', N'Supervisor Control de Plagas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 674, N'678', N'Ingeniero Mantenimiento Eléctrico Fábrica', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 675, N'679', N'Acomodador de Carga', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 676, N'680', N'Supervisor de Preparación y Adecuación de Tierras', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 677, N'681', N'Supervisor de Infraestructura Agrícola', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 678, N'682', N'Auxiliar de GPS', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 679, N'683', N'Jefe de Extracción', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 680, N'684', N'Piloto de Ambulancia', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 681, N'685', N'Técnico de Comunicación', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 682, N'686', N'Auxiliar de Nóminas', CAST(N'2018-05-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 683, N'687', N'Supervisor de Manipulación de Alimentos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 684, N'688', N'Asesor', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 685, N'689', N'Supervisor de Semilleros', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 686, N'690', N'Jefe de Región', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 687, N'691', N'Jefe de Turno Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 688, N'692', N'Ingeniero de Mantenimiento Mecánico Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 689, N'693', N'Ingeniero de Mantenimiento Eléctrico Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 690, N'694', N'Operador de Calderas Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 691, N'695', N'Operador Turbomaquinaria Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 692, N'696', N'Mecánico Operador Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 693, N'697', N'Operador Electricista - Instrumentista Generación', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 694, N'698', N'Técnico Auxiliar de Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 695, N'699', N'Supervisor Agrícola Trainee', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 696, N'700', N'Tecnico en Hardware lll', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 697, N'701', N'Coordinador', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 698, N'702', N'Coordinador de Mantenimiento Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 699, N'703', N'Director', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 700, N'704', N'Odontólogo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 701, N'705', N'Tractorista Trainee', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 702, N'706', N'Coordinador de Operaciones Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 703, N'707', N'Ingeniero de Operaciones Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 704, N'708', N'Asistente Administrativo Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 705, N'709', N'Ingeniero de Seguridad Industrial y Ambiental', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 706, N'710', N'Ayudante de Limpieza Conductor de Azúcar', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 707, N'711', N'Supervisor de Tratamiento de Jugo', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 708, N'712', N'Trainee Administrativo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 709, N'713', N'Planificador de Mantenimiento', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 710, N'714', N'Ingeniero de Controles', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 711, N'715', N'Especialista de Documentación', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 712, N'716', N'Ingeniero de Operación Cristalización', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 713, N'717', N'Ingeniero de Energía y Controles', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 714, N'718', N'Líder de Mantenimiento Eléctrico y Automatización', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 715, N'719', N'Líder de Mantenimiento Mecánico', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 716, N'720', N'Líder de Molienda', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 717, N'721', N'Líder de Separación', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 718, N'722', N'Ingeniero de Operación Tratamiento de Jugo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 719, N'723', N'Supervisor de Cocción y Separación', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 720, N'724', N'Piloto Administrativo Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 721, N'725', N'Supervisor de Compras', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 722, N'726', N'Auxiliar de Mantenimiento', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 723, N'727', N'Encargado de Importaciones', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 724, N'728', N'Operador Triturador de Madera', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 725, N'729', N'Supervisor Operativo III', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 726, N'730', N'Supervisor de Operación y Mercado de Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 727, N'731', N'Empleada Hotel II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 728, N'732', N'Ayudante de Hotel/Cafetería (Entrenamiento)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 729, N'733', N'Ejecutivo Comercial de Energía Eléctrica', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 730, N'734', N'Coordinador de TI', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 731, N'735', N'Coordinador Contable', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 732, N'736', N'Administrador Oficina Familiar', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 733, N'737', N'Mensajero Gerencial', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 734, N'738', N'Conserje Gerencial', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 735, N'739', N'Secretaria Gerencial', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 736, N'740', N'Asistente de Cumplimiento NIIF', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 737, N'741', N'Analista NIIF', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 738, N'742', N'Auxiliar de Recursos Humanos II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 739, N'743', N'Jefe Mitigación de Quemas Criminales', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 740, N'744', N'Administrador de Atención a Cañeros', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 741, N'745', N'Jefe de Riego', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 742, N'746', N'Supervisor de Fertilización y Labores Varias', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 743, N'747', N'Encargado de Servidores', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 744, N'748', N'Encargado de Soporte', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 745, N'749', N'Auxiliar de Archivo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 746, N'750', N'Ingeniero de Operación Molienda', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 747, N'751', N'Jefe de Turno Molienda', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 748, N'752', N'Jefe de Turno Fabricación', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 749, N'753', N'Ingeniero de Mantenimiento Automatización', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 750, N'754', N'Coordinador de O&M Bloque 3', CAST(N'2017-01-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 751, N'755', N'Técnico Especialista', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 752, N'756', N'Ingeniero de Documentación', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 753, N'757', N'Ingeniero de Instrumentación', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 754, N'758', N'Ingeniero Eléctrico', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 755, N'759', N'Ingeniero Mecánico', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 756, N'760', N'Oficinista Técnico', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 757, N'761', N'Supervisor Seguridad Industrial', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 758, N'762', N'Coordinador de Producción Agrícola Zona 1', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 759, N'763', N'Coordinador de Producción Agrícola Zona 3', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 760, N'764', N'Coordinador de Producción Agrícola Zona 4', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 761, N'765', N'Administrador de Producción Agrícola Zona 2', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 762, N'766', N'Administrador de Producción Agrícola Zona 3', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 763, N'767', N'Administrador de Producción Agrícola Zona 4', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 764, N'768', N'Mecánico I - Cogeneración', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 765, N'769', N'Operador Turbo Generador - Cogeneración', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 766, N'770', N'Electricista Especializado II - Cogeneración', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 767, N'771', N'Operador de Despacho de Energía II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 768, N'772', N'Instrumentista Especializado II - Cogeneración', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 769, N'773', N'Instrumentista Especializado III - Cogeneración', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 770, N'774', N'Peón Industrial - Cogeneración', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 771, N'775', N'Supervisor de Producción Agrícola Z 1', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 772, N'776', N'Supervisor de Producción Agrícola Z 2', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 773, N'777', N'Supervisor de Producción Agrícola Z 3', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 774, N'778', N'Supervisor de Producción Agrícola Z 4', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 775, N'779', N'Soldador Especializado III - Cogeneración', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 776, N'780', N'Soldador Especializado II - Cogeneración', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 777, N'781', N'Mecánico Especializado III - Cogeneración', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 778, N'782', N'Lubricador - Cogeneración', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 779, N'783', N'Supervisor de Seguridad e Instalaciones B', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 780, N'784', N'Supervisor de Seguridad de Campo B', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 781, N'785', N'Tecnico Hardware II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 782, N'786', N'Auxiliar de Recursos Humanos I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 783, N'787', N'Asistente de Planificación y Control', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 784, N'788', N'Auxiliar Administrativo Cafetería', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 785, N'789', N'Peón Agrícola Semilleros', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 786, N'790', N'Caporal y Bodeguero', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 787, N'791', N'Caporal Campo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 788, N'792', N'Encargado de Modulo Habitacional', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 789, N'793', N'Cocinero I (Cocina Industrial)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 790, N'794', N'Op. Tractor Preparación y Adecuación de Tierras II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 791, N'795', N'Ejecutiva de Cuenta de Energía Eléctrica', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 792, N'796', N'Analista de Mercado Eléctrico', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 793, N'797', N'Coordinador Legal y Administrativo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 794, N'798', N'Analista de Combustibles Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 795, N'799', N'Gerente de Cultura y Desarrollo de Talento', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 796, N'800', N'Coordinador de Proyectos RRHH', CAST(N'2016-08-30T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 797, N'801', N'Coordinador de Mercado Eléctrico', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 798, N'802', N'Operador Maquina de Tortilla Cafetería', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 799, N'803', N'Coordinador de Proyectos Productividad', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 800, N'804', N'Coordinador Venta Energía Eléctrica Local-Regional', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 801, N'805', N'Coordinador Técnico de Comercialización', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 802, N'806', N'Auxiliar Técnico de Comercialización ', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 803, N'807', N'Gestor Legal y Administrativo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 804, N'808', N'Supervisor de Hoteles y Clubes', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 805, N'809', N'Supervisor Producción de Alimentos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 806, N'810', N'Puesto_', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 807, N'811', N'Coordinador de Gestión y Desarrollo de Talento', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 808, N'812', N'Técnico Comunitario de RSE', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 809, N'813', N'Analista de Presupuesto', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 810, N'814', N'Operador Técnico Senior', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 811, N'815', N'Ingeniero de Automatización y Control Energía', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 812, N'816', N'Encargado de Traslado y Manejo de Químicos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 813, N'817', N'Piloto Profesional (Transporte de Caña) A', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 814, N'818', N'Supervisor de Análisis Financiero y BD', CAST(N'2018-05-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 815, N'819', N'Especialista Operacion de Caldera', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 816, N'820', N'Especialista Operación Turbomaquinaria', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 817, N'821', N'Mecánico Especialista de Mantenimiento', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 818, N'822', N'Especialista Mecánico de Operaciones', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 819, N'823', N'Auxiliar Técnico de Mantenimiento', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 820, N'824', N'Auxiliar Técnico de Operaciones', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 821, N'825', N'Especialista Técnico Senior', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 822, N'826', N'Especialista Técnico Senior de Mantto', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 823, N'827', N'Especialista Electricista - Instrumentista de oper', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 824, N'828', N'Electricista especialista de mantenimiento', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 825, N'829', N'Instrumentista Especialista de Mantenimiento', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 826, N'830', N'Asistente de Gestión y Rentas de Trabajo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 827, N'831', N'Asistente de Servicios al Cortador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 828, N'832', N'Verificador de Referencias II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 829, N'833', N'Bono Académico', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 830, N'834', N'Auxiliar Técnico', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 831, N'835', N'Monitor de Seguridad Industrial y Ambiente', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 832, N'836', N'Superintendente de Tesorería', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 833, N'837', N'Técnico de Campo Mantto. Predictivo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 834, N'838', N'Director Financiero', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 835, N'839', N'Ingeniero de Mantenimiento Predictivo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 836, N'840', N'Analista de Tesorería', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 837, N'841', N'Auxiliar Administrativa Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 838, N'842', N'Director Presidente', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 839, N'843', N'Director Cadena de Suministros', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 840, N'844', N'Coordinador de Cuentas Por Pagar y Facturación', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 841, N'845', N'Superintendente de Planificación y Control Financi', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 842, N'846', N'Asistente Contable I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 843, N'847', N'Analista Senior de Relación con Bancos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 844, N'848', N'CEO - Director General', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 845, N'849', N'Conserje Directiva', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 846, N'850', N'Gestor de Compras Líder', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 847, N'851', N'Analista de Información Cadena Suministros', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 848, N'852', N'Jefe Administrativo Fábrica', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 849, N'999', N'Jubilado', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 850, N'A11', N'Mecanico A1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 851, N'A12', N'Piloto de Asistencias A1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 852, N'A13', N'Tornero A1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 853, N'A14', N'Soldador A1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 854, N'A15', N'Electromecanico A1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 855, N'A16', N'Operador de Maquinaria A1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 856, N'A17', N'Llantero A1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 857, N'A21', N'Mecanico A2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 858, N'A22', N'Piloto de Asistencias A2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 859, N'A23', N'Tornero A2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 860, N'A24', N'Soldador A2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 861, N'A25', N'Electromecanico A2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 862, N'A26', N'Operador de Maquinaria A2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 863, N'A27', N'Llantero A2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 864, N'A28', N'Pintor A2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 865, N'A29', N'Piloto Llantero A2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 866, N'AA1', N'Operador Torre de Control', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 867, N'AAA', N'Generico Campo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 868, N'AB1', N'Asistente Administrativa', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 869, N'AB2', N'Digitador AB', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 870, N'AB3', N'Emisor de Solicitudes y Cotizaciones Agrícolas', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 871, N'AB4', N'Encargado de Llantera', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 872, N'AB5', N'Planillero', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 873, N'AC1', N'Digitador', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 874, N'AC2', N'Emisor de Solicitudes y Cotizaciones Automotriz', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 875, N'B11', N'Mecanico B1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 876, N'B12', N'Piloto de Asistencias B1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 877, N'B13', N'Tornero B1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 878, N'B14', N'Soldador B1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 879, N'B15', N'Electromecanico B1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 880, N'B16', N'Llantero B1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 881, N'B17', N'Piloto Llantero B1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 882, N'B18', N'Operador de Maquinaria B', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 883, N'B21', N'Mecanico B2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 884, N'B22', N'Piloto de Asistencias B2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 885, N'B23', N'Tornero B2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 886, N'B24', N'Soldador B2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 887, N'B25', N'Electromecanico B2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 888, N'B26', N'Llantero B2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 889, N'B27', N'Piloto llantero B2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 890, N'E11', N'Mecanico E1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 891, N'E12', N'Soldador E1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 892, N'E13', N'Electromecanico E1', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 893, N'E21', N'Mecanico E2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 894, N'E22', N'Soldador E2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (1, 895, N'E23', N'Electromecanico E2', CAST(N'2014-03-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 896, N'001', N'Operador De Alzadora', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 897, N'002', N'Apuntador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 898, N'003', N'Op. Tractor Movimiento Interno', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 899, N'004', N'Enganchador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 900, N'006', N'Recolector De Caña', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 901, N'007', N'Supervisor De Corte', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 902, N'008', N'Caporal Corte De Caña', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 903, N'009', N'Supervisor De Alce', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 904, N'010', N'Tractorista De Ruta', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 905, N'012', N'Cortador De Caña', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 906, N'013', N'Coordinador de Transporte', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 907, N'014', N'Supervisor De Transporte Ruta y Red Vial', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 908, N'015', N'Coordinador Taller Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 909, N'016', N'Encargada de Registros', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 910, N'017', N'Despuntador De Caña (Jaulas)', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 911, N'020', N'Encargado De Vivero Forestal', CAST(N'2014-11-30T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 912, N'026', N'Coordinador de Ingeniería Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 913, N'027', N'Gerente de Operaciones Agrícolas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 914, N'028', N'Encalador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 915, N'029', N'Banderillero', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 916, N'030', N'Evaluador Agrícola I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 917, N'032', N'Programador Senior', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 918, N'033', N'Supervisor de Riego Producción Agrícola', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 919, N'034', N'Jefe de Departamento Forestal', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 920, N'035', N'Supervisor Forestal', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 921, N'036', N'Operador de Chipiadora', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 922, N'039', N'Gestor de Sistemas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 923, N'041', N'Coordinador de Evaluaciones Técnicas Agrícolas', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 924, N'043', N'Tornero Especializado I', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 925, N'044', N'Soldador Especializado II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 926, N'045', N'Instrumentista Especializado II', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 927, N'048', N'Asistente de Ingeniería Agrícola', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 928, N'050', N'Operador Hidrolavadora', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 929, N'051', N'Operador Tanques de Miel', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 930, N'052', N'Operador Secado y Enfriado', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 931, N'054', N'Ayudante de Limpieza', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 932, N'055', N'Auxiliar de Documentación de Procesos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 933, N'057', N'Jefe de Electricistas', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 934, N'058', N'Jefe de Clarificación', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 935, N'059', N'Asistente de Maquinaria', CAST(N'2015-10-28T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 936, N'061', N'Auxiliar de Operador de Tachos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 937, N'064', N'Operador Conductores de Bagazo', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 938, N'065', N'Operador Desfibradora / Homogenizador', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 939, N'066', N'Operador Core Sampler', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 940, N'067', N'Gerente Técnico', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 941, N'069', N'Operador de Motores de Molinos', NULL)
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 942, N'071', N'Jefe de Programación', CAST(N'2015-12-31T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[TblPuestos] ([EmpresaID], [PuestoID], [PuestoCodigo], [Nombre], [FechaDeBaja]) VALUES (2, 943, N'072', N'Supervisor Turno Cristalización', NULL)
GO
SET IDENTITY_INSERT [dbo].[TblPuestos] OFF
GO
ALTER TABLE [dbo].[TblPuestos]  WITH CHECK ADD  CONSTRAINT [FK_TblPuestos_TblEmpresas] FOREIGN KEY([EmpresaID])
REFERENCES [dbo].[TblEmpresas] ([EmpresaID])
GO
ALTER TABLE [dbo].[TblPuestos] CHECK CONSTRAINT [FK_TblPuestos_TblEmpresas]
GO
