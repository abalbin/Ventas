//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VentasApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TipoExamen
    {
        public TipoExamen()
        {
            this.Examen = new HashSet<Examen>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
    
        public virtual ICollection<Examen> Examen { get; set; }
    }
}
