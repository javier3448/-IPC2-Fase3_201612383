using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using IPC2Proyecto.Models.MyModels;
using System.Linq;

namespace IPC2Proyecto
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            /*init cookies*/
            if (Request.Cookies.Get("usuario") == null)
            {
                HttpCookie usCook = new HttpCookie("usuario");
                usCook.Expires = DateTime.Today.AddDays(1); 
                usCook.Values["id_usuario"] = "0";
                usCook.Values["tipo"] = "anonimo";

                Response.Cookies.Add(usCook);

                Response.Redirect("~/");
            }

            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            /*Identidad*/
            if (Request.Cookies.Get("usuario").Values["id_usuario"] == "0" || Request.Cookies.Get("usuario")==null)
            {
                IdentidadMultiView.ActiveViewIndex = 0;
            }
            else {
                IdentidadMultiView.ActiveViewIndex = 1;
            }

            /*Tipo*/
            if (Request.Cookies.Get("usuario").Values["tipo"] == "admin")
            {
                TipoMultiView.ActiveViewIndex = 0;
            }
            else if (Request.Cookies.Get("usuario").Values["tipo"] == "operador")
            {
                TipoMultiView.ActiveViewIndex = 1;
            }
            else if (Request.Cookies.Get("usuario").Values["tipo"] == "instructor")
            {
                TipoMultiView.ActiveViewIndex = 2;
            }
            else if (Request.Cookies.Get("usuario").Values["tipo"] == "estudiante") {
                TipoMultiView.ActiveViewIndex = 3;
            }
            else
            {
                TipoMultiView.ActiveViewIndex = 4;
            }
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        protected void Logout(object sender, EventArgs e)
        {
            Response.Cookies.Get("usuario").Values["id_usuario"] = "0";
            Response.Cookies.Get("usuario").Values["nombre"] = Usuario.TipoDeUsuario.anonimo.ToString();
            Response.Cookies.Get("usuario").Values["tipo"] = Usuario.TipoDeUsuario.anonimo.ToString();

            Response.Redirect("~/");
        }

        public String GetNombre() {
            String s = "Anonimo";
            int idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);

            ModelDatabase db = new ModelDatabase();

            /*SELECT * 
            FROM Usuario
            WHERE id_usuario=@IdUsuario*/
            Usuario us = (from u in db.Usuarios
                          where u.id_usuario == idUsuario
                          select u).SingleOrDefault();

            s = us.nombre;

            return s;
        }

    }

}