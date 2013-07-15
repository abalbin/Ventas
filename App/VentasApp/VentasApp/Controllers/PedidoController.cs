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
    public class PedidoController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /Pedido/

        public ActionResult Index()
        {
            var pedido = db.Pedido.Include(p => p.Llamada).Include(p => p.Proveedor).Include(p => p.Presentacion);
            return View(pedido.ToList());
        }

        //
        // GET: /Pedido/Details/5

        public ActionResult Details(int id = 0)
        {
            Pedido pedido = db.Pedido.Find(id);
            if (pedido == null)
            {
                return HttpNotFound();
            }
            return View(pedido);
        }

        //
        // GET: /Pedido/Create

        public ActionResult Create()
        {
            ViewBag.IdLlamada = new SelectList(db.Llamada, "Id", "Observaciones");
            ViewBag.IdProveedor = new SelectList(db.Proveedor, "Id", "Nombre");
            ViewBag.IdPresentacion = new SelectList(db.Presentacion, "Id", "Nombre");
            return View();
        }

        //
        // POST: /Pedido/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Pedido pedido)
        {
            if (ModelState.IsValid)
            {
                db.Pedido.Add(pedido);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdLlamada = new SelectList(db.Llamada, "Id", "Observaciones", pedido.IdLlamada);
            ViewBag.IdProveedor = new SelectList(db.Proveedor, "Id", "Nombre", pedido.IdProveedor);
            ViewBag.IdPresentacion = new SelectList(db.Presentacion, "Id", "Nombre", pedido.IdPresentacion);
            return View(pedido);
        }

        //
        // GET: /Pedido/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Pedido pedido = db.Pedido.Find(id);
            if (pedido == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdLlamada = new SelectList(db.Llamada, "Id", "Observaciones", pedido.IdLlamada);
            ViewBag.IdProveedor = new SelectList(db.Proveedor, "Id", "Nombre", pedido.IdProveedor);
            ViewBag.IdPresentacion = new SelectList(db.Presentacion, "Id", "Nombre", pedido.IdPresentacion);
            return View(pedido);
        }

        //
        // POST: /Pedido/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Pedido pedido)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pedido).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdLlamada = new SelectList(db.Llamada, "Id", "Observaciones", pedido.IdLlamada);
            ViewBag.IdProveedor = new SelectList(db.Proveedor, "Id", "Nombre", pedido.IdProveedor);
            ViewBag.IdPresentacion = new SelectList(db.Presentacion, "Id", "Nombre", pedido.IdPresentacion);
            return View(pedido);
        }

        //
        // GET: /Pedido/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Pedido pedido = db.Pedido.Find(id);
            if (pedido == null)
            {
                return HttpNotFound();
            }
            return View(pedido);
        }

        //
        // POST: /Pedido/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Pedido pedido = db.Pedido.Find(id);
            db.Pedido.Remove(pedido);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}