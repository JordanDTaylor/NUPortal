namespace NUPortal.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Degree.DegreeTrack")]
    public partial class DegreeTrack
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DegreeTrack()
        {
            CourseCode = new HashSet<CourseCode>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        [StringLength(6)]
        public string DegreeId { get; set; }

        public int? CohortId { get; set; }

        public virtual Degree Degree { get; set; }

        public virtual Cohort Cohort { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CourseCode> CourseCode { get; set; }
    }
}
