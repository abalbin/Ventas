using Mvc.Mailer;
using VentasApp.Models;

namespace VentasApp.Mailers
{ 
    public interface IUserMailer
    {
			MvcMailMessage AlertPedido(Pedido model);
	}
}