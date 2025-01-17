USE [master]
GO
/****** Object:  Database [ecom]    Script Date: 01-03-2021 01:41:59 ******/
CREATE DATABASE [ecom]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecom', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ecom.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ecom_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ecom_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ecom] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecom].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecom] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecom] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecom] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecom] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecom] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecom] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ecom] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ecom] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecom] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecom] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecom] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecom] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecom] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecom] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecom] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ecom] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecom] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecom] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecom] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecom] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecom] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ecom] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecom] SET RECOVERY FULL 
GO
ALTER DATABASE [ecom] SET  MULTI_USER 
GO
ALTER DATABASE [ecom] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecom] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ecom] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ecom] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ecom] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ecom] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ecom', N'ON'
GO
ALTER DATABASE [ecom] SET QUERY_STORE = OFF
GO
USE [ecom]
GO


/****** Object:  Table [dbo].[brands]    Script Date: 01-03-2021 01:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[brand_id] [int] NOT NULL,
	[brand_title] [text] NOT NULL,
	[brand_description] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



/****** Object:  Table [dbo].[cart]    Script Date: 01-03-2021 01:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [int] NOT NULL,
	[username] [varchar](200) NOT NULL,
	[product_id] [int] NOT NULL,
	[ip_address] [varchar](100) NOT NULL,
	[product_title] [varchar](200) NOT NULL,
	[product_image] [text] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
	[total_amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[categories]    Script Date: 01-03-2021 01:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[cat_id] [int] NOT NULL,
	[cat_title] [text] NOT NULL,
	[category_description] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[order_items]    Script Date: 01-03-2021 01:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_price] [int] NOT NULL,
	[product_quantity] [int] NOT NULL,
	[flag] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[orders]    Script Date: 01-03-2021 01:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] NOT NULL,
	[username] [varchar](200) NOT NULL,
	[total_amount] [int] NOT NULL,
	[order_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[products]    Script Date: 01-03-2021 01:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] NOT NULL,
	[product_cat] [int] NOT NULL,
	[product_title] [varchar](100) NOT NULL,
	[product_price] [varchar](100) NOT NULL,
	[product_img] [text] NOT NULL,
	[product_keywords] [varchar](200) NOT NULL,
	[product_brand] [int] NOT NULL,
	[product_quantity] [varchar](200) NOT NULL,
	[product_flag] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



/****** Object:  Table [dbo].[users]    Script Date: 01-03-2021 01:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](200) NOT NULL,
	[first_name] [varchar](200) NOT NULL,
	[last_name] [varchar](200) NOT NULL,
	[email] [varchar](200) NOT NULL,
	[password] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [dbo].[order_items] ADD  DEFAULT ('1') FOR [flag]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ('1') FOR [product_flag]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([product_cat])
REFERENCES [dbo].[categories] ([cat_id])
GO
USE [master]
GO
ALTER DATABASE [ecom] SET  READ_WRITE 
GO
