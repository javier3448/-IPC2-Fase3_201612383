using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasOperador.Prestamos
{
    public partial class EditarPrestamo : System.Web.UI.Page
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

        protected void Page_InitComplete(object sender, EventArgs e)
        {
            initPrestamo();
            llenarControles();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            initPrestamo();
        }

        private void llenarControles()
        {
            txbDescripcion.Text = prestamo.descripcion;

            //Estado
            if (prestamo.estado=="resuelto")
            {
                ListEstado.SelectedIndex = 0;
            }
            else
            {
                ListEstado.SelectedIndex = 1;
            }

            //Fecha
            txbDia.Text = prestamo.fecha.Day.ToString();
            txbMes.Text = prestamo.fecha.Month.ToString();
            txbAno.Text = prestamo.fecha.Year.ToString();

            //Insumo
            txbNombreInsumo.Text = prestamo.Insumo.nombre;

            //Carne
            txbCarneEstudiante.Text = prestamo.Usuario.carne;
        }

        ModelDatabase db;
        Prestamo prestamo;

        private void initPrestamo()
        {
            db = new ModelDatabase();

            int idP;
            bool b = Int32.TryParse(Request.QueryString["idPrestamo"], out idP);

            if (!b)
            {
                Response.Redirect("~/PaginasOperador/Prestamos/Insumos");
            }

            prestamo = (from p in db.Prestamoes
                       where p.id_prestamo==idP
                       select p).Take(1).First();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            UpdatePrestamo();
            Response.Redirect("~/PaginasOperador/Prestamos/EditarInsumo?idInsumo="+prestamo.insumo_id_insumo);
        }

        private void UpdatePrestamo()
        {
            db = new ModelDatabase();

            int idP;
            bool b = Int32.TryParse(Request.QueryString["idPrestamo"], out idP);

            if (!b)
            {
                Response.Redirect("~/PaginasOperador/Prestamos/Insumos");
            }

            prestamo = (from p in db.Prestamoes
                        where p.id_prestamo == idP
                        select p).Take(1).First();

            prestamo.descripcion = txbDescripcion.Text;
            prestamo.estado = ListEstado.SelectedValue;

            int year, month, day;
            bool b0, b1, b2;

            b0 = Int32.TryParse(txbAno.Text, out year);
            b1 = Int32.TryParse(txbMes.Text, out month);
            b2 = Int32.TryParse(txbDia.Text, out day);

            if (!b0 || !b1 || !b2)
            {
                llenarControles();
                LiteralError.Text = "Error en la fecha";
                return;
            }

            prestamo.fecha = new DateTime(year, month, day);

            prestamo.usuario_id_usuario = GetIdUsuario(txbCarneEstudiante.Text);

            if (prestamo.usuario_id_usuario==0)
            {
                LiteralError.Text ="Usuario no valido";
                llenarControles();
                return;
            }

            db.SaveChanges();
        }

        private int GetIdUsuario(string text)
        {
            Usuario usuario = (from u in db.Usuarios
                               where u.carne == text
                               select u).Take(1).First();

            if (usuario == null)
            {
                return 0;
            }

            return usuario.id_usuario;
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            llenarControles();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ListView1.Items.Any())
            {
                LiteralError.Text = "Solo puede existir un incidente por prestamo";
                return;
            }

            Response.Redirect("~/PaginasOperador/Prestamos/NuevoIncidente?idPrestamo=" + prestamo.id_prestamo.ToString());
        }
    }
}