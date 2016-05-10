
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/10/2016 17:21:58
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

-- Creating table 'ScheduledCourses1'
CREATE TABLE [dbo].[ScheduledCourses1] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StartTime] datetime  NOT NULL,
    [EndTime] datetime  NOT NULL,
    [Monday] bit  NOT NULL,
    [Tuesday] bit  NOT NULL,
    [Wednesday] bit  NOT NULL,
    [Thursday] bit  NOT NULL,
    [Friday] bit  NOT NULL,
    [Section] nvarchar(max)  NOT NULL,
    [Quarter] nvarchar(max)  NOT NULL,
    [Course_Id] int  NOT NULL
);
GO

-- Creating table 'Courses1'
CREATE TABLE [dbo].[Courses1] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] int IDENTITY(1,1) NOT NULL,
    [Name] int IDENTITY(1,1) NOT NULL,
    [Credits] smallint  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [CoursesCourses_Courses1_Id] int  NOT NULL
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

-- Creating table 'Instructors'
CREATE TABLE [dbo].[Instructors] (
    [PersonId] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'ScheduledCoursesInstructor'
CREATE TABLE [dbo].[ScheduledCoursesInstructor] (
    [ScheduledCourses_Id] int  NOT NULL,
    [Instructors_PersonId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'ScheduledCourses1'
ALTER TABLE [dbo].[ScheduledCourses1]
ADD CONSTRAINT [PK_ScheduledCourses1]
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

-- Creating primary key on [PersonId] in table 'Instructors'
ALTER TABLE [dbo].[Instructors]
ADD CONSTRAINT [PK_Instructors]
    PRIMARY KEY CLUSTERED ([PersonId] ASC);
GO

-- Creating primary key on [ScheduledCourses_Id], [Instructors_PersonId] in table 'ScheduledCoursesInstructor'
ALTER TABLE [dbo].[ScheduledCoursesInstructor]
ADD CONSTRAINT [PK_ScheduledCoursesInstructor]
    PRIMARY KEY CLUSTERED ([ScheduledCourses_Id], [Instructors_PersonId] ASC);
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
    REFERENCES [dbo].[ScheduledCourses1]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Instructors_PersonId] in table 'ScheduledCoursesInstructor'
ALTER TABLE [dbo].[ScheduledCoursesInstructor]
ADD CONSTRAINT [FK_ScheduledCoursesInstructor_Instructor]
    FOREIGN KEY ([Instructors_PersonId])
    REFERENCES [dbo].[Instructors]
        ([PersonId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ScheduledCoursesInstructor_Instructor'
CREATE INDEX [IX_FK_ScheduledCoursesInstructor_Instructor]
ON [dbo].[ScheduledCoursesInstructor]
    ([Instructors_PersonId]);
GO

-- Creating foreign key on [Course_Id] in table 'ScheduledCourses1'
ALTER TABLE [dbo].[ScheduledCourses1]
ADD CONSTRAINT [FK_CoursesScheduledCourses]
    FOREIGN KEY ([Course_Id])
    REFERENCES [dbo].[Courses1]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CoursesScheduledCourses'
CREATE INDEX [IX_FK_CoursesScheduledCourses]
ON [dbo].[ScheduledCourses1]
    ([Course_Id]);
GO

-- Creating foreign key on [CoursesCourses_Courses1_Id] in table 'Courses1'
ALTER TABLE [dbo].[Courses1]
ADD CONSTRAINT [FK_CoursesCourses]
    FOREIGN KEY ([CoursesCourses_Courses1_Id])
    REFERENCES [dbo].[Courses1]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CoursesCourses'
CREATE INDEX [IX_FK_CoursesCourses]
ON [dbo].[Courses1]
    ([CoursesCourses_Courses1_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------