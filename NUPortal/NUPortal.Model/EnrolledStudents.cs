namespace NUPortal.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact.EnrolledStudents")]
    public partial class EnrolledStudents
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int StudentId { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int EnrolledCampus { get; set; }

        public int? CohortId { get; set; }

        public bool CurrentlyEnrolled { get; set; }

        public virtual Campus Campus { get; set; }

        public virtual Cohort Cohort { get; set; }

        public virtual Students Students { get; set; }
    }
}
