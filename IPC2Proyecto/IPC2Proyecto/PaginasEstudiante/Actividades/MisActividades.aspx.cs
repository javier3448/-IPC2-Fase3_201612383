using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasEstudiante
{
    public partial class MisActividades : System.Web.UI.Page
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

            IQueryable<Actividad> actividades = from a in db.Actividads
                                                select a;

            List<Actividad> ListActividades = new List<Actividad>();

            foreach (Actividad actividad in actividades)
            {
                if (!actividad.Matriculas.Any())
                {
                    
                }
                else
                {
                    int idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);
                    IQueryable<Matricula> matriculasDeActividad = from m in db.Matriculas
                                                                  where m.usuario_estudiante == idUsuario && m.actividad_id_actividad == actividad.id_actividad
                                                                  select m;

                    if (matriculasDeActividad.Any())
                    {
                        ListActividades.Add(actividad);
                    }
                }
            }

            return ListActividades;
        }

        public string GetAsistencia(Actividad actividad)
        {
            if (!actividad.Matriculas.Any())
            {
                return "error";
            }
            else
            {
                ModelDatabase db = new ModelDatabase();

                int idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);
                IQueryable<Matricula> matriculasDeActividad = from m in db.Matriculas
                                                              where m.usuario_estudiante == idUsuario && m.actividad_id_actividad == actividad.id_actividad
                                                              select m;

                if (!matriculasDeActividad.Any())
                {
                    return "error";
                }
                else
                {
                    if (matriculasDeActividad.Take(1).First().asistencia == Matricula.TipoDeAsistencia.Ausente)
                    {
                        return matriculasDeActividad.Take(1).First().asistencia;
                    }
                    else if (matriculasDeActividad.Take(1).First().asistencia == Matricula.TipoDeAsistencia.Presente)
                    {
                        return matriculasDeActividad.Take(1).First().asistencia;
                    }
                    else
                    {
                        return "error";
                    }
                }
            }

        }

        public string GetClassAsistencia(Actividad actividad)
        {
            if (!actividad.Matriculas.Any())
            {
                return "text-danger";
            }
            else
            {
                ModelDatabase db = new ModelDatabase();

                int idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);
                IQueryable<Matricula> matriculasDeActividad = from m in db.Matriculas
                                                              where m.usuario_estudiante == idUsuario && m.actividad_id_actividad == actividad.id_actividad
                                                              select m;

                if (!matriculasDeActividad.Any())
                {
                    return "text-danger";
                }
                else
                {
                    if (matriculasDeActividad.Take(1).First().asistencia == Matricula.TipoDeAsistencia.Ausente)
                    {
                        return "text-warning";
                    }
                    else if (matriculasDeActividad.Take(1).First().asistencia == Matricula.TipoDeAsistencia.Presente)
                    {
                        return "text-success";
                    }
                    else
                    {
                        return "text-danger";
                    }
                }
            }
        }
    }
}