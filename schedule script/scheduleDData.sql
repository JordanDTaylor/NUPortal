use test

--///////////////////////////////////////// Attempted Courses
select * from Schedule.AttemptedCourses;
delete from Schedule.AttemptedCourses;

insert into Schedule.AttemptedCourses(StudentId, ScheduledEventId, Passed, GradePercent)
values (1, 7, 1, 2.5);

insert into Schedule.AttemptedCourses(StudentId, ScheduledEventId, Passed, GradePercent)
values (1, 8, 1, 2.4);


insert into Schedule.AttemptedCourses(StudentId, ScheduledEventId, Passed, GradePercent)
values (2, 7, 1, 3.0);


insert into Schedule.AttemptedCourses(StudentId, ScheduledEventId, Passed, GradePercent)
values (2, 8, 0, 1.5);


--///////////////////////////////////////// Category Codes
select * from Schedule.CategoryCodes;
delete from Schedule.CategoryCodes;

insert into Schedule.CategoryCodes(Category, Course)
values (1, 'CSC120');

insert into Schedule.CategoryCodes(Category, Course)
values (2, 'ISS130');

insert into Schedule.CategoryCodes(Category, Course)
values (1, 'CSC180');

insert into Schedule.CategoryCodes(Category, Course)
values (2, 'ISS120');

--///////////////////////////////////////// Cohort
select * from Schedule.Cohort;
delete from Schedule.Cohort;

insert into Schedule.Cohort(StartDate)
values (3-12-2005);

insert into Schedule.Cohort(StartDate)
values (3-13-2005);

insert into Schedule.Cohort(StartDate)
values (3-14-2005);

insert into Schedule.Cohort(StartDate)
values (3-15-2005);

--///////////////////////////////////////// Course Category
select * from Schedule.CourseCategory;
delete from Schedule.CourseCategory;

insert into Schedule.CourseCategory(Label)
values ('Computer Science');

insert into Schedule.CourseCategory(Label)
values ('Information Systems');

insert into Schedule.CourseCategory(Label)
values ('Web Development');

insert into Schedule.CourseCategory(Label)
values ('Game Development');

--///////////////////////////////////////// Course Code
select * from Schedule.CourseCode;
delete from Schedule.CourseCode;

insert into Schedule.CourseCode(Code)
values ('CSC180');

insert into Schedule.CourseCode(Code)
values ('CSC120');

insert into Schedule.CourseCode(Code)
values ('ISS130');

insert into Schedule.CourseCode(Code)
values ('ISS120');

--///////////////////////////////////////// Courses
select * from Schedule.Courses;
delete from Schedule.Courses;

insert into Schedule.Courses(Code, Name, Credits, [Description])
values ('CSC120', 'Intro To Computer Science', 2, 'Learn the basics of Computer Programming');

insert into Schedule.Courses(Code, Name, Credits, [Description])
values ('CSC180', 'Software Design Principles', 2, 'Learn programming design principles');

insert into Schedule.Courses(Code, Name, Credits, [Description])
values ('ISS120', 'Intro To Networking', 2, 'Learn the basics of Networking');

insert into Schedule.Courses(Code, Name, Credits, [Description])
values ('ISS130', 'Hacking101', 2, 'Learn what it feels like to be hacked');

--///////////////////////////////////////// Elective Categories
select * from Schedule.ElectiveCategories;
delete from Schedule.ElectiveCategories;

insert into Schedule.ElectiveCategories(CategoryId, CourseId)
values (1, 20);

insert into Schedule.ElectiveCategories(CategoryId, CourseId)
values (1, 21);

insert into Schedule.ElectiveCategories(CategoryId, CourseId)
values (2, 22);

insert into Schedule.ElectiveCategories(CategoryId, CourseId)
values (2, 23);

--///////////////////////////////////////// Planned Courses
select * from Schedule.PlannedCourses;
delete from Schedule.PlannedCourses;

insert into Schedule.PlannedCourses(StudentId, CourseCode, [Quarter])
values (1, 'CSC120', 1);

insert into Schedule.PlannedCourses(StudentId, CourseCode, [Quarter])
values (2, 'CSC120', 1);

insert into Schedule.PlannedCourses(StudentId, CourseCode, [Quarter])
values (3, 'CSC120', 1);

insert into Schedule.PlannedCourses(StudentId, CourseCode, [Quarter])
values (4, 'CSC120', 1);

--///////////////////////////////////////// Pre Reqs
select * from Schedule.PreReqs;
delete from Schedule.PreReqs;

insert into Schedule.PreReqs(Course, RequiredCourse)
values ('CSC180', 'CSC120');

insert into Schedule.PreReqs(Course, RequiredCourse)
values ('ISS130', 'ISS120');

insert into Schedule.PreReqs(Course, RequiredCourse)
values ('CSC120', 'ISS120');

--///////////////////////////////////////// Quarters
select * from Schedule.Quarters;
delete from Schedule.Quarters;

insert into Schedule.Quarters(Label, Sprint1, Sprint2)
values ('Summer2012', 1, 2);

insert into Schedule.Quarters(Label, Sprint1, Sprint2)
values ('Fall2012', 2, 3);

insert into Schedule.Quarters(Label, Sprint1, Sprint2)
values ('Winter2012', 3, 4);

insert into Schedule.Quarters(Label, Sprint1, Sprint2)
values ('Fall2012', 1, 4);

--///////////////////////////////////////// Registered Courses
select * from Schedule.RegisteredCourses;
delete from Schedule.RegisteredCourses;

insert into Schedule.RegisteredCourses(StudentId, ScheduledCourse)
values (1, 7);

insert into Schedule.RegisteredCourses(StudentId, ScheduledCourse)
values (2, 7);

insert into Schedule.RegisteredCourses(StudentId, ScheduledCourse)
values (3, 8);

insert into Schedule.RegisteredCourses(StudentId, ScheduledCourse)
values (2, 8);

--///////////////////////////////////////// Scheduled Instructor
select * from Schedule.ScheduledInstructor;
select * from Contact.Instructors;
delete from Schedule.ScheduledInstructor;

--insert into Schedule.ScheduledInstructor(ScheduledCourses_Id, Instructors_Id)
--values (7, 1);

--///////////////////////////////////////// Scheduled Events
select * from Schedule.ScheduledEvents;
delete from Schedule.ScheduledEvents;

insert into Schedule.ScheduledEvents(StartTime, EndTime, Monday, Tuesday, Wednesday, Thursday, Friday, Section, [Quarter], Room, IsRegisterable, Course_Id)
values ('02:30', '03:20', 1, 1, 1, 1, 1, 'E', 1, 1, 1, 20);

insert into Schedule.ScheduledEvents(StartTime, EndTime, Monday, Tuesday, Wednesday, Thursday, Friday, Section, [Quarter], Room, IsRegisterable, Course_Id)
values ('02:30', '03:20', 1, 1, 1, 1, 1, 'E', 1, 2, 1, 20);

insert into Schedule.ScheduledEvents(StartTime, EndTime, Monday, Tuesday, Wednesday, Thursday, Friday, Section, [Quarter], Room, IsRegisterable, Course_Id)
values ('02:30', '03:20', 1, 1, 1, 1, 1, 'E', 1, 3, 1, 20);

insert into Schedule.ScheduledEvents(StartTime, EndTime, Monday, Tuesday, Wednesday, Thursday, Friday, Section, [Quarter], Room, IsRegisterable, Course_Id)
values ('02:30', '03:20', 1, 1, 1, 1, 1, 'E', 1, 4, 1, 20);

--///////////////////////////////////////// Scheduled TA
select * from Schedule.SheduledTA;
select * from Contact.TeachingAssistant;
delete from Schedule.SheduledTA;

--insert into Schedule.SheduledTA(TeachingAssistants_Id, ScheduledEvents_Id)
--values (1, 1);

--///////////////////////////////////////// Sprints
select * from Schedule.Sprints;
delete from Schedule.Sprints;

insert into Schedule.Sprints(StartDate, EndDate)
values (3-12-2015, 3-30-2015);

insert into Schedule.Sprints(StartDate, EndDate)
values (3-13-2015, 3-31-2015);

insert into Schedule.Sprints(StartDate, EndDate)
values (3-14-2015, 3-32-2015);

insert into Schedule.Sprints(StartDate, EndDate)
values (3-15-2015, 3-33-2015);

--///////////////////////////////////////// Years
select * from Schedule.Years;
delete from Schedule.Years;

insert into Schedule.Years([Year])
values (2012);

insert into Schedule.Years([Year])
values (2011);

insert into Schedule.Years([Year])
values (2014);

insert into Schedule.Years([Year])
values (2000);