using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IPC2Proyecto.Models.MyModels;

namespace IPC2Proyecto
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (RevisarCampos()) {
                ModelDatabase db = new ModelDatabase();

                db.Usuarios.Add(new Usuario
                {
                    carne = txbCarnet.Text,
                    contrasena = txbContraseña.Text,
                    cui = txbCui.Text,
                    nombre = txbNombre.Text,
                    direccion = txbDireccion.Text,
                    telefono = txbTelefono.Text,
                    correo = txbCorreo.Text,
                    fecha_de_nacimiento = new DateTime(Int32.Parse(txbAno.Text), Int32.Parse(txbMes.Text), Int32.Parse(txbDia.Text)),
                    tipo = ListTipo.Text
                });

                db.SaveChanges();

                Usuario usuario = (from u in db.Usuarios
                                   where u.carne == txbCarnet.Text
                                   select u).SingleOrDefault();

                initCookiesDeUsuario(usuario);

                Response.Redirect("~/");
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }

        private void initCookiesDeUsuario(Usuario u)
        {
            Response.Cookies.Get("usuario").Values["id_usuario"] = u.id_usuario.ToString();
            Response.Cookies.Get("usuario").Values["tipo"] = u.tipo;
        }

        private Boolean RevisarCampos() {
            Boolean b = true;

            if (!isCarnetUnique(txbCarnet.Text))
            {
                txbCarnet.Text = "";
                FailureTextCarnet.Text = "Carnet ya existente";
                b = false;
            }
            else if (txbCarnet.Text == "")
            {
                FailureTextCarnet.Text = "Campo obligatorio";
                b = false;
            }
            else
            {
                FailureTextCarnet.Text = "";
            }
            //
            if (!isCuiUnique(txbCui.Text))
            {
                txbCui.Text = "";
                FailureTextCui.Text = "cui ya existente";
                b = false;
            }
            else if (txbCui.Text == "")
            {
                FailureTextCui.Text = "Campo obligatorio";
                b = false;
            }
            else
            {
                FailureTextCui.Text = "";
            }
            //
            if (txbContraseña.Text == "")
            {
                FailureTextContraseña.Text = "Campo obligatorio";
                b = false;
            }
            else {
                FailureTextContraseña.Text = "";
            }

            //
            if (txbNombre.Text == "")
            {
                FailureTextNombre.Text = "Campo obligatorio";
                b = false;
            }
            else
            {
                FailureTextNombre.Text = "";
            }

            //
            if (txbCorreo.Text == "")
            {
                FailureTextCorreo.Text = "Campo obligatorio";
                b = false;
            }
            else
            {
                FailureTextCorreo.Text = "";
            }

            //
            if (txbContraseña.Text == "")
            {
                FailureTextFecha.Text = "Campo obligatorio";
                b = false;
            }
            else
            {
                try
                {
                    DateTime dateTime = new DateTime(Int32.Parse(txbAno.Text), Int32.Parse(txbMes.Text), Int32.Parse(txbDia.Text));
                }
                catch (Exception)
                {
                    FailureTextFecha.Text = "Fecha no valida";
                }
                FailureTextFecha.Text = "";
            }

            return b;
        }

        private bool isCarnetUnique(string text)
        {
            ModelDatabase db = new ModelDatabase();

            IQueryable<String> carnets = from s in db.Usuarios
                                         select s.carne;

            foreach (String c in carnets)
            {
                if (c==text)
                {
                    return false;
                }
            }

            return true;
        }

        private bool isCuiUnique(string text)
        {
            ModelDatabase db = new ModelDatabase();

            IQueryable<String> cuis = from s in db.Usuarios
                                         select s.cui;

            foreach (String c in cuis)
            {
                if (c == text)
                {
                    return false;
                }
            }

            return true;
        }
    }
}