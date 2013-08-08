using Mvc.Mailer;
using VentasApp.Models;

namespace VentasApp.Mailers
{ 
	public class UserMailer : MailerBase, IUserMailer 	
	{
		public UserMailer()
		{
			MasterName="_Layout";
		}
		
		public virtual MvcMailMessage AlertPedido(Pedido model)
		{
			//ViewBag.Data = someObject;
			ViewData.Model = model;
			return Populate(x =>
			{
				x.Subject = string.Format("Unimed - Pedido {0}", model.Fecha.Value.ToString("dd-MM-yyyy"));
				x.ViewName = "AlertPedido";
				x.To.Add(model.Proveedor.Mail);
			});
		}
	}
}