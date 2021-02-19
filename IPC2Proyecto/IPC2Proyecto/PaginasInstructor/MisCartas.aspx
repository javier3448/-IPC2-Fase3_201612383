<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisCartas.aspx.cs" Inherits="IPC2Proyecto.PaginasInstructor.MisCartas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .ResizeImg
        {
            max-height:400px;
            max-width:200px;
        }
        .auto-style1 {
            height: 36px;
        }
        .auto-style2 {
            width: 204px;
        }
        .auto-style3 {
            height: 20px;
        }
    </style>
    <table class="nav-justified">
        <tr>
            <td>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames = "id_carta" ItemType="IPC2Proyecto.Models.MyModels.Carta" SelectMethod="GetCartas">
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
                            <a href="EditarCarta.aspx?idCarta=<%#:Item.id_carta%>">
                                <span>
                                    <h4><b><%#:Item.asunto%></b></h4>
                                </span>
                            </a>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td><%#:GetContenido(Item.contenido)%></td>
                        <br />
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" Height="200px" ScrollBars="Both" Width="200px">
                                <asp:Image ID="Image1" runat="server" ImageUrl="<%#:Item.imagen%>" AlternateText="Image de carta" CssClass="ResizeImg" />
                            </asp:Panel>
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
                                <asp:Button ID="NuevaCarta" runat="server" Text="Nueva Carta" Class="btn btn-primary" OnClick="NuevaCarta_Click"/>
                                        </td>
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
