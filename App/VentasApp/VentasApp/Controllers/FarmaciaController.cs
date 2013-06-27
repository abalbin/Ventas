using System.Data;
using System.Linq;
using System.Web.Mvc;
using VentasApp.Filters;
using VentasApp.Models;

namespace VentasApp.Controllers
{
    [Authorize]
    [InitializeSimpleMembership]
    public class FarmaciaController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /Farmacia/

        public ActionResult Index()
        {
            return View(db.Farmacia.ToList());
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
            return View();
        }

        //
        // POST: /Farmacia/Create

        [HttpPost]
        public ActionResult Create(Farmacia farmacia)
        {
            if (ModelState.IsValid)
            {
                db.Farmacia.Add(farmacia);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

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
            return View(farmacia);
        }

        //
        // POST: /Farmacia/Edit/5

        [HttpPost]
        public ActionResult Edit(Farmacia farmacia)
        {
            if (ModelState.IsValid)
            {
                db.Entry(farmacia).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
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