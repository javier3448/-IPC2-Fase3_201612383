<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallesActividad.aspx.cs" Inherits="IPC2Proyecto.PaginasEstudiante.Actividades.DetallesActividad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td>
                <table class="nav-justified">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="FailureText" />
                            </p>
                        </td>
                    </tr>    
                    <tr>
                            <td class="modal-sm" style="width: 206px">
                                <h4>Nombre:</h4>
                            </td>
                            <td>
                                <table style="width:100%;">
                                    <tr>
                                        <td><asp:TextBox ID="TBNombre" runat="server" Width="264px" ReadOnly="True"></asp:TextBox></td>
                                        <td><asp:Literal ID="LiteralIdSalon" runat="server"></asp:Literal></td>
                                    </tr>
                                </table>
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
                                <asp:TextBox ID="TBTipo" runat="server" ReadOnly="True"></asp:TextBox>
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
                                <asp:Calendar ID="CalendarFecha" runat="server" style="margin-left: 2px" Enabled="False"></asp:Calendar>
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
                                        <td>Inicio:<asp:TextBox ID="TBHoraInicio" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>Final:<asp:TextBox ID="TBHoraFinal" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                <h4>
                                    Catedratico:</h4>
                    
                            </td>
                            <td>
                                <asp:TextBox ID="TBCatedratico" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 32px;">
                    
                                <h4>
                                    Salon:</h4>
                    
                            </td>
                            <td style="height: 32px">
                                <asp:TextBox ID="TBSalon" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td style="height: 32px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                <h4>
                                    Curso:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <asp:TextBox ID="TBCurso" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
            
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                            </td>
                            <td style="height: 39px">
                                &nbsp;</td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                &nbsp;</td>
                            <td>
                                <table style="width:100%;">
                                    <tr>
                                        <td style="width: 331px">
                                <asp:Button ID="Save" runat="server" Text="Asignarse" Class="btn btn-primary" OnClick="Save_Click"/>
                                        </td>
                                        <td>
                                            <asp:Button ID="Cancel" runat="server" Text="Cancelar" Class="btn btn-primary" OnClick="Cancel_Click"/>
                                    </td>
                                        <td>
                                            <asp:RadioButton ID="RBTraslapes" runat="server" Text="Traslapes" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>



</asp:Content>
