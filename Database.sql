USE [master]
GO
/****** Object:  Database [supershop]    Script Date: 4/30/2018 4:53:35 PM ******/
CREATE DATABASE [supershop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'supershop', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\supershop.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'supershop_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\supershop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [supershop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [supershop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [supershop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [supershop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [supershop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [supershop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [supershop] SET ARITHABORT OFF 
GO
ALTER DATABASE [supershop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [supershop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [supershop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [supershop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [supershop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [supershop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [supershop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [supershop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [supershop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [supershop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [supershop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [supershop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [supershop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [supershop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [supershop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [supershop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [supershop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [supershop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [supershop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [supershop] SET  MULTI_USER 
GO
ALTER DATABASE [supershop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [supershop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [supershop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [supershop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [supershop]
GO
/****** Object:  Table [dbo].[T_Category]    Script Date: 4/30/2018 4:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Category](
	[catID] [int] IDENTITY(100,1) NOT NULL,
	[catName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_Category] PRIMARY KEY CLUSTERED 
(
	[catID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Company]    Script Date: 4/30/2018 4:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Company](
	[ComID] [int] IDENTITY(1,1) NOT NULL,
	[ComName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_Company] PRIMARY KEY CLUSTERED 
(
	[ComID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Item]    Script Date: 4/30/2018 4:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[AvailableQuantity] [int] NULL,
 CONSTRAINT [PK_T_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_StockIn]    Script Date: 4/30/2018 4:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_StockIn](
	[StockinID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[Stockin] [int] NOT NULL,
 CONSTRAINT [PK_T_StockIn] PRIMARY KEY CLUSTERED 
(
	[StockinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_StockOut]    Script Date: 4/30/2018 4:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_StockOut](
	[StockOutID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[StockOutQuantity] [int] NOT NULL,
	[StockOutCategory] [varchar](50) NOT NULL,
	[StockOutDate] [date] NOT NULL,
 CONSTRAINT [PK_T_StockOut] PRIMARY KEY CLUSTERED 
(
	[StockOutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_Category] ON 

INSERT [dbo].[T_Category] ([catID], [catName]) VALUES (100, N'Sports')
INSERT [dbo].[T_Category] ([catID], [catName]) VALUES (101, N'Mobile')
INSERT [dbo].[T_Category] ([catID], [catName]) VALUES (102, N'Laptop')
INSERT [dbo].[T_Category] ([catID], [catName]) VALUES (103, N'Tab')
INSERT [dbo].[T_Category] ([catID], [catName]) VALUES (104, N'HardDisk')
INSERT [dbo].[T_Category] ([catID], [catName]) VALUES (105, N'Processor')
SET IDENTITY_INSERT [dbo].[T_Category] OFF
SET IDENTITY_INSERT [dbo].[T_Company] ON 

INSERT [dbo].[T_Company] ([ComID], [ComName]) VALUES (1, N'Intel')
INSERT [dbo].[T_Company] ([ComID], [ComName]) VALUES (2, N'Samsung')
INSERT [dbo].[T_Company] ([ComID], [ComName]) VALUES (3, N'Walton')
INSERT [dbo].[T_Company] ([ComID], [ComName]) VALUES (4, N'Asus')
INSERT [dbo].[T_Company] ([ComID], [ComName]) VALUES (5, N'Adidas')
INSERT [dbo].[T_Company] ([ComID], [ComName]) VALUES (6, N'')
SET IDENTITY_INSERT [dbo].[T_Company] OFF
SET IDENTITY_INSERT [dbo].[T_Item] ON 

INSERT [dbo].[T_Item] ([ID], [CompanyID], [CategoryID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (1, 3, 101, N'Primo F2', 10, 19)
INSERT [dbo].[T_Item] ([ID], [CompanyID], [CategoryID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (2, 3, 101, N'Primo F3', 10, 23)
INSERT [dbo].[T_Item] ([ID], [CompanyID], [CategoryID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (3, 2, 101, N'J2', 10, 50)
INSERT [dbo].[T_Item] ([ID], [CompanyID], [CategoryID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (4, 5, 100, N'Football', 15, 77)
INSERT [dbo].[T_Item] ([ID], [CompanyID], [CategoryID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (6, 3, 101, N'GH', 15, 33)
INSERT [dbo].[T_Item] ([ID], [CompanyID], [CategoryID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (7, 2, 103, N'Note', 22, 28)
INSERT [dbo].[T_Item] ([ID], [CompanyID], [CategoryID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (8, 2, 101, N'J1', 5, 27)
INSERT [dbo].[T_Item] ([ID], [CompanyID], [CategoryID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (9, 1, 105, N'i3', 20, 13)
INSERT [dbo].[T_Item] ([ID], [CompanyID], [CategoryID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (10, 1, 105, N'i5', 22, 33)
INSERT [dbo].[T_Item] ([ID], [CompanyID], [CategoryID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (11, 1, 105, N'i7', 15, 774)
INSERT [dbo].[T_Item] ([ID], [CompanyID], [CategoryID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (12, 4, 102, N'Laptop', 30, 60)
SET IDENTITY_INSERT [dbo].[T_Item] OFF
ALTER TABLE [dbo].[T_Item]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[T_Category] ([catID])
GO
ALTER TABLE [dbo].[T_Item]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [dbo].[T_Company] ([ComID])
GO
ALTER TABLE [dbo].[T_StockOut]  WITH CHECK ADD  CONSTRAINT [FK_T_StockOut_T_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[T_Item] ([ID])
GO
ALTER TABLE [dbo].[T_StockOut] CHECK CONSTRAINT [FK_T_StockOut_T_Item]
GO
USE [master]
GO
ALTER DATABASE [supershop] SET  READ_WRITE 
GO
