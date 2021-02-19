<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisActividades.aspx.cs" Inherits="IPC2Proyecto.PaginasInstructor.MisActividades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
                            <a href="EditarActividad.aspx?idActividad=<%#:Item.id_actividad%>">
                                <span>
                                    <h4><b><%#:Item.nombre%></b></h4>
                                </span>
                            </a>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td><b>Curso: </b><%#:Item.Curso.nombre%></td>
                    </tr>
                    <tr>
                        <td><b>Fecha: </b><%#:Item.fecha_incio.Day%>/<%#:(Item.fecha_incio).Month%>/<%#:(Item.fecha_incio).Year%></td>
                    </tr>
                    <tr>
                        <td><b>Hora de incio: </b><%#:Item.fecha_incio.ToString("HH:mm")%></td>
                    </tr>
                    <tr>
                        <td><b>Hora final: </b><%#:Item.fecha_final.ToString("HH:mm")%></td>
                    </tr>
                    <tr>
                        <td><b>Salon: </b><%#:Item.Salon.nombre%></td>
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

</asp:Content>
