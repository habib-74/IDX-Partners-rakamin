USE [master]
GO
/****** Object:  Database [DWH_Project]    Script Date: 03/09/2023 18:45:28 ******/
CREATE DATABASE [DWH_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DWH_Project', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DWH_Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DWH_Project_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DWH_Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DWH_Project] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DWH_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DWH_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DWH_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DWH_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DWH_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DWH_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [DWH_Project] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DWH_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DWH_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DWH_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DWH_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DWH_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DWH_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DWH_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DWH_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DWH_Project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DWH_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DWH_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DWH_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DWH_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DWH_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DWH_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DWH_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DWH_Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DWH_Project] SET  MULTI_USER 
GO
ALTER DATABASE [DWH_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DWH_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DWH_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DWH_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DWH_Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DWH_Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DWH_Project] SET QUERY_STORE = ON
GO
ALTER DATABASE [DWH_Project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DWH_Project]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 03/09/2023 18:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[NoHp] [varchar](50) NOT NULL,
 CONSTRAINT [PKCustomerID] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 03/09/2023 18:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](225) NOT NULL,
	[ProductCategory] [varchar](225) NOT NULL,
	[ProductUnitPrice] [int] NOT NULL,
 CONSTRAINT [PKProductID] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStatusOrder]    Script Date: 03/09/2023 18:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStatusOrder](
	[StatusID] [int] NOT NULL,
	[StatusOrder] [varchar](50) NOT NULL,
	[StatusOrderDesc] [varchar](50) NOT NULL,
 CONSTRAINT [PKStatusID] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSalesOrder]    Script Date: 03/09/2023 18:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSalesOrder](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
 CONSTRAINT [PKOrderID] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactSalesOrder]  WITH CHECK ADD  CONSTRAINT [FKCustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[DimCustomer] ([CustomerID])
GO
ALTER TABLE [dbo].[FactSalesOrder] CHECK CONSTRAINT [FKCustomerID]
GO
ALTER TABLE [dbo].[FactSalesOrder]  WITH CHECK ADD  CONSTRAINT [FKProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[DimProduct] ([ProductID])
GO
ALTER TABLE [dbo].[FactSalesOrder] CHECK CONSTRAINT [FKProductID]
GO
ALTER TABLE [dbo].[FactSalesOrder]  WITH CHECK ADD  CONSTRAINT [FKStatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[DimStatusOrder] ([StatusID])
GO
ALTER TABLE [dbo].[FactSalesOrder] CHECK CONSTRAINT [FKStatusID]
GO
/****** Object:  StoredProcedure [dbo].[summary_order_status]    Script Date: 03/09/2023 18:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[summary_order_status] @StatusID int AS
BEGIN
	SELECT
	fo.OrderID,
	dc.CustomerName,
	dp.ProductName,
	fo.Quantity,
	ds.StatusOrder
	FROM
		FactSalesOrder AS fo
	JOIN
		DimCustomer AS dc
			ON fo.CustomerID = dc.CustomerID
	JOIN
		DimProduct AS dp
			ON fo.ProductID = dp.ProductID
	JOIN
		DimStatusOrder AS ds
			ON fo.StatusID = ds.StatusID
		WHERE ds.StatusID = @StatusID
	END;
GO
USE [master]
GO
ALTER DATABASE [DWH_Project] SET  READ_WRITE 
GO
