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
    
    public partial class Linea
    {
        public Linea()
        {
            this.UserProfile = new HashSet<UserProfile>();
            this.Documento = new HashSet<Documento>();
            this.Producto = new HashSet<Producto>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
    
        public virtual ICollection<UserProfile> UserProfile { get; set; }
        public virtual ICollection<Documento> Documento { get; set; }
        public virtual ICollection<Producto> Producto { get; set; }
    }
}
