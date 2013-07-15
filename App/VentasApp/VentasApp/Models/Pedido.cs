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
    
    public partial class Pedido
    {
        public int Id { get; set; }
        public int IdPresentacion { get; set; }
        public int IdProveedor { get; set; }
        public Nullable<int> IdLlamada { get; set; }
        public int Cantidad { get; set; }
        public Nullable<decimal> PrecioTotal { get; set; }
        public Nullable<System.DateTime> Fecha { get; set; }
    
        public virtual Llamada Llamada { get; set; }
        public virtual Presentacion Presentacion { get; set; }
        public virtual Proveedor Proveedor { get; set; }
    }
}