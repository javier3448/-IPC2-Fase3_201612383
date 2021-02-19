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
    public partial class MisActividades : System.Web.UI.Page
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

        public IQueryable<Actividad> GetActividades() {
            ModelDatabase db = new ModelDatabase();

            int idEstudiante = Int32.Parse(Request.Cookies.Get("usuario").Values["id_usuario"]);

            IQueryable<Actividad> actividades = from a in db.Actividads
                                                join m in db.Matriculas on a.id_actividad equals m.actividad_id_actividad
                                                where m.usuario_estudiante == idEstudiante
                                                select a;

            return actividades;
        }
    }
}