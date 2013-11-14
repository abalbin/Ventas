using System;
using System.Web.Mvc;
using System.Data;
using System.Data.Entity;
using System.Linq;
using VentasApp.Filters;
using VentasApp.Models;
using VentasApp.Models.ViewModels;

namespace VentasApp.Controllers
{
    [InitializeSimpleMembership]
    [Authorize]
    public class HomeController : Controller
    {
        private Entities db = new Entities();

        public ActionResult Index()
        {
            var model = new HomeViewModel();
            DateTime now = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("SA Pacific Standard Time"));
            model.LlamadasRegistradas = db.Llamada.AsEnumerable().Where(l => l.Fecha != null ? l.Fecha.Value.Date.Equals(now.Date) : false).Count();
            model.LlamadasPendientes = db.Llamada.AsEnumerable().Where(l => l.EsRellamada.Value && (l.FechaPrevistaRellamada != null ? l.FechaPrevistaRellamada.Value.Date.Equals(now.Date) : false)).Count();
            model.PedidosRegistrados = db.Pedido.AsEnumerable().Where(l => l.Fecha.Value.Date.Equals(now.Date)).Count();
            model.LlamadasPedidosRegistrados = db.Pedido.AsEnumerable().Where(l => l.Fecha.Value.Date.Equals(now.Date) && l.IdLlamada != null).Count();
            model.CampaniasVigentes = db.Campania.AsEnumerable().Where(l => l.Vigente.Value).Count();
            model.Total = model.LlamadasRegistradas + model.LlamadasPendientes + model.PedidosRegistrados + model.LlamadasPedidosRegistrados + model.CampaniasVigentes;

            model.Total = model.Total == 0 ? 1 : model.Total;

            model.LlamadasRegistradasPercent = model.LlamadasRegistradas * 100 / model.Total;
            model.LlamadasPendientesPercent = model.LlamadasPendientes * 100 / model.Total;
            model.PedidosRegistradosPercent = model.PedidosRegistrados * 100 / model.Total;
            model.LlamadasPedidosRegistradosPercent = model.LlamadasPedidosRegistrados * 100 / model.Total;
            model.CampaniasVigentesPercent = model.CampaniasVigentes * 100 / model.Total;

            return View("Index", model);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
