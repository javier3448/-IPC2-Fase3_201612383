using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasEstudiante.Actividades
{
    public partial class ActividadesDisponibles : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.Cookies.Get("usuario").Values["tipo"] != "estudiante" || Request.Cookies.Get("usuario").Values["tipo"] == null)
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

        public List<Actividad> GetActividades()
        {
            ModelDatabase db = new ModelDatabase();

            DateTime today = DateTime.Now;

            IQueryable<Actividad> actividades = from a in db.Actividads
                                                where a.fecha_incio > today &&
                                                      (a.Curso.nombre == "laboratorio" || a.Curso.nombre == "talleres")
                                                select a;

            List<Actividad> ListActividades = new List<Actividad>();

            foreach (Actividad actividad in actividades)
            {
                if (!actividad.Matriculas.Any())
                {
                    ListActividades.Add(actividad);
                }
                else 
                {
                    int idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);
                    IQueryable<Matricula> matriculasDeActividad = from m in db.Matriculas
                                                                  where m.usuario_estudiante == idUsuario && m.actividad_id_actividad == actividad.id_actividad
                                                                  select m;

                    if (!matriculasDeActividad.Any())
                    {
                        ListActividades.Add(actividad);
                    }
                }
            }

            return ListActividades;
        }
        

    }
}