using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasInstructor
{
    public partial class EditarCarta : System.Web.UI.Page
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
            initCarta();
            llenarControles();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            initCarta();
        }

        private void llenarControles()
        {
            txbAsunto.Text = carta.asunto;
            txbContenido.Text = carta.contenido;
            txbUrlImgen.Text = carta.imagen;
            ImagenCarta.ImageUrl = carta.imagen;
        }

        Carta carta;
        /*Si no tiene parametro idActividad se va a home*/
        private void initCarta()
        {
            ModelDatabase db = new ModelDatabase();

            int idC;
            bool b = Int32.TryParse(Request.QueryString["idCarta"], out idC);

            if (!b)
            {
                idC = 02;
            }

            carta = (from c in db.Cartas
                     where c.id_carta == idC
                    select c).Take(1).First();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            UpdateCarta();
        }

        private void UpdateCarta()
        {
            ModelDatabase db = new ModelDatabase();

            int idC;
            bool b = Int32.TryParse(Request.QueryString["idCarta"], out idC);

            if (!b)
            {
                idC = 02;
            }

            Carta cart = (from c in db.Cartas
                          where c.id_carta == idC
                          select c).Take(1).First();

            cart.asunto = txbAsunto.Text;
            cart.contenido = txbContenido.Text;
            cart.imagen = txbUrlImgen.Text;

            db.SaveChanges();

            initCarta();
            llenarControles();
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            initCarta();
            llenarControles();
        }
    }
}