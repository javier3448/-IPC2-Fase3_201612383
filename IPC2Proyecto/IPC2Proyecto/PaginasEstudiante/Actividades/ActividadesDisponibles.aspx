<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActividadesDisponibles.aspx.cs" Inherits="IPC2Proyecto.PaginasEstudiante.Actividades.ActividadesDisponibles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width:100%;">
        <tr>
            <td>
                <div class="jumbotron">
                    <h2>Actividades disponibles</h2>
                    <h4>&nbsp;</h4>
                </div>
                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="ListView1" runat="server" DataKeyNames = "id_actividad" ItemType="IPC2Proyecto.Models.MyModels.Actividad" SelectMethod="GetActividades">
        <EmptyDataTemplate>
            <table >
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td/>
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td runat="server">
                <table>
                    <tr>
                    </tr>
                    <tr>
                        <td>
                            <a href="DetallesActividad.aspx?id_actividad=<%#:Item.id_actividad%>">
                                <span>
                                    <h4><b><%#:Item.nombre%></b></h4>
                                </span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>Catedratico: <%#:Item.Carta.Usuario.nombre%></td>
                    </tr>
                    <tr>
                        <td>Salon: <%#:Item.Salon.nombre%></td>
                    </tr>
                    <tr>
                        <td>Edificio: <%#:Item.Salon.edificio%></td>
                    </tr>
                    <tr>
                        <td>
                            Fecha: <%#:Item.fecha_incio.ToString("dd/MM/yyyy")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hora inicio: <%#:Item.fecha_incio.ToString("HH:mm")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hora final: <%#:Item.fecha_final.ToString("HH:mm")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table style="width:100%;">
                <tbody>
                    <tr>
                        <td>
                            <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                <tr id="groupPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr></tr>
                </tbody>
            </table>
        </LayoutTemplate>
    </asp:ListView>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;<table style="width:100%;">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                                &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                </table>
            </td>
            <td class="auto-style1"></td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
        </tr>
    </table>

</asp:Content>
