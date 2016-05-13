namespace NUPortal.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Financial.AcademicYear")]
    public partial class AcademicYear
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AcademicYear()
        {
            AwardLetter = new HashSet<AwardLetter>();
        }

        public int StartQuarter { get; set; }

        public int EndQuarter { get; set; }

        public int Id { get; set; }

        public virtual Quarters Quarters { get; set; }

        public virtual Quarters Quarters1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AwardLetter> AwardLetter { get; set; }
    }
}
