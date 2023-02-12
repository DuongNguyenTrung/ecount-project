USE [master]
GO
/****** Object:  Database [SWP_Ecount]    Script Date: 2/6/2023 10:31:42 PM ******/
CREATE DATABASE [SWP_Ecount]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP_Ecount', FILENAME = N'E:\Program\SQLServer\MSSQL15.SQLEXPRESS\MSSQL\DATA\SWP_Ecount.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP_Ecount_log', FILENAME = N'E:\Program\SQLServer\MSSQL15.SQLEXPRESS\MSSQL\DATA\SWP_Ecount_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWP_Ecount] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP_Ecount].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP_Ecount] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP_Ecount] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP_Ecount] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP_Ecount] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP_Ecount] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP_Ecount] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP_Ecount] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP_Ecount] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP_Ecount] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP_Ecount] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP_Ecount] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP_Ecount] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP_Ecount] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP_Ecount] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP_Ecount] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWP_Ecount] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP_Ecount] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP_Ecount] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP_Ecount] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP_Ecount] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP_Ecount] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP_Ecount] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP_Ecount] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP_Ecount] SET  MULTI_USER 
GO
ALTER DATABASE [SWP_Ecount] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP_Ecount] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP_Ecount] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP_Ecount] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP_Ecount] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP_Ecount] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP_Ecount] SET QUERY_STORE = OFF
GO
USE [SWP_Ecount]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 2/6/2023 10:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[bank_id] [int] NOT NULL,
	[bank_name] [varchar](50) NULL,
	[img] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[bank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/6/2023 10:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] NOT NULL,
	[category_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Debit]    Script Date: 2/6/2023 10:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Debit](
	[debit_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[debtor_id] [int] NOT NULL,
	[amount] [bigint] NOT NULL,
	[repayment_term] [datetime] NOT NULL,
	[note] [nvarchar](200) NULL,
	[img] [varchar](200) NULL,
	[status] [bit] NULL,
	[create_date] [datetime] NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_Debit] PRIMARY KEY CLUSTERED 
(
	[debit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Debtor]    Script Date: 2/6/2023 10:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Debtor](
	[debtor_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[phone] [varchar](11) NULL,
	[email] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[status] [bit] NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_Debtor] PRIMARY KEY CLUSTERED 
(
	[debtor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LinkedBank]    Script Date: 2/6/2023 10:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkedBank](
	[id] [int] NOT NULL,
	[user_id] [int] NULL,
	[bank_id] [int] NULL,
	[account_number] [varchar](30) NULL,
	[balance] [int] NULL,
	[create_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/6/2023 10:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[pakage_id] [int] NULL,
	[amount] [float] NULL,
	[deadline] [datetime] NULL,
	[create_date] [datetime] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 2/6/2023 10:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[pakage_id] [int] NOT NULL,
	[supplier_id] [int] NULL,
	[category_id] [int] NULL,
	[months] [tinyint] NULL,
	[interest_rate_per_month] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[pakage_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 2/6/2023 10:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[slider_id] [int] NOT NULL,
	[content] [varchar](max) NULL,
	[title] [varchar](100) NULL,
	[img] [varchar](200) NULL,
	[status] [bit] NULL,
	[create_date] [datetime] NULL,
	[update_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[slider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2/6/2023 10:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[supplier_id] [int] NOT NULL,
	[supplier_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/6/2023 10:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullname] [varchar](50) NULL,
	[gender] [bit] NULL,
	[email] [varchar](60) NULL,
	[address] [varchar](80) NULL,
	[phone] [varchar](11) NULL,
	[role] [tinyint] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__Users__B9BE370FA57530C0] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Debit] ADD  CONSTRAINT [DF_Debit_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Debtor] ADD  CONSTRAINT [DF_Debtor_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [DF_Slider_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_role]  DEFAULT ((1)) FOR [role]
GO
ALTER TABLE [dbo].[Debit]  WITH CHECK ADD  CONSTRAINT [FK_Debit_Debtor] FOREIGN KEY([debtor_id])
REFERENCES [dbo].[Debtor] ([debtor_id])
GO
ALTER TABLE [dbo].[Debit] CHECK CONSTRAINT [FK_Debit_Debtor]
GO
ALTER TABLE [dbo].[Debit]  WITH CHECK ADD  CONSTRAINT [FK_Debit_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Debit] CHECK CONSTRAINT [FK_Debit_Users]
GO
ALTER TABLE [dbo].[LinkedBank]  WITH CHECK ADD  CONSTRAINT [fk_bank_linkedbank] FOREIGN KEY([bank_id])
REFERENCES [dbo].[Bank] ([bank_id])
GO
ALTER TABLE [dbo].[LinkedBank] CHECK CONSTRAINT [fk_bank_linkedbank]
GO
ALTER TABLE [dbo].[LinkedBank]  WITH CHECK ADD  CONSTRAINT [fk_linkedbank_userid] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[LinkedBank] CHECK CONSTRAINT [fk_linkedbank_userid]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_order_userid] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_order_userid]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_package_order] FOREIGN KEY([pakage_id])
REFERENCES [dbo].[Package] ([pakage_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_package_order]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [fk_category_pakage] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [fk_category_pakage]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [fk_supplier_package] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Supplier] ([supplier_id])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [fk_supplier_package]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD CHECK  (([interest_rate_per_month]<(10)))
GO
USE [master]
GO
ALTER DATABASE [SWP_Ecount] SET  READ_WRITE 
GO
