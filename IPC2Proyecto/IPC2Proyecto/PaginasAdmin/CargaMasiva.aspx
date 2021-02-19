<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CargaMasiva.aspx.cs" Inherits="IPC2Proyecto.PaginasAdmin.CargaMasiva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                <div class="jumbotron">
                    <h1>Carga masiva de datos</h1>
                    <p class="lead">Suba un archivo con inserciones para la base de datos</p>
                </div>  
            </td>
        </tr>
        <tr>
            <td>

                <table style="width:100%;">
                    <tr>
                        <td style="width: 206px">
                            <h4>Tabla:</h4>
                        </td>
                        <td>
                <asp:DropDownList ID="DropDownTabla" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>Actividades</asp:ListItem>
                    <asp:ListItem>Asignacion</asp:ListItem>
                    <asp:ListItem>Carta</asp:ListItem>
                    <asp:ListItem>Curso</asp:ListItem>
                    <asp:ListItem>Incidente insumo</asp:ListItem>
                    <asp:ListItem>Incidente salon</asp:ListItem>
                    <asp:ListItem>Insumo</asp:ListItem>
                    <asp:ListItem>Matricula</asp:ListItem>
                    <asp:ListItem>Prestamo</asp:ListItem>
                    <asp:ListItem>Salon</asp:ListItem>
                    <asp:ListItem>Usuario</asp:ListItem>
                </asp:DropDownList>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td>

                <table style="width:100%;">
                    <tr>
                        <td style="width: 206px">
                            <h4>Formato:</h4>
                        </td>
                        <td>
                            <p class="text-info">
                            <asp:Literal runat="server" ID="FormatoText" />
                            </p>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td>

                <table style="width:100%;">
                    <tr>
                        <td style="width: 206px">
                            <h4>.</h4>
                        </td>
                        <td>
                            <p class="text-success">
                            <asp:Literal runat="server" ID="TipoText" />
                            </p>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td>

                <table style="margin-bottom: 0px;" class="nav-justified">
                    <tr>
                        <td style="width: 206px; height: 39px;">
                            <h4>Archivo:</h4>
                        </td>
                        <td style="height: 39px">
                            <asp:TextBox ID="TextBoxArchivo" runat="server" Width="481px"></asp:TextBox>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td>
                <table style="width:100%;">
                    <tr>
                        <td style="width: 207px; height: 20px">
                            <p class="text-success"></p>
                        </td>
                        <td style="height: 20px">
                            <p class="text-success"><asp:Literal ID="Resultado" runat="server"></asp:Literal></p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td>

                <table style="width:100%;">
                    <tr>
                        <td style="width: 708px">
                            <h4 class="text-center">
                                <asp:Button ID="Aceptar" runat="server" OnClick="Aceptar_Click" Text="Aceptar" />
                            </h4>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td>

            </td>
        </tr>

    </table>
</asp:Content>
