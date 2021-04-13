USE [master]
GO
/****** Object:  Database [CC]    Script Date: 13/04/2021 09:38:32 ******/
CREATE DATABASE [CC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CC] SET ARITHABORT OFF 
GO
ALTER DATABASE [CC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CC] SET  MULTI_USER 
GO
ALTER DATABASE [CC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CC] SET QUERY_STORE = OFF
GO
USE [CC]
GO
/****** Object:  Table [dbo].[Bien]    Script Date: 13/04/2021 09:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bien](
	[IdBien] [int] IDENTITY(1,1) NOT NULL,
	[NomBien] [varchar](50) NOT NULL,
	[DateBien] [datetime] NOT NULL,
	[IdProprietaire] [int] NULL,
 CONSTRAINT [PK_Bien] PRIMARY KEY CLUSTERED 
(
	[IdBien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proprietaire]    Script Date: 13/04/2021 09:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proprietaire](
	[IdProprietaire] [int] IDENTITY(1,1) NOT NULL,
	[NomProprietaire] [varchar](50) NOT NULL,
	[DateProprietaire] [datetime] NOT NULL,
 CONSTRAINT [PK_Proprietaire] PRIMARY KEY CLUSTERED 
(
	[IdProprietaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bien] ADD  CONSTRAINT [DF_Bien_DateBien]  DEFAULT (getdate()) FOR [DateBien]
GO
ALTER TABLE [dbo].[Proprietaire] ADD  CONSTRAINT [DF_Proprietaire_DateProprietaire]  DEFAULT (getdate()) FOR [DateProprietaire]
GO
ALTER TABLE [dbo].[Bien]  WITH CHECK ADD  CONSTRAINT [FK_Bien_Proprietaire] FOREIGN KEY([IdProprietaire])
REFERENCES [dbo].[Proprietaire] ([IdProprietaire])
GO
ALTER TABLE [dbo].[Bien] CHECK CONSTRAINT [FK_Bien_Proprietaire]
GO
USE [master]
GO
ALTER DATABASE [CC] SET  READ_WRITE 
GO
