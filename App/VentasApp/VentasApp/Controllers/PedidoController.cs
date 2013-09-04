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
            var pedido = db.Pedido.Include(p => p.Llamada).Include(p => p.Proveedor);
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
            Session["Presentaciones"] = new List<Presentacion_Pedido>();
            ViewBag.Presentaciones = Session["Presentaciones"];
            var listaCampanias = db.Campania.Where(c => c.Vigente.Value).ToList();
            ViewBag.Campanias = listaCampanias.Count > 0 ? listaCampanias : new List<Campania>();
            return View();
        }

        public ActionResult SelectCampaniaPartial(int id = 0)
        {
            if (id > 0)
            {
                List<Campania> lista = db.Campania.Where(c => c.IdPresentacion == id && c.Vigente.Value).ToList();
                return PartialView(lista);
            }
            return HttpNotFound();
        }

        public ActionResult AddCampaniaToPresentacion(int idCampania = 0, int idPresentacion = 0)
        {
            List<Presentacion_Pedido> lista = Session["Presentaciones"] as List<Presentacion_Pedido>;
            var item = lista.Find(p => p.IdPresentacion == idPresentacion);
            if (item != null)
            {
                item.IdCampania = idCampania;
                var camp = db.Campania.Find(idCampania);
                item.Campania = new Campania() { Nombre = camp.Nombre };
                return PartialView("PresentacionesPartial", Session["Presentaciones"]);
            }
            return HttpNotFound();
        }

        public ActionResult RemoveCampaniaOffPresentacion(int id = 0)
        {
            List<Presentacion_Pedido> lista = Session["Presentaciones"] as List<Presentacion_Pedido>;
            var item = lista.Find(p => p.IdPresentacion == id);
            if (item != null)
            {
                item.IdCampania = null;
                item.Campania = null;
                return PartialView("PresentacionesPartial", Session["Presentaciones"]);
            }
            return HttpNotFound();
        }

        public ActionResult AddPresentacion(int idPresentacion = 0, int cantidad = 0)
        {
            List<Presentacion_Pedido> lista = Session["Presentaciones"] as List<Presentacion_Pedido>;
            if (lista == null) lista = new List<Presentacion_Pedido>();
            var item = lista.Find(p=>p.IdPresentacion == idPresentacion);
            if (item != null) item.Cantidad += cantidad;
            else
            {
                var presentacion = db.Presentacion.Find(idPresentacion);
                var presPedido = new Presentacion_Pedido() { Cantidad = cantidad, IdPresentacion = idPresentacion, Presentacion = presentacion };
                lista.Add(presPedido);
            }            
            return PartialView("PresentacionesPartial", Session["Presentaciones"]);
        }

        public ActionResult RemovePresentacion(int id = 0)
        {
            List<Presentacion_Pedido> lista = Session["Presentaciones"] as List<Presentacion_Pedido>;
            if (lista == null) lista = new List<Presentacion_Pedido>();
            var item = lista.Find(p=>p.IdPresentacion == id);
            lista.Remove(item);
            return PartialView("PresentacionesPartial", Session["Presentaciones"]);
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
                var listaPrestPedido = Session["Presentaciones"] as List<Presentacion_Pedido>;
                foreach (var item in listaPrestPedido)
                {
                    db.Presentacion_Pedido.Add(new Presentacion_Pedido() { IdPresentacion = item.IdPresentacion, IdPedido = pedido.Id, IdCampania = item.IdCampania, Cantidad = item.Cantidad });
                }
                db.SaveChanges();
                pedido.Presentacion_Pedido = listaPrestPedido;
                var prov = db.Proveedor.Find(pedido.IdProveedor);
                //var pres = db.Presentacion.Find(pedido.IdPresentacion);
                pedido.Proveedor = prov;
                //pedido.Presentacion = pres;
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
            ViewBag.IdFarmacia = new SelectList(db.Farmacia, "Id", "RUC", pedido.IdFarmacia);
            ViewBag.Farmacia = db.Farmacia.Find(pedido.IdFarmacia);
            ViewBag.IdProveedor = new SelectList(db.Proveedor, "Id", "Nombre", pedido.IdProveedor);
            ViewBag.IdEstado = new SelectList(db.Estado.Where(e => e.Pedido1.Value), "Id", "Nombre", pedido.IdEstado);
            ViewBag.IdFormaPago = new SelectList(db.FormaPago, "Id", "Nombre", pedido.IdFormaPago);
            var presentaciones = db.Presentacion.AsEnumerable();
            var modelPresentaciones = from p in presentaciones
                                      select new PresentacionViewModel() { Id = p.Id, NombreMostrar = string.Format("{0} - {1}", p.Producto.Nombre, p.Nombre) };
            ViewBag.IdPresentacion = new SelectList(modelPresentaciones, "Id", "NombreMostrar");
            //Session["Presentaciones"] = pedido.Presentacion_Pedido.ToList();
            var listPresentaciones = pedido.Presentacion_Pedido.ToList();
            var listaSession = new List<Presentacion_Pedido>();
            foreach (var item in listPresentaciones)
            {
                var pres = new Presentacion_Pedido() { IdPresentacion = item.IdPresentacion, Presentacion = item.Presentacion, Cantidad = item.Cantidad, IdCampania = item.IdCampania, Campania = new Campania() { Id = item.Campania.Id, Nombre = item.Campania.Nombre } };
                listaSession.Add(pres);
            }
            Session["Presentaciones"] = listaSession;
            ViewBag.Presentaciones = Session["Presentaciones"];
            var listaCampanias = db.Campania.Where(c => c.Vigente.Value).ToList();
            ViewBag.Campanias = listaCampanias.Count > 0 ? listaCampanias : new List<Campania>();
            pedido.Presentacion_Pedido = null;
            return View(pedido);
        }

        //
        // POST: /Pedido/Edit/5

        [HttpPost]
        public ActionResult Edit(Pedido pedido)
        {
            if (ModelState.IsValid)
            {
                var listaPres = db.Presentacion_Pedido.Where(p => p.IdPedido == pedido.Id);
                foreach (var item in listaPres)
                {
                    db.Presentacion_Pedido.Remove(item);
                    db.Entry(item).State = EntityState.Deleted;
                }
                db.SaveChanges();
                db.Entry(pedido).State = EntityState.Modified;
                var listaPrestPedido = Session["Presentaciones"] as List<Presentacion_Pedido>;
                foreach (var item in listaPrestPedido)
                {
                    db.Presentacion_Pedido.Add(new Presentacion_Pedido() { IdPresentacion = item.IdPresentacion, IdPedido = pedido.Id, IdCampania = item.IdCampania, Cantidad = item.Cantidad });
                }
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