<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallesMiActividad.aspx.cs" Inherits="IPC2Proyecto.PaginasEstudiante.Actividades.EditarActividad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <div class="jumbotron">
                    <h2>Detalles de actividad matriculada</h2>
                    <h4>
                        Nombre: <asp:Literal ID="LiteralNombreActividad" runat="server"></asp:Literal>
                    </h4>
                </div>
                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
            </td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td>
                <table class="nav-justified">
                    <tr>
                        <td style="height: 20px; width: 375px">
                            <h4>&nbsp;</h4>
                            <h4>Presentacion:</h4>
                            <p>
                                &nbsp;</p>
                        </td>
                        <td style="width: 452px; height: 20px">
                                <asp:Button ID="DescargarPresentacion" runat="server" Text="Descargar" Class="btn btn-primary" OnClick="DescargarPresentacion_Click"/>
                                        </td>
                        <td style="height: 20px"></td>
                    </tr>
                    <tr>
                        <td style="width: 375px; height: 98px;">
                            <h4>&nbsp;</h4>
                            <h4>Cuestionario:</h4>
                            <p>
                                &nbsp;</p>
                        </td>
                        <td style="width: 452px; height: 98px;">
                                <asp:Button ID="DescargarCuestionario" runat="server" Text="Descargar" Class="btn btn-primary" OnClick="DescargarCuestionario_Click"/>
                                        <br />
                                <p class="text-success">
                                <asp:Literal runat="server" ID="LiteralRespuesta" />
                                </p>
                                        </td>
                        <td style="height: 98px">
                            <asp:TextBox ID="TBRespuesta" runat="server" ReadOnly="True" Width="215px"></asp:TextBox>
                            <br />
                            <asp:FileUpload ID="FileUploadRespuesta" runat="server" Height="22px" Width="222px" />
                                <asp:Button ID="BTNSubirCuestionario" runat="server" Text="Subir" Class="btn btn-primary" CssClass="btn-info" OnClick="BTNSubirPresentacion_Click"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 375px">
                            <h4>Tomar asistencia:</h4>
                        </td>
                        <td style="width: 452px">
                            <asp:TextBox ID="TBCodigo" runat="server"></asp:TextBox>
                                <asp:Button ID="TomarAsistencia" runat="server" Text="ok" Class="btn btn-primary" CssClass="btn-info" OnClick="TomarAsistencia_Click"/>
                                        </td>
                        <td>
                            <asp:Literal ID="LiteralAsistencia" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="CancelarMatriculacion" runat="server" Text="Cancelar Matriculacion" CssClass="btn-danger" OnClick="CancelarMatriculacion_Click" />
            </td>
        </tr>
    </table>

</asp:Content>
