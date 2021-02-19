<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Insumos.aspx.cs" Inherits="IPC2Proyecto.PaginasOperador.NuevoPrestamo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames = "id_insumo" ItemType="IPC2Proyecto.Models.MyModels.Insumo" SelectMethod="GetInsumos">
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
                            <a href="EditarInsumo.aspx?idInsumo=<%#:Item.id_insumo%>">
                                <span>
                                    <h4><b><%#:Item.nombre%></b></h4>
                                </span>
                            </a>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td><b>Descripcion: </b><br />
                            <asp:TextBox ID="TextBox1" runat="server" Text ="<%#:Item.descripcion%>" ReadOnly="true" TextMode="MultiLine" Height="75px" ScrollBars="Both" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Estado: </b><%#:Item.estado%></td>
                    </tr>
                    <tr>
                        <td><b>Precio: </b><%#:Item.precio%></td>
                    </tr>
                    <tr>
                        <td><b>Disponible: <asp:RadioButton ID="RadioButton1" runat="server" Enabled="false" Checked="<%#bool.Parse(GetDisponible(Item))%>" /></b></td>
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
