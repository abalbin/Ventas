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
            ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "RazonSocial");
            return View();
        }

        //
        // POST: /Llamada/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Llamada llamada)
        {
            if (ModelState.IsValid)
            {
                llamada.IdEstado = 1;
                db.Llamada.Add(llamada);
                db.SaveChanges();
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
            ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "RazonComercial", llamada.IdFarmacia);
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
                return RedirectToAction("Index");
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