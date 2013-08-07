using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentasApp.Filters;
using VentasApp.Models;
using VentasApp.Models.ViewModels;

namespace VentasApp.Controllers
{
    [InitializeSimpleMembership]
    [Authorize]
    public class CampaniaController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /Campania/

        public ActionResult Index()
        {
            var campania = db.Campania.Include(c => c.Presentacion);
            return View(campania.ToList());
        }

        //
        // GET: /Campania/Details/5

        public ActionResult Details(int id = 0)
        {
            Campania campania = db.Campania.Find(id);
            if (campania == null)
            {
                return HttpNotFound();
            }
            return View(campania);
        }

        //
        // GET: /Campania/Create

        public ActionResult Create()
        {
            var presentaciones = db.Presentacion.AsEnumerable();
            var modelPresentaciones = from p in presentaciones
                                      select new PresentacionViewModel() { Id = p.Id, NombreMostrar = string.Format("{0} - {1}", p.Producto.Nombre, p.Nombre) };
            ViewBag.IdPresentacion = new SelectList(modelPresentaciones, "Id", "NombreMostrar");
            return View();
        }

        //
        // POST: /Campania/Create

        [HttpPost]
        public ActionResult Create(Campania campania)
        {
            if (ModelState.IsValid)
            {
                campania.Fecha = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("SA Pacific Standard Time"));
                db.Campania.Add(campania);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdPresentacion = new SelectList(db.Presentacion, "Id", "Nombre", campania.IdPresentacion);
            return View(campania);
        }

        //
        // GET: /Campania/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Campania campania = db.Campania.Find(id);
            if (campania == null)
            {
                return HttpNotFound();
            }
            var presentaciones = db.Presentacion.AsEnumerable();
            var modelPresentaciones = from p in presentaciones
                                      select new PresentacionViewModel() { Id = p.Id, NombreMostrar = string.Format("{0} - {1}", p.Producto.Nombre, p.Nombre) };
            ViewBag.IdPresentacion = new SelectList(modelPresentaciones, "Id", "NombreMostrar", campania.IdPresentacion);
            return View(campania);
        }

        //
        // POST: /Campania/Edit/5

        [HttpPost]
        public ActionResult Edit(Campania campania)
        {
            if (ModelState.IsValid)
            {
                db.Entry(campania).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdPresentacion = new SelectList(db.Presentacion, "Id", "Nombre", campania.IdPresentacion);
            return View(campania);
        }

        //
        // GET: /Campania/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Campania campania = db.Campania.Find(id);
            if (campania == null)
            {
                return HttpNotFound();
            }
            return View(campania);
        }

        //
        // POST: /Campania/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Campania campania = db.Campania.Find(id);
            db.Campania.Remove(campania);
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