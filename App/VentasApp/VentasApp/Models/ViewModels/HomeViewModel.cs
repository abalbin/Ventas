using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VentasApp.Models.ViewModels
{
    public class HomeViewModel
    {
        public int LlamadasRegistradas { get; set; }
        public int LlamadasPendientes { get; set; }
        public int PedidosRegistrados { get; set; }
        public int LlamadasPedidosRegistrados { get; set; }
        public int Total { get; set; }

        public float LlamadasRegistradasPercent { get; set; }
        public float LlamadasPendientesPercent { get; set; }
        public float PedidosRegistradosPercent { get; set; }
        public float LlamadasPedidosRegistradosPercent { get; set; }
    }
}