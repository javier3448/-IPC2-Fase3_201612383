using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IPC2Proyecto.Models.MyModels;

namespace IPC2Proyecto.PaginasUsuario
{
    public partial class GestionarCuenta : System.Web.UI.Page
    {
        private int idUsuario = 0;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.Cookies.Get("usuario").Values["id_usuario"] == "0" || Request.Cookies.Get("usuario").Values["id_usuario"] == null)
            {
                Response.Redirect("~/Login");
            }
            else
            {
                idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);

                ModelDatabase db = new ModelDatabase();
                IQueryable<Usuario> usuarios = db.Usuarios;

                IQueryable<Usuario> us = from u in usuarios
                                         where u.id_usuario == idUsuario
                                         select u;

                foreach (Usuario u in us)
                {
                    txbCarnet.Text = u.carne;
                    txbContraseña.Text = u.contrasena;
                    txbCui.Text = u.cui;
                    txbNombre.Text = u.nombre;
                    txbDireccion.Text = u.direccion;
                    txbTelefono.Text = u.telefono;
                    txbCorreo.Text = u.correo;
                    txbDia.Text = u.fecha_de_nacimiento.Day.ToString();
                    txbMes.Text = u.fecha_de_nacimiento.Month.ToString();
                    txbAno.Text = u.fecha_de_nacimiento.Year.ToString();
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            ModelDatabase db = new ModelDatabase();

            Usuario us = (from u in db.Usuarios
                         where u.id_usuario == idUsuario
                         select u).SingleOrDefault();
            
            us.contrasena = txbContraseña.Text;
            us.cui = txbCui.Text;
            us.nombre = txbNombre.Text;
            us.direccion = txbDireccion.Text;
            us.telefono= txbTelefono.Text;
            us.correo = txbCorreo.Text;
            us.fecha_de_nacimiento = new DateTime(Int32.Parse(txbAno.Text), Int32.Parse(txbMes.Text), Int32.Parse(txbDia.Text));
            

            db.SaveChanges();
            Response.Redirect("~/");
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            ModelDatabase db = new ModelDatabase();
            IQueryable<Usuario> usuarios = db.Usuarios;

            IQueryable<Usuario> us = from u in usuarios
                                     where u.id_usuario == idUsuario
                                     select u;

            foreach (Usuario u in us)
            {
                txbCarnet.Text = u.carne;
                txbContraseña.Text = u.contrasena;
                txbCui.Text = u.cui;
                txbNombre.Text = u.nombre;
                txbTelefono.Text = u.telefono;
                txbCorreo.Text = u.correo;
                txbDia.Text = u.fecha_de_nacimiento.Day.ToString();
                txbMes.Text = u.fecha_de_nacimiento.Month.ToString();
                txbAno.Text = u.fecha_de_nacimiento.Year.ToString();
            }
        }
    }
}