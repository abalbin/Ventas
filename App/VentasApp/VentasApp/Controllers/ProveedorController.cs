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
    public class ProveedorController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /Proveedor/

        public ActionResult Index()
        {
            return View(db.Proveedor.ToList());
        }

        //
        // GET: /Proveedor/Details/5

        public ActionResult Details(int id = 0)
        {
            Proveedor proveedor = db.Proveedor.Find(id);
            if (proveedor == null)
            {
                return HttpNotFound();
            }
            return View(proveedor);
        }

        //
        // GET: /Proveedor/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Proveedor/Create

        [HttpPost]
        public ActionResult Create(Proveedor proveedor)
        {
            if (ModelState.IsValid)
            {
                db.Proveedor.Add(proveedor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(proveedor);
        }

        //
        // GET: /Proveedor/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Proveedor proveedor = db.Proveedor.Find(id);
            if (proveedor == null)
            {
                return HttpNotFound();
            }
            return View(proveedor);
        }

        //
        // POST: /Proveedor/Edit/5

        [HttpPost]
        public ActionResult Edit(Proveedor proveedor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(proveedor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(proveedor);
        }

        //
        // GET: /Proveedor/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Proveedor proveedor = db.Proveedor.Find(id);
            if (proveedor == null)
            {
                return HttpNotFound();
            }
            return View(proveedor);
        }

        //
        // POST: /Proveedor/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Proveedor proveedor = db.Proveedor.Find(id);
            db.Proveedor.Remove(proveedor);
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