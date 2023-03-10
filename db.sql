USE [master]
GO
/****** Object:  Database [SWP_Ecount]    Script Date: 2/19/2023 11:03:56 AM ******/
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
/****** Object:  Table [dbo].[Debit]    Script Date: 2/19/2023 11:03:56 AM ******/
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
/****** Object:  Table [dbo].[Debtor]    Script Date: 2/19/2023 11:03:56 AM ******/
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
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_Debtor] PRIMARY KEY CLUSTERED 
(
	[debtor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/19/2023 11:03:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](300) NOT NULL,
	[fullname] [varchar](50) NULL,
	[gender] [bit] NULL,
	[email] [varchar](60) NULL,
	[address] [varchar](80) NULL,
	[phone] [varchar](11) NULL,
	[role] [tinyint] NULL,
	[status] [bit] NULL,
	[verify_token] [varchar](30) NULL,
 CONSTRAINT [PK__Users__B9BE370FA57530C0] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 2/19/2023 11:03:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users] ON [dbo].[Users]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Debit] ADD  CONSTRAINT [DF_Debit_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Debtor] ADD  CONSTRAINT [DF_Debtor_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Debtor] ADD  CONSTRAINT [DF_Debtor_update_date]  DEFAULT (getdate()) FOR [update_date]
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
USE [master]
GO
ALTER DATABASE [SWP_Ecount] SET  READ_WRITE 
GO
