using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.Admin
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_init(object sender, EventArgs e) {
            if (Request.Cookies.Get("usuario").Values["tipo"] != "admin" || Request.Cookies.Get("usuario").Values["tipo"] == null)
            {
                Response.Redirect("~/Login");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}