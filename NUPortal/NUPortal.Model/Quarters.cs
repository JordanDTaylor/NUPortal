//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NUPortal.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Quarters
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Quarters()
        {
            this.YearsYear = 2016;
            this.Sprint1 = 2016;
            this.Sprint2 = 2016;
            this.SheduledEvent = new HashSet<SheduledEvent>();
        }
    
        public int Id { get; set; }
        public string Label { get; set; }
        public int YearsYear { get; set; }
        public int Sprint1 { get; set; }
        public int Sprint2 { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SheduledEvent> SheduledEvent { get; set; }
    }
}
