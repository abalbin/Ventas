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
    
    public partial class RespuestaUsuario
    {
        public int Id { get; set; }
        public Nullable<int> IdRespuesta { get; set; }
        public Nullable<int> IdUsuario { get; set; }
        public Nullable<int> IdExamenUsuario { get; set; }
        public string Texto { get; set; }
        public bool Marcada { get; set; }
    
        public virtual ExamenUsuario ExamenUsuario { get; set; }
        public virtual Respuesta Respuesta { get; set; }
        public virtual UserProfile UserProfile { get; set; }
    }
}
