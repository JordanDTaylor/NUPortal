
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/11/2016 15:18:07
-- Generated from EDMX file: D:\Classes\16_Q2_Spring\NUPortal\NUPortal\NUPortal.Model\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Test];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_QuartersYears]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Quarters] DROP CONSTRAINT [FK_QuartersYears];
GO
IF OBJECT_ID(N'[dbo].[FK_SprintQuarters]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Quarters] DROP CONSTRAINT [FK_SprintQuarters];
GO
IF OBJECT_ID(N'[dbo].[FK_SprintQuarters1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Quarters] DROP CONSTRAINT [FK_SprintQuarters1];
GO
IF OBJECT_ID(N'[dbo].[FK_ScheduledCoursesInstructor_ScheduledCourses]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ScheduledCoursesInstructor] DROP CONSTRAINT [FK_ScheduledCoursesInstructor_ScheduledCourses];
GO
IF OBJECT_ID(N'[dbo].[FK_ScheduledCoursesInstructor_Instructor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ScheduledCoursesInstructor] DROP CONSTRAINT [FK_ScheduledCoursesInstructor_Instructor];
GO
IF OBJECT_ID(N'[dbo].[FK_CoursesScheduledCourses]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SheduledEvents] DROP CONSTRAINT [FK_CoursesScheduledCourses];
GO
IF OBJECT_ID(N'[dbo].[FK_SheduledEventRoom]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SheduledEvents] DROP CONSTRAINT [FK_SheduledEventRoom];
GO
IF OBJECT_ID(N'[dbo].[FK_SheduledEventQuarters]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SheduledEvents] DROP CONSTRAINT [FK_SheduledEventQuarters];
GO
IF OBJECT_ID(N'[dbo].[FK_TASheduledEvent_TA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TASheduledEvent] DROP CONSTRAINT [FK_TASheduledEvent_TA];
GO
IF OBJECT_ID(N'[dbo].[FK_TASheduledEvent_SheduledEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TASheduledEvent] DROP CONSTRAINT [FK_TASheduledEvent_SheduledEvent];
GO
IF OBJECT_ID(N'[dbo].[FK_PreReqsCourses_PreReqs]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PreReqsCourses] DROP CONSTRAINT [FK_PreReqsCourses_PreReqs];
GO
IF OBJECT_ID(N'[dbo].[FK_PreReqsCourses_Courses]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PreReqsCourses] DROP CONSTRAINT [FK_PreReqsCourses_Courses];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonPhoneNumber_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonPhoneNumber] DROP CONSTRAINT [FK_PersonPhoneNumber_Person];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonPhoneNumber_PhoneNumber]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonPhoneNumber] DROP CONSTRAINT [FK_PersonPhoneNumber_PhoneNumber];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonPhoneNumber1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_PersonPhoneNumber1];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonEntity1_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonEntity1] DROP CONSTRAINT [FK_PersonEntity1_Person];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonEntity1_Entity1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonEntity1] DROP CONSTRAINT [FK_PersonEntity1_Entity1];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonEmails]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People] DROP CONSTRAINT [FK_PersonEmails];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonAddress_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonAddress] DROP CONSTRAINT [FK_PersonAddress_Person];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonAddress_Address]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonAddress] DROP CONSTRAINT [FK_PersonAddress_Address];
GO
IF OBJECT_ID(N'[dbo].[FK_Instructor_inherits_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People_Instructor] DROP CONSTRAINT [FK_Instructor_inherits_Person];
GO
IF OBJECT_ID(N'[dbo].[FK_TeachingAssistant_inherits_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People_TeachingAssistant] DROP CONSTRAINT [FK_TeachingAssistant_inherits_Person];
GO
IF OBJECT_ID(N'[dbo].[FK_EmergencyContact_inherits_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People_EmergencyContact] DROP CONSTRAINT [FK_EmergencyContact_inherits_Person];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[SheduledEvents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SheduledEvents];
GO
IF OBJECT_ID(N'[dbo].[Courses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Courses];
GO
IF OBJECT_ID(N'[dbo].[Quarters]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Quarters];
GO
IF OBJECT_ID(N'[dbo].[Years]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Years];
GO
IF OBJECT_ID(N'[dbo].[Sprints]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sprints];
GO
IF OBJECT_ID(N'[dbo].[Rooms]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rooms];
GO
IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[PreReqs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PreReqs];
GO
IF OBJECT_ID(N'[dbo].[Addresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Addresses];
GO
IF OBJECT_ID(N'[dbo].[PhoneNumbers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhoneNumbers];
GO
IF OBJECT_ID(N'[dbo].[Emails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Emails];
GO
IF OBJECT_ID(N'[dbo].[People_Instructor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People_Instructor];
GO
IF OBJECT_ID(N'[dbo].[People_TeachingAssistant]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People_TeachingAssistant];
GO
IF OBJECT_ID(N'[dbo].[People_EmergencyContact]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People_EmergencyContact];
GO
IF OBJECT_ID(N'[dbo].[ScheduledCoursesInstructor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ScheduledCoursesInstructor];
GO
IF OBJECT_ID(N'[dbo].[TASheduledEvent]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TASheduledEvent];
GO
IF OBJECT_ID(N'[dbo].[PreReqsCourses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PreReqsCourses];
GO
IF OBJECT_ID(N'[dbo].[PersonPhoneNumber]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonPhoneNumber];
GO
IF OBJECT_ID(N'[dbo].[PersonEntity1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonEntity1];
GO
IF OBJECT_ID(N'[dbo].[PersonAddress]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonAddress];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'SheduledEvents'
CREATE TABLE [dbo].[SheduledEvents] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StartTime] time  NOT NULL,
    [EndTime] time  NOT NULL,
    [Monday] bit  NOT NULL,
    [Tuesday] bit  NOT NULL,
    [Wednesday] bit  NOT NULL,
    [Thursday] bit  NOT NULL,
    [Friday] bit  NOT NULL,
    [Section] nvarchar(max)  NOT NULL,
    [Quarter] int  NOT NULL,
    [Room] int  NOT NULL,
    [Course_Id] int  NOT NULL
);
GO

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Credits] smallint  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Quarters'
CREATE TABLE [dbo].[Quarters] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Label] nvarchar(max)  NOT NULL,
    [YearsYear] int  NOT NULL,
    [Sprint1] int  NOT NULL,
    [Sprint2] int  NOT NULL
);
GO

-- Creating table 'Years'
CREATE TABLE [dbo].[Years] (
    [Year] int  NOT NULL
);
GO

-- Creating table 'Sprints'
CREATE TABLE [dbo].[Sprints] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL
);
GO

-- Creating table 'Rooms'
CREATE TABLE [dbo].[Rooms] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Capacity] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [MiddelName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [PrimaryPhone] nvarchar(max)  NOT NULL,
    [PrimaryEmail] nvarchar(max)  NOT NULL,
    [DateOfBirth] datetime  NOT NULL
);
GO

-- Creating table 'PreReqs'
CREATE TABLE [dbo].[PreReqs] (
    [Course] int  NOT NULL,
    [RequiredCourse] int  NOT NULL
);
GO

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Street1] nvarchar(max)  NOT NULL,
    [Street2] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [PostalCode] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PhoneNumbers'
CREATE TABLE [dbo].[PhoneNumbers] (
    [Number] nvarchar(max)  NOT NULL,
    [SupportsSMS] bit  NOT NULL,
    [IsFax] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Emails'
CREATE TABLE [dbo].[Emails] (
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'People_Instructor'
CREATE TABLE [dbo].[People_Instructor] (
    [PersonId] int IDENTITY(1,1) NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'People_TeachingAssistant'
CREATE TABLE [dbo].[People_TeachingAssistant] (
    [PersonId] int IDENTITY(1,1) NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'People_EmergencyContact'
CREATE TABLE [dbo].[People_EmergencyContact] (
    [ContactFor] int  NOT NULL,
    [PersonId] int IDENTITY(1,1) NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'ScheduledCoursesInstructor'
CREATE TABLE [dbo].[ScheduledCoursesInstructor] (
    [ScheduledCourses_Id] int  NOT NULL,
    [Instructors_Id] int  NOT NULL
);
GO

-- Creating table 'TASheduledEvent'
CREATE TABLE [dbo].[TASheduledEvent] (
    [TeachingAssistants_Id] int  NOT NULL,
    [SheduledEvents_Id] int  NOT NULL
);
GO

-- Creating table 'PreReqsCourses'
CREATE TABLE [dbo].[PreReqsCourses] (
    [PreReq_Course] int  NOT NULL,
    [PreReq_RequiredCourse] int  NOT NULL,
    [Courses_Id] int  NOT NULL
);
GO

-- Creating table 'PersonPhoneNumber'
CREATE TABLE [dbo].[PersonPhoneNumber] (
    [People_Id] int  NOT NULL,
    [PhoneNumbers_Number] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PersonEntity1'
CREATE TABLE [dbo].[PersonEntity1] (
    [Person_Id] int  NOT NULL,
    [Emails_Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PersonAddress'
CREATE TABLE [dbo].[PersonAddress] (
    [People_Id] int  NOT NULL,
    [Addresses_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'SheduledEvents'
ALTER TABLE [dbo].[SheduledEvents]
ADD CONSTRAINT [PK_SheduledEvents]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Quarters'
ALTER TABLE [dbo].[Quarters]
ADD CONSTRAINT [PK_Quarters]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Year] in table 'Years'
ALTER TABLE [dbo].[Years]
ADD CONSTRAINT [PK_Years]
    PRIMARY KEY CLUSTERED ([Year] ASC);
GO

-- Creating primary key on [Id] in table 'Sprints'
ALTER TABLE [dbo].[Sprints]
ADD CONSTRAINT [PK_Sprints]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [PK_Rooms]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Course], [RequiredCourse] in table 'PreReqs'
ALTER TABLE [dbo].[PreReqs]
ADD CONSTRAINT [PK_PreReqs]
    PRIMARY KEY CLUSTERED ([Course], [RequiredCourse] ASC);
GO

-- Creating primary key on [Id] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Number] in table 'PhoneNumbers'
ALTER TABLE [dbo].[PhoneNumbers]
ADD CONSTRAINT [PK_PhoneNumbers]
    PRIMARY KEY CLUSTERED ([Number] ASC);
GO

-- Creating primary key on [Email] in table 'Emails'
ALTER TABLE [dbo].[Emails]
ADD CONSTRAINT [PK_Emails]
    PRIMARY KEY CLUSTERED ([Email] ASC);
GO

-- Creating primary key on [Id] in table 'People_Instructor'
ALTER TABLE [dbo].[People_Instructor]
ADD CONSTRAINT [PK_People_Instructor]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'People_TeachingAssistant'
ALTER TABLE [dbo].[People_TeachingAssistant]
ADD CONSTRAINT [PK_People_TeachingAssistant]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'People_EmergencyContact'
ALTER TABLE [dbo].[People_EmergencyContact]
ADD CONSTRAINT [PK_People_EmergencyContact]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ScheduledCourses_Id], [Instructors_Id] in table 'ScheduledCoursesInstructor'
ALTER TABLE [dbo].[ScheduledCoursesInstructor]
ADD CONSTRAINT [PK_ScheduledCoursesInstructor]
    PRIMARY KEY CLUSTERED ([ScheduledCourses_Id], [Instructors_Id] ASC);
GO

-- Creating primary key on [TeachingAssistants_Id], [SheduledEvents_Id] in table 'TASheduledEvent'
ALTER TABLE [dbo].[TASheduledEvent]
ADD CONSTRAINT [PK_TASheduledEvent]
    PRIMARY KEY CLUSTERED ([TeachingAssistants_Id], [SheduledEvents_Id] ASC);
GO

-- Creating primary key on [PreReq_Course], [PreReq_RequiredCourse], [Courses_Id] in table 'PreReqsCourses'
ALTER TABLE [dbo].[PreReqsCourses]
ADD CONSTRAINT [PK_PreReqsCourses]
    PRIMARY KEY CLUSTERED ([PreReq_Course], [PreReq_RequiredCourse], [Courses_Id] ASC);
GO

-- Creating primary key on [People_Id], [PhoneNumbers_Number] in table 'PersonPhoneNumber'
ALTER TABLE [dbo].[PersonPhoneNumber]
ADD CONSTRAINT [PK_PersonPhoneNumber]
    PRIMARY KEY CLUSTERED ([People_Id], [PhoneNumbers_Number] ASC);
GO

-- Creating primary key on [Person_Id], [Emails_Email] in table 'PersonEntity1'
ALTER TABLE [dbo].[PersonEntity1]
ADD CONSTRAINT [PK_PersonEntity1]
    PRIMARY KEY CLUSTERED ([Person_Id], [Emails_Email] ASC);
GO

-- Creating primary key on [People_Id], [Addresses_Id] in table 'PersonAddress'
ALTER TABLE [dbo].[PersonAddress]
ADD CONSTRAINT [PK_PersonAddress]
    PRIMARY KEY CLUSTERED ([People_Id], [Addresses_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [YearsYear] in table 'Quarters'
ALTER TABLE [dbo].[Quarters]
ADD CONSTRAINT [FK_QuartersYears]
    FOREIGN KEY ([YearsYear])
    REFERENCES [dbo].[Years]
        ([Year])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_QuartersYears'
CREATE INDEX [IX_FK_QuartersYears]
ON [dbo].[Quarters]
    ([YearsYear]);
GO

-- Creating foreign key on [Sprint1] in table 'Quarters'
ALTER TABLE [dbo].[Quarters]
ADD CONSTRAINT [FK_SprintQuarters]
    FOREIGN KEY ([Sprint1])
    REFERENCES [dbo].[Sprints]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SprintQuarters'
CREATE INDEX [IX_FK_SprintQuarters]
ON [dbo].[Quarters]
    ([Sprint1]);
GO

-- Creating foreign key on [Sprint2] in table 'Quarters'
ALTER TABLE [dbo].[Quarters]
ADD CONSTRAINT [FK_SprintQuarters1]
    FOREIGN KEY ([Sprint2])
    REFERENCES [dbo].[Sprints]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SprintQuarters1'
CREATE INDEX [IX_FK_SprintQuarters1]
ON [dbo].[Quarters]
    ([Sprint2]);
GO

-- Creating foreign key on [ScheduledCourses_Id] in table 'ScheduledCoursesInstructor'
ALTER TABLE [dbo].[ScheduledCoursesInstructor]
ADD CONSTRAINT [FK_ScheduledCoursesInstructor_ScheduledCourses]
    FOREIGN KEY ([ScheduledCourses_Id])
    REFERENCES [dbo].[SheduledEvents]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Instructors_Id] in table 'ScheduledCoursesInstructor'
ALTER TABLE [dbo].[ScheduledCoursesInstructor]
ADD CONSTRAINT [FK_ScheduledCoursesInstructor_Instructor]
    FOREIGN KEY ([Instructors_Id])
    REFERENCES [dbo].[People_Instructor]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduledCoursesInstructor_Instructor'
CREATE INDEX [IX_FK_ScheduledCoursesInstructor_Instructor]
ON [dbo].[ScheduledCoursesInstructor]
    ([Instructors_Id]);
GO

-- Creating foreign key on [Course_Id] in table 'SheduledEvents'
ALTER TABLE [dbo].[SheduledEvents]
ADD CONSTRAINT [FK_CoursesScheduledCourses]
    FOREIGN KEY ([Course_Id])
    REFERENCES [dbo].[Courses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CoursesScheduledCourses'
CREATE INDEX [IX_FK_CoursesScheduledCourses]
ON [dbo].[SheduledEvents]
    ([Course_Id]);
GO

-- Creating foreign key on [Room] in table 'SheduledEvents'
ALTER TABLE [dbo].[SheduledEvents]
ADD CONSTRAINT [FK_SheduledEventRoom]
    FOREIGN KEY ([Room])
    REFERENCES [dbo].[Rooms]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SheduledEventRoom'
CREATE INDEX [IX_FK_SheduledEventRoom]
ON [dbo].[SheduledEvents]
    ([Room]);
GO

-- Creating foreign key on [Quarter] in table 'SheduledEvents'
ALTER TABLE [dbo].[SheduledEvents]
ADD CONSTRAINT [FK_SheduledEventQuarters]
    FOREIGN KEY ([Quarter])
    REFERENCES [dbo].[Quarters]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SheduledEventQuarters'
CREATE INDEX [IX_FK_SheduledEventQuarters]
ON [dbo].[SheduledEvents]
    ([Quarter]);
GO

-- Creating foreign key on [TeachingAssistants_Id] in table 'TASheduledEvent'
ALTER TABLE [dbo].[TASheduledEvent]
ADD CONSTRAINT [FK_TASheduledEvent_TA]
    FOREIGN KEY ([TeachingAssistants_Id])
    REFERENCES [dbo].[People_TeachingAssistant]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SheduledEvents_Id] in table 'TASheduledEvent'
ALTER TABLE [dbo].[TASheduledEvent]
ADD CONSTRAINT [FK_TASheduledEvent_SheduledEvent]
    FOREIGN KEY ([SheduledEvents_Id])
    REFERENCES [dbo].[SheduledEvents]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TASheduledEvent_SheduledEvent'
CREATE INDEX [IX_FK_TASheduledEvent_SheduledEvent]
ON [dbo].[TASheduledEvent]
    ([SheduledEvents_Id]);
GO

-- Creating foreign key on [PreReq_Course], [PreReq_RequiredCourse] in table 'PreReqsCourses'
ALTER TABLE [dbo].[PreReqsCourses]
ADD CONSTRAINT [FK_PreReqsCourses_PreReqs]
    FOREIGN KEY ([PreReq_Course], [PreReq_RequiredCourse])
    REFERENCES [dbo].[PreReqs]
        ([Course], [RequiredCourse])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Courses_Id] in table 'PreReqsCourses'
ALTER TABLE [dbo].[PreReqsCourses]
ADD CONSTRAINT [FK_PreReqsCourses_Courses]
    FOREIGN KEY ([Courses_Id])
    REFERENCES [dbo].[Courses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PreReqsCourses_Courses'
CREATE INDEX [IX_FK_PreReqsCourses_Courses]
ON [dbo].[PreReqsCourses]
    ([Courses_Id]);
GO

-- Creating foreign key on [People_Id] in table 'PersonPhoneNumber'
ALTER TABLE [dbo].[PersonPhoneNumber]
ADD CONSTRAINT [FK_PersonPhoneNumber_Person]
    FOREIGN KEY ([People_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PhoneNumbers_Number] in table 'PersonPhoneNumber'
ALTER TABLE [dbo].[PersonPhoneNumber]
ADD CONSTRAINT [FK_PersonPhoneNumber_PhoneNumber]
    FOREIGN KEY ([PhoneNumbers_Number])
    REFERENCES [dbo].[PhoneNumbers]
        ([Number])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonPhoneNumber_PhoneNumber'
CREATE INDEX [IX_FK_PersonPhoneNumber_PhoneNumber]
ON [dbo].[PersonPhoneNumber]
    ([PhoneNumbers_Number]);
GO

-- Creating foreign key on [PrimaryPhone] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_PersonPhoneNumber1]
    FOREIGN KEY ([PrimaryPhone])
    REFERENCES [dbo].[PhoneNumbers]
        ([Number])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonPhoneNumber1'
CREATE INDEX [IX_FK_PersonPhoneNumber1]
ON [dbo].[People]
    ([PrimaryPhone]);
GO

-- Creating foreign key on [Person_Id] in table 'PersonEntity1'
ALTER TABLE [dbo].[PersonEntity1]
ADD CONSTRAINT [FK_PersonEntity1_Person]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Emails_Email] in table 'PersonEntity1'
ALTER TABLE [dbo].[PersonEntity1]
ADD CONSTRAINT [FK_PersonEntity1_Entity1]
    FOREIGN KEY ([Emails_Email])
    REFERENCES [dbo].[Emails]
        ([Email])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonEntity1_Entity1'
CREATE INDEX [IX_FK_PersonEntity1_Entity1]
ON [dbo].[PersonEntity1]
    ([Emails_Email]);
GO

-- Creating foreign key on [PrimaryEmail] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [FK_PersonEmails]
    FOREIGN KEY ([PrimaryEmail])
    REFERENCES [dbo].[Emails]
        ([Email])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonEmails'
CREATE INDEX [IX_FK_PersonEmails]
ON [dbo].[People]
    ([PrimaryEmail]);
GO

-- Creating foreign key on [People_Id] in table 'PersonAddress'
ALTER TABLE [dbo].[PersonAddress]
ADD CONSTRAINT [FK_PersonAddress_Person]
    FOREIGN KEY ([People_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Addresses_Id] in table 'PersonAddress'
ALTER TABLE [dbo].[PersonAddress]
ADD CONSTRAINT [FK_PersonAddress_Address]
    FOREIGN KEY ([Addresses_Id])
    REFERENCES [dbo].[Addresses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonAddress_Address'
CREATE INDEX [IX_FK_PersonAddress_Address]
ON [dbo].[PersonAddress]
    ([Addresses_Id]);
GO

-- Creating foreign key on [Id] in table 'People_Instructor'
ALTER TABLE [dbo].[People_Instructor]
ADD CONSTRAINT [FK_Instructor_inherits_Person]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'People_TeachingAssistant'
ALTER TABLE [dbo].[People_TeachingAssistant]
ADD CONSTRAINT [FK_TeachingAssistant_inherits_Person]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'People_EmergencyContact'
ALTER TABLE [dbo].[People_EmergencyContact]
ADD CONSTRAINT [FK_EmergencyContact_inherits_Person]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------