namespace NUPortal.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Schedule.SheduledEvents")]
    public partial class SheduledEvents
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SheduledEvents()
        {
            AttemptedCourses = new HashSet<AttemptedCourses>();
            RegisteredCourses = new HashSet<RegisteredCourses>();
            Instructors = new HashSet<Instructors>();
            TeachingAssistant = new HashSet<TeachingAssistant>();
        }

        public int Id { get; set; }

        public TimeSpan StartTime { get; set; }

        public TimeSpan EndTime { get; set; }

        public bool Monday { get; set; }

        public bool Tuesday { get; set; }

        public bool Wednesday { get; set; }

        public bool Thursday { get; set; }

        public bool Friday { get; set; }

        [Required]
        public string Section { get; set; }

        public int Quarter { get; set; }

        public int Room { get; set; }

        public bool IsRegisterable { get; set; }

        public int Course_Id { get; set; }

        public virtual Rooms Rooms { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AttemptedCourses> AttemptedCourses { get; set; }

        public virtual Courses Courses { get; set; }

        public virtual Quarters Quarters { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RegisteredCourses> RegisteredCourses { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Instructors> Instructors { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TeachingAssistant> TeachingAssistant { get; set; }
    }
}
