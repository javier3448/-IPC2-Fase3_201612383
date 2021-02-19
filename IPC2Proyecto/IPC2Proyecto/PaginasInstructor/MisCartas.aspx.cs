using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IPC2Proyecto.Models.MyModels;
using IPC2Proyecto.Models;

namespace IPC2Proyecto.PaginasInstructor
{
    public partial class MisCartas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.Cookies.Get("usuario").Values["tipo"] != "instructor" || Request.Cookies.Get("usuario").Values["tipo"] == null)
            {
                if (Request.Cookies.Get("usuario").Values["tipo"] == "admin")
                {
                    return;
                }
                Response.Redirect("~/Login");
            }
        }

        public IQueryable<Carta> GetCartas() {
            ModelDatabase db = new ModelDatabase();

            int idEstudiante = Int32.Parse(Request.Cookies.Get("usuario").Values["id_usuario"]);

            IQueryable<Carta> cartas = from c in db.Cartas
                                       where c.usuario_instructor == idEstudiante
                                       select c;

            return cartas;
        }

        public string GetContenido(string contenido) {
            if (contenido.Length<40) {
                return contenido;
            }
            return contenido.Substring(0, 40) + "...";
        }

        protected void NuevaCarta_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PaginasInstructor/NuevaCarta");
        }
    }
}