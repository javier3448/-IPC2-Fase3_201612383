<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="IPC2Proyecto.Admin.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    

    <table style="width:100%;">
        <tr>
            <td style="height: 8px">
                <div class="jumbotron">
                    <h1>Modulos de usuario</h1>
                    <p class="lead">       Modulos y paginas de los demas tipos de usuario en la plataforma</p>
                </div>  
            </td>
        </tr>
        <tr>
            <td>
                <asp:TreeView ID="TreeView1" runat="server" ImageSet="XPFileExplorer" NodeIndent="15">
                    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                    <Nodes>
                        <asp:TreeNode Text="Modulos de Operador" Value="Paginas Operador">
                            <asp:TreeNode NavigateUrl="~/PaginasOperador/Calendario.aspx" Text="Calendario" Value="Calendario"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/PaginasOperador/GestionDeRecursos.aspx" Text="Recursos" Value="Gestion de recursos"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/PaginasOperador/NuevaActividad.aspx" Text="Actividad" Value="Actividad"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/PaginasOperador/NuevoCurso.aspx" Text="Curso" Value="Curso"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/PaginasOperador/Prestamos/Insumos.aspx" Text="Insumos" Value="Insumos"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/PaginasOperador/Incidentes.aspx" Text="Incidentes" Value="Incidentes"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="Modulos de Instructor" Value="Modulos de Instructor">
                            <asp:TreeNode NavigateUrl="~/PaginasInstructor/Calendario.aspx" Text="Calendario" Value="Calendario"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/PaginasInstructor/MisActividades.aspx" Text="Mis Actividades" Value="Mis Actividades"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/PaginasInstructor/MisCartas.aspx" Text="Carta" Value="Carta"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="Modulos de Estudiante" Value="Modulos de Estudiante">
                            <asp:TreeNode NavigateUrl="~/PaginasEstudiante/Cursos/CursosDisponibles.aspx" Text="Asignar Cursos" Value="Asignar Cursos"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/PaginasEstudiante/Cursos/MisCursos.aspx" Text="Mis cursos" Value="Mis cursos"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/PaginasEstudiante/Actividades/Calendario.aspx" Text="Calendario" Value="Calendario"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/PaginasEstudiante/Actividades/ActividadesDisponibles.aspx" Text="Matricular Actividades" Value="Matricular Actividades"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/PaginasEstudiante/Actividades/MisActividades.aspx" Text="MisActividades" Value="MisActividades"></asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="2px" NodeSpacing="0px" VerticalPadding="2px" />
                    <ParentNodeStyle Font-Bold="True" Font-Size = "12"/>
                    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px" VerticalPadding="0px" />
                </asp:TreeView>
                
            </td>
        </tr>
        <tr>
            <td>

            </td>
        </tr>
    </table>
    

</asp:Content>
