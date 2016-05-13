namespace NUPortal.Model
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class NuPortalModel : DbContext
    {
        public NuPortalModel()
            : base("name=NuPortalModel")
        {
        }

        public virtual DbSet<Addresses> Addresses { get; set; }
        public virtual DbSet<Building> Building { get; set; }
        public virtual DbSet<Campus> Campus { get; set; }
        public virtual DbSet<Emails> Emails { get; set; }
        public virtual DbSet<EnrolledStudents> EnrolledStudents { get; set; }
        public virtual DbSet<Instructors> Instructors { get; set; }
        public virtual DbSet<People> People { get; set; }
        public virtual DbSet<PhoneNumbers> PhoneNumbers { get; set; }
        public virtual DbSet<Rooms> Rooms { get; set; }
        public virtual DbSet<Staff> Staff { get; set; }
        public virtual DbSet<Students> Students { get; set; }
        public virtual DbSet<TeachingAssistant> TeachingAssistant { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Degree> Degree { get; set; }
        public virtual DbSet<DegreeTrack> DegreeTrack { get; set; }
        public virtual DbSet<AcademicYear> AcademicYear { get; set; }
        public virtual DbSet<AwardLetter> AwardLetter { get; set; }
        public virtual DbSet<OtherLoanType> OtherLoanType { get; set; }
        public virtual DbSet<Transactions> Transactions { get; set; }
        public virtual DbSet<AttemptedCourses> AttemptedCourses { get; set; }
        public virtual DbSet<Cohort> Cohort { get; set; }
        public virtual DbSet<CourseCategory> CourseCategory { get; set; }
        public virtual DbSet<CourseCode> CourseCode { get; set; }
        public virtual DbSet<Courses> Courses { get; set; }
        public virtual DbSet<PlannedCourses> PlannedCourses { get; set; }
        public virtual DbSet<Quarters> Quarters { get; set; }
        public virtual DbSet<RegisteredCourses> RegisteredCourses { get; set; }
        public virtual DbSet<SheduledEvents> SheduledEvents { get; set; }
        public virtual DbSet<Sprints> Sprints { get; set; }
        public virtual DbSet<Years> Years { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Addresses>()
                .HasMany(e => e.Building)
                .WithRequired(e => e.Addresses)
                .HasForeignKey(e => e.Address)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Addresses>()
                .HasMany(e => e.Campus)
                .WithOptional(e => e.Addresses)
                .HasForeignKey(e => e.Address);

            modelBuilder.Entity<Addresses>()
                .HasMany(e => e.People)
                .WithMany(e => e.Addresses)
                .Map(m => m.ToTable("PersonAddress", "Contact"));

            modelBuilder.Entity<Building>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Campus>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Campus>()
                .HasMany(e => e.Building)
                .WithRequired(e => e.Campus)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Campus>()
                .HasMany(e => e.EnrolledStudents)
                .WithRequired(e => e.Campus)
                .HasForeignKey(e => e.EnrolledCampus)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Emails>()
                .HasMany(e => e.People)
                .WithRequired(e => e.Emails)
                .HasForeignKey(e => e.PrimaryEmail)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Emails>()
                .HasMany(e => e.People1)
                .WithMany(e => e.Emails1)
                .Map(m => m.ToTable("PeoplesEmails", "Contact").MapRightKey("Person_Id"));

            modelBuilder.Entity<Instructors>()
                .HasMany(e => e.SheduledEvents)
                .WithMany(e => e.Instructors)
                .Map(m => m.ToTable("ScheduledInstructor", "Schedule").MapRightKey("ScheduledCourses_Id"));

            modelBuilder.Entity<People>()
                .HasOptional(e => e.Instructors)
                .WithRequired(e => e.People)
                .WillCascadeOnDelete();

            modelBuilder.Entity<People>()
                .HasOptional(e => e.Staff)
                .WithRequired(e => e.People);

            modelBuilder.Entity<People>()
                .HasOptional(e => e.Students)
                .WithRequired(e => e.People);

            modelBuilder.Entity<People>()
                .HasMany(e => e.PhoneNumbers1)
                .WithMany(e => e.People1)
                .Map(m => m.ToTable("PersonPhoneNumber", "Contact"));

            modelBuilder.Entity<People>()
                .HasMany(e => e.People1)
                .WithMany(e => e.People2)
                .Map(m => m.ToTable("EmergencyContact").MapLeftKey("ContactFor").MapRightKey("PersonId"));

            modelBuilder.Entity<PhoneNumbers>()
                .HasMany(e => e.People)
                .WithRequired(e => e.PhoneNumbers)
                .HasForeignKey(e => e.PrimaryPhone)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Rooms>()
                .Property(e => e.Number)
                .IsFixedLength();

            modelBuilder.Entity<Rooms>()
                .HasMany(e => e.SheduledEvents)
                .WithRequired(e => e.Rooms)
                .HasForeignKey(e => e.Room)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Rooms>()
                .HasMany(e => e.Staff)
                .WithOptional(e => e.Rooms)
                .HasForeignKey(e => e.Office);

            modelBuilder.Entity<Staff>()
                .HasMany(e => e.Students)
                .WithOptional(e => e.Staff)
                .HasForeignKey(e => e.FinancialAdvisor);

            modelBuilder.Entity<Staff>()
                .HasMany(e => e.Students1)
                .WithOptional(e => e.Staff1)
                .HasForeignKey(e => e.Advocate);

            modelBuilder.Entity<Staff>()
                .HasOptional(e => e.TeachingAssistant)
                .WithRequired(e => e.Staff);

            modelBuilder.Entity<Students>()
                .HasMany(e => e.EnrolledStudents)
                .WithRequired(e => e.Students)
                .HasForeignKey(e => e.StudentId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Students>()
                .HasMany(e => e.AttemptedCourses)
                .WithRequired(e => e.Students)
                .HasForeignKey(e => e.StudentId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Students>()
                .HasMany(e => e.Transactions)
                .WithRequired(e => e.Students)
                .HasForeignKey(e => e.StudentId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<AcademicYear>()
                .HasMany(e => e.AwardLetter)
                .WithRequired(e => e.AcademicYear)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.Id)
                .IsFixedLength();

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.Tuition_Fees)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.Books_Supplies)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.Housing)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.LivingExpensesQ1)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.LivingExpensesQ2)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.LivingExpensesQ3)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.PreviousBalance)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.PellGrant)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.SEO_Grant)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.VA_Benefits)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.VA_YellowRibonMatch)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.PresidentialScholarship)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.AccessGrant)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.TransferScholarship)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.ResidentGrant)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.OutsideScholarship)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.PersonalFamilyContributions)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.FederalSubsidizedLoan)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.FederalUnsubsidizedLoan)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.Federal_PLUS_Loan)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.OtherLoan)
                .HasPrecision(19, 4);

            modelBuilder.Entity<AwardLetter>()
                .Property(e => e.PreviousOtherLoanBalance)
                .HasPrecision(19, 4);

            modelBuilder.Entity<OtherLoanType>()
                .HasMany(e => e.AwardLetter)
                .WithRequired(e => e.OtherLoanType1)
                .HasForeignKey(e => e.OtherLoanType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Transactions>()
                .Property(e => e.Amount)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Transactions>()
                .Property(e => e.Date)
                .IsFixedLength();

            modelBuilder.Entity<CourseCategory>()
                .HasMany(e => e.CourseCode)
                .WithMany(e => e.CourseCategory)
                .Map(m => m.ToTable("CategoryCodes", "Schedule").MapLeftKey("Category").MapRightKey("Course"));

            modelBuilder.Entity<CourseCode>()
                .HasMany(e => e.Courses)
                .WithRequired(e => e.CourseCode)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CourseCode>()
                .HasMany(e => e.PlannedCourses)
                .WithRequired(e => e.CourseCode1)
                .HasForeignKey(e => e.CourseCode)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CourseCode>()
                .HasMany(e => e.CourseCode1)
                .WithMany(e => e.CourseCode2)
                .Map(m => m.ToTable("ElectiveCategories", "Schedule").MapLeftKey("ElectiveCourseId").MapRightKey("CourseId"));

            modelBuilder.Entity<CourseCode>()
                .HasMany(e => e.CourseCode11)
                .WithMany(e => e.CourseCode3)
                .Map(m => m.ToTable("PreReqs", "Schedule").MapLeftKey("Course").MapRightKey("RequiredCourse"));

            modelBuilder.Entity<CourseCode>()
                .HasMany(e => e.DegreeTrack)
                .WithMany(e => e.CourseCode)
                .Map(m => m.ToTable("DegreeTrackCourses").MapLeftKey("CourseCode").MapRightKey("DegreeTackId"));

            modelBuilder.Entity<Courses>()
                .HasMany(e => e.SheduledEvents)
                .WithRequired(e => e.Courses)
                .HasForeignKey(e => e.Course_Id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Quarters>()
                .HasMany(e => e.AcademicYear)
                .WithRequired(e => e.Quarters)
                .HasForeignKey(e => e.StartQuarter)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Quarters>()
                .HasMany(e => e.AcademicYear1)
                .WithRequired(e => e.Quarters1)
                .HasForeignKey(e => e.EndQuarter)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Quarters>()
                .HasMany(e => e.PlannedCourses)
                .WithRequired(e => e.Quarters)
                .HasForeignKey(e => e.Quarter)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Quarters>()
                .HasMany(e => e.SheduledEvents)
                .WithRequired(e => e.Quarters)
                .HasForeignKey(e => e.Quarter)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SheduledEvents>()
                .HasMany(e => e.AttemptedCourses)
                .WithRequired(e => e.SheduledEvents)
                .HasForeignKey(e => e.ScheduledEventId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SheduledEvents>()
                .HasMany(e => e.RegisteredCourses)
                .WithRequired(e => e.SheduledEvents)
                .HasForeignKey(e => e.ScheduledCourse)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SheduledEvents>()
                .HasMany(e => e.TeachingAssistant)
                .WithMany(e => e.SheduledEvents)
                .Map(m => m.ToTable("SheduledTA", "Schedule").MapRightKey("TeachingAssistants_Id"));

            modelBuilder.Entity<Sprints>()
                .HasMany(e => e.Quarters)
                .WithRequired(e => e.Sprints)
                .HasForeignKey(e => e.Sprint1)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Sprints>()
                .HasMany(e => e.Quarters1)
                .WithRequired(e => e.Sprints1)
                .HasForeignKey(e => e.Sprint2)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Years>()
                .HasMany(e => e.Quarters)
                .WithRequired(e => e.Years)
                .WillCascadeOnDelete(false);
        }
    }
}
