<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="NuevoCurso.aspx.cs" Inherits="IPC2Proyecto.PaginasOperador.NuevoCurso" EnableViewState="True" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <div class="jumbotron">
                    <h2>Crear Curso</h2>
                    <h4>Reservar un salon para multiples actividades de un curso</h4>
                </div>
                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <table class="nav-justified">
                    <tr>
                        <td style="height: 43px">
                            <h4>Nombre</h4>
                        </td>
                        <td style="height: 43px">
                            <asp:TextBox ID="TBNombre" runat="server" Width="264px"></asp:TextBox>

                        </td>
                        <td style="height: 43px"></td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top">
                            <h4>&nbsp;</h4>
                            <h4>Inicio: </h4>
                        </td>
                        <td>
                                <br />
                                <asp:TextBox ID="TBDateInicial" runat="server" Width="264px" ReadOnly="True" ></asp:TextBox>
                            <asp:Calendar ID="CalendarInicial" runat="server" OnSelectionChanged="CalendarInicial_SelectionChanged" style="margin-left: 2px"></asp:Calendar>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top">
                            <h4>&nbsp;</h4>
                            <h4>&nbsp;Fin: </h4>
                        </td>
                        <td>
                                <br />
                                <asp:TextBox ID="TBDateFinal" runat="server" Width="264px" ReadOnly="True"></asp:TextBox>
                            <asp:Calendar ID="CalendarFinal" runat="server" OnSelectionChanged="CalendarFinal_SelectionChanged"></asp:Calendar>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <h4>Ciclo:</h4>
                        </td>
                            <td>
                                <asp:DropDownList ID="DDLCiclo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLCiclo_SelectedIndexChanged">
                                    <asp:ListItem>semanal</asp:ListItem>
                                    <asp:ListItem>mensual</asp:ListItem>
                                    <asp:ListItem>anual</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="height: 43px">
                            <h4>Carta:</h4>
                        </td>
                        <td style="height: 43px">
                            <asp:MultiView ID="MultiViewCarta" runat="server" ActiveViewIndex="2">
                                    <asp:View ID="View4" runat="server">
                                        id:
                                        <asp:TextBox ID="TBIdCarta" runat="server" Width="70px"></asp:TextBox>
                                    </asp:View>
                                    <asp:View ID="View5" runat="server">
                                        <table style="width:100%;">
                                            <tr>
                                                <td>Asunto: <asp:TextBox ID="TBAsunto" runat="server"></asp:TextBox>
                                                </td>
                                                <td>Contenido: <asp:TextBox ID="TBContenido" runat="server"></asp:TextBox>
                                                </td>
                                                <td>Imagen: <asp:TextBox ID="TBImagen" runat="server"></asp:TextBox>
                                                </td>
                                                <td>Instructor: <asp:TextBox ID="TBCarne" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                    <asp:View ID="View6" runat="server">
                                        <table style="width:100%;">
                                            <tr>
                                                <td style="width: 141px">
                                                    <asp:Button ID="idCarta" runat="server" Text="Id" Class="btn btn-secondary" Width="75px" OnClick="idCarta_Click"/>
                                                </td>
                                                <td>
                                                    <asp:Button ID="nuevaCarta" runat="server" Text="Nueva" Class="btn btn-secondary" OnClick="nuevaCarta_Click"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                </asp:MultiView>
                        </td>
                    </tr>
                     <tr>
                        <td style="height: 43px">
                        </td>
                        <td style="height: 43px">

                            <br />
                            <asp:Button ID="Aceptar" runat="server" Text="Aceptar" Class="btn btn-primary" OnClick="Aceptar_Click"/>
                            <br />

                        </td>
                        <td style="height: 43px"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
        </tr>
        <tr>
                        <td style="vertical-align:top;">
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width:100%;">
                                            <tr>
                                                <td>
                                                    <h4>Nombre:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TBNombreActividad" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                                            <asp:View ID="View1" runat="server">
                                                <table class="nav-justified" style="text-align:center;" border="1">
                                                    <tr>
                                                        <td style="height: 21px">Lunes</td>
                                                        <td style="height: 21px">Martes</td>
                                                        <td style="height: 21px">Miercoles</td>
                                                        <td style="height: 21px">Jueves</td>
                                                        <td style="height: 21px">Viernes</td>
                                                        <td style="height: 21px">Sabado</td>
                                                        <td style="height: 21px">Domingo</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 20px">
                                                            <asp:RadioButton ID="RBLunes" runat="server" AutoPostBack="True" OnCheckedChanged="RBLunes_CheckedChanged" />
                                                        </td>
                                                        <td style="height: 20px">
                                                            <asp:RadioButton ID="RBMartes" runat="server" AutoPostBack="True" OnCheckedChanged="RBMartes_CheckedChanged" />
                                                        </td>
                                                        <td style="height: 20px">
                                                            <asp:RadioButton ID="RBMiercoles" runat="server" AutoPostBack="True" OnCheckedChanged="RBMiercoles_CheckedChanged" />
                                                        </td>
                                                        <td style="height: 20px">
                                                            <asp:RadioButton ID="RBJueves" runat="server" AutoPostBack="True" OnCheckedChanged="RBJueves_CheckedChanged" />
                                                        </td>
                                                        <td style="height: 20px">
                                                            <asp:RadioButton ID="RBViernes" runat="server" AutoPostBack="True" OnCheckedChanged="RBViernes_CheckedChanged" />
                                                        </td>
                                                        <td style="height: 20px">
                                                            <asp:RadioButton ID="RBSabado" runat="server" AutoPostBack="True" OnCheckedChanged="RBSabado_CheckedChanged" />
                                                        </td>
                                                        <td style="height: 20px">
                                                            <asp:RadioButton ID="RBDomingo" runat="server" AutoPostBack="True" OnCheckedChanged="RBDomingo_CheckedChanged" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:View>
                                            <asp:View ID="View2" runat="server">
                                                <table style="width:100%;">
                                                    <tr>
                                                        <td>
                                                            <h4>Dia:</h4>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TBDia" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:View>
                                            <asp:View ID="View3" runat="server">
                                                <br />
                                                <asp:TextBox ID="TBDateActividad" runat="server" Width="264px" ReadOnly="True"></asp:TextBox>
                                                <asp:Calendar ID="CalendarActividad" runat="server" OnSelectionChanged="CalendarActividad_SelectionChanged"></asp:Calendar>
                                            </asp:View>
                                        </asp:MultiView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        
                                        <table style="width:100%;">
                                            <tr>
                                                <td style="height: 39px">
                                                    <h4>Hora inicio:</h4>
                                                </td>
                                                <td style="height: 39px">
                                                    <asp:TextBox ID="TBHoraInicio" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 20px">
                                                    <h4>Hora final:</h4>
                                                </td>
                                                <td style="height: 20px">
                                                    <asp:TextBox ID="TBHoraFinal" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 45px">
                                                    <h4>Salon:</h4>
                                                </td>
                                                <td style="height: 45px">
                                <asp:DropDownList ID="DDLSalon" runat="server" DataSourceID="SqlDataSourceSalones" DataTextField="nombre" DataValueField="id_salon">
                                </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSourceSalones" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" SelectCommand="SELECT id_salon, nombre FROM Salon WHERE (activo = 1) AND (estado &lt;&gt; 'inhabilitado')"></asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 45px">
                                                    
                                                </td>
                                                <td style="height: 45px">
                                
                            
                                                    <table style="width:100%;">
                                                        <tr>
                                                            <td style="height: 36px">
                                                                <asp:Button ID="GenerarActividades" runat="server" Text="Generar actividades" Class="btn btn-primary" OnClick="GenerarActividades_Click"/>
                                                            </td>
                                                            <td style="height: 36px">
                            <asp:Button ID="CancelarActividades" runat="server" Text="Cancelar" Class="btn btn-primary" OnClick="CancelarActividades_Click"/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                
                                                </td>
                                            </tr>
                                        </table>
                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="vertical-align:top; text-align:center; width: 115px;">
                            <br />
                            <asp:Button ID="Agregar" runat="server" Text="Agregar" Class="btn btn-primary" OnClick="Agregar_Click"/>
                        </td>
                        <td>
                                <asp:Panel ID="Panel1" runat="server" Height="400px" ScrollBars="Both" Width="325px">
                                    
                                    <asp:Table ID="Table1" runat="server" BorderColor="Black" BorderStyle="Solid" CssClass="table-condensed">
                                    </asp:Table>
                                    
                                </asp:Panel>
                        </td>
                    </tr>
    </table>

</asp:Content>
