using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentasApp.Filters;
using VentasApp.Mailers;
using VentasApp.Models;
using VentasApp.Models.ViewModels;

namespace VentasApp.Controllers
{
    [InitializeSimpleMembership]
    [Authorize]
    public class PedidoController : Controller
    {
        private Entities db = new Entities();

        private IUserMailer _userMailer = new UserMailer();
        public IUserMailer UserMailer
        {
            get { return _userMailer; }
            set { _userMailer = value; }
        }

        //
        // GET: /Pedido/

        public ActionResult Index()
        {
            var pedido = db.Pedido.Include(p => p.Llamada).Include(p => p.Presentacion).Include(p => p.Proveedor);
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

        public ActionResult Create(int idLlamada = 0)
        {
            if (idLlamada > 0)
            {
                ViewBag.IdLlamada = idLlamada;
                var llamada = db.Llamada.Find(idLlamada);
                ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "RUC", llamada.IdFarmacia);
                ViewBag.Farmacia = db.Farmacia.Find(llamada.IdFarmacia);
            }
            else
                ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "RUC");
            ViewBag.IdProveedor = new SelectList(db.Proveedor, "Id", "Nombre");
            ViewBag.IdEstado = new SelectList(db.Estado.Where(e => e.Pedido1.Value), "Id", "Nombre");
            ViewBag.IdFormaPago = new SelectList(db.FormaPago, "Id", "Nombre");
            var presentaciones = db.Presentacion.AsEnumerable();
            var modelPresentaciones = from p in presentaciones
                                      select new PresentacionViewModel() { Id = p.Id, NombreMostrar = string.Format("{0} - {1}", p.Producto.Nombre, p.Nombre) };
            ViewBag.IdPresentacion = new SelectList(modelPresentaciones, "Id", "NombreMostrar");
            return View();
        }

        public PartialViewResult GetDetallesFarmaciaPartial(int id = 0)
        {
            var farmacia = db.Farmacia.Find(id);
            return PartialView("DetallesFarmaciaPartial", farmacia);
        }

        //
        // POST: /Pedido/Create

        [HttpPost]
        public ActionResult Create(Pedido pedido)
        {
            if (ModelState.IsValid)
            {
                db.Pedido.Add(pedido);
                db.SaveChanges();
                var prov = db.Proveedor.Find(pedido.IdProveedor);
                var pres = db.Presentacion.Find(pedido.IdPresentacion);
                pedido.Proveedor = prov;
                pedido.Presentacion = pres;
                EnviarAlertaPedido(pedido);
                return RedirectToAction("Index");
            }

            var presentaciones = db.Presentacion.AsEnumerable();
            var modelPresentaciones = from p in presentaciones
                                      select new PresentacionViewModel() { Id = p.Id, NombreMostrar = string.Format("{0} - {1}", p.Producto.Nombre, p.Nombre) };
            ViewBag.IdPresentacion = new SelectList(modelPresentaciones, "Id", "NombreMostrar");
            ViewBag.IdProveedor = new SelectList(db.Proveedor, "Id", "Nombre", pedido.IdProveedor);
            return View(pedido);
        }

        public void EnviarAlertaPedido(Pedido model)
        {
            UserMailer.AlertPedido(model).Send();
        }

        public ActionResult SendMail(int id = 0)
        {
            var model = db.Pedido.Find(id);
            if (model != null) EnviarAlertaPedido(model);
            return RedirectToAction("Index");
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
            ViewBag.IdProveedor = new SelectList(db.Proveedor, "Id", "Nombre", pedido.IdProveedor);
            var presentaciones = db.Presentacion.AsEnumerable();
            var modelPresentaciones = from p in presentaciones
                                      select new PresentacionViewModel() { Id = p.Id, NombreMostrar = string.Format("{0} - {1}", p.Producto.Nombre, p.Nombre) };
            ViewBag.IdPresentacion = new SelectList(modelPresentaciones, "Id", "NombreMostrar", pedido.IdPresentacion);
            return View(pedido);
        }

        //
        // POST: /Pedido/Edit/5

        [HttpPost]
        public ActionResult Edit(Pedido pedido)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pedido).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var presentaciones = db.Presentacion.AsEnumerable();
            var modelPresentaciones = from p in presentaciones
                                      select new PresentacionViewModel() { Id = p.Id, NombreMostrar = string.Format("{0} - {1}", p.Producto.Nombre, p.Nombre) };
            ViewBag.IdPresentacion = new SelectList(modelPresentaciones, "Id", "NombreMostrar");
            ViewBag.IdProveedor = new SelectList(db.Proveedor, "Id", "Nombre", pedido.IdProveedor);
            ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "RUC", pedido.IdFarmacia);
            ViewBag.Farmacia = db.Farmacia.Find(pedido.IdFarmacia);
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