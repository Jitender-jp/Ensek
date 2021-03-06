USE [master]
GO
/****** Object:  Database [EnsekDB]    Script Date: 11/01/2022 2:47:45 PM ******/
CREATE DATABASE [EnsekDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnsekDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EnsekDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EnsekDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EnsekDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EnsekDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnsekDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnsekDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnsekDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnsekDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnsekDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnsekDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnsekDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EnsekDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnsekDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnsekDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnsekDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnsekDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnsekDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnsekDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnsekDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnsekDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EnsekDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnsekDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnsekDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnsekDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnsekDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnsekDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EnsekDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnsekDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EnsekDB] SET  MULTI_USER 
GO
ALTER DATABASE [EnsekDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnsekDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnsekDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnsekDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EnsekDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EnsekDB] SET QUERY_STORE = OFF
GO
USE [EnsekDB]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/01/2022 2:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[AccountId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterReading]    Script Date: 11/01/2022 2:47:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterReading](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[MeterReadDate] [datetime] NOT NULL,
	[MeterReadValue] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2344, N'Tommy', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2233, N'Barry', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (8766, N'Sally', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2345, N'Jerry', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2346, N'Ollie', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2347, N'Tara', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2348, N'Tammy', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2349, N'Simon', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2350, N'Colin', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2351, N'Gladys', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2352, N'Greg', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2353, N'Tony', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2355, N'Arthur', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (2356, N'Craig', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (6776, N'Laura', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (4534, N'JOSH', N'TEST')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (1234, N'Freya', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (1239, N'Noddy', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (1240, N'Archie', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (1241, N'Lara', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (1242, N'Tim', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (1243, N'Graham', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (1244, N'Tony', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (1245, N'Neville', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (1246, N'Jo', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (1247, N'Jim', N'Test')
INSERT [dbo].[Customer] ([AccountId], [FirstName], [LastName]) VALUES (1248, N'Pam', N'Test')
USE [master]
GO
ALTER DATABASE [EnsekDB] SET  READ_WRITE 
GO
