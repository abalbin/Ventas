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
    
    public partial class Ubigeo
    {
        public Ubigeo()
        {
            this.Farmacia = new HashSet<Farmacia>();
        }
    
        public int Id { get; set; }
        public Nullable<int> Ubigeo1 { get; set; }
        public Nullable<int> Ubigeo2 { get; set; }
        public Nullable<int> Ubigeo3 { get; set; }
        public Nullable<int> Ubigeo4 { get; set; }
        public Nullable<int> Ubigeo5 { get; set; }
        public string Nombre { get; set; }
    
        public virtual ICollection<Farmacia> Farmacia { get; set; }
    }
}