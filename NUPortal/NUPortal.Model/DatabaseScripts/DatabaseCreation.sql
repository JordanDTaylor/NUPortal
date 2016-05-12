USE [master]
GO
/****** Object:  Database [Test]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE DATABASE [Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Test.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Test_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Test] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Test] SET  MULTI_USER 
GO
ALTER DATABASE [Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Test] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Test]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street1] [nvarchar](max) NOT NULL,
	[Street2] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AttemptedCourses]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttemptedCourses](
	[StudentId] [int] NOT NULL,
	[ScheduledEventId] [int] NOT NULL,
	[Passed] [bit] NULL,
	[GradePercent] [float] NOT NULL,
 CONSTRAINT [PK_AttemptedCourses] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[ScheduledEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Building]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Building](
	[Id] [int] NOT NULL,
	[CampusId] [int] NOT NULL,
	[Address] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Campus]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Campus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [int] NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Campus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoryCodes]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryCodes](
	[Category] [int] NOT NULL,
	[Course] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_CategoryCodes] PRIMARY KEY CLUSTERED 
(
	[Category] ASC,
	[Course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cohort]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cohort](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NULL,
 CONSTRAINT [PK_Cohort] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseCategory]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Label] [nvarchar](100) NULL,
 CONSTRAINT [PK_CourseCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseCode]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCode](
	[Code] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_CourseCode] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](8) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Credits] [smallint] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Degree]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Degree](
	[Id] [nvarchar](6) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Degree] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DegreeTrack]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DegreeTrack](
	[Id] [int] NOT NULL,
	[DegreeId] [nvarchar](6) NULL,
	[CohortId] [int] NULL,
 CONSTRAINT [PK_DegreeTrack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DegreeTrackCourses]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DegreeTrackCourses](
	[DegreeTackId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [nvarchar](8) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ElectiveCategories]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElectiveCategories](
	[ElectiveCourseId] [nvarchar](8) NOT NULL,
	[CourseId] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_ElectiveCategories] PRIMARY KEY CLUSTERED 
(
	[ElectiveCourseId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Emails]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[Email] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_Emails] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EnrolledStudents]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrolledStudents](
	[StudentId] [int] NOT NULL,
	[EnrolledCampus] [int] NOT NULL,
	[CohortId] [int] NULL,
	[CurrentlyEnrolled] [bit] NOT NULL,
 CONSTRAINT [PK_EnrolledStudents] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[EnrolledCampus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_People_Instructor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[MiddelName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[PrimaryPhone] [nvarchar](20) NOT NULL,
	[PrimaryEmail] [nvarchar](60) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People_EmergencyContact]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People_EmergencyContact](
	[ContactFor] [int] NOT NULL,
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_People_EmergencyContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People_TeachingAssistant]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People_TeachingAssistant](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_People_TeachingAssistant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PeoplesEmails]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeoplesEmails](
	[Person_Id] [int] NOT NULL,
	[Emails_Email] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_PersonEntity1] PRIMARY KEY CLUSTERED 
(
	[Person_Id] ASC,
	[Emails_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonAddress]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonAddress](
	[People_Id] [int] NOT NULL,
	[Addresses_Id] [int] NOT NULL,
 CONSTRAINT [PK_PersonAddress] PRIMARY KEY CLUSTERED 
(
	[People_Id] ASC,
	[Addresses_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonPhoneNumber]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonPhoneNumber](
	[People_Id] [int] NOT NULL,
	[PhoneNumbers_Number] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_PersonPhoneNumber] PRIMARY KEY CLUSTERED 
(
	[People_Id] ASC,
	[PhoneNumbers_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhoneNumbers]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneNumbers](
	[Number] [nvarchar](20) NOT NULL,
	[SupportsSMS] [bit] NOT NULL,
	[IsFax] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PhoneNumbers] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlannedCourses]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlannedCourses](
	[StudentId] [int] NOT NULL,
	[CourseCode] [nvarchar](8) NOT NULL,
	[Quarter] [int] NOT NULL,
 CONSTRAINT [PK_PlannedCourses] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PreReqs]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreReqs](
	[Course] [nvarchar](8) NOT NULL,
	[RequiredCourse] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_PreReqs_1] PRIMARY KEY CLUSTERED 
(
	[Course] ASC,
	[RequiredCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quarters]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quarters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Label] [nvarchar](max) NOT NULL,
	[Year] [int] NOT NULL,
	[Sprint1] [int] NOT NULL,
	[Sprint2] [int] NOT NULL,
 CONSTRAINT [PK_Quarters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegisteredCourses]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisteredCourses](
	[StudentId] [int] NOT NULL,
	[ScheduledCourse] [int] NOT NULL,
 CONSTRAINT [PK_RegisteredCourses] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[ScheduledCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nchar](10) NULL,
	[BuildingId] [int] NULL,
	[Capacity] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScheduledInstructor]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduledInstructor](
	[ScheduledCourses_Id] [int] NOT NULL,
	[Instructors_Id] [int] NOT NULL,
 CONSTRAINT [PK_ScheduledCoursesInstructor] PRIMARY KEY CLUSTERED 
(
	[ScheduledCourses_Id] ASC,
	[Instructors_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SheduledEvents]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SheduledEvents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Monday] [bit] NOT NULL,
	[Tuesday] [bit] NOT NULL,
	[Wednesday] [bit] NOT NULL,
	[Thursday] [bit] NOT NULL,
	[Friday] [bit] NOT NULL,
	[Section] [nvarchar](max) NOT NULL,
	[Quarter] [int] NOT NULL,
	[Room] [int] NOT NULL,
	[IsRegisterable] [bit] NOT NULL,
	[Course_Id] [int] NOT NULL,
 CONSTRAINT [PK_SheduledEvents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sprints]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sprints](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Sprints] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TASheduledEvent]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TASheduledEvent](
	[TeachingAssistants_Id] [int] NOT NULL,
	[SheduledEvents_Id] [int] NOT NULL,
 CONSTRAINT [PK_TASheduledEvent] PRIMARY KEY CLUSTERED 
(
	[TeachingAssistants_Id] ASC,
	[SheduledEvents_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [money] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Date] [timestamp] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Years]    Script Date: 5/12/2016 4:13:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Years](
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Years] PRIMARY KEY CLUSTERED 
(
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_PersonEmails]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonEmails] ON [dbo].[People]
(
	[PrimaryEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_PersonPhoneNumber1]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonPhoneNumber1] ON [dbo].[People]
(
	[PrimaryPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_PersonEntity1_Entity1]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonEntity1_Entity1] ON [dbo].[PeoplesEmails]
(
	[Emails_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonAddress_Address]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonAddress_Address] ON [dbo].[PersonAddress]
(
	[Addresses_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_PersonPhoneNumber_PhoneNumber]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonPhoneNumber_PhoneNumber] ON [dbo].[PersonPhoneNumber]
(
	[PhoneNumbers_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_QuartersYears]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_QuartersYears] ON [dbo].[Quarters]
(
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SprintQuarters]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SprintQuarters] ON [dbo].[Quarters]
(
	[Sprint1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SprintQuarters1]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SprintQuarters1] ON [dbo].[Quarters]
(
	[Sprint2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ScheduledCoursesInstructor_Instructor]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ScheduledCoursesInstructor_Instructor] ON [dbo].[ScheduledInstructor]
(
	[Instructors_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CoursesScheduledCourses]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CoursesScheduledCourses] ON [dbo].[SheduledEvents]
(
	[Course_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SheduledEventQuarters]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SheduledEventQuarters] ON [dbo].[SheduledEvents]
(
	[Quarter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SheduledEventRoom]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SheduledEventRoom] ON [dbo].[SheduledEvents]
(
	[Room] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TASheduledEvent_SheduledEvent]    Script Date: 5/12/2016 4:13:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_TASheduledEvent_SheduledEvent] ON [dbo].[TASheduledEvent]
(
	[SheduledEvents_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttemptedCourses]  WITH CHECK ADD  CONSTRAINT [FK_AttemptedCourses_SheduledEvents] FOREIGN KEY([ScheduledEventId])
REFERENCES [dbo].[SheduledEvents] ([Id])
GO
ALTER TABLE [dbo].[AttemptedCourses] CHECK CONSTRAINT [FK_AttemptedCourses_SheduledEvents]
GO
ALTER TABLE [dbo].[AttemptedCourses]  WITH CHECK ADD  CONSTRAINT [FK_AttemptedCourses_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[AttemptedCourses] CHECK CONSTRAINT [FK_AttemptedCourses_Students]
GO
ALTER TABLE [dbo].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_Addresses] FOREIGN KEY([Address])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[Building] CHECK CONSTRAINT [FK_Building_Addresses]
GO
ALTER TABLE [dbo].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_Campus] FOREIGN KEY([CampusId])
REFERENCES [dbo].[Campus] ([Id])
GO
ALTER TABLE [dbo].[Building] CHECK CONSTRAINT [FK_Building_Campus]
GO
ALTER TABLE [dbo].[Campus]  WITH CHECK ADD  CONSTRAINT [FK_Campus_Addresses] FOREIGN KEY([Address])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[Campus] CHECK CONSTRAINT [FK_Campus_Addresses]
GO
ALTER TABLE [dbo].[CategoryCodes]  WITH CHECK ADD  CONSTRAINT [FK_CategoryCodes_CourseCategory] FOREIGN KEY([Category])
REFERENCES [dbo].[CourseCategory] ([Id])
GO
ALTER TABLE [dbo].[CategoryCodes] CHECK CONSTRAINT [FK_CategoryCodes_CourseCategory]
GO
ALTER TABLE [dbo].[CategoryCodes]  WITH CHECK ADD  CONSTRAINT [FK_CategoryCodes_CourseCode] FOREIGN KEY([Course])
REFERENCES [dbo].[CourseCode] ([Code])
GO
ALTER TABLE [dbo].[CategoryCodes] CHECK CONSTRAINT [FK_CategoryCodes_CourseCode]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_CourseCode] FOREIGN KEY([Code])
REFERENCES [dbo].[CourseCode] ([Code])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_CourseCode]
GO
ALTER TABLE [dbo].[DegreeTrack]  WITH CHECK ADD  CONSTRAINT [FK_DegreeTrack_Cohort] FOREIGN KEY([CohortId])
REFERENCES [dbo].[Cohort] ([Id])
GO
ALTER TABLE [dbo].[DegreeTrack] CHECK CONSTRAINT [FK_DegreeTrack_Cohort]
GO
ALTER TABLE [dbo].[DegreeTrack]  WITH CHECK ADD  CONSTRAINT [FK_DegreeTrack_Degree] FOREIGN KEY([DegreeId])
REFERENCES [dbo].[Degree] ([Id])
GO
ALTER TABLE [dbo].[DegreeTrack] CHECK CONSTRAINT [FK_DegreeTrack_Degree]
GO
ALTER TABLE [dbo].[DegreeTrackCourses]  WITH CHECK ADD  CONSTRAINT [FK_DegreeTrackCourses_CourseCode] FOREIGN KEY([CourseCode])
REFERENCES [dbo].[CourseCode] ([Code])
GO
ALTER TABLE [dbo].[DegreeTrackCourses] CHECK CONSTRAINT [FK_DegreeTrackCourses_CourseCode]
GO
ALTER TABLE [dbo].[DegreeTrackCourses]  WITH CHECK ADD  CONSTRAINT [FK_DegreeTrackCourses_DegreeTrack] FOREIGN KEY([DegreeTackId])
REFERENCES [dbo].[DegreeTrack] ([Id])
GO
ALTER TABLE [dbo].[DegreeTrackCourses] CHECK CONSTRAINT [FK_DegreeTrackCourses_DegreeTrack]
GO
ALTER TABLE [dbo].[ElectiveCategories]  WITH CHECK ADD  CONSTRAINT [FK_ElectiveCategories_CourseCode] FOREIGN KEY([ElectiveCourseId])
REFERENCES [dbo].[CourseCode] ([Code])
GO
ALTER TABLE [dbo].[ElectiveCategories] CHECK CONSTRAINT [FK_ElectiveCategories_CourseCode]
GO
ALTER TABLE [dbo].[ElectiveCategories]  WITH CHECK ADD  CONSTRAINT [FK_ElectiveCategories_CourseCode1] FOREIGN KEY([CourseId])
REFERENCES [dbo].[CourseCode] ([Code])
GO
ALTER TABLE [dbo].[ElectiveCategories] CHECK CONSTRAINT [FK_ElectiveCategories_CourseCode1]
GO
ALTER TABLE [dbo].[EnrolledStudents]  WITH CHECK ADD  CONSTRAINT [FK_EnrolledStudents_Campus] FOREIGN KEY([EnrolledCampus])
REFERENCES [dbo].[Campus] ([Id])
GO
ALTER TABLE [dbo].[EnrolledStudents] CHECK CONSTRAINT [FK_EnrolledStudents_Campus]
GO
ALTER TABLE [dbo].[EnrolledStudents]  WITH CHECK ADD  CONSTRAINT [FK_EnrolledStudents_Cohort] FOREIGN KEY([CohortId])
REFERENCES [dbo].[Cohort] ([Id])
GO
ALTER TABLE [dbo].[EnrolledStudents] CHECK CONSTRAINT [FK_EnrolledStudents_Cohort]
GO
ALTER TABLE [dbo].[EnrolledStudents]  WITH CHECK ADD  CONSTRAINT [FK_EnrolledStudents_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[EnrolledStudents] CHECK CONSTRAINT [FK_EnrolledStudents_Students]
GO
ALTER TABLE [dbo].[Instructors]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_inherits_Person] FOREIGN KEY([Id])
REFERENCES [dbo].[People] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Instructors] CHECK CONSTRAINT [FK_Instructor_inherits_Person]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmails] FOREIGN KEY([PrimaryEmail])
REFERENCES [dbo].[Emails] ([Email])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_PersonEmails]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhoneNumber1] FOREIGN KEY([PrimaryPhone])
REFERENCES [dbo].[PhoneNumbers] ([Number])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_PersonPhoneNumber1]
GO
ALTER TABLE [dbo].[People_EmergencyContact]  WITH CHECK ADD  CONSTRAINT [FK_EmergencyContact_inherits_Person] FOREIGN KEY([Id])
REFERENCES [dbo].[People] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[People_EmergencyContact] CHECK CONSTRAINT [FK_EmergencyContact_inherits_Person]
GO
ALTER TABLE [dbo].[People_TeachingAssistant]  WITH CHECK ADD  CONSTRAINT [FK_TeachingAssistant_inherits_Person] FOREIGN KEY([Id])
REFERENCES [dbo].[People] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[People_TeachingAssistant] CHECK CONSTRAINT [FK_TeachingAssistant_inherits_Person]
GO
ALTER TABLE [dbo].[PeoplesEmails]  WITH CHECK ADD  CONSTRAINT [FK_PersonEntity1_Entity1] FOREIGN KEY([Emails_Email])
REFERENCES [dbo].[Emails] ([Email])
GO
ALTER TABLE [dbo].[PeoplesEmails] CHECK CONSTRAINT [FK_PersonEntity1_Entity1]
GO
ALTER TABLE [dbo].[PeoplesEmails]  WITH CHECK ADD  CONSTRAINT [FK_PersonEntity1_Person] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[PeoplesEmails] CHECK CONSTRAINT [FK_PersonEntity1_Person]
GO
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Address] FOREIGN KEY([Addresses_Id])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_Address]
GO
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Person] FOREIGN KEY([People_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_Person]
GO
ALTER TABLE [dbo].[PersonPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhoneNumber_Person] FOREIGN KEY([People_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[PersonPhoneNumber] CHECK CONSTRAINT [FK_PersonPhoneNumber_Person]
GO
ALTER TABLE [dbo].[PersonPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhoneNumber_PhoneNumber] FOREIGN KEY([PhoneNumbers_Number])
REFERENCES [dbo].[PhoneNumbers] ([Number])
GO
ALTER TABLE [dbo].[PersonPhoneNumber] CHECK CONSTRAINT [FK_PersonPhoneNumber_PhoneNumber]
GO
ALTER TABLE [dbo].[PlannedCourses]  WITH CHECK ADD  CONSTRAINT [FK_PlannedCourses_CourseCode] FOREIGN KEY([CourseCode])
REFERENCES [dbo].[CourseCode] ([Code])
GO
ALTER TABLE [dbo].[PlannedCourses] CHECK CONSTRAINT [FK_PlannedCourses_CourseCode]
GO
ALTER TABLE [dbo].[PlannedCourses]  WITH CHECK ADD  CONSTRAINT [FK_PlannedCourses_Quarters] FOREIGN KEY([Quarter])
REFERENCES [dbo].[Quarters] ([Id])
GO
ALTER TABLE [dbo].[PlannedCourses] CHECK CONSTRAINT [FK_PlannedCourses_Quarters]
GO
ALTER TABLE [dbo].[PreReqs]  WITH CHECK ADD  CONSTRAINT [FK_PreReqs_CourseCode] FOREIGN KEY([Course])
REFERENCES [dbo].[CourseCode] ([Code])
GO
ALTER TABLE [dbo].[PreReqs] CHECK CONSTRAINT [FK_PreReqs_CourseCode]
GO
ALTER TABLE [dbo].[PreReqs]  WITH CHECK ADD  CONSTRAINT [FK_PreReqs_CourseCode1] FOREIGN KEY([RequiredCourse])
REFERENCES [dbo].[CourseCode] ([Code])
GO
ALTER TABLE [dbo].[PreReqs] CHECK CONSTRAINT [FK_PreReqs_CourseCode1]
GO
ALTER TABLE [dbo].[Quarters]  WITH CHECK ADD  CONSTRAINT [FK_QuartersYears] FOREIGN KEY([Year])
REFERENCES [dbo].[Years] ([Year])
GO
ALTER TABLE [dbo].[Quarters] CHECK CONSTRAINT [FK_QuartersYears]
GO
ALTER TABLE [dbo].[Quarters]  WITH CHECK ADD  CONSTRAINT [FK_SprintQuarters] FOREIGN KEY([Sprint1])
REFERENCES [dbo].[Sprints] ([Id])
GO
ALTER TABLE [dbo].[Quarters] CHECK CONSTRAINT [FK_SprintQuarters]
GO
ALTER TABLE [dbo].[Quarters]  WITH CHECK ADD  CONSTRAINT [FK_SprintQuarters1] FOREIGN KEY([Sprint2])
REFERENCES [dbo].[Sprints] ([Id])
GO
ALTER TABLE [dbo].[Quarters] CHECK CONSTRAINT [FK_SprintQuarters1]
GO
ALTER TABLE [dbo].[RegisteredCourses]  WITH CHECK ADD  CONSTRAINT [FK_RegisteredCourses_SheduledEvents] FOREIGN KEY([ScheduledCourse])
REFERENCES [dbo].[SheduledEvents] ([Id])
GO
ALTER TABLE [dbo].[RegisteredCourses] CHECK CONSTRAINT [FK_RegisteredCourses_SheduledEvents]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Building] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Building] ([Id])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Building]
GO
ALTER TABLE [dbo].[ScheduledInstructor]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledCoursesInstructor_Instructor] FOREIGN KEY([Instructors_Id])
REFERENCES [dbo].[Instructors] ([Id])
GO
ALTER TABLE [dbo].[ScheduledInstructor] CHECK CONSTRAINT [FK_ScheduledCoursesInstructor_Instructor]
GO
ALTER TABLE [dbo].[ScheduledInstructor]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledCoursesInstructor_ScheduledCourses] FOREIGN KEY([ScheduledCourses_Id])
REFERENCES [dbo].[SheduledEvents] ([Id])
GO
ALTER TABLE [dbo].[ScheduledInstructor] CHECK CONSTRAINT [FK_ScheduledCoursesInstructor_ScheduledCourses]
GO
ALTER TABLE [dbo].[SheduledEvents]  WITH CHECK ADD  CONSTRAINT [FK_CoursesScheduledCourses] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[SheduledEvents] CHECK CONSTRAINT [FK_CoursesScheduledCourses]
GO
ALTER TABLE [dbo].[SheduledEvents]  WITH CHECK ADD  CONSTRAINT [FK_SheduledEventQuarters] FOREIGN KEY([Quarter])
REFERENCES [dbo].[Quarters] ([Id])
GO
ALTER TABLE [dbo].[SheduledEvents] CHECK CONSTRAINT [FK_SheduledEventQuarters]
GO
ALTER TABLE [dbo].[SheduledEvents]  WITH CHECK ADD  CONSTRAINT [FK_SheduledEventRoom] FOREIGN KEY([Room])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[SheduledEvents] CHECK CONSTRAINT [FK_SheduledEventRoom]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_People] FOREIGN KEY([Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_People]
GO
ALTER TABLE [dbo].[TASheduledEvent]  WITH CHECK ADD  CONSTRAINT [FK_TASheduledEvent_SheduledEvent] FOREIGN KEY([SheduledEvents_Id])
REFERENCES [dbo].[SheduledEvents] ([Id])
GO
ALTER TABLE [dbo].[TASheduledEvent] CHECK CONSTRAINT [FK_TASheduledEvent_SheduledEvent]
GO
ALTER TABLE [dbo].[TASheduledEvent]  WITH CHECK ADD  CONSTRAINT [FK_TASheduledEvent_TA] FOREIGN KEY([TeachingAssistants_Id])
REFERENCES [dbo].[People_TeachingAssistant] ([Id])
GO
ALTER TABLE [dbo].[TASheduledEvent] CHECK CONSTRAINT [FK_TASheduledEvent_TA]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Students]
GO
USE [master]
GO
ALTER DATABASE [Test] SET  READ_WRITE 
GO
