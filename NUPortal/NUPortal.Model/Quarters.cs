namespace NUPortal.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Schedule.Quarters")]
    public partial class Quarters
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Quarters()
        {
            AcademicYear = new HashSet<AcademicYear>();
            AcademicYear1 = new HashSet<AcademicYear>();
            PlannedCourses = new HashSet<PlannedCourses>();
            SheduledEvents = new HashSet<SheduledEvents>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(10)]
        public string Label { get; set; }

        public int Year { get; set; }

        public int Sprint1 { get; set; }

        public int Sprint2 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AcademicYear> AcademicYear { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AcademicYear> AcademicYear1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlannedCourses> PlannedCourses { get; set; }

        public virtual Years Years { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SheduledEvents> SheduledEvents { get; set; }

        public virtual Sprints Sprints { get; set; }

        public virtual Sprints Sprints1 { get; set; }
    }
}
