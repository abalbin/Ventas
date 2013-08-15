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
    
    public partial class Presentacion
    {
        public Presentacion()
        {
            this.Campania = new HashSet<Campania>();
            this.Presentacion_Pedido = new HashSet<Presentacion_Pedido>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public Nullable<int> IdProducto { get; set; }
        public Nullable<decimal> Precio { get; set; }
        public string Codigo { get; set; }
    
        public virtual Producto Producto { get; set; }
        public virtual ICollection<Campania> Campania { get; set; }
        public virtual ICollection<Presentacion_Pedido> Presentacion_Pedido { get; set; }
    }
}
