using IPC2Proyecto.Models.MyModels;
using IPC2Proyecto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasInstructor
{
    public partial class EditarActividad : System.Web.UI.Page
    {
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

        protected void Page_InitComplete(object sender, EventArgs e)
        {
            initActividad();
            llenarControles();
        }

        Actividad actividad;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*Si no tiene parametro idActividad se va home*/
            initActividad();
        }

        private void llenarControles()
        {

            if (actividad == null)
            {
                return;
            }

            LiteralIdSalon.Text = "idActividad: " + actividad.id_actividad.ToString();
            txbNombre.Text = actividad.nombre;
            txbTipo.Text = actividad.tipo;
            DateTime inicioActividad = actividad.fecha_incio;
            DateTime finActividad = actividad.fecha_final;
            txbAnoInicio.Text = inicioActividad.Year.ToString();
            txbMesInicio.Text = inicioActividad.Month.ToString();
            txbDiaInicio.Text = inicioActividad.Day.ToString();
            txbHoraInicio.Text = inicioActividad.Hour.ToString();

            txbAnoFinal.Text = finActividad.Year.ToString();
            txbMesFinal.Text = finActividad.Month.ToString();
            txbDiaFinal.Text = finActividad.Day.ToString();
            txbHoraFinal.Text = finActividad.Hour.ToString();

            txbIdCarta.Text = actividad.carta_id_carta.ToString();
            ImagenCarta.ImageUrl = getImageCarta(actividad.carta_id_carta);
            txbSalonId.Text = actividad.salon_id_salon.ToString();
            txbCurso.Text = actividad.curso_id_curso.ToString();
            txbPresentacion.Text = actividad.presentacion;
            txbCuestionario.Text = actividad.cuestionario;
            txbCodigo.Text = actividad.codigo_qr;
        }

        private string getImageCarta(int carta_id_carta)
        {
            ModelDatabase db = new ModelDatabase();

            /*SELECT imagen 
            FROM Carta
            WHERE id_carta=@IdCarta*/
            String imgURL = (from c in db.Cartas
                            where c.id_carta == carta_id_carta
                            select c.imagen).SingleOrDefault();

            return imgURL;
        }

        private void initActividad()
        {
            ModelDatabase db = new ModelDatabase();

            int idS;
            bool b = Int32.TryParse(Request.QueryString["idActividad"], out idS);

            if (!b)
            {
                idS = 02;
            }

            /*SELECT * 
            FROM Actividad
            WHERE id_actividad=@IdActividad*/
            actividad = (from a in db.Actividads
                         where a.id_actividad == idS
                         select a).Take(1).First();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            UpdateActividad();
        }

        protected void UpdateActividad()
        {
            ModelDatabase db = new ModelDatabase();

            int idS;
            bool b = Int32.TryParse(Request.QueryString["idActividad"], out idS);

            if (!b)
            {
                idS = 02;
            }

            /*SELECT * 
            FROM Actividad
            WHERE id_actividad=@IdActividad*/
            Actividad activida = (from a in db.Actividads
                                  where a.id_actividad == idS
                                  select a).Take(1).First();

            activida.cuestionario = txbCuestionario.Text;
            activida.presentacion = txbPresentacion.Text;

            db.SaveChanges();

            initActividad();
            llenarControles();
        }

        private bool UploadCuestionario()
        {
            if (FileUploadCuestionario.PostedFile!=null && FileUploadCuestionario.FileName != " ")
            {
                ModelDatabase db = new ModelDatabase();

                IQueryable<String> CuestionariosConMismoNombre = from a in db.Actividads
                                                                 where a.cuestionario == FileUploadCuestionario.FileName
                                                                 select a.cuestionario;

                if (CuestionariosConMismoNombre.Any())
                {
                    FailureText.Text = "Ya existe un archivo con el nombre " + CuestionariosConMismoNombre.Take(1).First();
                    return false;
                }

                FileUploadCuestionario.SaveAs(Server.MapPath("~/Cuestionarios/")+FileUploadCuestionario.FileName);
                LiteralCuestionario.Text = "Cuestionario subido";
                txbCuestionario.Text = FileUploadCuestionario.FileName;
                return true;
            }
            else
            {
                LiteralCuestionario.Text = "Seleccione el cuestionario primero";
                return false;
            }
        }

        private bool UploadPresentacion()
        {
            if (FileUploadCuestionario.PostedFile != null && FileUploadPresentacion.FileName != " " )
            {
                ModelDatabase db = new ModelDatabase();

                IQueryable<String> PresentacionesConMismoNombre = from a in db.Actividads
                                                                 where a.presentacion == FileUploadPresentacion.FileName
                                                                 select a.presentacion;

                if (PresentacionesConMismoNombre.Any())
                {
                    FailureText.Text = "Ya existe un archivo con el nombre " + PresentacionesConMismoNombre.Take(1).First();
                    return false;
                }

                FileUploadPresentacion.SaveAs(Server.MapPath("~/Presentaciones/") + FileUploadPresentacion.FileName);
                LiteralPresentacion.Text = "Presentacion subida";
                txbPresentacion.Text = FileUploadPresentacion.FileName;
                return true;
            }
            else
            {
                LiteralPresentacion.Text = "Seleccione la presentacion primero";
                return false;
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            initActividad();
            llenarControles();
        }

        protected void BTNSubirPresentacion_Click(object sender, EventArgs e)
        {
            UploadPresentacion();
        }

        protected void BTNSubirCuestionario_Click(object sender, EventArgs e)
        {
            UploadCuestionario();
        }

        protected void BTNDescargarPresentacion_Click(object sender, EventArgs e)
        {
            DownloadPresentacion();
        }

        private void DownloadPresentacion()
        {
            try
            {
                Response.Clear();
                Response.ContentType = "appliaction/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + actividad.cuestionario);
                Response.TransmitFile(Server.MapPath("~/Cuestionarios/") + actividad.cuestionario);
                Response.End();
            }
            catch (Exception e)
            {
                FailureText.Text = "Fallo la descarga + /n" +
                                    e.Message;
            }
        }

        protected void BTNDescargarCuestionario_Click(object sender, EventArgs e)
        {
            DownloadCuestionario();
        }

        private void DownloadCuestionario()
        {
            try
            {
                Response.Clear();
                Response.ContentType = "appliaction/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + actividad.cuestionario);
                Response.TransmitFile(Server.MapPath("~/Cuestionarios/")+actividad.cuestionario);
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