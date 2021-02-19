<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevaCarta.aspx.cs" Inherits="IPC2Proyecto.PaginasInstructor.NuevaCarta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
            <td>
                <p class="text-danger">
                    &nbsp;</p>
                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><h4>Asunto:</h4></td>
            <td>
                <asp:TextBox ID="txbAsunto" runat="server" Width="250px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="vertical-align:top"><h4>Contenido:</h4></td>
            <td>
                <asp:TextBox ID="txbContenido" runat="server" Width="500px" Height="200px" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 39px"><h4>Url Imagen:</h4></td>
            <td style="height: 39px">
                
                <asp:FileUpload ID="ImgFile" runat="server" />
                
            </td>
            <td style="height: 39px"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <table style="width:100%;">
                    <tr>
                        <td>
                            <asp:Button ID="Save" runat="server" Text="Guardar" Class="btn btn-primary" OnClick="Save_Click" style="height: 36px"/>
                        </td>
                        <td>
                            <asp:Button ID="Cancel" runat="server" Text="Cancelar" Class="btn btn-primary" OnClick="Cancel_Click"/>
                        </td>
                    </tr>
                </table>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>
