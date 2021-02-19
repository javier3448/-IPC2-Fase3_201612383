<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevoIncidente.aspx.cs" Inherits="IPC2Proyecto.PaginasOperador.Prestamos.NuevoIncidente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<table class="nav-justified">
        <tr>
                                    <td class="modal-sm" style="width: 206px">
                                        &nbsp;
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="modal-sm" style="width: 206px">
                                        <h4>Descripcion:</h4>
                                    </td>
                                    <td>
                                        <table style="width:100%;">
                                            <tr>
                                                <td style="height: 30px"><asp:TextBox ID="txbDescripcion" runat="server" Width="264px" Height="44px" TextMode="MultiLine"></asp:TextBox></td>
                                                <td style="height: 30px">
                                                    <p class="text-danger">
                                                        <asp:Literal ID="LiteralError" runat="server"></asp:Literal>
                                                    </p>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                        <h4>
                                            Estado:</h4>
                    
                                    </td>
                                    <td style="height: 39px">
                                        <asp:DropDownList ID="ListEstado" runat="server">
                                            <asp:ListItem>pendiente</asp:ListItem>
                                            <asp:ListItem>resuelto</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="height: 39px"></td>
                                </tr>
                                <tr>
                                    <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                        <h4>
                                            Costo:</h4>
                    
                                    </td>
                                    <td style="height: 39px">
                                        <asp:TextBox ID="txbCosto" runat="server" Width="125px"></asp:TextBox>
                                    </td>
                
                                    <td style="height: 39px"></td>
                                </tr>
                                <tr>
                                    <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                        <h4>
                                            idPrestamo:</h4>
                    
                                    </td>
                                    <td style="height: 39px">
                                        <asp:TextBox ID="txbIdPrestamo" runat="server" Width="125px" ReadOnly="True"></asp:TextBox>
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
</asp:Content>
