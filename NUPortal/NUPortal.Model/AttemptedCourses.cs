namespace NUPortal.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Schedule.AttemptedCourses")]
    public partial class AttemptedCourses
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int StudentId { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ScheduledEventId { get; set; }

        public bool? Passed { get; set; }

        public double GradePercent { get; set; }

        public virtual Students Students { get; set; }

        public virtual SheduledEvents SheduledEvents { get; set; }
    }
}
