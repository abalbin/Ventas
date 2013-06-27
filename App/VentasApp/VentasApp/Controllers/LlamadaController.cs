using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using VentasApp.Filters;
using VentasApp.Models;

namespace VentasApp.Controllers
{
    [Authorize]
    [InitializeSimpleMembership]
    public class LlamadaController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /Llamada/

        public ActionResult Index()
        {
            var llamada_farmacia = db.Llamada_Farmacia.Include(l => l.Farmacia).Include(l => l.Llamada_Farmacia2);
            return View(llamada_farmacia.ToList());
        }

        //
        // GET: /Llamada/Details/5

        public ActionResult Details(int id = 0)
        {
            Llamada_Farmacia llamada_farmacia = db.Llamada_Farmacia.Find(id);
            if (llamada_farmacia == null)
            {
                return HttpNotFound();
            }
            return View(llamada_farmacia);
        }

        //
        // GET: /Llamada/Create

        public ActionResult Create()
        {
            ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "Ruc");
            ViewBag.IdLlamadaPadre = new SelectList(db.Llamada_Farmacia, "Id", "Observaciones");
            return View();
        }

        //
        // POST: /Llamada/Create

        [HttpPost]
        public ActionResult Create(Llamada_Farmacia llamada_farmacia)
        {
            if (ModelState.IsValid)
            {
                db.Llamada_Farmacia.Add(llamada_farmacia);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "Ruc", llamada_farmacia.IdFarmacia);
            ViewBag.IdLlamadaPadre = new SelectList(db.Llamada_Farmacia, "Id", "Observaciones", llamada_farmacia.IdLlamadaPadre);
            return View(llamada_farmacia);
        }

        //
        // GET: /Llamada/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Llamada_Farmacia llamada_farmacia = db.Llamada_Farmacia.Find(id);
            if (llamada_farmacia == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "Ruc", llamada_farmacia.IdFarmacia);
            ViewBag.IdLlamadaPadre = new SelectList(db.Llamada_Farmacia, "Id", "Observaciones", llamada_farmacia.IdLlamadaPadre);
            return View(llamada_farmacia);
        }

        //
        // POST: /Llamada/Edit/5

        [HttpPost]
        public ActionResult Edit(Llamada_Farmacia llamada_farmacia)
        {
            if (ModelState.IsValid)
            {
                db.Entry(llamada_farmacia).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "Ruc", llamada_farmacia.IdFarmacia);
            ViewBag.IdLlamadaPadre = new SelectList(db.Llamada_Farmacia, "Id", "Observaciones", llamada_farmacia.IdLlamadaPadre);
            return View(llamada_farmacia);
        }

        //
        // GET: /Llamada/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Llamada_Farmacia llamada_farmacia = db.Llamada_Farmacia.Find(id);
            if (llamada_farmacia == null)
            {
                return HttpNotFound();
            }
            return View(llamada_farmacia);
        }

        //
        // POST: /Llamada/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Llamada_Farmacia llamada_farmacia = db.Llamada_Farmacia.Find(id);
            db.Llamada_Farmacia.Remove(llamada_farmacia);
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