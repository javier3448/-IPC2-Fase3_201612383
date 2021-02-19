<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevaActividad.aspx.cs" Inherits="IPC2Proyecto.PaginasOperador.NuevaActividad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width:100%;">
            <tr>
                <td>
                    <div class="jumbotron">
                        <h2>Crear Actividad</h2>
                        <h4>Reservar un salon para una actividad.</h4>
                    </div>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <p class="text-danger">
                        <asp:Literal runat="server" ID="FailureText" />
                    </p>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <table class="nav-justified">
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                                <h4>Nombre:</h4>
                            </td>
                            <td>
                                <asp:TextBox ID="txbNombre" runat="server" Width="264px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                <h4>
                                    Tipo:</h4>
                    
                            </td>
                            <td>
                                <asp:DropDownList ID="ListTipo" runat="server">
                                    <asp:ListItem>lab</asp:ListItem>
                                    <asp:ListItem>curso</asp:ListItem>
                                    <asp:ListItem>taller</asp:ListItem>
                                    <asp:ListItem>mantenimiento</asp:ListItem>
                                    <asp:ListItem>feriado</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                <h4>
                                    Fecha:</h4>
                    
                            </td>
                            <td>
                                <asp:TextBox ID="TBFecha" runat="server" ReadOnly="True" Width="264px"></asp:TextBox>
                                <asp:Calendar ID="CalendarFecha" runat="server" OnSelectionChanged="CalendarFecha_SelectionChanged" style="margin-left: 2px"></asp:Calendar>
                            </td>
                
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                <h4>
                                    Hora:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <table style="width:100%;">
                                    <tr>
                                        <td>Inicio:<asp:TextBox ID="TBHoraInicio" runat="server"></asp:TextBox>
                                        </td>
                                        <td>Final:<asp:TextBox ID="TBHoraFinal" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                <h4>
                                    Carta:</h4>
                    
                            </td>
                            <td>
                                <asp:MultiView ID="MultiViewCarta" runat="server" ActiveViewIndex="2">
                                    <asp:View ID="View1" runat="server">
                                        id:
                                        <asp:TextBox ID="txbIdCarta" runat="server" Width="70px"></asp:TextBox>
                                    </asp:View>
                                    <asp:View ID="View2" runat="server">
                                        <table style="width:100%;">
                                            <tr>
                                                <td>Asunto: <asp:TextBox ID="txbAsunto" runat="server"></asp:TextBox>
                                                </td>
                                                <td>Contenido: <asp:TextBox ID="txbContenido" runat="server"></asp:TextBox>
                                                </td>
                                                <td>Imagen: <asp:TextBox ID="txbImagen" runat="server"></asp:TextBox>
                                                </td>
                                                <td>Instructor: <asp:TextBox ID="txbCarne" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                    <asp:View ID="View3" runat="server">
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
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                <h4>
                                    Salon:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <asp:DropDownList ID="DDLSalon" runat="server" DataSourceID="SqlDataSourceSalons" DataTextField="nombre" DataValueField="id_salon">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceSalons" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" SelectCommand="SELECT id_salon, nombre FROM Salon"></asp:SqlDataSource>
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                <h4>
                                    Curso:</h4>
                    
                            </td>
                            <td>
                                <asp:DropDownList ID="DDLCurso" runat="server" DataSourceID="SqlDataSourceCurso" DataTextField="nombre" DataValueField="id_curso">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceCurso" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" SelectCommand="SELECT id_curso, nombre FROM Curso"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
            
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                            </td>
                            <td style="height: 39px">
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                &nbsp;</td>
                            <td>
                                <table style="width:100%;">
                                    <tr>
                                        <td style="width: 331px">
                                <asp:Button ID="Save" runat="server" Text="Guardar" Class="btn btn-primary" OnClick="Save_Click"/>
                                        </td>
                                        <td>
                                <asp:Button ID="Cancel" runat="server" Text="Cancelar" Class="btn btn-primary" OnClick="Cancel_Click"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

</asp:Content>
