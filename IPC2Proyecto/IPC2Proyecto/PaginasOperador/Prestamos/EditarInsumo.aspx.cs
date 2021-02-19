using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasOperador.Prestamos
{
    public partial class EditarInsumo : System.Web.UI.Page
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
            initInsumo();
            llenarControles();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            initInsumo();
        }



        private void llenarControles()
        {
            txbNombre.Text = insumo.nombre;
            txbDescripcion.Text = insumo.descripcion;
            txbPrecio.Text = insumo.precio.ToString();
            //Estado
            if (insumo.estado=="excelente")
            {
                DropDownListEstado.SelectedIndex = 0;
            }
            else if (insumo.estado == "bueno")
            {
                DropDownListEstado.SelectedIndex = 1;
            }
            else if (insumo.estado == "regular")
            {
                DropDownListEstado.SelectedIndex = 2;
            }
            else if (insumo.estado == "malo")
            {
                DropDownListEstado.SelectedIndex = 3;
            }
            else {
                DropDownListEstado.SelectedIndex = 5;
            }

            //Disponible
            if (insumo.disponible) {
                RadioButtonSi.Checked = true;
                RadioButtonNo.Checked = false;
            }
            else
            {
                RadioButtonSi.Checked = false;
                RadioButtonNo.Checked = true;
            }
        }

        private Insumo insumo;

        ModelDatabase db;

        private void initInsumo()
        {
            db = new ModelDatabase();

            int idI;
            bool b = Int32.TryParse(Request.QueryString["idInsumo"], out idI);

            if (!b)
            {
                Response.Redirect("~/PaginasOperador/Prestamos/Insumos");
            }

            insumo = (from i in db.Insumoes
                      where i.id_insumo == idI
                      select i).Take(1).First();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            UpdateInsumo();
        }

        private void UpdateInsumo()
        {
            Decimal decimalPrecio;

            bool b = Decimal.TryParse(txbPrecio.Text, out decimalPrecio);

            if (!b) {
                FailureText.Text = "Precio no valido";
                llenarControles();
                return;
            }

            insumo.nombre = txbNombre.Text;
            insumo.descripcion = txbDescripcion.Text;
            insumo.estado = DropDownListEstado.SelectedValue;
            insumo.precio = decimalPrecio;

            if (RadioButtonSi.Checked) {
                insumo.disponible = true;
            }
            else
            {
                insumo.disponible = false;
            }

            db.SaveChanges();

            Response.Redirect("~/PaginasOperador/Prestamos/Insumos");
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            llenarControles();
        }

        protected void RadioButtonDisponible_CheckedChanged(object sender, EventArgs e)
        {
            RadioButtonNo.Checked = false;
        }

        protected void RadioButtonDisponible0_CheckedChanged(object sender, EventArgs e)
        {
            RadioButtonSi.Checked = false;
        }

        protected void btnDetallesCommand(object sender, CommandEventArgs e)
        {
            int idP;
            bool b = Int32.TryParse(e.CommandName, out idP);

            if (!b)
            {
                FailureText.Text = "id_prestamo no valido";
                return;
            }

            Response.Redirect("~/PaginasOperador/Prestamos/EditarPrestamo?idPrestamo="+e.CommandName);
        }

        protected void Agregar_Click(object sender, EventArgs e)
        {
            int idI;
            bool b = Int32.TryParse(Request.QueryString["idInsumo"], out idI);

            if (!b)
            {
                Response.Redirect("~/PaginasOperador/Prestamos/Insumos");
                return;
            }

            Response.Redirect("~/PaginasOperador/Prestamos/NuevoPrestamo?idPrestamo="+idI.ToString());
        }
    }
}