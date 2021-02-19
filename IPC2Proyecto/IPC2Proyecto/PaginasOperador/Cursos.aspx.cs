using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasOperador
{
    public partial class Cursos : System.Web.UI.Page
    {
        ModelDatabase db;

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

        public IQueryable<Curso> GetCursos() {

            db = new ModelDatabase();

            IQueryable<Curso> cursos = from c in db.Cursoes
                                       where c.nombre!="talleres" &&
                                             c.nombre != "mantenimiento" &&
                                             c.nombre != "feriado"
                                       select c;

            return cursos;
        }

        public string GetNombreInstructor(Curso curso)
        {
            try
            {
                String s = curso.Actividads.Take(1).First().Carta.Usuario.nombre;

                return s;
            }
            catch (Exception)
            {
                return "No tiene ninguna actividad";
            }
        }

        protected void NuevoCurso_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PaginasOperador/NuevoCurso.aspx");
        }
    }
}