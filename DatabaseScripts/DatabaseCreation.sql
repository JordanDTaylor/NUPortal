USE [master]
GO
/****** Object:  Database [Test]    Script Date: 5/31/2016 2:40:14 PM ******/
CREATE DATABASE [Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NUPORTALDEV\MSSQL\DATA\Test.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NUPORTALDEV\MSSQL\DATA\Test_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [Test] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [Test] SET  DISABLE_BROKER 
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
ALTER DATABASE [Test] SET RECOVERY FULL 
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
EXEC sys.sp_db_vardecimal_storage_format N'Test', N'ON'
GO
USE [Test]
GO
/****** Object:  Schema [Contact]    Script Date: 5/31/2016 2:40:15 PM ******/
CREATE SCHEMA [Contact]
GO
/****** Object:  Schema [Degree]    Script Date: 5/31/2016 2:40:15 PM ******/
CREATE SCHEMA [Degree]
GO
/****** Object:  Schema [Financial]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE SCHEMA [Financial]
GO
/****** Object:  Schema [Passport]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE SCHEMA [Passport]
GO
/****** Object:  Schema [Schedule]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE SCHEMA [Schedule]
GO
/****** Object:  Table [Contact].[Addresses]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street1] [nvarchar](max) NOT NULL,
	[Street2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Contact].[Building]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Contact].[Building](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CampusId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[PhoneNumberId] [int] NULL,
	[BuildingName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Contact].[Campus]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Contact].[Campus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NULL,
	[PhoneNumberId] [int] NULL,
	[CampusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Campus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Contact].[Emails]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[Emails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_Emails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Contact].[EmergencyContact]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[EmergencyContact](
	[ContactFor] [int] NOT NULL,
	[PersonId] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Contact].[EnrolledStudents]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[EnrolledStudents](
	[StudentId] [int] NOT NULL,
	[EnrolledCampusId] [int] NOT NULL,
	[CohortId] [int] NULL,
	[CurrentlyEnrolled] [bit] NOT NULL,
 CONSTRAINT [PK_EnrolledStudents] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[EnrolledCampusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Contact].[Instructors]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[Instructors](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_People_Instructor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Contact].[People]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PreferedName] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[PrimaryPhoneId] [int] NULL,
	[PrimaryEmailId] [int] NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[SocialSecurity] [nvarchar](9) NULL CONSTRAINT [DF_People_SocialSecurity]  DEFAULT ((0)),
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Contact].[PeoplesEmails]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[PeoplesEmails](
	[Person_Id] [int] NOT NULL,
	[EmailId] [int] NOT NULL,
 CONSTRAINT [PK_PersonEntity1] PRIMARY KEY CLUSTERED 
(
	[Person_Id] ASC,
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Contact].[PersonAddress]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[PersonAddress](
	[People_Id] [int] NOT NULL,
	[Addresses_Id] [int] NOT NULL,
 CONSTRAINT [PK_PersonAddress] PRIMARY KEY CLUSTERED 
(
	[People_Id] ASC,
	[Addresses_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Contact].[PersonPhoneNumber]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[PersonPhoneNumber](
	[PeopleId] [int] NOT NULL,
	[PhoneNumberId] [int] NOT NULL,
 CONSTRAINT [PK_PersonPhoneNumber] PRIMARY KEY CLUSTERED 
(
	[PeopleId] ASC,
	[PhoneNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Contact].[PhoneNumbers]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[PhoneNumbers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[SupportsSMS] [bit] NOT NULL,
	[IsFax] [bit] NOT NULL,
 CONSTRAINT [PK_PhoneNumbers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Contact].[Rooms]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [nvarchar](10) NULL,
	[BuildingId] [int] NULL,
	[PhoneNumberId] [int] NULL,
	[Capacity] [int] NOT NULL CONSTRAINT [DF_Rooms_Capacity]  DEFAULT ((0)),
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Contact].[Staff]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[Staff](
	[RoomId] [int] NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Contact].[Students]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[Students](
	[FinancialAdvisor_PersonId] [int] NULL,
	[Advocate_PersonId] [int] NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Contact].[TeachingAssistant]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact].[TeachingAssistant](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_People_TeachingAssistant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Degree].[Degree]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Degree].[Degree](
	[Id] [nvarchar](6) NOT NULL,
	[Name] [nvarchar](128) NULL,
 CONSTRAINT [PK_Degree] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Degree].[DegreeTrack]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Degree].[DegreeTrack](
	[Id] [int] NOT NULL,
	[DegreeId] [nvarchar](6) NULL,
	[CohortId] [int] NULL,
 CONSTRAINT [PK_DegreeTrack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Degree].[DegreeTrackCourses]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Degree].[DegreeTrackCourses](
	[DegreeTrackId] [int] NOT NULL,
	[CourseCode] [nvarchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DegreeTrackId] ASC,
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Financial].[AcademicYear]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Financial].[AcademicYear](
	[StartQuarter] [int] NOT NULL,
	[EndQuarter] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AcademicYear] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Financial].[AwardLetter]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Financial].[AwardLetter](
	[AcademicYearId] [int] NOT NULL,
	[Id] [nchar](10) NOT NULL,
	[StudentId] [int] NOT NULL,
	[DateIssued] [datetime] NOT NULL,
	[Tuition_Fees] [money] NOT NULL,
	[Books_Supplies] [money] NOT NULL,
	[Housing] [money] NOT NULL,
	[LivingExpensesQ1] [money] NOT NULL,
	[LivingExpensesQ2] [money] NOT NULL,
	[LivingExpensesQ3] [money] NOT NULL,
	[PreviousBalance] [money] NOT NULL,
	[PellGrant] [money] NOT NULL,
	[SEO_Grant] [money] NOT NULL,
	[VA_Benefits] [money] NOT NULL,
	[VA_YellowRibonMatch] [money] NOT NULL,
	[PresidentialScholarship] [money] NOT NULL,
	[AccessGrant] [money] NOT NULL,
	[TransferScholarship] [money] NOT NULL,
	[ResidentGrant] [money] NOT NULL,
	[OutsideScholarship] [money] NOT NULL,
	[PersonalFamilyContributions] [money] NOT NULL,
	[FederalSubsidizedLoan] [money] NOT NULL,
	[FederalUnsubsidizedLoan] [money] NOT NULL,
	[Federal_PLUS_Loan] [money] NOT NULL,
	[OtherLoan] [money] NOT NULL,
	[OtherLoanType] [nvarchar](50) NOT NULL,
	[PreviousOtherLoanBalance] [money] NOT NULL,
 CONSTRAINT [PK_AwardLetter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Financial].[OtherLoanType]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Financial].[OtherLoanType](
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OtherLoanType] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Financial].[Transactions]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Financial].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Reference] [nvarchar](50) NULL,
	[Amount] [money] NOT NULL,
	[Qualifies1098] [bit] NOT NULL CONSTRAINT [DF_Transactions_Qualifies1098]  DEFAULT ((0)),
	[Scholarship_Grant] [bit] NOT NULL CONSTRAINT [DF_Transactions_Scholarship_Grant]  DEFAULT ((0)),
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Passport].[LocalLogins]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Passport].[LocalLogins](
	[username] [nvarchar](256) NOT NULL,
	[password] [nvarchar](256) NOT NULL,
	[PersonId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Passport].[LocalTokens]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Passport].[LocalTokens](
	[token] [varchar](38) NOT NULL,
	[username] [nvarchar](256) NULL,
	[expiry] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Schedule].[AttemptedCourses]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[AttemptedCourses](
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
/****** Object:  Table [Schedule].[CategoryCodes]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[CategoryCodes](
	[Category] [int] NOT NULL,
	[Course] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_CategoryCodes] PRIMARY KEY CLUSTERED 
(
	[Category] ASC,
	[Course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Schedule].[Cohort]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[Cohort](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NULL,
 CONSTRAINT [PK_Cohort] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Schedule].[CourseCategory]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[CourseCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Label] [nvarchar](100) NULL,
 CONSTRAINT [PK_CourseCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Schedule].[CourseCode]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[CourseCode](
	[Code] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_CourseCode] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Schedule].[Courses]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[Courses](
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
/****** Object:  Table [Schedule].[ElectiveCategories]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[ElectiveCategories](
	[CategoryId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_ElectiveCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Schedule].[PlannedCourses]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[PlannedCourses](
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
/****** Object:  Table [Schedule].[PreReqs]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[PreReqs](
	[Course] [nvarchar](8) NOT NULL,
	[RequiredCourse] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_PreReqs_1] PRIMARY KEY CLUSTERED 
(
	[Course] ASC,
	[RequiredCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Schedule].[Quarters]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[Quarters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Label] [nvarchar](10) NOT NULL,
	[Sprint1] [int] NOT NULL,
	[Sprint2] [int] NOT NULL,
 CONSTRAINT [PK_Quarters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Schedule].[RegisteredCourses]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[RegisteredCourses](
	[StudentId] [int] NOT NULL,
	[ScheduledCourse] [int] NOT NULL,
 CONSTRAINT [PK_RegisteredCourses] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[ScheduledCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Schedule].[ScheduledEvents]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[ScheduledEvents](
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
/****** Object:  Table [Schedule].[ScheduledInstructor]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[ScheduledInstructor](
	[ScheduledCourses_Id] [int] NOT NULL,
	[Instructors_Id] [int] NOT NULL,
 CONSTRAINT [PK_ScheduledCoursesInstructor] PRIMARY KEY CLUSTERED 
(
	[ScheduledCourses_Id] ASC,
	[Instructors_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Schedule].[SheduledTA]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[SheduledTA](
	[TeachingAssistants_Id] [int] NOT NULL,
	[ScheduledEvents_Id] [int] NOT NULL,
 CONSTRAINT [PK_TASheduledEvent] PRIMARY KEY CLUSTERED 
(
	[TeachingAssistants_Id] ASC,
	[ScheduledEvents_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Schedule].[Sprints]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[Sprints](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Sprints] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Schedule].[Years]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Schedule].[Years](
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Years] PRIMARY KEY CLUSTERED 
(
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Emails]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Emails] ON [Contact].[Emails]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonEmails]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonEmails] ON [Contact].[People]
(
	[PrimaryEmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonPhoneNumber1]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonPhoneNumber1] ON [Contact].[People]
(
	[PrimaryPhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonEntity1_Entity1]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonEntity1_Entity1] ON [Contact].[PeoplesEmails]
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonAddress_Address]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonAddress_Address] ON [Contact].[PersonAddress]
(
	[Addresses_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonPhoneNumber_PhoneNumber]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonPhoneNumber_PhoneNumber] ON [Contact].[PersonPhoneNumber]
(
	[PhoneNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AcademicYear]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AcademicYear] ON [Financial].[AcademicYear]
(
	[StartQuarter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SprintQuarters]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SprintQuarters] ON [Schedule].[Quarters]
(
	[Sprint1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SprintQuarters1]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SprintQuarters1] ON [Schedule].[Quarters]
(
	[Sprint2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CoursesScheduledCourses]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CoursesScheduledCourses] ON [Schedule].[ScheduledEvents]
(
	[Course_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SheduledEventQuarters]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SheduledEventQuarters] ON [Schedule].[ScheduledEvents]
(
	[Quarter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SheduledEventRoom]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_SheduledEventRoom] ON [Schedule].[ScheduledEvents]
(
	[Room] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ScheduledCoursesInstructor_Instructor]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ScheduledCoursesInstructor_Instructor] ON [Schedule].[ScheduledInstructor]
(
	[Instructors_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TASheduledEvent_SheduledEvent]    Script Date: 5/31/2016 2:40:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_TASheduledEvent_SheduledEvent] ON [Schedule].[SheduledTA]
(
	[ScheduledEvents_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_Tuition_Fees]  DEFAULT ((0)) FOR [Tuition_Fees]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_Books_Supplies]  DEFAULT ((0)) FOR [Books_Supplies]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_Housing]  DEFAULT ((0)) FOR [Housing]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_LivingExpensesQ1]  DEFAULT ((0)) FOR [LivingExpensesQ1]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_LivingExpensesQ2]  DEFAULT ((0)) FOR [LivingExpensesQ2]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_LivingExpensesQ3]  DEFAULT ((0)) FOR [LivingExpensesQ3]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_PreviousBalance]  DEFAULT ((0)) FOR [PreviousBalance]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_PellGrant]  DEFAULT ((0)) FOR [PellGrant]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_SEO_Grant]  DEFAULT ((0)) FOR [SEO_Grant]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_VA_Benefits]  DEFAULT ((0)) FOR [VA_Benefits]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_VA_YellowRibonMatch]  DEFAULT ((0)) FOR [VA_YellowRibonMatch]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_PresidentialScholarship]  DEFAULT ((0)) FOR [PresidentialScholarship]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_AccessGrant]  DEFAULT ((0)) FOR [AccessGrant]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_TransferScholarship]  DEFAULT ((0)) FOR [TransferScholarship]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_ResidentGrant]  DEFAULT ((0)) FOR [ResidentGrant]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_OutsideScholarship]  DEFAULT ((0)) FOR [OutsideScholarship]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_PersonalFamilyContributions]  DEFAULT ((0)) FOR [PersonalFamilyContributions]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_FederalSubsidizedLoan]  DEFAULT ((0)) FOR [FederalSubsidizedLoan]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_FederalUnsubsidizedLoan]  DEFAULT ((0)) FOR [FederalUnsubsidizedLoan]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_Federal_PLUS_Loan]  DEFAULT ((0)) FOR [Federal_PLUS_Loan]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_OtherLoan]  DEFAULT ((0)) FOR [OtherLoan]
GO
ALTER TABLE [Financial].[AwardLetter] ADD  CONSTRAINT [DF_AwardLetter_PreviousOtherLoanBalance]  DEFAULT ((0)) FOR [PreviousOtherLoanBalance]
GO
ALTER TABLE [Contact].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_Addresses] FOREIGN KEY([AddressId])
REFERENCES [Contact].[Addresses] ([Id])
GO
ALTER TABLE [Contact].[Building] CHECK CONSTRAINT [FK_Building_Addresses]
GO
ALTER TABLE [Contact].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_Campus] FOREIGN KEY([CampusId])
REFERENCES [Contact].[Campus] ([Id])
GO
ALTER TABLE [Contact].[Building] CHECK CONSTRAINT [FK_Building_Campus]
GO
ALTER TABLE [Contact].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_PhoneNumbers] FOREIGN KEY([PhoneNumberId])
REFERENCES [Contact].[PhoneNumbers] ([Id])
GO
ALTER TABLE [Contact].[Building] CHECK CONSTRAINT [FK_Building_PhoneNumbers]
GO
ALTER TABLE [Contact].[Campus]  WITH CHECK ADD  CONSTRAINT [FK_Campus_Addresses] FOREIGN KEY([AddressId])
REFERENCES [Contact].[Addresses] ([Id])
GO
ALTER TABLE [Contact].[Campus] CHECK CONSTRAINT [FK_Campus_Addresses]
GO
ALTER TABLE [Contact].[Campus]  WITH CHECK ADD  CONSTRAINT [FK_Campus_PhoneNumbers] FOREIGN KEY([PhoneNumberId])
REFERENCES [Contact].[PhoneNumbers] ([Id])
GO
ALTER TABLE [Contact].[Campus] CHECK CONSTRAINT [FK_Campus_PhoneNumbers]
GO
ALTER TABLE [Contact].[EmergencyContact]  WITH CHECK ADD  CONSTRAINT [FK_EmergencyContact_People] FOREIGN KEY([ContactFor])
REFERENCES [Contact].[People] ([Id])
GO
ALTER TABLE [Contact].[EmergencyContact] CHECK CONSTRAINT [FK_EmergencyContact_People]
GO
ALTER TABLE [Contact].[EmergencyContact]  WITH CHECK ADD  CONSTRAINT [FK_EmergencyContact_People1] FOREIGN KEY([PersonId])
REFERENCES [Contact].[People] ([Id])
GO
ALTER TABLE [Contact].[EmergencyContact] CHECK CONSTRAINT [FK_EmergencyContact_People1]
GO
ALTER TABLE [Contact].[EnrolledStudents]  WITH CHECK ADD  CONSTRAINT [FK_EnrolledStudents_Campus] FOREIGN KEY([EnrolledCampusId])
REFERENCES [Contact].[Campus] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Contact].[EnrolledStudents] CHECK CONSTRAINT [FK_EnrolledStudents_Campus]
GO
ALTER TABLE [Contact].[EnrolledStudents]  WITH CHECK ADD  CONSTRAINT [FK_EnrolledStudents_Cohort] FOREIGN KEY([CohortId])
REFERENCES [Schedule].[Cohort] ([Id])
GO
ALTER TABLE [Contact].[EnrolledStudents] CHECK CONSTRAINT [FK_EnrolledStudents_Cohort]
GO
ALTER TABLE [Contact].[EnrolledStudents]  WITH CHECK ADD  CONSTRAINT [FK_EnrolledStudents_Students] FOREIGN KEY([StudentId])
REFERENCES [Contact].[Students] ([PersonId])
GO
ALTER TABLE [Contact].[EnrolledStudents] CHECK CONSTRAINT [FK_EnrolledStudents_Students]
GO
ALTER TABLE [Contact].[Instructors]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_inherits_Person] FOREIGN KEY([Id])
REFERENCES [Contact].[People] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Contact].[Instructors] CHECK CONSTRAINT [FK_Instructor_inherits_Person]
GO
ALTER TABLE [Contact].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Emails] FOREIGN KEY([PrimaryEmailId])
REFERENCES [Contact].[Emails] ([Id])
GO
ALTER TABLE [Contact].[People] CHECK CONSTRAINT [FK_People_Emails]
GO
ALTER TABLE [Contact].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_PhoneNumbers] FOREIGN KEY([PrimaryPhoneId])
REFERENCES [Contact].[PhoneNumbers] ([Id])
GO
ALTER TABLE [Contact].[People] CHECK CONSTRAINT [FK_People_PhoneNumbers]
GO
ALTER TABLE [Contact].[PeoplesEmails]  WITH CHECK ADD  CONSTRAINT [FK_PeoplesEmails_Emails] FOREIGN KEY([EmailId])
REFERENCES [Contact].[Emails] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Contact].[PeoplesEmails] CHECK CONSTRAINT [FK_PeoplesEmails_Emails]
GO
ALTER TABLE [Contact].[PeoplesEmails]  WITH CHECK ADD  CONSTRAINT [FK_PersonEntity1_Person] FOREIGN KEY([Person_Id])
REFERENCES [Contact].[People] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Contact].[PeoplesEmails] CHECK CONSTRAINT [FK_PersonEntity1_Person]
GO
ALTER TABLE [Contact].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Address] FOREIGN KEY([Addresses_Id])
REFERENCES [Contact].[Addresses] ([Id])
GO
ALTER TABLE [Contact].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_Address]
GO
ALTER TABLE [Contact].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Person] FOREIGN KEY([People_Id])
REFERENCES [Contact].[People] ([Id])
GO
ALTER TABLE [Contact].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_Person]
GO
ALTER TABLE [Contact].[PersonPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhoneNumber_Person] FOREIGN KEY([PeopleId])
REFERENCES [Contact].[People] ([Id])
GO
ALTER TABLE [Contact].[PersonPhoneNumber] CHECK CONSTRAINT [FK_PersonPhoneNumber_Person]
GO
ALTER TABLE [Contact].[PersonPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhoneNumber_PhoneNumbers] FOREIGN KEY([PhoneNumberId])
REFERENCES [Contact].[PhoneNumbers] ([Id])
GO
ALTER TABLE [Contact].[PersonPhoneNumber] CHECK CONSTRAINT [FK_PersonPhoneNumber_PhoneNumbers]
GO
ALTER TABLE [Contact].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Building] FOREIGN KEY([BuildingId])
REFERENCES [Contact].[Building] ([Id])
GO
ALTER TABLE [Contact].[Rooms] CHECK CONSTRAINT [FK_Rooms_Building]
GO
ALTER TABLE [Contact].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_PhoneNumbers] FOREIGN KEY([PhoneNumberId])
REFERENCES [Contact].[PhoneNumbers] ([Id])
GO
ALTER TABLE [Contact].[Rooms] CHECK CONSTRAINT [FK_Rooms_PhoneNumbers]
GO
ALTER TABLE [Contact].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_People] FOREIGN KEY([PersonId])
REFERENCES [Contact].[People] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Contact].[Staff] CHECK CONSTRAINT [FK_Staff_People]
GO
ALTER TABLE [Contact].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Rooms] FOREIGN KEY([RoomId])
REFERENCES [Contact].[Rooms] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Contact].[Staff] CHECK CONSTRAINT [FK_Staff_Rooms]
GO
ALTER TABLE [Contact].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_People] FOREIGN KEY([PersonId])
REFERENCES [Contact].[People] ([Id])
GO
ALTER TABLE [Contact].[Students] CHECK CONSTRAINT [FK_Students_People]
GO
ALTER TABLE [Contact].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Staff] FOREIGN KEY([FinancialAdvisor_PersonId])
REFERENCES [Contact].[Staff] ([PersonId])
GO
ALTER TABLE [Contact].[Students] CHECK CONSTRAINT [FK_Students_Staff]
GO
ALTER TABLE [Contact].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Staff1] FOREIGN KEY([Advocate_PersonId])
REFERENCES [Contact].[Staff] ([PersonId])
GO
ALTER TABLE [Contact].[Students] CHECK CONSTRAINT [FK_Students_Staff1]
GO
ALTER TABLE [Degree].[DegreeTrack]  WITH CHECK ADD  CONSTRAINT [FK_DegreeTrack_Cohort] FOREIGN KEY([CohortId])
REFERENCES [Schedule].[Cohort] ([Id])
GO
ALTER TABLE [Degree].[DegreeTrack] CHECK CONSTRAINT [FK_DegreeTrack_Cohort]
GO
ALTER TABLE [Degree].[DegreeTrack]  WITH CHECK ADD  CONSTRAINT [FK_DegreeTrack_Degree] FOREIGN KEY([DegreeId])
REFERENCES [Degree].[Degree] ([Id])
GO
ALTER TABLE [Degree].[DegreeTrack] CHECK CONSTRAINT [FK_DegreeTrack_Degree]
GO
ALTER TABLE [Degree].[DegreeTrackCourses]  WITH CHECK ADD FOREIGN KEY([CourseCode])
REFERENCES [Schedule].[CourseCode] ([Code])
GO
ALTER TABLE [Degree].[DegreeTrackCourses]  WITH CHECK ADD FOREIGN KEY([DegreeTrackId])
REFERENCES [Degree].[DegreeTrack] ([Id])
GO
ALTER TABLE [Financial].[AcademicYear]  WITH CHECK ADD  CONSTRAINT [FK_AcademicYear_Quarters] FOREIGN KEY([StartQuarter])
REFERENCES [Schedule].[Quarters] ([Id])
GO
ALTER TABLE [Financial].[AcademicYear] CHECK CONSTRAINT [FK_AcademicYear_Quarters]
GO
ALTER TABLE [Financial].[AcademicYear]  WITH CHECK ADD  CONSTRAINT [FK_AcademicYear_Quarters1] FOREIGN KEY([EndQuarter])
REFERENCES [Schedule].[Quarters] ([Id])
GO
ALTER TABLE [Financial].[AcademicYear] CHECK CONSTRAINT [FK_AcademicYear_Quarters1]
GO
ALTER TABLE [Financial].[AwardLetter]  WITH CHECK ADD  CONSTRAINT [FK_AwardLetter_AcademicYear] FOREIGN KEY([AcademicYearId])
REFERENCES [Financial].[AcademicYear] ([Id])
GO
ALTER TABLE [Financial].[AwardLetter] CHECK CONSTRAINT [FK_AwardLetter_AcademicYear]
GO
ALTER TABLE [Financial].[AwardLetter]  WITH CHECK ADD  CONSTRAINT [FK_AwardLetter_OtherLoanType] FOREIGN KEY([OtherLoanType])
REFERENCES [Financial].[OtherLoanType] ([Type])
GO
ALTER TABLE [Financial].[AwardLetter] CHECK CONSTRAINT [FK_AwardLetter_OtherLoanType]
GO
ALTER TABLE [Financial].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Students] FOREIGN KEY([StudentId])
REFERENCES [Contact].[Students] ([PersonId])
GO
ALTER TABLE [Financial].[Transactions] CHECK CONSTRAINT [FK_Transactions_Students]
GO
ALTER TABLE [Passport].[LocalLogins]  WITH CHECK ADD  CONSTRAINT [FK__LocalLogi__Perso__41B8C09B] FOREIGN KEY([PersonId])
REFERENCES [Contact].[People] ([Id])
GO
ALTER TABLE [Passport].[LocalLogins] CHECK CONSTRAINT [FK__LocalLogi__Perso__41B8C09B]
GO
ALTER TABLE [Passport].[LocalTokens]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [Passport].[LocalLogins] ([username])
GO
ALTER TABLE [Schedule].[AttemptedCourses]  WITH CHECK ADD  CONSTRAINT [FK_AttemptedCourses_SheduledEvents] FOREIGN KEY([ScheduledEventId])
REFERENCES [Schedule].[ScheduledEvents] ([Id])
GO
ALTER TABLE [Schedule].[AttemptedCourses] CHECK CONSTRAINT [FK_AttemptedCourses_SheduledEvents]
GO
ALTER TABLE [Schedule].[AttemptedCourses]  WITH CHECK ADD  CONSTRAINT [FK_AttemptedCourses_Students] FOREIGN KEY([StudentId])
REFERENCES [Contact].[Students] ([PersonId])
GO
ALTER TABLE [Schedule].[AttemptedCourses] CHECK CONSTRAINT [FK_AttemptedCourses_Students]
GO
ALTER TABLE [Schedule].[CategoryCodes]  WITH CHECK ADD  CONSTRAINT [FK_CategoryCodes_CourseCategory] FOREIGN KEY([Category])
REFERENCES [Schedule].[CourseCategory] ([Id])
GO
ALTER TABLE [Schedule].[CategoryCodes] CHECK CONSTRAINT [FK_CategoryCodes_CourseCategory]
GO
ALTER TABLE [Schedule].[CategoryCodes]  WITH CHECK ADD  CONSTRAINT [FK_CategoryCodes_CourseCode] FOREIGN KEY([Course])
REFERENCES [Schedule].[CourseCode] ([Code])
GO
ALTER TABLE [Schedule].[CategoryCodes] CHECK CONSTRAINT [FK_CategoryCodes_CourseCode]
GO
ALTER TABLE [Schedule].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_CourseCode] FOREIGN KEY([Code])
REFERENCES [Schedule].[CourseCode] ([Code])
GO
ALTER TABLE [Schedule].[Courses] CHECK CONSTRAINT [FK_Courses_CourseCode]
GO
ALTER TABLE [Schedule].[ElectiveCategories]  WITH CHECK ADD  CONSTRAINT [FK_ElectiveCategories_Courses] FOREIGN KEY([CourseId])
REFERENCES [Schedule].[Courses] ([Id])
GO
ALTER TABLE [Schedule].[ElectiveCategories] CHECK CONSTRAINT [FK_ElectiveCategories_Courses]
GO
ALTER TABLE [Schedule].[ElectiveCategories]  WITH CHECK ADD  CONSTRAINT [FK_ElectiveCategories_ElectiveCategories] FOREIGN KEY([CategoryId])
REFERENCES [Schedule].[CourseCategory] ([Id])
GO
ALTER TABLE [Schedule].[ElectiveCategories] CHECK CONSTRAINT [FK_ElectiveCategories_ElectiveCategories]
GO
ALTER TABLE [Schedule].[PlannedCourses]  WITH CHECK ADD  CONSTRAINT [FK_PlannedCourses_CourseCode] FOREIGN KEY([CourseCode])
REFERENCES [Schedule].[CourseCode] ([Code])
GO
ALTER TABLE [Schedule].[PlannedCourses] CHECK CONSTRAINT [FK_PlannedCourses_CourseCode]
GO
ALTER TABLE [Schedule].[PlannedCourses]  WITH CHECK ADD  CONSTRAINT [FK_PlannedCourses_Quarters] FOREIGN KEY([Quarter])
REFERENCES [Schedule].[Quarters] ([Id])
GO
ALTER TABLE [Schedule].[PlannedCourses] CHECK CONSTRAINT [FK_PlannedCourses_Quarters]
GO
ALTER TABLE [Schedule].[PreReqs]  WITH CHECK ADD  CONSTRAINT [FK_PreReqs_CourseCode] FOREIGN KEY([Course])
REFERENCES [Schedule].[CourseCode] ([Code])
GO
ALTER TABLE [Schedule].[PreReqs] CHECK CONSTRAINT [FK_PreReqs_CourseCode]
GO
ALTER TABLE [Schedule].[PreReqs]  WITH CHECK ADD  CONSTRAINT [FK_PreReqs_CourseCode1] FOREIGN KEY([RequiredCourse])
REFERENCES [Schedule].[CourseCode] ([Code])
GO
ALTER TABLE [Schedule].[PreReqs] CHECK CONSTRAINT [FK_PreReqs_CourseCode1]
GO
ALTER TABLE [Schedule].[Quarters]  WITH CHECK ADD  CONSTRAINT [FK_SprintQuarters] FOREIGN KEY([Sprint1])
REFERENCES [Schedule].[Sprints] ([Id])
GO
ALTER TABLE [Schedule].[Quarters] CHECK CONSTRAINT [FK_SprintQuarters]
GO
ALTER TABLE [Schedule].[Quarters]  WITH CHECK ADD  CONSTRAINT [FK_SprintQuarters1] FOREIGN KEY([Sprint2])
REFERENCES [Schedule].[Sprints] ([Id])
GO
ALTER TABLE [Schedule].[Quarters] CHECK CONSTRAINT [FK_SprintQuarters1]
GO
ALTER TABLE [Schedule].[RegisteredCourses]  WITH CHECK ADD  CONSTRAINT [FK_RegisteredCourses_SheduledEvents] FOREIGN KEY([ScheduledCourse])
REFERENCES [Schedule].[ScheduledEvents] ([Id])
GO
ALTER TABLE [Schedule].[RegisteredCourses] CHECK CONSTRAINT [FK_RegisteredCourses_SheduledEvents]
GO
ALTER TABLE [Schedule].[ScheduledEvents]  WITH CHECK ADD  CONSTRAINT [FK_CoursesScheduledCourses] FOREIGN KEY([Course_Id])
REFERENCES [Schedule].[Courses] ([Id])
GO
ALTER TABLE [Schedule].[ScheduledEvents] CHECK CONSTRAINT [FK_CoursesScheduledCourses]
GO
ALTER TABLE [Schedule].[ScheduledEvents]  WITH CHECK ADD  CONSTRAINT [FK_SheduledEventQuarters] FOREIGN KEY([Quarter])
REFERENCES [Schedule].[Quarters] ([Id])
GO
ALTER TABLE [Schedule].[ScheduledEvents] CHECK CONSTRAINT [FK_SheduledEventQuarters]
GO
ALTER TABLE [Schedule].[ScheduledEvents]  WITH CHECK ADD  CONSTRAINT [FK_SheduledEventRoom] FOREIGN KEY([Room])
REFERENCES [Contact].[Rooms] ([Id])
GO
ALTER TABLE [Schedule].[ScheduledEvents] CHECK CONSTRAINT [FK_SheduledEventRoom]
GO
ALTER TABLE [Schedule].[ScheduledInstructor]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledCoursesInstructor_Instructor] FOREIGN KEY([Instructors_Id])
REFERENCES [Contact].[Instructors] ([Id])
GO
ALTER TABLE [Schedule].[ScheduledInstructor] CHECK CONSTRAINT [FK_ScheduledCoursesInstructor_Instructor]
GO
ALTER TABLE [Schedule].[ScheduledInstructor]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledCoursesInstructor_ScheduledCourses] FOREIGN KEY([ScheduledCourses_Id])
REFERENCES [Schedule].[ScheduledEvents] ([Id])
GO
ALTER TABLE [Schedule].[ScheduledInstructor] CHECK CONSTRAINT [FK_ScheduledCoursesInstructor_ScheduledCourses]
GO
ALTER TABLE [Schedule].[SheduledTA]  WITH CHECK ADD  CONSTRAINT [FK_TASheduledEvent_SheduledEvent] FOREIGN KEY([ScheduledEvents_Id])
REFERENCES [Schedule].[ScheduledEvents] ([Id])
GO
ALTER TABLE [Schedule].[SheduledTA] CHECK CONSTRAINT [FK_TASheduledEvent_SheduledEvent]
GO
ALTER TABLE [Schedule].[SheduledTA]  WITH CHECK ADD  CONSTRAINT [FK_TASheduledEvent_TA] FOREIGN KEY([TeachingAssistants_Id])
REFERENCES [Contact].[TeachingAssistant] ([Id])
GO
ALTER TABLE [Schedule].[SheduledTA] CHECK CONSTRAINT [FK_TASheduledEvent_TA]
GO
/****** Object:  StoredProcedure [Financial].[getStudentTransactions]    Script Date: 5/31/2016 2:40:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Financial].[getStudentTransactions] 
    @sId int 
AS 
    SET NOCOUNT ON;
	SELECT StudentId, [Date], Description, Reference, Amount, Balance = SUM(Amount)
	OVER (ORDER BY [Date], Id)
	FROM Financial.Transactions
	WHERE StudentId = @sId

GO
USE [master]
GO
ALTER DATABASE [Test] SET  READ_WRITE 
GO
