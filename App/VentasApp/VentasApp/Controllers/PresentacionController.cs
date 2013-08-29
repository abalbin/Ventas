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
    public class PresentacionController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /Presentacion/

        public ActionResult Index()
        {
            var presentacion = db.Presentacion.Include(p => p.Producto);
            return View(presentacion.ToList());
        }

        //
        // GET: /Presentacion/Details/5

        public ActionResult Details(int id = 0)
        {
            Presentacion presentacion = db.Presentacion.Find(id);
            if (presentacion == null)
            {
                return HttpNotFound();
            }
            return View(presentacion);
        }

        //
        // GET: /Presentacion/Create

        public ActionResult Create()
        {
            ViewBag.IdProducto = new SelectList(db.Producto, "Id", "Nombre");
            return View();
        }

        //
        // POST: /Presentacion/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Presentacion presentacion)
        {
            if (ModelState.IsValid)
            {
                db.Presentacion.Add(presentacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdProducto = new SelectList(db.Producto, "Id", "Nombre", presentacion.IdProducto);
            return View(presentacion);
        }

        //
        // GET: /Presentacion/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Presentacion presentacion = db.Presentacion.Find(id);
            if (presentacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdProducto = new SelectList(db.Producto, "Id", "Nombre", presentacion.IdProducto);
            return View(presentacion);
        }

        //
        // POST: /Presentacion/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Presentacion presentacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(presentacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdProducto = new SelectList(db.Producto, "Id", "Nombre", presentacion.IdProducto);
            return View(presentacion);
        }

        //
        // GET: /Presentacion/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Presentacion presentacion = db.Presentacion.Find(id);
            if (presentacion == null)
            {
                return HttpNotFound();
            }
            return View(presentacion);
        }

        //
        // POST: /Presentacion/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Presentacion presentacion = db.Presentacion.Find(id);
            db.Presentacion.Remove(presentacion);
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