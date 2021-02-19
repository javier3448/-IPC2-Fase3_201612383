﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cursos.aspx.cs" Inherits="IPC2Proyecto.PaginasOperador.Cursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width:100%;">
        <tr>
            <td>
                <div class="jumbotron">
                    <h2>Cursos</h2>
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
                <asp:ListView ID="ListView1" runat="server" DataKeyNames = "id_curso" ItemType="IPC2Proyecto.Models.MyModels.Curso" SelectMethod="GetCursos">
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
                            <a href="EditarCurso.aspx?id_curso=<%#:Item.id_curso%>">
                                <span>
                                    <h4><b><%#:Item.nombre%></b></h4>
                                </span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>Ciclo: <%#:Item.ciclo%></td>
                        <br />
                    </tr>
                    <tr>
                        <td>
                            Fecha inicio: <%#:(Item.fecha_incio ?? default(DateTime)).ToString("dd/MM/yyyy")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Fecha Final: <%#:(Item.fecha_final ?? default(DateTime)).ToString("dd/MM/yyyy")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Catedratico: <%#:GetNombreInstructor(Item)%>
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
                                <asp:Button ID="NuevaCurso" runat="server" Text="Nuevo Curso" Class="btn btn-primary" OnClick="NuevoCurso_Click"/>
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
