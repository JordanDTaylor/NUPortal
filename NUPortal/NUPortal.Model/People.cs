namespace NUPortal.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact.People")]
    public partial class People
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public People()
        {
            Emails1 = new HashSet<Emails>();
            Addresses = new HashSet<Addresses>();
            PhoneNumbers1 = new HashSet<PhoneNumbers>();
            People1 = new HashSet<People>();
            People2 = new HashSet<People>();
        }

        public int Id { get; set; }

        [Required]
        public string FirstName { get; set; }

        [Required]
        public string MiddelName { get; set; }

        [Required]
        public string LastName { get; set; }

        [Required]
        [StringLength(20)]
        public string PrimaryPhone { get; set; }

        [Required]
        [StringLength(60)]
        public string PrimaryEmail { get; set; }

        public DateTime DateOfBirth { get; set; }

        [StringLength(9)]
        public string SocialSecurity { get; set; }

        public virtual Emails Emails { get; set; }

        public virtual Instructors Instructors { get; set; }

        public virtual PhoneNumbers PhoneNumbers { get; set; }

        public virtual Staff Staff { get; set; }

        public virtual Students Students { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Emails> Emails1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Addresses> Addresses { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhoneNumbers> PhoneNumbers1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<People> People1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<People> People2 { get; set; }
    }
}
