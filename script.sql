
CREATE DATABASE [mg1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mg', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\mg1.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mg_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\mg1_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mg1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mg1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mg1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mg1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mg1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mg1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mg1] SET ARITHABORT OFF 
GO
ALTER DATABASE [mg1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mg1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [mg1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mg1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mg1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mg1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mg1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mg1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mg1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mg1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mg1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mg1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mg1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mg1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mg1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mg1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mg1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mg1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mg1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mg1] SET  MULTI_USER 
GO
ALTER DATABASE [mg1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mg1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mg1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mg1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [mg1]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 30.01.2024 10:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id_Cat] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Id_Products] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id_Cat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 30.01.2024 10:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id_prod] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id_prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 30.01.2024 10:13:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id_uesr] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id_uesr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Products] FOREIGN KEY([Id_Products])
REFERENCES [dbo].[Products] ([Id_prod])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Products]
GO
USE [master]
GO
ALTER DATABASE [mg1] SET  READ_WRITE 
GO
