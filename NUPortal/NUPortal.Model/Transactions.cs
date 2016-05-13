namespace NUPortal.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Financial.Transactions")]
    public partial class Transactions
    {
        public int Id { get; set; }

        [Column(TypeName = "money")]
        public decimal Amount { get; set; }

        public int StudentId { get; set; }

        [Required]
        [StringLength(50)]
        public string Description { get; set; }

        [StringLength(50)]
        public string Reference { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Date { get; set; }

        public bool Qualifies1098 { get; set; }

        public bool Scholarship_Grant { get; set; }

        public virtual Students Students { get; set; }
    }
}
