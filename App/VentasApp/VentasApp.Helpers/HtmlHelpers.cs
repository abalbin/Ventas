using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.Mvc.Html;
using System.Web.Routing;

namespace VentasApp.Helpers
{
    public static class HtmlHelpers
    {
        public static MvcHtmlString ContentActionLink(this AjaxHelper htmlHelper, string linkText, string actionName, string controllerName, object routeValues, AjaxOptions ajaxOptions, object htmlAttributes)
        {
            var tagActionLink = htmlHelper.ActionLink("[replace]", actionName, controllerName, routeValues, ajaxOptions, htmlAttributes).ToHtmlString();
            return MvcHtmlString.Create(tagActionLink.Replace("[replace]", linkText));
        }

        public static MvcHtmlString ContentActionLink(this AjaxHelper ajaxHelper, string linkText, string actionName, string controllerName, RouteValueDictionary routeValues, AjaxOptions ajaxOptions, IDictionary<string, object> htmlAttributes)
        {
            var tagActionLink = ajaxHelper.ActionLink("[replace]", actionName, controllerName, routeValues, ajaxOptions, htmlAttributes).ToHtmlString();
            return MvcHtmlString.Create(tagActionLink.Replace("[replace]", linkText));
        }
    }
}
