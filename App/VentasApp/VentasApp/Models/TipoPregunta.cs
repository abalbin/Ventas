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
    
    public partial class TipoPregunta
    {
        public TipoPregunta()
        {
            this.Pregunta = new HashSet<Pregunta>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string NombreControl { get; set; }
    
        public virtual ICollection<Pregunta> Pregunta { get; set; }
    }
}
