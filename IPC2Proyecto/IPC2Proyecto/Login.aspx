<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IPC2Proyecto.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="modal-sm" style="width: 142px; height: 39px;">
                </td>
                <td style="height: 39px">
                </td>
                <td style="height: 39px"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 142px">
                    <h4>Carnet:</h4>
                </td>
                <td>
                    <asp:TextBox ID="txbUsuario" runat="server" Width="264px"></asp:TextBox>
                </td>
                <td>
                    <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                    </p>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 142px">
                    <h4>
                        Contraseña:</h4>
                </td>
                <td>
                    <asp:TextBox ID="txbContraseña" runat="server" Width="263px" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 142px">
                    
                </td>
                <td>
                    
                    
                    
                </td>
                
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 142px">
                    
                </td>
                <td>
                    
                    <asp:Button ID="Button1" OnClick="LogIn" runat="server" Text="Aceptar" Class="btn btn-primary"/>
                    
                </td>
                
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 142px">
                    
                </td>

                <td>
                </td>
                
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 142px">
                    
                </td>

                <td>
                    <asp:Button ID="recupContra" runat="server" Text="Recuperar contraseña" Class="btn btn-secondary" OnClick="recupContra_Click"/>
                </td>
                
                <td>&nbsp;</td>
            </tr>

        </table>

</asp:Content>
