using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasInstructor
{
    public partial class NuevaCarta : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e) {
            if (Request.Cookies.Get("usuario").Values["tipo"] != "instructor" || Request.Cookies.Get("usuario").Values["tipo"] == null)
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

        protected void Cancel_Click(object sender, EventArgs e)
        {
            limpiarCampos();
        }

        private void limpiarCampos()
        {
            txbAsunto.Text = "";
            txbContenido.Text = "";
            ImgFile.Attributes.Clear();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int idUsuario = Int32.Parse(Request.Cookies.Get("usuario").Values["id_usuario"]);

            string imgPath = SubirImage();
            if (imgPath=="error")
            {
                FailureText.Text = "Imagen no valida";
            }

            Carta carta = new Carta()
            {
                asunto = txbAsunto.Text,
                contenido = txbContenido.Text,
                imagen = "~/" + imgPath,
                usuario_instructor = idUsuario
            };

            ModelDatabase db = new ModelDatabase();
            db.Cartas.Add(carta);
            db.SaveChanges();

            Response.Redirect("~/PaginasInstructor/MisCartas");
        }

        /**/
        public string SubirImage()
        {
            string imgName = "";
            int imgSize = 0;
            string imgPath = "";

            if (ImgFile.PostedFile != null && ImgFile.FileName != " ")
            {
                imgName = ImgFile.FileName;
                imgPath = "Images/" + imgName;
                imgSize = ImgFile.PostedFile.ContentLength;
                if (imgSize > 10240)
                {
                    return "error";
                }
                else
                {
                    String dir = Server.MapPath(imgPath).Replace("\\PaginasInstructor","");
                    ImgFile.SaveAs(dir);
                    return imgPath;
                }
            }

            return "error";
        }
    }
}