using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentasApp.Filters;
using VentasApp.Models;

namespace VentasApp.Controllers
{
    [InitializeSimpleMembership]
    [Authorize]
    public class LlamadaController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /Llamada/

        public ActionResult Index()
        {
            var llamada = db.Llamada;
            var model = llamada.OrderByDescending(r => r.Fecha).ToList();
            return View(model);
        }

        public ActionResult Seguimiento()
        {
            var llamada = db.Llamada.Where(r => r.EsRellamada.Value);
            var model = llamada.OrderByDescending(r => r.Fecha).ToList();
            return View(model);
        }

        //
        // GET: /Llamada/Details/5

        public ActionResult Details(int id = 0)
        {
            Llamada llamada = db.Llamada.Find(id);
            if (llamada == null)
            {
                return HttpNotFound();
            }
            return View(llamada);
        }

        //
        // GET: /Llamada/Create

        public ActionResult Create()
        {
            ViewBag.IdEstado = new SelectList(db.Estado, "Id", "Nombre");
            ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "Ruc");
            ViewBag.IdEstado = new SelectList(db.Estado, "Id", "Nombre");
            ViewBag.EsRellamadaHelper = false;
            return View();
        }
        public PartialViewResult GetDetallesFarmaciaPartial(int id = 0)
        {
            var farmacia = db.Farmacia.Find(id);
            return PartialView("DetallesFarmaciaPartial", farmacia);
        }


        //
        // POST: /Llamada/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Llamada llamada)
        {
            if (ModelState.IsValid)
            {
                string fechaStr = llamada.FechaPrevistaRellamadaStr;
                bool esRellamada = llamada.EsRellamadaHelper.Value;
                llamada.Fecha = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("SA Pacific Standard Time"));
                llamada.FechaPrevistaRellamada = null;
                llamada.FechaPrevistaRellamadaStr = !esRellamada ? null : fechaStr;
                llamada.EsRellamada = false;
                llamada.IdLlamadaPadre = null;
                db.Llamada.Add(llamada);
                db.SaveChanges();
                if (esRellamada)
                {
                    Llamada rellamada = new Llamada()
                    {
                        FechaPrevistaRellamada = Convert.ToDateTime(fechaStr),
                        IdFarmacia = llamada.IdFarmacia,
                        EsRellamada = true,
                        IdLlamadaPadre = llamada.Id,
                        Observaciones = llamada.Observaciones
                    };
                    db.Llamada.Add(rellamada);
                    db.SaveChanges();
                }
                if (llamada.ConPedido.HasValue && llamada.ConPedido.Value)
                    return RedirectToAction("Create", "Pedido", new { idLlamada = llamada.Id });
                return RedirectToAction("Index");
            }

            ViewBag.IdEstado = new SelectList(db.Estado, "Id", "Nombre", llamada.IdEstado);
            return View(llamada);
        }

        //
        // GET: /Llamada/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Llamada llamada = db.Llamada.Find(id);
            if (llamada == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdEstado = new SelectList(db.Estado, "Id", "Nombre", llamada.IdEstado);
            ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "RUC", llamada.IdFarmacia);
            ViewBag.IdEstado = new SelectList(db.Estado, "Id", "Nombre", llamada.IdEstado);
            ViewBag.EsRellamadaHelper = false;
            ViewBag.Farmacia = db.Farmacia.Find(llamada.IdFarmacia);

            return View(llamada);
        }

        public ActionResult EditSeguimiento(int id = 0)
        {
            Llamada llamada = db.Llamada.Find(id);
            if (llamada == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdEstado = new SelectList(db.Estado, "Id", "Nombre", llamada.IdEstado);
            ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "Ruc", llamada.IdFarmacia);
            ViewBag.IdEstado = new SelectList(db.Estado, "Id", "Nombre", llamada.IdEstado);
            ViewBag.EsRellamadaHelper = false;

            return View(llamada);
        }

        //
        // POST: /Llamada/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Llamada llamada)
        {
            if (ModelState.IsValid)
            {
                db.Entry(llamada).State = EntityState.Modified;
                db.SaveChanges();
                if (llamada.ConPedido.HasValue && llamada.ConPedido.Value)
                    return RedirectToAction("Create", "Pedido", new { idLlamada = llamada.Id });
                return RedirectToAction("Index");
            }
            ViewBag.IdEstado = new SelectList(db.Estado, "Id", "Nombre", llamada.IdEstado);
            return View(llamada);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditSeguimiento(Llamada llamada)
        {
            if (ModelState.IsValid)
            {
                db.Entry(llamada).State = EntityState.Modified;
                string fechaStr = llamada.FechaPrevistaRellamadaStr;
                bool esRellamada = llamada.EsRellamadaHelper.Value;
                llamada.Fecha = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("SA Pacific Standard Time"));
                llamada.FechaPrevistaRellamadaStr = !esRellamada ? null : fechaStr;
                llamada.EsRellamada = false;
                db.SaveChanges();
                if (esRellamada)
                {
                    Llamada rellamada = new Llamada()
                    {
                        FechaPrevistaRellamada = Convert.ToDateTime(fechaStr),
                        IdFarmacia = llamada.IdFarmacia,
                        EsRellamada = true,
                        IdLlamadaPadre = llamada.Id
                    };
                    db.Llamada.Add(rellamada);
                    db.SaveChanges();
                }
                if (llamada.ConPedido.HasValue && llamada.ConPedido.Value)
                    return RedirectToAction("Create", "Pedido", new { idLlamada = llamada.Id });
                return RedirectToAction("Seguimiento");
            }
            ViewBag.IdEstado = new SelectList(db.Estado, "Id", "Nombre", llamada.IdEstado);
            return View(llamada);
        }

        //
        // GET: /Llamada/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Llamada llamada = db.Llamada.Find(id);
            if (llamada == null)
            {
                return HttpNotFound();
            }
            return View(llamada);
        }

        //
        // POST: /Llamada/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Llamada llamada = db.Llamada.Find(id);
            db.Llamada.Remove(llamada);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult CreatePedido(int id = 0)
        {
            if (id == 0)
                return HttpNotFound();
            return RedirectToAction("Create", "Pedido", new { idLlamada = id });
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}