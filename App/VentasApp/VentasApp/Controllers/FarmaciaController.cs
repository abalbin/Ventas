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
    public class FarmaciaController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /Farmacia/

        public ActionResult Index()
        {
            var farmacia = db.Farmacia.Include(f => f.Ubigeo);
            return View(farmacia.ToList());
        }

        //
        // GET: /Farmacia/Details/5

        public ActionResult Details(int id = 0)
        {
            Farmacia farmacia = db.Farmacia.Find(id);
            if (farmacia == null)
            {
                return HttpNotFound();
            }
            return View(farmacia);
        }

        //
        // GET: /Farmacia/Create

        public ActionResult Create()
        {
            ViewBag.IdUbigeo = new SelectList(db.Ubigeo, "Id", "Nombre");
            return View();
        }

        //
        // POST: /Farmacia/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Farmacia farmacia)
        {
            if (ModelState.IsValid)
            {
                db.Farmacia.Add(farmacia);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdUbigeo = new SelectList(db.Ubigeo, "Id", "Nombre", farmacia.IdUbigeo);
            return View(farmacia);
        }

        //
        // GET: /Farmacia/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Farmacia farmacia = db.Farmacia.Find(id);
            if (farmacia == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdUbigeo = new SelectList(db.Ubigeo, "Id", "Nombre", farmacia.IdUbigeo);
            return View(farmacia);
        }

        //
        // POST: /Farmacia/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Farmacia farmacia)
        {
            if (ModelState.IsValid)
            {
                db.Entry(farmacia).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdUbigeo = new SelectList(db.Ubigeo, "Id", "Nombre", farmacia.IdUbigeo);
            return View(farmacia);
        }

        //
        // GET: /Farmacia/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Farmacia farmacia = db.Farmacia.Find(id);
            if (farmacia == null)
            {
                return HttpNotFound();
            }
            return View(farmacia);
        }

        //
        // POST: /Farmacia/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Farmacia farmacia = db.Farmacia.Find(id);
            db.Farmacia.Remove(farmacia);
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