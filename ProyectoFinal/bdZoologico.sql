USE [master]
GO
/****** Object:  Database [bdZoologico]    Script Date: 16/06/2023 21:45:27 ******/
CREATE DATABASE [bdZoologico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bdZoologico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SERVIDORSQL\MSSQL\DATA\bdZoologico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bdZoologico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SERVIDORSQL\MSSQL\DATA\bdZoologico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bdZoologico] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdZoologico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdZoologico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bdZoologico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bdZoologico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bdZoologico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bdZoologico] SET ARITHABORT OFF 
GO
ALTER DATABASE [bdZoologico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bdZoologico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bdZoologico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bdZoologico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bdZoologico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bdZoologico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bdZoologico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bdZoologico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bdZoologico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bdZoologico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bdZoologico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bdZoologico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bdZoologico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bdZoologico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bdZoologico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bdZoologico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bdZoologico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bdZoologico] SET RECOVERY FULL 
GO
ALTER DATABASE [bdZoologico] SET  MULTI_USER 
GO
ALTER DATABASE [bdZoologico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bdZoologico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bdZoologico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bdZoologico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bdZoologico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bdZoologico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bdZoologico', N'ON'
GO
ALTER DATABASE [bdZoologico] SET QUERY_STORE = OFF
GO
USE [bdZoologico]
GO
/****** Object:  Table [dbo].[TB_ANIMAL]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ANIMAL](
	[ID_ANIMAL] [int] IDENTITY(1,1) NOT NULL,
	[NUM_ETIQUETA] [nvarchar](max) NULL,
	[NOMBRE] [nvarchar](max) NULL,
	[ESPECIE] [nvarchar](max) NULL,
	[EDAD] [int] NULL,
	[HABITAT] [nvarchar](max) NULL,
	[FECHA_INGRESO] [datetime] NULL,
 CONSTRAINT [PK_TB_ANIMAL] PRIMARY KEY CLUSTERED 
(
	[ID_ANIMAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CAUSA]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CAUSA](
	[ID_CAUSA] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [nvarchar](max) NULL,
 CONSTRAINT [PK_TB_CAUSA] PRIMARY KEY CLUSTERED 
(
	[ID_CAUSA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_HISTORIAL_MEDICO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_HISTORIAL_MEDICO](
	[ID_HISTORIAL_MEDICO] [int] IDENTITY(1,1) NOT NULL,
	[ID_USUARIO] [int] NULL,
	[ID_ANIMAL] [int] NULL,
	[ID_CAUSA] [int] NULL,
	[DETALLES] [nvarchar](max) NULL,
	[FECHA_ATENCION] [datetime] NULL,
 CONSTRAINT [PK_TB_HISTORIAL_MEDICO] PRIMARY KEY CLUSTERED 
(
	[ID_HISTORIAL_MEDICO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_INVENTARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_INVENTARIO](
	[ID_INVENTARIO] [int] IDENTITY(1,1) NOT NULL,
	[ID_PRODUCTO] [int] NULL,
	[NOMBRE] [nvarchar](max) NULL,
	[FECHA_INGRESO] [datetime] NULL,
 CONSTRAINT [PK_TB_INVENTARIO] PRIMARY KEY CLUSTERED 
(
	[ID_INVENTARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PRODUCTO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PRODUCTO](
	[ID_PRODUCTO] [int] IDENTITY(1,1) NOT NULL,
	[TIPO_PRODUCTO] [nvarchar](max) NULL,
 CONSTRAINT [PK_TB_PRODUCTO] PRIMARY KEY CLUSTERED 
(
	[ID_PRODUCTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_RELACION_HISTORIALMEDICO_INVENTARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_RELACION_HISTORIALMEDICO_INVENTARIO](
	[ID_RELACION] [int] IDENTITY(1,1) NOT NULL,
	[ID_HISTORIAL_MEDICO] [int] NULL,
	[ID_INVENTARIO] [int] NULL,
 CONSTRAINT [PK_TB_RELACION_HISTORIAL_INVENTARIO] PRIMARY KEY CLUSTERED 
(
	[ID_RELACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_RESERVA]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_RESERVA](
	[ID_RESERVA] [int] IDENTITY(1,1) NOT NULL,
	[ID_USUARIO] [int] NULL,
	[FECHA_RESERVA] [nchar](10) NULL,
 CONSTRAINT [PK_TB_RESERVA] PRIMARY KEY CLUSTERED 
(
	[ID_RESERVA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TIPO_USUARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_TIPO_USUARIO](
	[ID_TIPO_USUARIO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [nvarchar](max) NULL,
 CONSTRAINT [PK_TB_TIPO_USUARIO] PRIMARY KEY CLUSTERED 
(
	[ID_TIPO_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_USUARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_USUARIO](
	[ID_USUARIO] [int] IDENTITY(1,1) NOT NULL,
	[ID_TIPO_USUARIO] [int] NULL,
	[NOMBRE] [nvarchar](max) NULL,
	[APELLIDOS] [nvarchar](max) NULL,
	[CEDULA] [int] NULL,
	[TELEFONO] [int] NULL,
	[CORREO_ELECTRONICO] [nvarchar](max) NULL,
	[PASSWORD] [nvarchar](max) NULL,
	[FECHA_INGRESO] [datetime] NULL,
 CONSTRAINT [PK_TB_USUARIO] PRIMARY KEY CLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TB_HISTORIAL_MEDICO]  WITH CHECK ADD  CONSTRAINT [FK_TB_HISTORIAL_MEDICO_TB_ANIMAL] FOREIGN KEY([ID_ANIMAL])
REFERENCES [dbo].[TB_ANIMAL] ([ID_ANIMAL])
GO
ALTER TABLE [dbo].[TB_HISTORIAL_MEDICO] CHECK CONSTRAINT [FK_TB_HISTORIAL_MEDICO_TB_ANIMAL]
GO
ALTER TABLE [dbo].[TB_HISTORIAL_MEDICO]  WITH CHECK ADD  CONSTRAINT [FK_TB_HISTORIAL_MEDICO_TB_CAUSA] FOREIGN KEY([ID_CAUSA])
REFERENCES [dbo].[TB_CAUSA] ([ID_CAUSA])
GO
ALTER TABLE [dbo].[TB_HISTORIAL_MEDICO] CHECK CONSTRAINT [FK_TB_HISTORIAL_MEDICO_TB_CAUSA]
GO
ALTER TABLE [dbo].[TB_HISTORIAL_MEDICO]  WITH CHECK ADD  CONSTRAINT [FK_TB_HISTORIAL_MEDICO_TB_USUARIO] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[TB_USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[TB_HISTORIAL_MEDICO] CHECK CONSTRAINT [FK_TB_HISTORIAL_MEDICO_TB_USUARIO]
GO
ALTER TABLE [dbo].[TB_INVENTARIO]  WITH CHECK ADD  CONSTRAINT [FK_TB_INVENTARIO_TB_PRODUCTO] FOREIGN KEY([ID_PRODUCTO])
REFERENCES [dbo].[TB_PRODUCTO] ([ID_PRODUCTO])
GO
ALTER TABLE [dbo].[TB_INVENTARIO] CHECK CONSTRAINT [FK_TB_INVENTARIO_TB_PRODUCTO]
GO
ALTER TABLE [dbo].[TB_RELACION_HISTORIALMEDICO_INVENTARIO]  WITH CHECK ADD  CONSTRAINT [FK_TB_RELACION_HISTORIAL_INVENTARIO_TB_HISTORIAL_MEDICO] FOREIGN KEY([ID_HISTORIAL_MEDICO])
REFERENCES [dbo].[TB_HISTORIAL_MEDICO] ([ID_HISTORIAL_MEDICO])
GO
ALTER TABLE [dbo].[TB_RELACION_HISTORIALMEDICO_INVENTARIO] CHECK CONSTRAINT [FK_TB_RELACION_HISTORIAL_INVENTARIO_TB_HISTORIAL_MEDICO]
GO
ALTER TABLE [dbo].[TB_RELACION_HISTORIALMEDICO_INVENTARIO]  WITH CHECK ADD  CONSTRAINT [FK_TB_RELACION_HISTORIAL_INVENTARIO_TB_INVENTARIO] FOREIGN KEY([ID_INVENTARIO])
REFERENCES [dbo].[TB_INVENTARIO] ([ID_INVENTARIO])
GO
ALTER TABLE [dbo].[TB_RELACION_HISTORIALMEDICO_INVENTARIO] CHECK CONSTRAINT [FK_TB_RELACION_HISTORIAL_INVENTARIO_TB_INVENTARIO]
GO
ALTER TABLE [dbo].[TB_RESERVA]  WITH CHECK ADD  CONSTRAINT [FK_TB_RESERVA_TB_USUARIO] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[TB_USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[TB_RESERVA] CHECK CONSTRAINT [FK_TB_RESERVA_TB_USUARIO]
GO
ALTER TABLE [dbo].[TB_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_TB_USUARIO_TB_TIPO_USUARIO] FOREIGN KEY([ID_TIPO_USUARIO])
REFERENCES [dbo].[TB_TIPO_USUARIO] ([ID_TIPO_USUARIO])
GO
ALTER TABLE [dbo].[TB_USUARIO] CHECK CONSTRAINT [FK_TB_USUARIO_TB_TIPO_USUARIO]
GO
/****** Object:  StoredProcedure [dbo].[ModificarUsuario]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ModificarUsuario]
    @ID INT,
    @NOMBRE nvarchar(max),
    @APELLIDOS nvarchar(max),
    @CEDULA INT,
    @TELEFONO INT,
    @ErrorID INT OUTPUT,
    @ErrorDescripcion NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        UPDATE TB_USUARIO
        SET NOMBRE = @Nombre,
            APELLIDOS = @Apellidos,
            CEDULA = @Cedula,
            TELEFONO = @Telefono
        WHERE ID_USUARIO = @Id;

        SET @ErrorID = 0;
        SET @ErrorDescripcion = '';
    END TRY
    BEGIN CATCH
        SET @ErrorID = ERROR_NUMBER();
        SET @ErrorDescripcion = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_ANIMAL]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ACTUALIZAR_ANIMAL]
(
    @ID_ANIMAL int,
    @NUM_ETIQUETA nvarchar(max),
    @NOMBRE nvarchar(max),
    @ESPECIE nvarchar(max),
    @EDAD int,
    @HABITAT nvarchar(max),
    @ERRORID int OUTPUT,
    @ERRORDESCRIPCION nvarchar(max) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT * FROM TB_ANIMAL WHERE NUM_ETIQUETA = @NUM_ETIQUETA AND ID_ANIMAL = @ID_ANIMAL)
        BEGIN
            SET @ERRORID = 2;
            SET @ERRORDESCRIPCION = 'EL NUMERO DE ETIQUETA YA EXISTE PARA OTRO ANIMAL';
        END
        ELSE
        BEGIN
            UPDATE TB_ANIMAL
                SET NOMBRE = @NOMBRE,
                ESPECIE = @ESPECIE,
                EDAD = @EDAD,
                HABITAT = @HABITAT
            WHERE ID_ANIMAL = @ID_ANIMAL;
            
            SET @ERRORID = 0;
            SET @ERRORDESCRIPCION = '';
        END
    END TRY
    BEGIN CATCH
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_CAUSA]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ACTUALIZAR_CAUSA]
    @ID_CAUSA INT,
    @DESCRIPCION_CAUSA NVARCHAR(MAX),
    @ErrorID INT OUTPUT,
    @ErrorDescripcion NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        UPDATE TB_CAUSA
        SET DESCRIPCION = @DESCRIPCION_CAUSA
        WHERE ID_CAUSA = @ID_CAUSA;

        SET @ErrorID = 0;
        SET @ErrorDescripcion = '';
    END TRY
    BEGIN CATCH
        SET @ErrorID = ERROR_NUMBER();
        SET @ErrorDescripcion = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_INVENTARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ACTUALIZAR_INVENTARIO]
    @ID_INVENTARIO INT,
    @NOMBRE_PRODUCTO NVARCHAR(MAX),
    @ErrorID INT OUTPUT,
    @ErrorDescripcion NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        UPDATE TB_INVENTARIO
        SET NOMBRE = @NOMBRE_PRODUCTO
        WHERE ID_INVENTARIO = @ID_INVENTARIO;

        SET @ErrorID = 0;
        SET @ErrorDescripcion = '';
    END TRY
    BEGIN CATCH
        SET @ErrorID = ERROR_NUMBER();
        SET @ErrorDescripcion = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_PRODUCTO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ACTUALIZAR_PRODUCTO]
(
    @ID_PRODUCTO int,
    @TIPO_PRODUCTO nvarchar(max),
    @ERRORID int OUTPUT,
    @ERRORDESCRIPCION nvarchar(max) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        UPDATE TB_PRODUCTO
        SET TIPO_PRODUCTO = @TIPO_PRODUCTO
        WHERE ID_PRODUCTO = @ID_PRODUCTO;
        
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';
    END TRY
    BEGIN CATCH
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_RESERVA]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ACTUALIZAR_RESERVA]
    @ID_RESERVA INT,
    @FECHA_RESERVA DATE,
    @ErrorID INT OUTPUT,
    @ErrorDescripcion NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        UPDATE TB_RESERVA
        SET FECHA_RESERVA = @FECHA_RESERVA
        WHERE ID_RESERVA = @ID_RESERVA;

        SET @ErrorID = 0;
        SET @ErrorDescripcion = '';
    END TRY
    BEGIN CATCH
        SET @ErrorID = ERROR_NUMBER();
        SET @ErrorDescripcion = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_TIPO_USUARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ACTUALIZAR_TIPO_USUARIO]
(
    @ID_TIPO_USUARIO int,
    @DESCRIPCION_TIPO_USUARIO nvarchar(max),
    @ERRORID int OUTPUT,
    @ERRORDESCRIPCION nvarchar(max) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        UPDATE TB_TIPO_USUARIO
        SET DESCRIPCION = @DESCRIPCION_TIPO_USUARIO
        WHERE ID_TIPO_USUARIO = @ID_TIPO_USUARIO;
        
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';
    END TRY
    BEGIN CATCH
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_USUARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ACTUALIZAR_USUARIO]
    @ID INT,
    @NOMBRE nvarchar(max),
    @APELLIDOS nvarchar(max),
    @CEDULA INT,
    @TELEFONO INT,
    @ErrorID INT OUTPUT,
    @ErrorDescripcion NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        UPDATE TB_USUARIO
        SET NOMBRE = @Nombre,
            APELLIDOS = @Apellidos,
            CEDULA = @Cedula,
            TELEFONO = @Telefono
        WHERE ID_USUARIO = @Id;

        SET @ErrorID = 0;
        SET @ErrorDescripcion = '';
    END TRY
    BEGIN CATCH
        SET @ErrorID = ERROR_NUMBER();
        SET @ErrorDescripcion = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_ANIMAL]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINAR_ANIMAL]
(
    @ID_ANIMAL int,
    @ERRORID int OUTPUT,
    @ERRORDESCRIPCION nvarchar(max) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        DELETE FROM TB_ANIMAL
        WHERE ID_ANIMAL = @ID_ANIMAL;
        
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';
    END TRY
    BEGIN CATCH
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_CAUSA]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINAR_CAUSA]
    @ID_CAUSA INT,
    @ErrorID INT OUTPUT,
    @ErrorDescripcion NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        DELETE FROM TB_CAUSA WHERE ID_CAUSA = @ID_CAUSA;

        SET @ErrorID = 0;
        SET @ErrorDescripcion = '';
    END TRY
    BEGIN CATCH
        SET @ErrorID = ERROR_NUMBER();
        SET @ErrorDescripcion = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_INVENTARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINAR_INVENTARIO]
    @ID_INVENTARIO INT,
    @ErrorID INT OUTPUT,
    @ErrorDescripcion NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        DELETE FROM TB_INVENTARIO WHERE ID_INVENTARIO = @ID_INVENTARIO;

        SET @ErrorID = 0;
        SET @ErrorDescripcion = '';
    END TRY
    BEGIN CATCH
        SET @ErrorID = ERROR_NUMBER();
        SET @ErrorDescripcion = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_PRODUCTO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINAR_PRODUCTO]
(
    @ID_PRODUCTO int,
    @ERRORID int OUTPUT,
    @ERRORDESCRIPCION nvarchar(max) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        DELETE FROM TB_PRODUCTO
        WHERE ID_PRODUCTO = @ID_PRODUCTO;
        
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';
    END TRY
    BEGIN CATCH
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_RESERVA]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINAR_RESERVA]
    @ID_RESERVA INT,
    @ErrorID INT OUTPUT,
    @ErrorDescripcion NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        DELETE FROM TB_RESERVA WHERE ID_RESERVA = @ID_RESERVA;

        SET @ErrorID = 0;
        SET @ErrorDescripcion = '';
    END TRY
    BEGIN CATCH
        SET @ErrorID = ERROR_NUMBER();
        SET @ErrorDescripcion = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_TIPO_USUARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ELIMINAR_TIPO_USUARIO]
(
    @ID_TIPO_USUARIO int,
    @ERRORID int OUTPUT,
    @ERRORDESCRIPCION nvarchar(max) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        DELETE FROM TB_TIPO_USUARIO
        WHERE ID_TIPO_USUARIO = @ID_TIPO_USUARIO;
        
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';
    END TRY
    BEGIN CATCH
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_USUARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ELIMINAR_USUARIO]
    @ID_USUARIO INT,
    @ErrorID INT OUTPUT,
    @ErrorDescripcion NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        DELETE FROM TB_USUARIO WHERE ID_USUARIO = @ID_USUARIO;
        
        SET @ErrorID = 0;
        SET @ErrorDescripcion = '';
    END TRY
    BEGIN CATCH
        SET @ErrorID = ERROR_NUMBER();
        SET @ErrorDescripcion = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_ANIMAL]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_ANIMAL]
(
    @NUM_ETIQUETA nvarchar(max),
    @NOMBRE nvarchar(max),
    @ESPECIE nvarchar(max),
    @EDAD int,
    @HABITAT nvarchar(max),
    @IDRETURN int OUTPUT,
    @ERRORID int OUTPUT,
    @ERRORDESCRIPCION nvarchar(max) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT * FROM TB_ANIMAL WHERE NUM_ETIQUETA = @NUM_ETIQUETA)
        BEGIN
            SET @IDRETURN = -1;
            SET @ERRORID = 1;
            SET @ERRORDESCRIPCION = 'EL ANIMAL CON EL NUMERO DE ETIQUETA YA EXISTE';
        END
        ELSE
        BEGIN
            INSERT INTO TB_ANIMAL (NUM_ETIQUETA, NOMBRE, ESPECIE, EDAD, HABITAT, FECHA_INGRESO)
            VALUES (@NUM_ETIQUETA, @NOMBRE, @ESPECIE, @EDAD, @HABITAT, GETUTCDATE());
            
            SET @IDRETURN = SCOPE_IDENTITY();
            SET @ERRORID = 0;
            SET @ERRORDESCRIPCION = '';
        END
    END TRY
    BEGIN CATCH
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_CAUSA]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INSERTAR_CAUSA]
    @DESCRIPCION_CAUSA NVARCHAR(MAX),
    @ErrorID INT OUTPUT,
    @ErrorDescripcion NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO TB_CAUSA (DESCRIPCION)
        VALUES (@DESCRIPCION_CAUSA);

        SET @ErrorID = 0;
        SET @ErrorDescripcion = '';
    END TRY
    BEGIN CATCH
        SET @ErrorID = ERROR_NUMBER();
        SET @ErrorDescripcion = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_HISTORIAL_MEDICO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_HISTORIAL_MEDICO]
(
	@ID_USUARIO int,
	@ID_ANIMAL int,
	@ID_CAUSA int,
	@DETALLES nvarchar(max),
	@IDRETURN int output,
	@ERRORID int output,
	@ERRORDESCRIPCION nvarchar(max) output
)
AS
BEGIN
	BEGIN TRY
		IF EXISTS (SELECT * FROM TB_USUARIO WHERE ID_USUARIO = @ID_USUARIO) -- validar primero si existe el usuario
			IF EXISTS (SELECT * FROM TB_ANIMAL WHERE ID_ANIMAL = @ID_ANIMAL) -- validar si existe el animal
				BEGIN
					INSERT INTO TB_HISTORIAL_MEDICO
					(
						ID_USUARIO,
						ID_ANIMAL,
						ID_CAUSA,
						DETALLES,
						FECHA_ATENCION
					)
					VALUES
					(
						@ID_USUARIO,
						@ID_ANIMAL,
						@ID_CAUSA,
						@DETALLES,
						GETUTCDATE()
					);

					set @idReturn = scope_identity();
					set @ERRORID = 0;
					set @ERRORDESCRIPCION = '';
				END

			ELSE
				--El animal no existe. Devolver error
				BEGIN
					SET @IDRETURN = -1;
					SET @ERRORID = 3; 
					SET @ERRORDESCRIPCION = 'ANIMAL NO EXISTE';
				END
		ELSE
			--El usuario no existe. Devolver error
			BEGIN
				SET @IDRETURN = -1;
				SET @ERRORID = 2;
				SET @ERRORDESCRIPCION = 'USUARIO NO REGISTRADO';
			END

	END TRY
	
	BEGIN CATCH
		set @idReturn = -1;
		set @errorId = ERROR_NUMBER();
		set @errorDescripcion = ERROR_MESSAGE();
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_INVENTARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_INVENTARIO]
    @ID_TIPO_PRODUCTO INT,
    @NOMBRE_PRODUCTO NVARCHAR(MAX),
	@IDRETURN int output,
    @ErrorID INT OUTPUT,
    @ErrorDescripcion NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO TB_INVENTARIO (ID_PRODUCTO, NOMBRE, FECHA_INGRESO)
        VALUES (@ID_TIPO_PRODUCTO, @NOMBRE_PRODUCTO, GETUTCDATE());

		SET @IDRETURN = SCOPE_IDENTITY();
        SET @ErrorID = 0;
        SET @ErrorDescripcion = '';
    END TRY
    BEGIN CATCH
		SET @IDRETURN = ERROR_NUMBER();
        SET @ErrorID = ERROR_NUMBER();
        SET @ErrorDescripcion = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_PRODUCTO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_PRODUCTO]
(
    @TIPO_PRODUCTO nvarchar(max),
    @IDRETURN int OUTPUT,
    @ERRORID int OUTPUT,
    @ERRORDESCRIPCION nvarchar(max) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        INSERT INTO TB_PRODUCTO (TIPO_PRODUCTO)
        VALUES (@TIPO_PRODUCTO);
        
        SET @IDRETURN = SCOPE_IDENTITY();
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';
    END TRY
    BEGIN CATCH
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_RELACION_HISTORIALMEDICO_INVENTARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INSERTAR_RELACION_HISTORIALMEDICO_INVENTARIO]
(
    @ID_HISTORIAL int,
	@ID_INVENTARIO int,
    @IDRETURN int OUTPUT,
    @ERRORID int OUTPUT,
    @ERRORDESCRIPCION nvarchar(max) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        INSERT INTO TB_TB_HISTORIAL_MEDICO (ID_HISTORIAL_MEDICO, ID_INVENTARIO)
        VALUES (@ID_HISTORIAL, @ID_INVENTARIO);
        
        SET @IDRETURN = SCOPE_IDENTITY();
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';
    END TRY
    BEGIN CATCH
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_TIPO_USUARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_TIPO_USUARIO]
(
    @DESCRIPCION_USUARIO nvarchar(max),
    @IDRETURN int OUTPUT,
    @ERRORID int OUTPUT,
    @ERRORDESCRIPCION nvarchar(max) OUTPUT
)
AS
BEGIN
    BEGIN TRY
        INSERT INTO TB_TIPO_USUARIO (DESCRIPCION)
        VALUES (@DESCRIPCION_USUARIO);
        
        SET @IDRETURN = SCOPE_IDENTITY();
        SET @ERRORID = 0;
        SET @ERRORDESCRIPCION = '';
    END TRY
    BEGIN CATCH
        SET @IDRETURN = -1;
        SET @ERRORID = ERROR_NUMBER();
        SET @ERRORDESCRIPCION = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_USUARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_USUARIO]
    @ID_USUARIO int,
	@TIPO_USUARIO int,
    @NOMBRE nvarchar(max),
    @APELLIDOS nvarchar(max),
    @CEDULA int,
	@TELEFONO int,
    @CORREO_ELECTRONICO nvarchar(max),
    @PASSWORD nvarchar(max),
	@IDRETURN int output,
    @ErrorID int OUTPUT,
    @ErrorDescripcion nvarchar(max) OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO TB_USUARIO(ID_USUARIO, ID_TIPO_USUARIO, NOMBRE, APELLIDOS, CEDULA, TELEFONO, CORREO_ELECTRONICO, PASSWORD, FECHA_INGRESO)
        VALUES (@ID_USUARIO, @TIPO_USUARIO, @NOMBRE, @APELLIDOS, @CEDULA, @TELEFONO, @CORREO_ELECTRONICO, @PASSWORD, GETUTCDATE());

		SET @IDRETURN = scope_identity();
        SET @ErrorID = 0;
        SET @ErrorDescripcion = '';
    END TRY
    BEGIN CATCH
		SET @IDRETURN =  scope_identity();
        SET @ErrorID = ERROR_NUMBER();
        SET @ErrorDescripcion = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_ANIMALES]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_ANIMALES]
AS
BEGIN
    SELECT *
    FROM TB_ANIMAL;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_CAUSA]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_CAUSA]
AS
BEGIN
    SELECT * FROM TB_CAUSA;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_HISTORIAL_MEDICO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_HISTORIAL_MEDICO]
AS
BEGIN
   
        -- Consultar todos los registros de la tabla TB_PUBLICACION
        SELECT 
			TB_HISTORIAL_MEDICO.ID_HISTORIAL_MEDICO,
			TB_HISTORIAL_MEDICO.ID_USUARIO,
			TB_HISTORIAL_MEDICO.ID_ANIMAL,
			TB_HISTORIAL_MEDICO.ID_CAUSA,
			TB_ANIMAL.NOMBRE,
			TB_ANIMAL.NUM_ETIQUETA,
			TB_CAUSA.DESCRIPCION,
			TB_HISTORIAL_MEDICO.DETALLES,
			TB_HISTORIAL_MEDICO.FECHA_ATENCION,
			TB_USUARIO.NOMBRE,
			TB_USUARIO.APELLIDOS
			
        FROM 
            TB_HISTORIAL_MEDICO
			INNER JOIN TB_USUARIO ON TB_HISTORIAL_MEDICO.ID_USUARIO = TB_USUARIO.ID_USUARIO
			INNER JOIN TB_ANIMAL ON TB_HISTORIAL_MEDICO.ID_ANIMAL = TB_ANIMAL.ID_ANIMAL
			INNER JOIN TB_CAUSA ON TB_HISTORIAL_MEDICO.ID_CAUSA = TB_CAUSA.ID_CAUSA
    
END
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_INVENTARIO]    Script Date: 16/06/2023 21:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_INVENTARIO]
AS
BEGIN
    SELECT 
		TB_INVENTARIO.ID_INVENTARIO,
		TB_PRODUCTO.ID_PRODUCTO,
		TB_PRODUCTO.TIPO_PRODUCTO,
		TB_INVENTARIO.NOMBRE,
		TB_INVENTARIO.FECHA_INGRESO
	FROM
		TB_INVENTARIO
		INNER JOIN TB_PRODUCTO ON TB_INVENTARIO.ID_PRODUCTO = TB_PRODUCTO.ID_PRODUCTO
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_PRODUCTO]    Script Date: 16/06/2023 21:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_PRODUCTO]
AS
BEGIN
      SELECT * FROM TB_PRODUCTO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_RELACION_HISTORIALMEDICO_INVENTARIO]    Script Date: 16/06/2023 21:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_RELACION_HISTORIALMEDICO_INVENTARIO]
AS
BEGIN
      SELECT 
		TB_RELACION_HISTORIALMEDICO_INVENTARIO.ID_HISTORIAL_MEDICO,
		TB_HISTORIAL_MEDICO.ID_CAUSA,
		TB_HISTORIAL_MEDICO.ID_ANIMAL,
		TB_INVENTARIO.ID_INVENTARIO,
		TB_PRODUCTO.ID_PRODUCTO,
		TB_CAUSA.DESCRIPCION,
		TB_HISTORIAL_MEDICO.DETALLES,
		TB_ANIMAL.NUM_ETIQUETA,
		TB_PRODUCTO.TIPO_PRODUCTO,
		TB_INVENTARIO.NOMBRE AS 'NOMBRE_MEDICAMENTO'
	  FROM
		TB_RELACION_HISTORIALMEDICO_INVENTARIO
		INNER JOIN TB_HISTORIAL_MEDICO ON TB_RELACION_HISTORIALMEDICO_INVENTARIO.ID_HISTORIAL_MEDICO = TB_HISTORIAL_MEDICO.ID_HISTORIAL_MEDICO
		INNER JOIN TB_CAUSA ON TB_HISTORIAL_MEDICO.ID_CAUSA = TB_CAUSA.ID_CAUSA
		INNER JOIN TB_ANIMAL ON TB_HISTORIAL_MEDICO.ID_ANIMAL = TB_ANIMAL.ID_ANIMAL
		INNER JOIN TB_INVENTARIO ON TB_RELACION_HISTORIALMEDICO_INVENTARIO.ID_INVENTARIO = TB_INVENTARIO.ID_INVENTARIO
		INNER JOIN TB_PRODUCTO ON TB_INVENTARIO.ID_PRODUCTO = TB_PRODUCTO.ID_PRODUCTO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_RESERVAS]    Script Date: 16/06/2023 21:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_RESERVAS]
AS
BEGIN
        SELECT * FROM TB_RESERVA
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_TIPO_USUARIO]    Script Date: 16/06/2023 21:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_TIPO_USUARIO]
AS
BEGIN
      SELECT * FROM TB_TIPO_USUARIO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_USUARIOS]    Script Date: 16/06/2023 21:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_USUARIOS]
AS
BEGIN
    SELECT
		TB_USUARIO.ID_USUARIO,
		TB_USUARIO.ID_TIPO_USUARIO,
		TB_TIPO_USUARIO.DESCRIPCION,
		TB_USUARIO.NOMBRE,
		TB_USUARIO.APELLIDOS,
		TB_USUARIO.CEDULA,
		TB_USUARIO.TELEFONO,
		TB_USUARIO.FECHA_INGRESO
	
	FROM
		TB_USUARIO
		INNER JOIN TB_TIPO_USUARIO ON TB_USUARIO.ID_TIPO_USUARIO = TB_TIPO_USUARIO.ID_TIPO_USUARIO
END;
GO
USE [master]
GO
ALTER DATABASE [bdZoologico] SET  READ_WRITE 
GO
