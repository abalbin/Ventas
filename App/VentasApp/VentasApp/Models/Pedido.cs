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
        public Pedido()
        {
            this.Presentacion_Pedido = new HashSet<Presentacion_Pedido>();
        }
    
        public int Id { get; set; }
        public int IdProveedor { get; set; }
        public Nullable<int> IdLlamada { get; set; }
        public Nullable<decimal> PrecioTotal { get; set; }
        public Nullable<System.DateTime> Fecha { get; set; }
        public Nullable<int> IdFarmacia { get; set; }
        public string Comentario { get; set; }
        public Nullable<int> IdFormaPago { get; set; }
        public Nullable<int> IdEstado { get; set; }
    
        public virtual Estado Estado { get; set; }
        public virtual Farmacia Farmacia { get; set; }
        public virtual FormaPago FormaPago { get; set; }
        public virtual Llamada Llamada { get; set; }
        public virtual Proveedor Proveedor { get; set; }
        public virtual ICollection<Presentacion_Pedido> Presentacion_Pedido { get; set; }
    }
}
