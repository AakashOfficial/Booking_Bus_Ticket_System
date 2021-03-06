USE [master]
GO
/****** Object:  Database [BookingBusTicketSystem]    Script Date: 8/9/2018 10:00:56 AM ******/
CREATE DATABASE [BookingBusTicketSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingBusTicketSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BookingBusTicketSystem.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookingBusTicketSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BookingBusTicketSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BookingBusTicketSystem] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookingBusTicketSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookingBusTicketSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookingBusTicketSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookingBusTicketSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookingBusTicketSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookingBusTicketSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [BookingBusTicketSystem] SET  MULTI_USER 
GO
ALTER DATABASE [BookingBusTicketSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookingBusTicketSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookingBusTicketSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookingBusTicketSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookingBusTicketSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookingBusTicketSystem', N'ON'
GO
ALTER DATABASE [BookingBusTicketSystem] SET QUERY_STORE = OFF
GO
USE [BookingBusTicketSystem]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BookingBusTicketSystem]
GO
/****** Object:  Schema [Booking]    Script Date: 8/9/2018 10:00:56 AM ******/
CREATE SCHEMA [Booking]
GO
/****** Object:  Schema [Bus]    Script Date: 8/9/2018 10:00:56 AM ******/
CREATE SCHEMA [Bus]
GO
/****** Object:  Schema [Customer]    Script Date: 8/9/2018 10:00:56 AM ******/
CREATE SCHEMA [Customer]
GO
/****** Object:  Schema [Employee]    Script Date: 8/9/2018 10:00:56 AM ******/
CREATE SCHEMA [Employee]
GO
/****** Object:  FullTextCatalog [BBTSFullTextSearch]    Script Date: 8/9/2018 10:00:56 AM ******/
CREATE FULLTEXT CATALOG [BBTSFullTextSearch] WITH ACCENT_SENSITIVITY = OFF
AS DEFAULT
GO
/****** Object:  Table [Booking].[Booking]    Script Date: 8/9/2018 10:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Booking].[Booking](
	[Booking_ID] [int] IDENTITY(1,1) NOT NULL,
	[Schedule_ID] [int] NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[BookingDate] [datetime] NULL,
	[DateStart] [date] NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Booking_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Booking].[Detail]    Script Date: 8/9/2018 10:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Booking].[Detail](
	[Booking_ID] [int] NOT NULL,
	[Seat] [int] NOT NULL,
 CONSTRAINT [PK_Detail] PRIMARY KEY CLUSTERED 
(
	[Booking_ID] ASC,
	[Seat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Bus].[Bus]    Script Date: 8/9/2018 10:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Bus].[Bus](
	[Bus_ID] [int] IDENTITY(1,1) NOT NULL,
	[NumberPlate] [varchar](20) NOT NULL,
	[BusType_ID] [int] NOT NULL,
	[SeatNum] [int] NOT NULL,
	[Driver_ID] [int] NOT NULL,
	[Emp_ID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Bus] PRIMARY KEY CLUSTERED 
(
	[Bus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Bus].[BusType]    Script Date: 8/9/2018 10:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Bus].[BusType](
	[Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NULL,
 CONSTRAINT [PK_BusType] PRIMARY KEY CLUSTERED 
(
	[Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Bus].[History]    Script Date: 8/9/2018 10:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Bus].[History](
	[OldBus_ID] [int] NOT NULL,
	[NewBus_ID] [int] NOT NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[OldBus_ID] ASC,
	[NewBus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Bus].[Schedule]    Script Date: 8/9/2018 10:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Bus].[Schedule](
	[Schedule_ID] [int] IDENTITY(1,1) NOT NULL,
	[Bus_ID] [int] NOT NULL,
	[TimeStart] [char](5) NOT NULL,
	[StartPlace] [int] NOT NULL,
	[FinishPlace] [int] NOT NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Schedule_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Customer].[Customer]    Script Date: 8/9/2018 10:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](100) NOT NULL,
	[Password] [varchar](50) NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Place]    Script Date: 8/9/2018 10:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Place](
	[Place_ID] [int] IDENTITY(1,1) NOT NULL,
	[PlaceName] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Place] PRIMARY KEY CLUSTERED 
(
	[Place_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Employee].[Account]    Script Date: 8/9/2018 10:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[Account](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Employee_ID] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Employee].[Employee]    Script Date: 8/9/2018 10:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[Employee](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[Email] [varchar](100) NULL,
	[IDNumber] [varchar](50) NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Manager_ID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Employee].[Employee_Role]    Script Date: 8/9/2018 10:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[Employee_Role](
	[Employee_ID] [int] NOT NULL,
	[Role_ID] [int] NOT NULL,
	[DateEdit] [datetime] NULL,
 CONSTRAINT [PK_Employee_Role] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC,
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Employee].[PhoneNumber]    Script Date: 8/9/2018 10:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[PhoneNumber](
	[Employee_ID] [int] NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PhoneNumber] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC,
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Employee].[Role]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee].[Role](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Booking].[Booking] ON 

INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (1, 1, 1, CAST(N'2018-06-28T16:00:02.320' AS DateTime), CAST(N'2018-07-01' AS Date), NULL, 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (3, 2, 7, CAST(N'2018-08-05T16:00:47.957' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (4, 3, 1, CAST(N'2018-07-02T09:29:37.703' AS DateTime), CAST(N'2018-07-02' AS Date), NULL, 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (6, 1, 1, CAST(N'2018-08-02T09:29:58.330' AS DateTime), CAST(N'2018-08-04' AS Date), NULL, 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (7, 2, 1, CAST(N'2018-08-02T09:30:14.937' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (8, 3, 1, CAST(N'2018-08-02T09:30:26.260' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (9, 1, 1, CAST(N'2018-08-02T09:30:44.540' AS DateTime), CAST(N'2018-08-07' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (10, 1, 1, CAST(N'2018-08-02T09:30:56.160' AS DateTime), CAST(N'2018-08-08' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (11, 2, 1, CAST(N'2018-08-02T09:31:17.410' AS DateTime), CAST(N'2018-08-09' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (12, 3, 1, CAST(N'2018-07-28T09:31:26.513' AS DateTime), CAST(N'2018-08-02' AS Date), NULL, 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (13, 2, 1, CAST(N'2018-08-02T09:31:40.120' AS DateTime), CAST(N'2018-09-10' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (14, 3, 1, CAST(N'2018-08-02T09:31:56.703' AS DateTime), CAST(N'2018-09-12' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (16, 1, 7, CAST(N'2018-08-02T13:16:23.217' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (19, 3, 8, CAST(N'2018-08-02T13:16:47.013' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (20, 2, 18, CAST(N'2018-08-02T13:17:04.150' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (21, 6, 1, CAST(N'2018-08-02T13:17:28.770' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (22, 3, 7, CAST(N'2018-08-02T13:18:04.720' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (23, 3, 18, CAST(N'2018-08-02T13:18:27.540' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (24, 3, 1, CAST(N'2018-08-02T13:18:42.130' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (25, 2, 1, CAST(N'2018-08-02T13:19:01.900' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (26, 2, 8, CAST(N'2018-08-02T13:19:17.640' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (27, 6, 7, CAST(N'2018-08-02T13:19:34.563' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (28, 6, 18, CAST(N'2018-08-02T13:19:49.227' AS DateTime), CAST(N'2018-08-06' AS Date), NULL, 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (33, 1, 1, CAST(N'2018-08-04T01:00:55.913' AS DateTime), CAST(N'2018-08-07' AS Date), N'', 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (34, 3, 1, CAST(N'2018-08-04T01:04:41.610' AS DateTime), CAST(N'2018-08-08' AS Date), N'', 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (35, 3, 1, CAST(N'2018-08-05T00:02:14.667' AS DateTime), CAST(N'2018-08-06' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (36, 2, 1, CAST(N'2018-08-05T00:04:37.407' AS DateTime), CAST(N'2018-08-06' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (37, 2, 1, CAST(N'2018-08-05T00:05:37.963' AS DateTime), CAST(N'2018-08-06' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (38, 3, 1, CAST(N'2018-08-05T01:16:58.363' AS DateTime), CAST(N'2018-08-06' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (39, 3, 26, CAST(N'2018-08-05T19:17:13.723' AS DateTime), CAST(N'2018-08-07' AS Date), N'Kèm thú cưng', 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (40, 3, 8, CAST(N'2018-08-05T20:27:21.230' AS DateTime), CAST(N'2018-08-06' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (41, 2, 8, CAST(N'2018-08-05T20:31:04.390' AS DateTime), CAST(N'2018-08-06' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (42, 1, 29, CAST(N'2018-08-05T22:19:15.943' AS DateTime), CAST(N'2018-08-05' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (43, 6, 31, CAST(N'2018-08-05T22:27:29.787' AS DateTime), CAST(N'2018-08-07' AS Date), N'', 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (44, 2, 26, CAST(N'2018-08-06T09:48:21.753' AS DateTime), CAST(N'2018-08-07' AS Date), N'', 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (45, 2, 1, CAST(N'2018-08-06T10:55:11.470' AS DateTime), CAST(N'2018-08-07' AS Date), N'', 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (46, 6, 36, CAST(N'2018-08-07T09:20:01.643' AS DateTime), CAST(N'2018-08-08' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (47, 6, 36, CAST(N'2018-08-07T09:21:10.387' AS DateTime), CAST(N'2018-08-08' AS Date), N'', 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (48, 1, 1, CAST(N'2018-08-07T09:47:33.463' AS DateTime), CAST(N'2018-08-08' AS Date), N'', 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (49, 1, 1, CAST(N'2018-08-09T08:24:41.393' AS DateTime), CAST(N'2018-08-11' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (50, 6, 1, CAST(N'2018-08-09T08:25:32.557' AS DateTime), CAST(N'2018-08-11' AS Date), N'', 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (51, 2, 1, CAST(N'2018-08-09T08:25:48.213' AS DateTime), CAST(N'2018-08-11' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (52, 2, 1, CAST(N'2018-08-09T08:26:12.820' AS DateTime), CAST(N'2018-08-11' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (53, 3, 1, CAST(N'2018-08-09T08:26:34.913' AS DateTime), CAST(N'2018-08-11' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (54, 3, 1, CAST(N'2018-08-09T08:27:33.030' AS DateTime), CAST(N'2018-08-11' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (55, 2, 1, CAST(N'2018-08-09T08:28:37.813' AS DateTime), CAST(N'2018-08-11' AS Date), N'', 0)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (56, 2, 7, CAST(N'2018-08-09T08:38:08.757' AS DateTime), CAST(N'2018-08-11' AS Date), N'', 1)
INSERT [Booking].[Booking] ([Booking_ID], [Schedule_ID], [Customer_ID], [BookingDate], [DateStart], [Description], [Status]) VALUES (57, 3, 7, CAST(N'2018-08-09T08:38:37.470' AS DateTime), CAST(N'2018-08-11' AS Date), N'', 1)
SET IDENTITY_INSERT [Booking].[Booking] OFF
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (1, 2)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (3, 4)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (3, 5)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (4, 6)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (4, 7)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (6, 1)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (6, 7)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (7, 7)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (8, 7)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (8, 9)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (9, 7)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (10, 1)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (11, 4)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (11, 23)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (12, 12)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (13, 32)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (14, 6)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (14, 21)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (16, 1)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (19, 1)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (19, 2)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (20, 5)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (21, 7)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (21, 32)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (22, 12)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (23, 4)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (24, 19)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (25, 11)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (26, 4)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (26, 6)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (27, 5)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (27, 29)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (28, 3)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (33, 2)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (33, 19)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (34, 6)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (34, 18)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (35, 8)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (36, 24)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (36, 41)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (37, 24)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (37, 41)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (38, 6)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (39, 1)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (39, 6)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (40, 25)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (41, 30)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (42, 1)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (43, 1)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (44, 1)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (44, 20)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (44, 21)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (44, 24)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (44, 39)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (44, 44)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (45, 32)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (45, 33)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (46, 22)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (46, 25)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (46, 26)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (47, 27)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (48, 32)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (49, 2)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (49, 21)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (49, 24)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (50, 3)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (50, 5)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (50, 8)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (50, 10)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (51, 1)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (51, 14)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (51, 17)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (51, 19)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (51, 20)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (51, 41)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (52, 24)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (52, 37)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (52, 39)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (53, 1)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (53, 4)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (53, 6)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (53, 7)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (54, 13)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (54, 14)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (55, 32)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (56, 26)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (56, 32)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (57, 18)
INSERT [Booking].[Detail] ([Booking_ID], [Seat]) VALUES (57, 22)
SET IDENTITY_INSERT [Bus].[Bus] ON 

INSERT [Bus].[Bus] ([Bus_ID], [NumberPlate], [BusType_ID], [SeatNum], [Driver_ID], [Emp_ID], [Status]) VALUES (1, N'49B1-28298', 1, 46, 4, 5, 1)
INSERT [Bus].[Bus] ([Bus_ID], [NumberPlate], [BusType_ID], [SeatNum], [Driver_ID], [Emp_ID], [Status]) VALUES (2, N'49G1-27272', 2, 29, 4, 5, 1)
SET IDENTITY_INSERT [Bus].[Bus] OFF
SET IDENTITY_INSERT [Bus].[BusType] ON 

INSERT [Bus].[BusType] ([Type_ID], [TypeName]) VALUES (1, N'Giường Nằm')
INSERT [Bus].[BusType] ([Type_ID], [TypeName]) VALUES (2, N'Ghế Ngồi')
INSERT [Bus].[BusType] ([Type_ID], [TypeName]) VALUES (3, N'Ghế Nằm')
SET IDENTITY_INSERT [Bus].[BusType] OFF
SET IDENTITY_INSERT [Bus].[Schedule] ON 

INSERT [Bus].[Schedule] ([Schedule_ID], [Bus_ID], [TimeStart], [StartPlace], [FinishPlace], [Price]) VALUES (1, 1, N'07:00', 1, 2, 200000.0000)
INSERT [Bus].[Schedule] ([Schedule_ID], [Bus_ID], [TimeStart], [StartPlace], [FinishPlace], [Price]) VALUES (2, 1, N'14:00', 2, 1, 20000.0000)
INSERT [Bus].[Schedule] ([Schedule_ID], [Bus_ID], [TimeStart], [StartPlace], [FinishPlace], [Price]) VALUES (3, 2, N'08:00', 2, 1, 150000.0000)
INSERT [Bus].[Schedule] ([Schedule_ID], [Bus_ID], [TimeStart], [StartPlace], [FinishPlace], [Price]) VALUES (6, 2, N'15:00', 1, 2, 150000.0000)
SET IDENTITY_INSERT [Bus].[Schedule] OFF
SET IDENTITY_INSERT [Customer].[Customer] ON 

INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (1, N'customer001@gmail.com', N'0987654321', N'e10adc3949ba59abbe56e057f20f883e', N'Ngô Thừa Ân', N'101, Thôn 9, Hòa Ninh, Di Linh, Lâm Đồng')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (7, N'customer002@gmail.com', N'0987654311', N'e10adc3949ba59abbe56e057f20f883e', N'Giang Hồng Anh', N'12, Thôn 6, Hòa Trung, Di Linh, Lâm Đồng')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (8, N'customer003@gmail.com', N'0111827733', N'e10adc3949ba59abbe56e057f20f883e', N'Ngô Công An', N'32, Thôn 2, Hòa Trung, Di Linh, Lâm Đồng')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (18, N'anhdtk@gmail.com', N'0987654322', N'e10adc3949ba59abbe56e057f20f883e', N'Đỗ Thị Kim Anh', N'102, Ấp Tân Lập, phường Đông Hòa, thị xã Dĩ An, tỉnh Bình Dương')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (26, N'baolp@gmail.com', N'01217276752', N'e10adc3949ba59abbe56e057f20f883e', N'Lâm Phước Bảo', N'Quận 1, Hồ Chí Minh')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (29, N'hieutt@gmail.com', N'09827373733', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Trung Hiếu', N'202, Linh Trung, Thủ Đức, Hồ Chí Minh')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (31, N'trungdvq@gmail.com', N'010192929191', N'e10adc3949ba59abbe56e057f20f883e', N'Đinh Vũ Quốc Trung', N'201, Lê văn Việt, QUận 9, Hồ Chí Minh')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (32, N'trangdth@gmail.com', N'012321939123', N'e10adc3949ba59abbe56e057f20f883e', N'Đinh Thị Huyền Trang', N'Quận 1, Hồ Chí Minh')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (33, N'manhdv@gmail.com', N'01230123123', N'e10adc3949ba59abbe56e057f20f883e', N'Đặng Văn Mạnh', N'Quận 4, Hồ Chí Minh 2')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (34, N'hungnv@gmail.com', N'01230213123', N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Văn Hùng', N'Quận 2, Hồ Chí Minh')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (35, N'huongttt@gmail.com', N'0928282828', N'e10adc3949ba59abbe56e057f20f883e', N'Trần Thị Thu Hương', N'Quận 1, Hồ Chí Minh')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (36, N'huonghq@gmail.com', N'01230123048', N'e10adc3949ba59abbe56e057f20f883e', N'Hồ Quỳnh Hương', N'Quận 8, Hồ Chí Minh')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (37, N'mailmail@gmail.com', N'01232931291', N'e10adc3949ba59abbe56e057f20f883e', N'Trịnh Thanh Xuân', N'Quận 12, Hồ Chí Minh')
INSERT [Customer].[Customer] ([Customer_ID], [Email], [PhoneNumber], [Password], [FullName], [Address]) VALUES (38, N'congdt@gmail.com', N'0912391239123', N'e10adc3949ba59abbe56e057f20f883e', N'Dương Thị Công', N'ahihi@gmail.com')
SET IDENTITY_INSERT [Customer].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Place] ON 

INSERT [dbo].[Place] ([Place_ID], [PlaceName]) VALUES (1, N'TP. Hồ Chí Minh')
INSERT [dbo].[Place] ([Place_ID], [PlaceName]) VALUES (2, N'Lâm Đồng')
SET IDENTITY_INSERT [dbo].[Place] OFF
INSERT [Employee].[Account] ([UserName], [Password], [Employee_ID]) VALUES (N'admin', N'21232f297a57a5a743894a0e4a801fc3', 1)
INSERT [Employee].[Account] ([UserName], [Password], [Employee_ID]) VALUES (N'linhdtm', N'e10adc3949ba59abbe56e057f20f883e', 2)
INSERT [Employee].[Account] ([UserName], [Password], [Employee_ID]) VALUES (N'phuongdtn', N'e10adc3949ba59abbe56e057f20f883e', 3)
INSERT [Employee].[Account] ([UserName], [Password], [Employee_ID]) VALUES (N'tititititi', N'e10adc3949ba59abbe56e057f20f883e', 10)
INSERT [Employee].[Account] ([UserName], [Password], [Employee_ID]) VALUES (N'trucltt', N'e10adc3949ba59abbe56e057f20f883e', 9)
SET IDENTITY_INSERT [Employee].[Employee] ON 

INSERT [Employee].[Employee] ([Employee_ID], [FirstName], [LastName], [Email], [IDNumber], [Address], [Manager_ID], [Status]) VALUES (1, N'Thủy', N'Đào Xuân', N'hoang113@gmail.com', N'251125171', N'101, Hòa Ninh, Di Linh, Đồng Nai', NULL, 1)
INSERT [Employee].[Employee] ([Employee_ID], [FirstName], [LastName], [Email], [IDNumber], [Address], [Manager_ID], [Status]) VALUES (2, N'Linh', N'Đỗ Thị Mỹ', N'linhdtm@gmail.com', N'121182765', N'12, Lâm Hà, Lâm Đồng', 1, 1)
INSERT [Employee].[Employee] ([Employee_ID], [FirstName], [LastName], [Email], [IDNumber], [Address], [Manager_ID], [Status]) VALUES (3, N'Phương', N'Đỗ Thị Như', N'phuongdtn@gmail.com', N'251627828', N'12, Lâm Hà, Lâm Đồng', 1, 1)
INSERT [Employee].[Employee] ([Employee_ID], [FirstName], [LastName], [Email], [IDNumber], [Address], [Manager_ID], [Status]) VALUES (4, N'Duy', N'Hà Xuân', N'duyhx@gmail.com', N'282828282', N'12, Linh Đông, Thủ Đức, TP.HCM', 1, 0)
INSERT [Employee].[Employee] ([Employee_ID], [FirstName], [LastName], [Email], [IDNumber], [Address], [Manager_ID], [Status]) VALUES (5, N'Dang', N'Đỗ Thành Tấn', N'dangtt@gmail.com', N'212819829', N'82, Lê Văn Việt, tăng Nhơn Phú A, Quận 9, TP.HCM', 1, 0)
INSERT [Employee].[Employee] ([Employee_ID], [FirstName], [LastName], [Email], [IDNumber], [Address], [Manager_ID], [Status]) VALUES (6, N'Thanh', N'Lê Thị Kim', N'lekiimthanh@gmail.com', N'281718171', N'01 Thôn 8, Bình Long, Bình Phước', 1, 0)
INSERT [Employee].[Employee] ([Employee_ID], [FirstName], [LastName], [Email], [IDNumber], [Address], [Manager_ID], [Status]) VALUES (7, N'Thiện', N'Nguyễn Út', N'thien113@gmail.com', N'272618181', N'Thôn 5 xã Tân Thượng, huyện Di Linh, tỉnh Lâm Đồng', 1, 0)
INSERT [Employee].[Employee] ([Employee_ID], [FirstName], [LastName], [Email], [IDNumber], [Address], [Manager_ID], [Status]) VALUES (8, N'Tuấn', N'Trần Văn', N'tuantv@gmail.com', N'267788777', N'Tân Lập, Dĩ An, Bình Bương', 1, 0)
INSERT [Employee].[Employee] ([Employee_ID], [FirstName], [LastName], [Email], [IDNumber], [Address], [Manager_ID], [Status]) VALUES (9, N'Trúc', N'Lê Thị Thanh', N'trucltt@gmail.com', N'281982989', N'Quận 7, Hồ Chí Minh', 1, 1)
INSERT [Employee].[Employee] ([Employee_ID], [FirstName], [LastName], [Email], [IDNumber], [Address], [Manager_ID], [Status]) VALUES (10, N'Tít', N'Nguyễn Văn', N'TiTNV@gmail.com', N'261717171', N'Hồ Chí Minh', 1, 1)
INSERT [Employee].[Employee] ([Employee_ID], [FirstName], [LastName], [Email], [IDNumber], [Address], [Manager_ID], [Status]) VALUES (11, N'Hưng', N'Vũ Nguyên', N'hungvn@gmail.com', N'2828282181', N'Hồ Chí Minh', 1, 0)
SET IDENTITY_INSERT [Employee].[Employee] OFF
INSERT [Employee].[Employee_Role] ([Employee_ID], [Role_ID], [DateEdit]) VALUES (1, 1, CAST(N'2018-07-25T09:31:15.163' AS DateTime))
INSERT [Employee].[Employee_Role] ([Employee_ID], [Role_ID], [DateEdit]) VALUES (2, 2, CAST(N'2018-07-25T09:31:24.730' AS DateTime))
INSERT [Employee].[Employee_Role] ([Employee_ID], [Role_ID], [DateEdit]) VALUES (3, 2, CAST(N'2018-07-25T09:31:32.277' AS DateTime))
INSERT [Employee].[Employee_Role] ([Employee_ID], [Role_ID], [DateEdit]) VALUES (4, 3, CAST(N'2018-07-25T09:43:21.713' AS DateTime))
INSERT [Employee].[Employee_Role] ([Employee_ID], [Role_ID], [DateEdit]) VALUES (5, 4, CAST(N'2018-07-25T09:43:32.223' AS DateTime))
INSERT [Employee].[Employee_Role] ([Employee_ID], [Role_ID], [DateEdit]) VALUES (6, 4, CAST(N'2018-08-04T02:29:51.870' AS DateTime))
INSERT [Employee].[Employee_Role] ([Employee_ID], [Role_ID], [DateEdit]) VALUES (7, 3, CAST(N'2018-08-04T13:05:48.280' AS DateTime))
INSERT [Employee].[Employee_Role] ([Employee_ID], [Role_ID], [DateEdit]) VALUES (8, 3, CAST(N'2018-08-04T17:20:57.920' AS DateTime))
INSERT [Employee].[Employee_Role] ([Employee_ID], [Role_ID], [DateEdit]) VALUES (9, 2, CAST(N'2018-08-05T01:24:58.953' AS DateTime))
INSERT [Employee].[Employee_Role] ([Employee_ID], [Role_ID], [DateEdit]) VALUES (10, 2, CAST(N'2018-08-05T22:41:58.947' AS DateTime))
INSERT [Employee].[Employee_Role] ([Employee_ID], [Role_ID], [DateEdit]) VALUES (11, 4, CAST(N'2018-08-08T09:17:16.640' AS DateTime))
INSERT [Employee].[PhoneNumber] ([Employee_ID], [PhoneNumber]) VALUES (1, N'0979319598')
INSERT [Employee].[PhoneNumber] ([Employee_ID], [PhoneNumber]) VALUES (1, N'0987117171')
INSERT [Employee].[PhoneNumber] ([Employee_ID], [PhoneNumber]) VALUES (2, N'0191717171')
INSERT [Employee].[PhoneNumber] ([Employee_ID], [PhoneNumber]) VALUES (3, N'0129129129')
INSERT [Employee].[PhoneNumber] ([Employee_ID], [PhoneNumber]) VALUES (4, N'0191827655')
INSERT [Employee].[PhoneNumber] ([Employee_ID], [PhoneNumber]) VALUES (5, N'0171526826')
INSERT [Employee].[PhoneNumber] ([Employee_ID], [PhoneNumber]) VALUES (6, N'01652456377')
INSERT [Employee].[PhoneNumber] ([Employee_ID], [PhoneNumber]) VALUES (7, N'01671525717')
INSERT [Employee].[PhoneNumber] ([Employee_ID], [PhoneNumber]) VALUES (8, N'0716566716')
INSERT [Employee].[PhoneNumber] ([Employee_ID], [PhoneNumber]) VALUES (9, N'0928737677')
INSERT [Employee].[PhoneNumber] ([Employee_ID], [PhoneNumber]) VALUES (10, N'01230123123')
INSERT [Employee].[PhoneNumber] ([Employee_ID], [PhoneNumber]) VALUES (11, N'02931238727')
SET IDENTITY_INSERT [Employee].[Role] ON 

INSERT [Employee].[Role] ([Role_ID], [Role_Name]) VALUES (1, N'Admin')
INSERT [Employee].[Role] ([Role_ID], [Role_Name]) VALUES (2, N'TicketSeller')
INSERT [Employee].[Role] ([Role_ID], [Role_Name]) VALUES (3, N'Driver')
INSERT [Employee].[Role] ([Role_ID], [Role_Name]) VALUES (4, N'Assistant')
SET IDENTITY_INSERT [Employee].[Role] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__85FB4E3862B5CC6E]    Script Date: 8/9/2018 10:00:57 AM ******/
ALTER TABLE [Customer].[Customer] ADD  CONSTRAINT [UQ__Customer__85FB4E3862B5CC6E] UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D10534460D0071]    Script Date: 8/9/2018 10:00:57 AM ******/
ALTER TABLE [Customer].[Customer] ADD  CONSTRAINT [UQ__Customer__A9D10534460D0071] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Booking].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [Customer].[Customer] ([Customer_ID])
GO
ALTER TABLE [Booking].[Booking] CHECK CONSTRAINT [FK_Booking_Customer]
GO
ALTER TABLE [Booking].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Schedule] FOREIGN KEY([Schedule_ID])
REFERENCES [Bus].[Schedule] ([Schedule_ID])
GO
ALTER TABLE [Booking].[Booking] CHECK CONSTRAINT [FK_Booking_Schedule]
GO
ALTER TABLE [Booking].[Detail]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Booking] FOREIGN KEY([Booking_ID])
REFERENCES [Booking].[Booking] ([Booking_ID])
GO
ALTER TABLE [Booking].[Detail] CHECK CONSTRAINT [FK_Detail_Booking]
GO
ALTER TABLE [Bus].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_BusType] FOREIGN KEY([BusType_ID])
REFERENCES [Bus].[BusType] ([Type_ID])
GO
ALTER TABLE [Bus].[Bus] CHECK CONSTRAINT [FK_Bus_BusType]
GO
ALTER TABLE [Bus].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Employee] FOREIGN KEY([Driver_ID])
REFERENCES [Employee].[Employee] ([Employee_ID])
GO
ALTER TABLE [Bus].[Bus] CHECK CONSTRAINT [FK_Bus_Employee]
GO
ALTER TABLE [Bus].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Employee1] FOREIGN KEY([Emp_ID])
REFERENCES [Employee].[Employee] ([Employee_ID])
GO
ALTER TABLE [Bus].[Bus] CHECK CONSTRAINT [FK_Bus_Employee1]
GO
ALTER TABLE [Bus].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Bus] FOREIGN KEY([OldBus_ID])
REFERENCES [Bus].[Bus] ([Bus_ID])
GO
ALTER TABLE [Bus].[History] CHECK CONSTRAINT [FK_History_Bus]
GO
ALTER TABLE [Bus].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Bus1] FOREIGN KEY([NewBus_ID])
REFERENCES [Bus].[Bus] ([Bus_ID])
GO
ALTER TABLE [Bus].[History] CHECK CONSTRAINT [FK_History_Bus1]
GO
ALTER TABLE [Bus].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Bus] FOREIGN KEY([Bus_ID])
REFERENCES [Bus].[Bus] ([Bus_ID])
GO
ALTER TABLE [Bus].[Schedule] CHECK CONSTRAINT [FK_Schedule_Bus]
GO
ALTER TABLE [Bus].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Place] FOREIGN KEY([StartPlace])
REFERENCES [dbo].[Place] ([Place_ID])
GO
ALTER TABLE [Bus].[Schedule] CHECK CONSTRAINT [FK_Schedule_Place]
GO
ALTER TABLE [Bus].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Place1] FOREIGN KEY([FinishPlace])
REFERENCES [dbo].[Place] ([Place_ID])
GO
ALTER TABLE [Bus].[Schedule] CHECK CONSTRAINT [FK_Schedule_Place1]
GO
ALTER TABLE [Employee].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Employee] FOREIGN KEY([Employee_ID])
REFERENCES [Employee].[Employee] ([Employee_ID])
GO
ALTER TABLE [Employee].[Account] CHECK CONSTRAINT [FK_Account_Employee]
GO
ALTER TABLE [Employee].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([Manager_ID])
REFERENCES [Employee].[Employee] ([Employee_ID])
GO
ALTER TABLE [Employee].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [Employee].[Employee_Role]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role_Employee] FOREIGN KEY([Employee_ID])
REFERENCES [Employee].[Employee] ([Employee_ID])
GO
ALTER TABLE [Employee].[Employee_Role] CHECK CONSTRAINT [FK_Employee_Role_Employee]
GO
ALTER TABLE [Employee].[Employee_Role]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role_Role] FOREIGN KEY([Role_ID])
REFERENCES [Employee].[Role] ([Role_ID])
GO
ALTER TABLE [Employee].[Employee_Role] CHECK CONSTRAINT [FK_Employee_Role_Role]
GO
ALTER TABLE [Employee].[PhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_PhoneNumber_Employee] FOREIGN KEY([Employee_ID])
REFERENCES [Employee].[Employee] ([Employee_ID])
GO
ALTER TABLE [Employee].[PhoneNumber] CHECK CONSTRAINT [FK_PhoneNumber_Employee]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCustomer]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetAllCustomer]
	@page int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @rownum int;

	select @rownum = 
		CASE
			WHEN COUNT(*) % 10 > 0
				THEN COUNT(*) % 10 + 1
			WHEN COUNT(*) % 10 = 0
				THEN COUNT(*) % 10
			WHEN COUNT(*) = 0
				THEN 1
		END 
	from Customer.Customer;

    WITH mytable AS
(
    SELECT TOP 100 PERCENT ROW_NUMBER() OVER (ORDER BY Customer_ID) AS RowNumber, Customer_ID, Email, PhoneNumber, FullName, Address
    FROM Customer.Customer
)

SELECT Customer_ID, Email, PhoneNumber, FullName, Address, @rownum AS 'RowNumber'
FROM mytable
WHERE @page >= 1*10 - 9 AND @page <= 1 * 10
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllEmployee]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetAllEmployee]
	@page int
AS
BEGIN
	SET NOCOUNT ON;

    WITH mytable AS
(

    SELECT TOP 100 PERCENT ROW_NUMBER() OVER (ORDER BY e.Employee_ID) AS RowNumber, e.Employee_ID, e.FirstName,
			 e.LastName, e.IDNumber, ea.UserName, m.LastName + ' ' + m.FirstName AS 'ManagerName', er.Role_Name, e.Status
    FROM Employee.Employee e LEFT JOIN Employee.Employee m ON (e.Manager_ID = m.Employee_ID)
		LEFT JOIN Employee.Account ea ON (e.Employee_ID = ea.Employee_ID)
		LEFT JOIN Employee.Employee_Role eer ON (eer.Employee_ID = e.Employee_ID)
		LEFT JOIN Employee.Role er ON (er.Role_ID = eer.Role_ID)
	WHERE er.Role_ID != 1
)


SELECT tb.Employee_ID, tb.FirstName, tb.LastName, tb.IDNumber, tb.UserName, tb.ManagerName, tb.Role_Name, tb.Status
FROM mytable tb
WHERE RowNumber >= @page*10 - 9 AND RowNumber <= @page * 10
END
GO
/****** Object:  StoredProcedure [dbo].[spGetBookedByCusIDPage]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 CREATE PROCEDURE [dbo].[spGetBookedByCusIDPage]
	@customerid int,
	@page int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @pagenum int;

	select @pagenum = 
		CASE
			WHEN COUNT(*) % 10 > 0
				THEN COUNT(*) / 10 + 1
			WHEN COUNT(*) % 10 = 0
				THEN COUNT(*) / 10
			WHEN COUNT(*) = 0
				THEN 1
		END    
	FROM Booking.Booking bb JOIN Bus.Schedule bs ON (bb.Schedule_ID = bs.Schedule_ID)
	WHERE bb.Customer_ID = @customerid;

    WITH mytable AS
(

    SELECT TOP 100 PERCENT ROW_NUMBER() OVER (ORDER BY bb.BookingDate desc) AS RowNumber, bb.Booking_ID, bb.BookingDate, convert(varchar, bb.DateStart, 103) + ' ' + bs.TimeStart AS 'TimeStart', pS.PlaceName AS 'StartPlace', pF.PlaceName AS 'FinishPlace',
	CASE
  WHEN
    bb.DateStart <= CONVERT(date, GETDATE()) AND bb.Status = 1
      THEN
        '2'
		WHEN
			bb.DateStart > CONVERT(date, GETDATE()) AND bb.Status = 1
      THEN
        '1'
		WHEN
				bb.Status = 0
      THEN
        '0'
END AS 'Status'
    FROM Booking.Booking bb
			JOIN Bus.Schedule bs ON (bb.Schedule_ID = bs.Schedule_ID)
			JOIN dbo.Place pS ON (pS.Place_ID = bs.StartPlace)
			JOIN dbo.Place pF ON (pF.Place_ID = bs.FinishPlace)
	WHERE bb.Customer_ID = @customerid
)


SELECT tb.Booking_ID, tb.BookingDate,tb.TimeStart, tb.StartPlace, tb.FinishPlace, tb.Status, @pagenum AS 'PageNumber'
FROM mytable tb
WHERE RowNumber >= @page*10 - 9 AND RowNumber <= @page * 10

END
GO
/****** Object:  StoredProcedure [dbo].[spGetBookingByDateStartScheduleSeat]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetBookingByDateStartScheduleSeat]
	@datestart date,
	@scheduleid int,
	@seat int
AS
BEGIN

	SET NOCOUNT ON;

	SELECT bb.Booking_ID, cc.FullName, cc.PhoneNumber, cc.Email, cc.Address, bb.BookingDate, bb.Description, bd.Seat
	FROM Booking.Booking bb JOIN Booking.Detail bd ON (bb.Booking_ID = bd.Booking_ID)
		JOIN Customer.Customer cc ON (cc.Customer_ID = bb.Customer_ID)
	WHERE bb.Booking_ID IN 
	(
	SELECT TOP 1 bb.Booking_ID
	FROM Booking.Booking bb JOIN Booking.Detail bd ON (bb.Booking_ID = bd.Booking_ID AND bb.Status = 1)
	WHERE bb.Schedule_ID = @scheduleid AND bb.DateStart = @datestart AND bd.Seat = @seat
	)
    
END
GO
/****** Object:  StoredProcedure [dbo].[spGetBusTypeBookedSeatsByPlaceTimeDate]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetBusTypeBookedSeatsByPlaceTimeDate]
	@schedule_id int,
	@DateStart date

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT bs.Bus_ID, bd.Seat
	FROM Bus.Schedule bs LEFT JOIN Booking.Booking bk ON (bs.Schedule_ID = bk.Schedule_ID   AND (bk.Status = 1 OR bk.Status IS NULL) AND bk.DateStart = @DateStart)
		LEFT JOIN Booking.Detail bd ON (bk.Booking_ID = bd.Booking_ID)
	WHERE bs.Schedule_ID = @schedule_id

END
GO
/****** Object:  StoredProcedure [dbo].[spGetCustomerByEmail]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetCustomerByEmail]
	@id int,
	@email varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT Email
   FROM Customer.Customer
   WHERE Email = @email AND Customer_ID != @id

END
GO
/****** Object:  StoredProcedure [dbo].[spGetCustomerByID]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetCustomerByID]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT c.Customer_ID, c.Email, c.PhoneNumber, c.Password, c.FullName, c.Address
	FROM Customer.Customer c
	WHERE c.Customer_ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spGetCustomerByPhoneNumber]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetCustomerByPhoneNumber]
	@id int,
	@phonenumber varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT PhoneNumber
   FROM Customer.Customer
   WHERE PhoneNumber = @phonenumber AND Customer_ID != @id

END
GO
/****** Object:  StoredProcedure [dbo].[spGetCustomerByUserPass]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetCustomerByUserPass]
	@user varchar(100),
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT c.Customer_ID, c.Email, c.PhoneNumber, c.Password, c.FullName, c.Address
	FROM Customer.Customer c
	WHERE (c.Email = @user OR c.PhoneNumber = @user) AND c.Password = @password
END
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeByAccount]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetEmployeeByAccount] 
	-- Add the parameters for the stored procedure here
	@username varchar(50),
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT e.Employee_ID, e.FirstName, e.LastName, e.Email, r.Role_ID
	FROM Employee.Account a JOIN Employee.Employee e ON (a.Employee_ID = e.Employee_ID AND e.Status = 1)
		LEFT JOIN Employee.Employee_Role r ON (e.Employee_ID = r.Employee_ID)
	WHERE a.UserName = @username AND a.Password = @password
END
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeByID]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetEmployeeByID]
	@empid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT ee.FirstName, ee.LastName, ee.Email, ee.IDNumber, ep.PhoneNumber, ee.Address, ea.UserName, ea.Password, er.Role_ID
	FROM Employee.Employee ee LEFT JOIN Employee.PhoneNumber ep ON (ee.Employee_ID = ep.Employee_ID)
		LEFT JOIN Employee.Employee_Role er ON (er.Employee_ID = ee.Employee_ID)
		LEFT JOIN Employee.Account ea ON (ea.Employee_ID = ee.Employee_ID)
	WHERE ee.Employee_ID = @empid
END
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeIDByInfo]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetEmployeeIDByInfo]
	@firstname nvarchar(50),
	@lastname nvarchar(100),
	@email varchar(100),
	@idnumber varchar(50),
	@address nvarchar(200),
	@managerid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT TOP 1 Employee_ID
	FROM Employee.Employee
	WHERE FirstName = @firstname AND LastName = @lastname AND Email = @email AND IDNumber = @idnumber AND Address = @address AND Manager_ID = @managerid AND Status = 'True'
	ORDER BY Employee_ID desc
END
GO
/****** Object:  StoredProcedure [dbo].[spGetPlaces]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetPlaces]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.Place_ID, p.PlaceName
	FROM dbo.Place p
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSchedule]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetSchedule]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT bs.Schedule_ID, bs.TimeStart, pS.PlaceName  AS 'StartPlace', pF.PlaceName  AS 'FinishPlace', b.NumberPlate, bbt.TypeName
	FROM Bus.Schedule bs JOIN dbo.Place pS ON (bs.StartPlace = pS.Place_ID)
		JOIN dbo.Place pF ON (pF.Place_ID = bs.FinishPlace)
		JOIN Bus.Bus b ON (b.Bus_ID = bs.Bus_ID)
		JOIN BUS.BusType bbt ON (b.BusType_ID = bbt.Type_ID)
	ORDER BY bs.TimeStart
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSeatsByBookingID]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetSeatsByBookingID]
	@BookingID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT Seat
	FROM Booking.Detail
	WHERE Booking_ID = @BookingID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTicketBookedAvailableByStartDate]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetTicketBookedAvailableByStartDate] 
	@startdate date,
	@page int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    WITH mytable AS
(
    SELECT TOP 100 PERCENT ROW_NUMBER() OVER (ORDER BY bb.BookingDate) AS RowNumber, bb.Booking_ID, b.NumberPlate, cc.FullName, pS.PlaceName AS 'StartPlace', pF.PlaceName AS 'FinishPlace', convert(char(5), bs.TimeStart, 108) AS 'StartTime'
	FROM Booking.Booking bb JOIN Bus.Schedule bs ON (bb.Schedule_ID = bs.Schedule_ID AND bb.Status = 1)
		JOIN dbo.Place pS ON (pS.Place_ID = bs.StartPlace)
		JOIN dbo.Place pF ON (pF.Place_ID = bs.FinishPlace)
		JOIN Customer.Customer cc ON (bb.Customer_ID = cc.Customer_ID)
		JOIN Bus.Bus b ON (b.Bus_ID = bs.Bus_ID)
	WHERE bb.DateStart = @startdate
)


SELECT tb.Booking_ID, tb.NumberPlate, tb.FullName, tb.StartTime, tb.StartPlace, tb.FinishPlace
FROM mytable tb
WHERE RowNumber >= @page*10 - 9 AND RowNumber <= @page * 10

END
GO
/****** Object:  StoredProcedure [dbo].[spGetTimeByPlaceDateAmount]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetTimeByPlaceDateAmount]
	@StartPlace int,
	@FinishPlace int,
	@DateStart date,
	@Amount int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT bs.Schedule_ID AS 'Schedule_ID', bs.TimeStart, bt.TypeName
	FROM Bus.Bus b JOIN Bus.BusType bt ON (b.BusType_ID = bt.Type_ID)
		JOIN Bus.Schedule bs ON (b.Bus_ID = bs.Bus_ID)
		LEFT JOIN Booking.Booking bk ON (bs.Schedule_ID = bk.Schedule_ID  AND bk.DateStart = @DateStart AND (bk.Status = 1 OR bk.Status IS NULL))
		LEFT JOIN Booking.Detail bd ON (bk.Booking_ID = bd.Booking_ID)
	WHERE (b.Status = 1 OR b.Status IS NULL) AND bs.StartPlace = @StartPlace AND bs.FinishPlace = @FinishPlace
	GROUP BY bs.Schedule_ID, bs.TimeStart, bt.TypeName, b.SeatNum
	HAVING b.SeatNum - COUNT(bd.Seat)  > @Amount
END
GO
/****** Object:  StoredProcedure [dbo].[spGetUserNameByNewUserNameOldUserName]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetUserNameByNewUserNameOldUserName]
	@username varchar(50),
	@oldusername varchar(50)
AS
BEGIN
	SELECT UserName 
	FROM Employee.Account
	WHERE UserName = @username AND UserName != @oldusername
END
GO
/****** Object:  StoredProcedure [dbo].[spGetUserNameByUserName]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetUserNameByUserName]
	@username varchar(50)
AS
BEGIN
	SELECT UserName 
	FROM Employee.Account
	WHERE UserName = @username
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertAccount]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertAccount]
	@empid int,
	@user varchar(50),
	@pass varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Employee.Account(Employee_ID, UserName, Password) VALUES (@empid, @user, @pass)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertBooking]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertBooking]
	@schedule_id int,
	@cusid int,
	@datestart date,
	@description nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Booking.Booking (Schedule_ID, Customer_ID, DateStart, Description)
	VALUES (@schedule_id, @cusid, @datestart, @description)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertCustomer]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertCustomer]
	@email varchar(100),
	@phonenumber varchar(100),
	@password varchar(50),
	@fullname nvarchar(100),
	@address nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO Customer.Customer (Email, PhoneNumber, Password, FullName, Address) VALUES (@email, @phonenumber, @password, @fullname, @address) 

END
GO
/****** Object:  StoredProcedure [dbo].[spInsertDetail]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertDetail]
	@bookingid int,
	@seat int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Booking.Detail (Booking_ID, Seat)
	VALUES (@bookingid, @seat)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertEmployee]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertEmployee]
	@firstname nvarchar(50),
	@lastname nvarchar(100),
	@email varchar(100),
	@idnumber varchar(50),
	@address nvarchar(200),
	@managerid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Employee.Employee (FirstName, LastName, Email, IDNumber, Address, Manager_ID, Status)
	VALUES (@firstname, @lastname, @email, @idnumber, @address,  @managerid, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertPhoneNumberEmployee]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertPhoneNumberEmployee]
	@empid int,
	@phonenum varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Employee.PhoneNumber (Employee_ID, PhoneNumber) VALUES (@empid, @phonenum)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertRole]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertRole]
	@empid int,
	@role int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Employee.Employee_Role (Employee_ID, Role_ID) VALUES (@empid, @role)
END
GO
/****** Object:  StoredProcedure [dbo].[spQuitEmployee]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spQuitEmployee]
	@empID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Employee.Employee SET Status = 0 WHERE Employee_ID = @empID
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchBooking]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSearchBooking] 
	@search varchar(20),
	@page int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    WITH mytable AS
(
    SELECT TOP 100 PERCENT ROW_NUMBER() OVER (ORDER BY bb.Booking_ID desc) AS RowNumber, bb.Booking_ID, b.NumberPlate, cc.FullName, pS.PlaceName AS 'StartPlace', pF.PlaceName AS 'FinishPlace', convert(varchar, bb.DateStart, 103) + ' ' + bs.TimeStart AS 'StartTime',
		CASE
			WHEN bb.DateStart <= CONVERT(date, GETDATE()) AND bb.Status = 1
			THEN '2'
			WHEN bb.DateStart > CONVERT(date, GETDATE()) AND bb.Status = 1
			THEN '1'
			WHEN bb.Status = 0
			THEN '0'
		END AS 'Status'
	FROM Booking.Booking bb JOIN Bus.Schedule bs ON (bb.Schedule_ID = bs.Schedule_ID)
		JOIN dbo.Place pS ON (pS.Place_ID = bs.StartPlace)
		JOIN dbo.Place pF ON (pF.Place_ID = bs.FinishPlace)
		JOIN Customer.Customer cc ON (bb.Customer_ID = cc.Customer_ID)
		JOIN Bus.Bus b ON (b.Bus_ID = bs.Bus_ID)
	WHERE FREETEXT(cc.FullName, @search) OR FREETEXT(cc.Email, @search) OR FREETEXT(cc.PhoneNumber, @search)
)


SELECT tb.Booking_ID, tb.NumberPlate, tb.FullName, tb.StartTime, tb.StartPlace, tb.FinishPlace, tb.Status
FROM mytable tb
WHERE RowNumber >= @page*10 - 9 AND RowNumber <= @page * 10

END
GO
/****** Object:  StoredProcedure [dbo].[spSearchCustomer]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchCustomer]
	@search varchar(20),
	@page int
AS
BEGIN
	SET NOCOUNT ON;

    WITH mytable AS
(
    SELECT TOP 100 PERCENT ROW_NUMBER() OVER (ORDER BY Customer_ID) AS RowNumber, Customer_ID, Email, PhoneNumber, FullName, Address
    FROM Customer.Customer
	WHERE FREETEXT(FullName, @search) OR FREETEXT(Email, @search) OR FREETEXT(PhoneNumber, @search) OR FREETEXT(Address, @search)
)


SELECT Customer_ID, Email, PhoneNumber, FullName, Address
FROM mytable tb
WHERE RowNumber >= @page*10 - 9 AND RowNumber <= @page * 10
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchEmployee]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchEmployee]
	@search varchar(20),
	@page int
AS
BEGIN
	SET NOCOUNT ON;

    WITH mytable AS
(

    SELECT TOP 100 PERCENT ROW_NUMBER() OVER (ORDER BY e.Employee_ID) AS RowNumber, e.Employee_ID, e.FirstName,
			 e.LastName, e.IDNumber, ea.UserName, m.LastName + ' ' + m.FirstName AS 'ManagerName',er.Role_Name,  e.Status
    FROM Employee.Employee e LEFT JOIN Employee.Employee m ON (e.Manager_ID = m.Employee_ID)
		LEFT JOIN Employee.Account ea ON (e.Employee_ID = ea.Employee_ID)
		LEFT JOIN Employee.Employee_Role eer ON (eer.Employee_ID = e.Employee_ID)
		LEFT JOIN Employee.Role er ON (er.Role_ID = eer.Role_ID)
	WHERE er.Role_ID != 1 AND (FREETEXT(e.FirstName, @search) OR FREETEXT(e.LastName, @search) OR FREETEXT(e.IDNumber, @search) OR FREETEXT(e.Address, @search) OR FREETEXT(e.Email, @search))
)


SELECT tb.Employee_ID, tb.FirstName, tb.LastName, tb.IDNumber, tb.UserName, tb.ManagerName, tb.Role_Name, tb.Status
FROM mytable tb
WHERE RowNumber >= @page*10 - 9 AND RowNumber <= @page * 10
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectBookingIDByBookingInfo]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSelectBookingIDByBookingInfo]
	@schedule_id int,
	@cusid int,
	@datestart date,
	@description nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT TOP 1 b.Booking_ID
	FROM Booking.Booking b
	WHERE b.Schedule_ID = @schedule_id AND b.Customer_ID = @cusid AND b.DateStart = @datestart AND b.Description = @description
	ORDER BY b.BookingDate desc
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBooking_Cancel]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateBooking_Cancel]
	@booking_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Booking.Booking SET Status = 'False' WHERE Booking_ID =  @booking_ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCustomer]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateCustomer]
	@id int,
	@email varchar(100),
	@phonenumber varchar(100),
	@password varchar(50),
	@fullname nvarchar(100),
	@address nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Customer.Customer 
	SET Email = @email, PhoneNumber = @phonenumber, Password = @password, FullName = @fullname, Address = @address
	WHERE Customer_ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCustomer_Pass_Add]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateCustomer_Pass_Add]
	@id int,
	@password varchar(50),
	@address nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Customer.Customer 
	SET Password = @password, Address = @address
	WHERE Customer_ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateEmployee]    Script Date: 8/9/2018 10:00:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateEmployee]
	@firstname nvarchar(50),
	@lastname nvarchar(100),
	@email varchar(100),
	@idnumber varchar(50),
	@address nvarchar(200),
	@managerid int,

	@phonenumber varchar(20),

	@roleid int,

	@empid int,

	@username varchar(50),
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	UPDATE Employee.Employee
	SET FirstName = @firstname, LastName = @lastname, Email = @email, IDNumber = @idnumber, Address = @address, Manager_ID = @managerid
	WHERE Employee_ID = @empid

	UPDATE Employee.PhoneNumber
	SET PhoneNumber = @phonenumber
	WHERE Employee_ID = @empid

	UPDATE Employee.Employee_Role
	SET Role_ID = @roleid
	WHERE Employee_ID = @empid

	IF @roleid = 2
		BEGIN
			DELETE FROM Employee.Account
			WHERE Employee_ID = @empid

			INSERT INTO Employee.Account (UserName, Password, Employee_ID) VALUES (@username, @password, @empid)
		END
	ELSE
		BEGIN 
			DELETE FROM Employee.Account
			WHERE Employee_ID = @empid
		END

END
GO
USE [master]
GO
ALTER DATABASE [BookingBusTicketSystem] SET  READ_WRITE 
GO
