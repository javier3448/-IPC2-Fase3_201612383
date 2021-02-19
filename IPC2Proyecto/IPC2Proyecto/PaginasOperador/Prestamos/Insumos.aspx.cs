using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasOperador
{
    public partial class NuevoPrestamo : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.Cookies.Get("usuario").Values["tipo"] != "operador" || Request.Cookies.Get("usuario").Values["tipo"] == null)
            {
                if (Request.Cookies.Get("usuario").Values["tipo"] == "admin")
                {
                    return;
                }
                Response.Redirect("~/Login");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Insumo> GetInsumos() {
            ModelDatabase db = new ModelDatabase();

            IQueryable<Insumo> insumos = from i in db.Insumoes
                                         select i;

            return insumos;
        }

        public string GetDisponible(Insumo insumo) {
            if (insumo==null)
            {
                return "false";
            }
            else if (insumo.disponible)
            {
                return "true";
            }
            return "false";
        }
    }
}