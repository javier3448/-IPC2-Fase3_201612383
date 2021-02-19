<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionarCuenta.aspx.cs" Inherits="IPC2Proyecto.PaginasUsuario.GestionarCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



<table style="width:100%;">
            <tr>
                <td class="modal-sm" style="width: 206px; height: 39px;">
                </td>
                <td style="height: 39px">
                </td>
                <td style="height: 39px"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 206px">
                    <h4>Carnet:</h4>
                </td>
                <td>
                    <asp:TextBox ID="txbCarnet" runat="server" Width="264px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 206px">
                    <h4>
                        Contraseña:</h4>
                </td>
                <td>
                    <asp:TextBox ID="txbContraseña" runat="server" Width="263px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 206px">
                    
                    <h4>
                        CUI:</h4>
                    
                </td>
                <td>
                    <asp:TextBox ID="txbCui" runat="server" Width="263px"></asp:TextBox>
                </td>
                
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                    <h4>
                        Nombre:</h4>
                    
                </td>
                <td style="height: 39px">
                    <asp:TextBox ID="txbNombre" runat="server" Width="263px"></asp:TextBox>
                </td>
                <td style="height: 39px"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 206px">
                    
                    <h4>
                        Direccion:</h4>
                    
                </td>
                <td>
                    <asp:TextBox ID="txbDireccion" runat="server" Width="263px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                    <h4>
                        Telefono:</h4>
                    
                </td>
                <td style="height: 39px">
                    <asp:TextBox ID="txbTelefono" runat="server" Width="263px"></asp:TextBox>
                </td>
                <td style="height: 39px"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 206px">
                    
                    <h4>
                        Correo:</h4>
                    
                </td>
                <td>
                    <asp:TextBox ID="txbCorreo" runat="server" Width="263px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 206px">
                    
                    <h4>
                        Fecha de nacimiento:</h4>
                </td>
                <td>
                    <table style="width:100%;">
                        <tr>
                            <td>
                                Dia:
                                    <asp:TextBox ID="txbDia" runat="server"></asp:TextBox>
                            </td>
                            <td>Mes:
                                <asp:TextBox ID="txbMes" runat="server"></asp:TextBox>
                            </td>
                            <td>Año: <asp:TextBox ID="txbAno" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
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



</asp:Content>
