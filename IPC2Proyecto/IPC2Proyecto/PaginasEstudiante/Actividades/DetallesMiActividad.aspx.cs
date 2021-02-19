using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasEstudiante.Actividades
{
    public partial class EditarActividad : System.Web.UI.Page
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

        protected void Page_InitComplete(object sender, EventArgs e)
        {
            LlenarCampos();
        }

        private void LlenarCampos()
        {
            int idActividad;
            int idUsuario;
            bool bA = Int32.TryParse(Request.QueryString["id_actividad"], out idActividad);
            bool bM = Int32.TryParse(Request.Cookies["usuario"].Values["id_usuario"], out idUsuario);

            if (!bA || !bM)
            {
                Response.Redirect("~/PaginasEstudiante/Actividades/MisActividades");
            }
            else
            {
                ModelDatabase db = new ModelDatabase();

                IQueryable<Matricula> matriculas = from m in db.Matriculas
                                                   where m.usuario_estudiante == idUsuario &&
                                                   m.actividad_id_actividad == idActividad
                                                   select m;
                if (!matriculas.Any())
                {
                    FailureText.Text = "El usuario loggeado no esta matriculado en esa actividad";
                    return;
                }

                Matricula matricula = matriculas.Take(1).First();

                LiteralNombreActividad.Text = matricula.Actividad.nombre;
                LiteralAsistencia.Text = matricula.asistencia;

                /*Enables o disables los controles dependiendo del estado de la asistencia*/
                if (matricula.asistencia == Matricula.TipoDeAsistencia.Ausente)
                {
                    DescargarPresentacion.Enabled = false;
                    DescargarPresentacion.ToolTip = "Tiene que tomar asistencia para poder descargar la presentacion";
                    DescargarCuestionario.Enabled = false;
                    DescargarCuestionario.ToolTip = "Tiene que tomar asistencia para poder descargar la presentacion";
                    FileUploadRespuesta.Enabled = false;
                    FileUploadRespuesta.ToolTip = "Tiene que tomar asistencia para poder descargar la presentacion";
                }

                if (DateTime.Compare(DateTime.Now, matricula.Actividad.fecha_final.AddDays(1))>=0)
                {
                    TBCodigo.Enabled = false;
                    TBCodigo.ToolTip = "Ya no puede tomar asistencia";
                    TomarAsistencia.Enabled = false;
                    TomarAsistencia.ToolTip = "Ya no puede tomar asistencia";
                    CancelarMatriculacion.Enabled = false;
                    CancelarMatriculacion.ToolTip = "Ya no puede tomar asistencia";
                }

                TBRespuesta.Text = matricula.respuestas_cuestionario;
            }
        }
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CancelarMatriculacion_Click(object sender, EventArgs e)
        {
            ModelDatabase db = new ModelDatabase();

            int idActividad;
            int idUsuario;
            bool bA = Int32.TryParse(Request.QueryString["id_actividad"], out idActividad);
            bool bM = Int32.TryParse(Request.Cookies["usuario"].Values["id_usuario"], out idUsuario);

            Matricula matriculaAEliminar = (from m in db.Matriculas
                                           where m.usuario_estudiante == idUsuario &&
                                           m.actividad_id_actividad == idActividad
                                           select m).Take(1).First();

            if (matriculaAEliminar.asistencia == Matricula.TipoDeAsistencia.Presente)
            {
                FailureText.Text = "No puede eliminar una matricula si ya tomo asistencia";
            }

            Actividad actividad = (from a in db.Actividads
                                   where a.id_actividad == idActividad
                                   select a).Take(1).First();

            if (actividad.fecha_final.AddHours(1)>DateTime.Now.AddHours(1))
            {
                FailureText.Text = "No puede eliminar una matricula si la actividad ya se realizo";
            }

            db.Matriculas.Remove(matriculaAEliminar);

            db.SaveChanges();

            Response.Redirect("~/PaginasEstudiante/Actividades/MisActividades");
        }

        protected void TomarAsistencia_Click(object sender, EventArgs e)
        {
            ModelDatabase db = new ModelDatabase();

            int idActividad;
            int idUsuario;
            bool bA = Int32.TryParse(Request.QueryString["id_actividad"], out idActividad);
            bool bM = Int32.TryParse(Request.Cookies["usuario"].Values["id_usuario"], out idUsuario);

            Actividad actividad = (from a in db.Actividads
                                   where a.id_actividad == idActividad
                                   select a).Take(1).First();

            /*Revisar si es la fecha correcta*/
            if (DateTime.Now<actividad.fecha_incio.AddHours(-1)||DateTime.Now> actividad.fecha_final.AddHours(1))
            {
                FailureText.Text = "Tiene que tomar asistencia una hora antes o despues de la actividad";
                return;
            }

            if (actividad.codigo_qr == TBCodigo.Text)
            {
                Matricula matricula = (from m in db.Matriculas
                                       where m.usuario_estudiante == idUsuario &&
                                       m.actividad_id_actividad == idActividad
                                       select m).Take(1).First();

                matricula.asistencia = Matricula.TipoDeAsistencia.Presente.ToString();

                db.SaveChanges();

                DescargarPresentacion.Enabled = true;
                DescargarCuestionario.Enabled = true;
                FileUploadRespuesta.Enabled = true;

                TBCodigo.ReadOnly = true;
                TomarAsistencia.Enabled = false;

                FailureText.Text = "Se ha tomado la asistencia";
                LiteralAsistencia.Text = "presente";
            }
            else
            {
                FailureText.Text = "Codigo incorrecto";
            }
        }

        protected void BTNSubirPresentacion_Click(object sender, EventArgs e)
        {
            UploadRespuesta();
        }

        private bool UploadRespuesta()
        {
            if (FileUploadRespuesta.PostedFile != null && FileUploadRespuesta.FileName != " ")
            {
                ModelDatabase db = new ModelDatabase();

                IQueryable<String> RespuestasConMismoNombre = from m in db.Matriculas
                                                              where m.respuestas_cuestionario == FileUploadRespuesta.FileName
                                                              select m.respuestas_cuestionario;

                if (RespuestasConMismoNombre.Any())
                {
                    FailureText.Text = "Ya existe un archivo con el nombre " + RespuestasConMismoNombre.Take(1).First();
                    return false;
                }

                FileUploadRespuesta.SaveAs(Server.MapPath("~/Respuestas/") + FileUploadRespuesta.FileName);
                LiteralRespuesta.Text = "Respuesta subida";
                TBRespuesta.Text = FileUploadRespuesta.FileName;

                int idActividad = Int32.Parse(Request.QueryString["id_actividad"]);
                int idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);

                Matricula matricula = (from m in db.Matriculas
                                       where m.usuario_estudiante == idUsuario &&
                                       m.actividad_id_actividad == idActividad
                                       select m).Take(1).First();

                matricula.respuestas_cuestionario = FileUploadRespuesta.FileName;

                db.SaveChanges();

                return true;
            }
            {
                LiteralRespuesta.Text = "Seleccione el cuestionario primero";
                return false;
            }
        }

        protected void DescargarPresentacion_Click(object sender, EventArgs e)
        {
            DownloadPresentacion();
        }

        private void DownloadPresentacion()
        {
            ModelDatabase db = new ModelDatabase();

            int idActividad = Int32.Parse(Request.QueryString["id_actividad"]);

            Actividad actividad = (from a in db.Actividads
                                   where a.id_actividad == idActividad
                                   select a).Take(1).First();

            try
            {
                Response.Clear();
                Response.ContentType = "appliaction/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + actividad.cuestionario);
                Response.TransmitFile(Server.MapPath("~/Presentacion/") + actividad.cuestionario);
                Response.End();
            }
            catch (Exception e)
            {
                FailureText.Text = "Fallo la descarga + /n" +
                                    e.Message;
            }
        }

        protected void DescargarCuestionario_Click(object sender, EventArgs e)
        {
            DownloadCuestionario();
        }

        private void DownloadCuestionario()
        {
            ModelDatabase db = new ModelDatabase();

            int idActividad = Int32.Parse(Request.QueryString["id_actividad"]);

            Actividad actividad = (from a in db.Actividads
                                   where a.id_actividad == idActividad
                                   select a).Take(1).First();

            try
            {
                Response.Clear();
                Response.ContentType = "appliaction/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + actividad.cuestionario);
                Response.TransmitFile(Server.MapPath("~/Cuestionario/") + actividad.cuestionario);
                Response.End();
            }
            catch (Exception e)
            {
                FailureText.Text = "Fallo la descarga + /n" +
                                    e.Message;
            }
        }
    }
}