namespace NUPortal.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Schedule.PlannedCourses")]
    public partial class PlannedCourses
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int StudentId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(8)]
        public string CourseCode { get; set; }

        public int Quarter { get; set; }

        public virtual CourseCode CourseCode1 { get; set; }

        public virtual Quarters Quarters { get; set; }
    }
}
