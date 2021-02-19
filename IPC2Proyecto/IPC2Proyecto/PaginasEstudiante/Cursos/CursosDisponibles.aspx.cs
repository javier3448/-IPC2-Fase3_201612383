using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasEstudiante
{
    public partial class Asignacion : System.Web.UI.Page
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

        public List<Curso> GetCursos()
        {
            ModelDatabase db = new ModelDatabase();

            DateTime today = DateTime.Today;
            IQueryable<Curso> IQCursos = from c in db.Cursoes
                                         where c.fecha_incio > today &&
                                               c.nombre != "talleres" &&
                                               c.nombre != "laboratorios" &&
                                               c.nombre != "mantenimiento" &&
                                               c.nombre != "feriado"
                                         select c;

            List<Curso> ListCursos = new List<Curso>();

            foreach (Curso curso in IQCursos)
            {
                if (!curso.Asignacions.Any())
                {
                    ListCursos.Add(curso);
                }
                else
                {
                    int idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);

                    IQueryable<Models.MyModels.Asignacion> asignacionesDeCurso = from a in db.Asignacions
                                                                                 where a.usuario_estudiante == idUsuario && a.curso_id_curso == curso.id_curso
                                                                                 select a;


                    if (!asignacionesDeCurso.Any())
                    {
                        ListCursos.Add(curso);
                    }
                }
            }

            return ListCursos;
        }

        public string GetNombreCatedratico(Curso curso)
        {
            if (!curso.Actividads.Any())
            {
                return "Error";
            }
            else
            {
                ModelDatabase db = new ModelDatabase();
                
                IQueryable<Actividad> actividadesDeCurso = from a in db.Actividads
                                                           where a.curso_id_curso==curso.id_curso
                                                           select a;

                if (!actividadesDeCurso.Any())
                {
                    return "error";
                }
                else
                {
                    Actividad actividadDeCurso = actividadesDeCurso.Take(1).First();

                    return "nombre: " + actividadDeCurso.Carta.Usuario.nombre + " carne: " + actividadDeCurso.Carta.Usuario.carne;
                }
            }
        }


    }
}