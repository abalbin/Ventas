﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Entities : DbContext
    {
        public Entities()
            : base("name=Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Estado> Estado { get; set; }
        public DbSet<NombreTabla> NombreTabla { get; set; }
        public DbSet<Proveedor> Proveedor { get; set; }
        public DbSet<Ubigeo> Ubigeo { get; set; }
        public DbSet<UserProfile> UserProfile { get; set; }
        public DbSet<webpages_Roles> webpages_Roles { get; set; }
        public DbSet<Presentacion> Presentacion { get; set; }
        public DbSet<Linea> Linea { get; set; }
        public DbSet<Producto> Producto { get; set; }
        public DbSet<Farmacia> Farmacia { get; set; }
        public DbSet<Llamada> Llamada { get; set; }
        public DbSet<Pedido> Pedido { get; set; }
        public DbSet<FormaPago> FormaPago { get; set; }
    }
}
