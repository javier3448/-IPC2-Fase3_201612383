using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using IPC2Proyecto.Models.MyModels;

namespace IPC2Proyecto.Lector
{
    public class EmailSender
    {
        public static void RecupContraseña(Usuario usuario) {

            MailMessage mail = new MailMessage("IPC2servermail@gmail.com", usuario.correo);
            mail.Subject = "RecupContraseña";
            mail.Body = usuario.contrasena;

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "IPC2serveremail@gmail.com",
                Password = "4d3c2b1a"
            };
            smtpClient.EnableSsl = true;
            smtpClient.Send(mail);
        }
    }
}