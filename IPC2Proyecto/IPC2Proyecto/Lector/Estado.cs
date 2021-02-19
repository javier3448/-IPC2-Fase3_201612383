using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static IPC2Proyecto.Lector.AnalizadorLexico;

namespace IPC2Proyecto.Lector
{
    public class Estado
    {
        public TipoDeEstado tipoDeEstado
        {
            get; set;
        }

        public TipoDeToken tipoDeToken
        {
            get; set;
        }

        public Estado(TipoDeEstado tipoDeEstado, TipoDeToken tipoDeToken)
        {
            this.tipoDeEstado = tipoDeEstado;
            this.tipoDeToken = tipoDeToken;
        }
    }
}