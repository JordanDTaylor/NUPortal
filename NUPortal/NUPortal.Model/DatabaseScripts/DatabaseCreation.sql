USE [Test]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[Building]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[Campus]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[CourseCode]    Script Date: 5/11/2016 4:13:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCode](
	[Code] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_CourseCode] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 5/11/2016 4:13:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](7) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Credits] [smallint] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Emails]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[Instructors]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[People]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[People_EmergencyContact]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[People_TeachingAssistant]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[PersonAddress]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[PersonEntity1]    Script Date: 5/11/2016 4:13:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonEntity1](
	[Person_Id] [int] NOT NULL,
	[Emails_Email] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_PersonEntity1] PRIMARY KEY CLUSTERED 
(
	[Person_Id] ASC,
	[Emails_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonPhoneNumber]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[PhoneNumbers]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[PreReqs]    Script Date: 5/11/2016 4:13:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreReqs](
	[Course] [nvarchar](7) NOT NULL,
	[RequiredCourse] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_PreReqs_1] PRIMARY KEY CLUSTERED 
(
	[Course] ASC,
	[RequiredCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PreReqsCourses]    Script Date: 5/11/2016 4:13:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreReqsCourses](
	[PreReq_Course] [int] NOT NULL,
	[PreReq_RequiredCourse] [int] NOT NULL,
	[Courses_Id] [int] NOT NULL,
 CONSTRAINT [PK_PreReqsCourses] PRIMARY KEY CLUSTERED 
(
	[PreReq_Course] ASC,
	[PreReq_RequiredCourse] ASC,
	[Courses_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PreReqsCourses1]    Script Date: 5/11/2016 4:13:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreReqsCourses1](
	[Courses2_Id] [int] NOT NULL,
	[Courses1_Id] [int] NOT NULL,
 CONSTRAINT [PK_PreReqsCourses1] PRIMARY KEY CLUSTERED 
(
	[Courses2_Id] ASC,
	[Courses1_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quarters]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[Rooms]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[ScheduledInstructor]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[SheduledEvents]    Script Date: 5/11/2016 4:13:28 PM ******/
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
	[Course_Id] [int] NOT NULL,
 CONSTRAINT [PK_SheduledEvents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sprints]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[TASheduledEvent]    Script Date: 5/11/2016 4:13:28 PM ******/
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
/****** Object:  Table [dbo].[Years]    Script Date: 5/11/2016 4:13:28 PM ******/
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
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_CourseCode] FOREIGN KEY([Code])
REFERENCES [dbo].[CourseCode] ([Code])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_CourseCode]
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
ALTER TABLE [dbo].[PersonEntity1]  WITH CHECK ADD  CONSTRAINT [FK_PersonEntity1_Entity1] FOREIGN KEY([Emails_Email])
REFERENCES [dbo].[Emails] ([Email])
GO
ALTER TABLE [dbo].[PersonEntity1] CHECK CONSTRAINT [FK_PersonEntity1_Entity1]
GO
ALTER TABLE [dbo].[PersonEntity1]  WITH CHECK ADD  CONSTRAINT [FK_PersonEntity1_Person] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[PersonEntity1] CHECK CONSTRAINT [FK_PersonEntity1_Person]
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
ALTER TABLE [dbo].[PreReqsCourses]  WITH CHECK ADD  CONSTRAINT [FK_PreReqsCourses_Courses] FOREIGN KEY([Courses_Id])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[PreReqsCourses] CHECK CONSTRAINT [FK_PreReqsCourses_Courses]
GO
ALTER TABLE [dbo].[PreReqsCourses1]  WITH CHECK ADD  CONSTRAINT [FK_PreReqsCourses1_Courses] FOREIGN KEY([Courses2_Id])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[PreReqsCourses1] CHECK CONSTRAINT [FK_PreReqsCourses1_Courses]
GO
ALTER TABLE [dbo].[PreReqsCourses1]  WITH CHECK ADD  CONSTRAINT [FK_PreReqsCourses1_Courses1] FOREIGN KEY([Courses1_Id])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[PreReqsCourses1] CHECK CONSTRAINT [FK_PreReqsCourses1_Courses1]
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
