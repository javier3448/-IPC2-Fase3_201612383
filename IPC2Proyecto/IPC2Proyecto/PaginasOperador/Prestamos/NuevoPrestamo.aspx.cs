using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasOperador.Prestamos
{
    public partial class NuevoPrestamo : System.Web.UI.Page
    {
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

        protected void Page_InitComplete(object sender, EventArgs e)
        {
            if (Request.QueryString["idInsumo"]!=null)
            {
                txbIdInsumo.Text = Request.QueryString["idInsumo"];
            }
            else
            {
                Response.Redirect("~/PaginasOperador/Prestamos/Insumos");
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int idUsuario = getIdUsuario(txbCarneEstudiante.Text);

            if (idUsuario==0)
            {
                LiteralError.Text = "carne no valido";
                return;
            }

            int year, month, day;
            bool b0, b1, b2;

            b0 = Int32.TryParse(txbAno.Text, out year);
            b1 = Int32.TryParse(txbMes.Text, out month);
            b2 = Int32.TryParse(txbDia.Text, out day);

            if (!b0 || !b1 || !b2)
            {
                LiteralError.Text = "Error en la fecha";
                return;
            }

            int idInsumo;
            bool b3 = Int32.TryParse(txbIdInsumo.Text, out idInsumo);

            if (!b3)
            {
                LiteralError.Text = "Insumo no valido";
                return;
            }

            ModelDatabase db = new ModelDatabase();

            Prestamo prestamo = new Prestamo()
            {
                descripcion = txbDescripcion.Text,
                fecha = new DateTime(year, month, day),
                estado = ListEstado.SelectedValue,
                insumo_id_insumo = idInsumo,
                usuario_id_usuario = idUsuario
            };

            db.Prestamoes.Add(prestamo);

            if (ListEstado.SelectedIndex==0)
            {
                int idI = Int32.Parse(Request.QueryString["idInsumo"]);

                Insumo insumo = (from i in db.Insumoes
                                 where i.id_insumo == idI
                                 select i).Take(1).First();

                insumo.disponible = false;
            }

            db.SaveChanges();

            Response.Redirect("~/PaginasOperador/Prestamos/EditarInsumo?idInsumo=" + Request.QueryString["idInsumo"]);
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PaginasOperador/Prestamos/EditarInsumo?idInsumo="+Request.QueryString["idInsumo"]);
        }
        
        private int getIdUsuario(string carne)
        {
            ModelDatabase db = new ModelDatabase();

            Usuario usuario = (from u in db.Usuarios
                               where u.carne == carne
                               select u).Take(1).First();

            if (usuario == null)
            {
                return 0;
            }

            return usuario.id_usuario;
        }
    }
}