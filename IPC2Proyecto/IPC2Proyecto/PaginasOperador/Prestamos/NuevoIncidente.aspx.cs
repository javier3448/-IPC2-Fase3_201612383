using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasOperador.Prestamos
{
    public partial class NuevoIncidente : System.Web.UI.Page
    {
        ModelDatabase db;
        int idPrestamo;
        int idInsumo;

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
            if (Request.QueryString["idPrestamo"] != null)
            {
                initIdPrestamo();
                initIdInsumo();
                txbIdPrestamo.Text = Request.QueryString["idPrestamo"];
            }
            else
            {
                Response.Redirect("~/PaginasOperador/Prestamos/Insumos");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Decimal d;

            bool b = Decimal.TryParse(txbCosto.Text, out d);

            if (!b)
            {
                LiteralError.Text = "Costo no valido";
                return;
            }

            db = new ModelDatabase();

            Incidente_insumo incidente_Insumo = new Incidente_insumo()
            {
                descripcion = txbDescripcion.Text,
                costo = d,
                estado = ListEstado.SelectedValue,
                activo = true,
                prestamo_id_prestamo = idPrestamo
            };

            db.Incidente_insumo.Add(incidente_Insumo);

            db.SaveChanges();

            Response.Redirect("~/PaginasOperador/Prestamos/EditarPrestamo?idPrestamo=" + idPrestamo);
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PaginasOperador/Prestamos/EditarPrestamo?idPrestamo=" + idPrestamo);
        }

        private void initIdInsumo() {
            db = new ModelDatabase();

            idInsumo = (from p in db.Prestamoes
                        where p.id_prestamo == idPrestamo
                        select p.insumo_id_insumo).Take(1).First();
        }

        private void initIdPrestamo()
        {
            bool b = Int32.TryParse(Request.QueryString["idPrestamo"], out idPrestamo);

            if (!b)
            {
                idPrestamo = 0;
                LiteralError.Text = "Prestamo no encotrado";
            }
        }
    }
}