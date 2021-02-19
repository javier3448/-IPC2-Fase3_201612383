using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IPC2Proyecto.Lector;

namespace IPC2Proyecto.Lector
{
    public class AnalizadorLexico
    {
        public enum TipoDeEstado
        {
            Normal, Aceptacion, Final
        }

        public enum TipoDeToken
        {
            boolean, palabra, numero, fecha, coma, invalido
        }

        private Estado s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, sActual;

        //Alfabeto
        String[] l = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                      "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "n", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
                      "á", "é", "í", "ó", "ú", "Á", "É", "Í", "Ó", "Ú", "ü", "Ü"};
        String[] coma = { "," };
        String[] slash = { "/" };
        String[] puntoYComa = { ";" };
        String[] dosPuntos = { ":" };
        String[] punto = { "." };
        String[] n = {"1","2","3","4","5", "6", "7", "8","9", "0" };
        String[] espacio = { " " };

        private void initEstados()
        {
            s0 = new Estado(TipoDeEstado.Normal, TipoDeToken.invalido);
            s1 = new Estado(TipoDeEstado.Aceptacion, TipoDeToken.palabra);
            s2 = new Estado(TipoDeEstado.Aceptacion, TipoDeToken.numero);
            s3 = new Estado(TipoDeEstado.Aceptacion, TipoDeToken.numero);
            s4 = new Estado(TipoDeEstado.Normal, TipoDeToken.invalido);
            s5 = new Estado(TipoDeEstado.Normal, TipoDeToken.invalido);
            s6 = new Estado(TipoDeEstado.Normal, TipoDeToken.invalido);
            s7 = new Estado(TipoDeEstado.Normal, TipoDeToken.invalido);
            s8 = new Estado(TipoDeEstado.Normal, TipoDeToken.invalido);
            s9 = new Estado(TipoDeEstado.Normal, TipoDeToken.invalido);
            s10 = new Estado(TipoDeEstado.Normal, TipoDeToken.invalido);
            s11 = new Estado(TipoDeEstado.Normal, TipoDeToken.invalido);
            s12 = new Estado(TipoDeEstado.Normal, TipoDeToken.invalido);
            s13 = new Estado(TipoDeEstado.Aceptacion, TipoDeToken.invalido);
            s14 = new Estado(TipoDeEstado.Final, TipoDeToken.coma);
        }

        public List<List<Token>> Valores { get; set; }

        private List<String> codigoFuente = new List<String>();

        public AnalizadorLexico(List<String> codigoFuente) {

        }

        int indice = 0;
        int intLinea = 0;
        public Token nextToken() {

            initEstados();
            indice = 0;
            Token token = new Token{
                Lexema = "",
                Tipo = TipoDeToken.invalido
            };

            Boolean b = true;
            Boolean bo = true;/*Se utiliza para que no pase por ningun otro if cuando se cumpla una condicion y cambie el estado*/
            while (b)
            {
                String c;
                if (codigoFuente[intLinea].Length != 0)
                {
                    c = codigoFuente[intLinea][indice].ToString();
                }
                else
                {
                    codigoFuente[intLinea] = " ";
                    c = codigoFuente[intLinea];
                }

                //Como no es estado de aceptacion agrega el caracter siempre
                if (sActual == s0 && bo)
                {
                    if (isAlfabeto(c, l))
                    {
                        sActual = s1;
                    }
                    else if (isAlfabeto(c, n))
                    {
                        sActual = s2;
                    }
                    else if (isAlfabeto(c, coma))
                    {
                        sActual = s14;
                    }
                    else
                    {
                        b = false;
                    }
                    token.Lexema += c;
                    bo = false;
                }
                //Como es estado de aceptacion se agrega el caracter si y solo si se reconoce en el estado
                else if (sActual == s1 && bo)
                {
                    if (isAlfabeto(c, l))
                    {
                        sActual = s1;
                        token.Lexema += c;
                    }
                    else
                    {
                        b = false;
                    }
                    bo = false;
                }
                //Como es estado de aceptacion se agrega el caracter si y solo si se reconoce en el estado
                else if (sActual == s2 && bo)
                {
                    if (isAlfabeto(c, n))
                    {
                        sActual = s2;
                        token.Lexema += c;
                    }
                    else if (isAlfabeto(c, punto))
                    {
                        sActual = s3;
                        token.Lexema += c;
                    }
                    else
                    {
                        b = false;
                    }
                    bo = false;
                }
                //Como es estado de aceptacion se agrega el caracter si y solo si se reconoce en el estado
                else if (sActual == s3 && bo)
                {
                    if (isAlfabeto(c, n))
                    {
                        sActual = s2;
                        token.Lexema += c;
                    }
                    else
                    {
                        b = false;
                    }
                    bo = false;
                }
                //Como no es estado de aceptacion agrega el caracter siempre
                else if (sActual == s4 && bo)
                {
                    if (isAlfabeto(c, n))
                    {
                        sActual = s5;
                    }
                    else
                    {
                        b = false;
                    }
                    token.Lexema += c;
                    bo = false;
                }
                //Como no es estado de aceptacion agrega el caracter siempre
                else if (sActual == s5 && bo)
                {
                    if (isAlfabeto(c, n))
                    {
                        sActual = s5;
                    }
                    if (isAlfabeto(c, slash))
                    {
                        sActual = s6;
                    }
                    else
                    {
                        b = false;
                    }
                    token.Lexema += c;
                    bo = false;
                }
                //Como no es estado de aceptacion agrega el caracter siempre
                else if (sActual == s6 && bo)
                {
                    if (isAlfabeto(c, n))
                    {
                        sActual = s7;
                    }
                    else
                    {
                        b = false;
                    }
                    token.Lexema += c;
                    bo = false;
                }
                //Como no es estado de aceptacion agrega el caracter siempre
                else if (sActual == s7 && bo)
                {
                    if (isAlfabeto(c, n))
                    {
                        sActual = s7;
                    }
                    if (isAlfabeto(c, espacio))
                    {
                        sActual = s8;
                    }
                    else
                    {
                        b = false;
                    }
                    token.Lexema += c;
                    bo = false;
                }
                //Como no es estado de aceptacion agrega el caracter siempre
                else if (sActual == s8 && bo)
                {
                    if (isAlfabeto(c, n))
                    {
                        sActual = s9;
                    }
                    else
                    {
                        b = false;
                    }
                    token.Lexema += c;
                    bo = false;
                }
                //Como no es estado de aceptacion agrega el caracter siempre
                else if (sActual == s9 && bo)
                {
                    if (isAlfabeto(c, n))
                    {
                        sActual = s9;
                    }
                    if (isAlfabeto(c, dosPuntos))
                    {
                        sActual = s10;
                    }
                    else
                    {
                        b = false;
                    }
                    token.Lexema += c;
                    bo = false;
                }
                //Como no es estado de aceptacion agrega el caracter siempre
                else if (sActual == s10 && bo)
                {
                    if (isAlfabeto(c, n))
                    {
                        sActual = s11;
                    }
                    else
                    {
                        b = false;
                    }
                    token.Lexema += c;
                    bo = false;
                }
                //Como no es estado de aceptacion agrega el caracter siempre
                else if (sActual == s11 && bo)
                {
                    if (isAlfabeto(c, n))
                    {
                        sActual = s11;
                    }
                    if (isAlfabeto(c, dosPuntos))
                    {
                        sActual = s12;
                    }
                    else
                    {
                        b = false;
                    }
                    token.Lexema += c;
                    bo = false;
                }
                //Como no es estado de aceptacion agrega el caracter siempre
                else if (sActual == s12 && bo)
                {
                    if (isAlfabeto(c, n))
                    {
                        sActual = s13;
                    }
                    else
                    {
                        b = false;
                    }
                    token.Lexema += c;
                    bo = false;
                }
                //Como es estado de aceptacion agrega el caracter si se reconoce
                else if (sActual == s13 && bo)
                {
                    if (isAlfabeto(c, n))
                    {
                        sActual = s13;
                        token.Lexema += c;
                    }
                    else
                    {
                        b = false;
                    }
                    bo = false;
                }
                else if (sActual==s14)
                {
                    bo = false;
                    b = false;
                }

                indice++;
                bo = true;

                token.Tipo = sActual.tipoDeToken;


                if (codigoFuente[intLinea].Length<=indice) {
                    indice = 0;
                    intLinea++;
                    if (codigoFuente.Count<=intLinea) {


                        b = false;
                        intLinea = 0;
                    }
                }
            }

            return token;
        }

        public Boolean isAlfabeto(String s, String[] alfabeto)
        {
            for (int i = 0; i < alfabeto.Length; i++)
            {
                if (s == alfabeto[i])
                {
                    return true;
                }
            }
            return false;
        }

    }
}