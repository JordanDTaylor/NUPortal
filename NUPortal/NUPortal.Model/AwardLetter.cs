namespace NUPortal.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Financial.AwardLetter")]
    public partial class AwardLetter
    {
        public int AcademicYearId { get; set; }

        [StringLength(10)]
        public string Id { get; set; }

        public int StudentId { get; set; }

        public DateTime DateIssued { get; set; }

        [Column(TypeName = "money")]
        public decimal Tuition_Fees { get; set; }

        [Column(TypeName = "money")]
        public decimal Books_Supplies { get; set; }

        [Column(TypeName = "money")]
        public decimal Housing { get; set; }

        [Column(TypeName = "money")]
        public decimal LivingExpensesQ1 { get; set; }

        [Column(TypeName = "money")]
        public decimal LivingExpensesQ2 { get; set; }

        [Column(TypeName = "money")]
        public decimal LivingExpensesQ3 { get; set; }

        [Column(TypeName = "money")]
        public decimal PreviousBalance { get; set; }

        [Column(TypeName = "money")]
        public decimal PellGrant { get; set; }

        [Column(TypeName = "money")]
        public decimal SEO_Grant { get; set; }

        [Column(TypeName = "money")]
        public decimal VA_Benefits { get; set; }

        [Column(TypeName = "money")]
        public decimal VA_YellowRibonMatch { get; set; }

        [Column(TypeName = "money")]
        public decimal PresidentialScholarship { get; set; }

        [Column(TypeName = "money")]
        public decimal AccessGrant { get; set; }

        [Column(TypeName = "money")]
        public decimal TransferScholarship { get; set; }

        [Column(TypeName = "money")]
        public decimal ResidentGrant { get; set; }

        [Column(TypeName = "money")]
        public decimal OutsideScholarship { get; set; }

        [Column(TypeName = "money")]
        public decimal PersonalFamilyContributions { get; set; }

        [Column(TypeName = "money")]
        public decimal FederalSubsidizedLoan { get; set; }

        [Column(TypeName = "money")]
        public decimal FederalUnsubsidizedLoan { get; set; }

        [Column(TypeName = "money")]
        public decimal Federal_PLUS_Loan { get; set; }

        [Column(TypeName = "money")]
        public decimal OtherLoan { get; set; }

        [Required]
        [StringLength(50)]
        public string OtherLoanType { get; set; }

        [Column(TypeName = "money")]
        public decimal PreviousOtherLoanBalance { get; set; }

        public virtual AcademicYear AcademicYear { get; set; }

        public virtual OtherLoanType OtherLoanType1 { get; set; }
    }
}
