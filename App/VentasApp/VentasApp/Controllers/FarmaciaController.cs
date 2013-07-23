using System;
using System.Collections.Generic;
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
            ViewBag.ddlRegiones = new SelectList(db.Ubigeo.Where(u => u.Ubigeo4 == 0 && u.Ubigeo5 == 0), "Ubigeo3", "Nombre");
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
            ViewBag.IdUbigeo = new SelectList(db.Ubigeo.Where(u => u.Ubigeo3 == farmacia.Ubigeo.Ubigeo3 && u.Ubigeo4 == farmacia.Ubigeo.Ubigeo4 && u.Ubigeo5 > 0), "Id", "Nombre", farmacia.IdUbigeo);
            ViewBag.Region = new SelectList(db.Ubigeo.Where(u => u.Ubigeo3 > 0 && u.Ubigeo4 == 0 && u.Ubigeo5 == 0), "Ubigeo3", "Nombre", farmacia.Ubigeo.Ubigeo3);
            var provincias = from p in db.Ubigeo.Where(u => u.Ubigeo3 == farmacia.Ubigeo.Ubigeo3 && u.Ubigeo4 > 0 && u.Ubigeo5 == 0).AsEnumerable()
                             select new { Value = string.Format("{0},{1}", p.Ubigeo3, p.Ubigeo4), Nombre = p.Nombre };
            ViewBag.Provincia = new SelectList(provincias, "Value", "Nombre", string.Format("{0},{1}", farmacia.Ubigeo.Ubigeo3, farmacia.Ubigeo.Ubigeo4));
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

        public ActionResult GetProvinciasByRegion(int ubigeo = 0)
        {
            if (ubigeo != 0)
            {
                //string[] cadenaUbigeo = ubigeo.Split(',');
                var result = db.Ubigeo.Where(r => r.Ubigeo3 == ubigeo && r.Ubigeo4 > 0 && r.Ubigeo5 == 0).AsEnumerable();
                var model = from u in result
                            select new { value = string.Format("{0},{1}", u.Ubigeo3, u.Ubigeo4), text = u.Nombre };
                return Json(model, JsonRequestBehavior.AllowGet);
            }
            return HttpNotFound();
        }

        public ActionResult GetDistritosByProvincia(string ubigeo = "")
        {
            if (ubigeo != "")
            {
                string[] cadenaUbigeo = ubigeo.Split(',');
                int ubig3 = Convert.ToInt32(cadenaUbigeo[0]);
                int ubig4 = Convert.ToInt32(cadenaUbigeo[1]);
                var result = db.Ubigeo.Where(r => r.Ubigeo3 == ubig3 && r.Ubigeo4 == ubig4 && r.Ubigeo5 > 0).AsEnumerable();
                var model = from u in result
                            select new { value = u.Id, text = u.Nombre };
                return Json(model, JsonRequestBehavior.AllowGet);
            }
            return HttpNotFound();
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}