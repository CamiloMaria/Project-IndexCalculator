USE [master]
GO
/****** Object:  Database [IndexCalculator]    Script Date: 16/7/2022 03:57:54 ******/
CREATE DATABASE [IndexCalculator]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IndexCalculator', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.CAMILOSQLSERVER\MSSQL\DATA\IndexCalculator.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IndexCalculator_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.CAMILOSQLSERVER\MSSQL\DATA\IndexCalculator_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IndexCalculator] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IndexCalculator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IndexCalculator] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IndexCalculator] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IndexCalculator] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IndexCalculator] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IndexCalculator] SET ARITHABORT OFF 
GO
ALTER DATABASE [IndexCalculator] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IndexCalculator] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IndexCalculator] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IndexCalculator] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IndexCalculator] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IndexCalculator] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IndexCalculator] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IndexCalculator] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IndexCalculator] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IndexCalculator] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IndexCalculator] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IndexCalculator] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IndexCalculator] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IndexCalculator] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IndexCalculator] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IndexCalculator] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IndexCalculator] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IndexCalculator] SET RECOVERY FULL 
GO
ALTER DATABASE [IndexCalculator] SET  MULTI_USER 
GO
ALTER DATABASE [IndexCalculator] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IndexCalculator] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IndexCalculator] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IndexCalculator] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IndexCalculator] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IndexCalculator] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IndexCalculator', N'ON'
GO
ALTER DATABASE [IndexCalculator] SET QUERY_STORE = OFF
GO
USE [IndexCalculator]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 16/7/2022 03:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[adminID] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](20) NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 16/7/2022 03:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 16/7/2022 03:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[SubjectId] [int] NULL,
	[Cedula] [varchar](20) NULL,
	[TotalMarks] [int] NULL,
	[OutOfMarks] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 16/7/2022 03:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](120) NULL,
	[Gender] [varchar](50) NULL,
	[DOB] [date] NULL,
	[Mobile] [bigint] NULL,
	[Carrera] [varchar](50) NULL,
	[ClassId] [int] NULL,
	[Cedula] [varchar](20) NULL,
	[Password] [varchar](50) NULL,
	[Type] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 16/7/2022 03:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[SubjectName] [varchar](80) NULL,
	[Credito] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 16/7/2022 03:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](120) NULL,
	[Gender] [varchar](50) NULL,
	[Mobile] [bigint] NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](20) NULL,
	[Cedula] [varchar](20) NULL,
	[DoB] [date] NULL,
	[ClassId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherSubject]    Script Date: 16/7/2022 03:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[SubjectId] [int] NULL,
	[TeacherId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarAdmin]    Script Date: 16/7/2022 03:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_ValidarAdmin]
@Cedula varchar(20),
@Password varchar(50)
as
begin
Select * from Admin where Cedula=@Cedula and Password=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarStudent]    Script Date: 16/7/2022 03:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ValidarStudent]
@Cedula varchar(20),
@Password varchar(50)
as
begin
Select * from Student where Cedula=@Cedula and Password=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarTeacher]    Script Date: 16/7/2022 03:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_ValidarTeacher]
@Cedula varchar(20),
@Password varchar(50)
as
begin
Select * from Teacher where Cedula=@Cedula and Password=@Password
end
GO
USE [master]
GO
ALTER DATABASE [IndexCalculator] SET  READ_WRITE 
GO
