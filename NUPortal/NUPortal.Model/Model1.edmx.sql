
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/11/2016 13:45:05
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
    ALTER TABLE [dbo].[ScheduledCourses1] DROP CONSTRAINT [FK_CoursesScheduledCourses];
GO
IF OBJECT_ID(N'[dbo].[FK_CoursesCourses]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Courses1] DROP CONSTRAINT [FK_CoursesCourses];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ScheduledCourses1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ScheduledCourses1];
GO
IF OBJECT_ID(N'[dbo].[Courses1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Courses1];
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
IF OBJECT_ID(N'[dbo].[Instructors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Instructors];
GO
IF OBJECT_ID(N'[dbo].[ScheduledCoursesInstructor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ScheduledCoursesInstructor];
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

-- Creating table 'Courses1'
CREATE TABLE [dbo].[Courses1] (
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
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'PreReqs'
CREATE TABLE [dbo].[PreReqs] (
    [Id] int IDENTITY(1,1) NOT NULL
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
    [PreReqs_Id] int  NOT NULL,
    [RequiredCourses_Id] int  NOT NULL
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

-- Creating primary key on [Id] in table 'Courses1'
ALTER TABLE [dbo].[Courses1]
ADD CONSTRAINT [PK_Courses1]
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

-- Creating primary key on [Id] in table 'PreReqs'
ALTER TABLE [dbo].[PreReqs]
ADD CONSTRAINT [PK_PreReqs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
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

-- Creating primary key on [PreReqs_Id], [RequiredCourses_Id] in table 'PreReqsCourses'
ALTER TABLE [dbo].[PreReqsCourses]
ADD CONSTRAINT [PK_PreReqsCourses]
    PRIMARY KEY CLUSTERED ([PreReqs_Id], [RequiredCourses_Id] ASC);
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
    REFERENCES [dbo].[Courses1]
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

-- Creating foreign key on [PreReqs_Id] in table 'PreReqsCourses'
ALTER TABLE [dbo].[PreReqsCourses]
ADD CONSTRAINT [FK_PreReqsCourses_PreReqs]
    FOREIGN KEY ([PreReqs_Id])
    REFERENCES [dbo].[PreReqs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RequiredCourses_Id] in table 'PreReqsCourses'
ALTER TABLE [dbo].[PreReqsCourses]
ADD CONSTRAINT [FK_PreReqsCourses_Courses]
    FOREIGN KEY ([RequiredCourses_Id])
    REFERENCES [dbo].[Courses1]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PreReqsCourses_Courses'
CREATE INDEX [IX_FK_PreReqsCourses_Courses]
ON [dbo].[PreReqsCourses]
    ([RequiredCourses_Id]);
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------