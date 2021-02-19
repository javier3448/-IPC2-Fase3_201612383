<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionDeRecursos.aspx.cs" Inherits="IPC2Proyecto.PaginasOperador.GestionDeRecursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <table class="nav-justified">
        <tr>
            <td class="text-center" style="height: 29px"></td>
        </tr>
        <tr>
            <td class="text-center">
                <h5>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
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
                </h5>
            </td>
        </tr>
        <tr>
            <td class="text-center" style="height: 29px">&nbsp;</td>
        </tr>
        <tr>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceActividad" InsertItemPosition="LastItem">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="fecha_incioLabel" runat="server" Text='<%# Eval("fecha_incio") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="fecha_finalLabel" runat="server" Text='<%# Eval("fecha_final") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="tipoLabel" runat="server" Text='<%# Eval("tipo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="presentacionLabel" runat="server" Text='<%# Eval("presentacion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="cuestionarioLabel" runat="server" Text='<%# Eval("cuestionario") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="codigo_qrLabel" runat="server" Text='<%# Eval("codigo_qr") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="salon_id_salonLabel" runat="server" Text='<%# Eval("salon_id_salon") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="carta_id_cartaLabel" runat="server" Text='<%# Eval("carta_id_carta") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="curso_id_cursoLabel" runat="server" Text='<%# Eval("curso_id_curso") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="fecha_incioTextBox" runat="server" Text='<%# Bind("fecha_incio") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="fecha_finalTextBox" runat="server" Text='<%# Bind("fecha_final") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="tipoTextBox" runat="server" Text='<%# Bind("tipo") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="presentacionTextBox" runat="server" Text='<%# Bind("presentacion") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="cuestionarioTextBox" runat="server" Text='<%# Bind("cuestionario") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="codigo_qrTextBox" runat="server" Text='<%# Bind("codigo_qr") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="salon_id_salonTextBox" runat="server" Text='<%# Bind("salon_id_salon") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="carta_id_cartaTextBox" runat="server" Text='<%# Bind("carta_id_carta") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="curso_id_cursoTextBox" runat="server" Text='<%# Bind("curso_id_curso") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton0" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="nombreTextBox0" runat="server" Text='<%# Bind("nombre") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="fecha_incioTextBox0" runat="server" Text='<%# Bind("fecha_incio") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="fecha_finalTextBox0" runat="server" Text='<%# Bind("fecha_final") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="tipoTextBox0" runat="server" Text='<%# Bind("tipo") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="presentacionTextBox0" runat="server" Text='<%# Bind("presentacion") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="cuestionarioTextBox0" runat="server" Text='<%# Bind("cuestionario") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="codigo_qrTextBox0" runat="server" Text='<%# Bind("codigo_qr") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="salon_id_salonTextBox0" runat="server" Text='<%# Bind("salon_id_salon") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="carta_id_cartaTextBox0" runat="server" Text='<%# Bind("carta_id_carta") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="curso_id_cursoTextBox0" runat="server" Text='<%# Bind("curso_id_curso") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Button ID="DeleteButton0" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton0" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel2" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel0" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="fecha_incioLabel0" runat="server" Text='<%# Eval("fecha_incio") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="fecha_finalLabel0" runat="server" Text='<%# Eval("fecha_final") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="tipoLabel0" runat="server" Text='<%# Eval("tipo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="presentacionLabel0" runat="server" Text='<%# Eval("presentacion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="cuestionarioLabel0" runat="server" Text='<%# Eval("cuestionario") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="codigo_qrLabel0" runat="server" Text='<%# Eval("codigo_qr") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="salon_id_salonLabel0" runat="server" Text='<%# Eval("salon_id_salon") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="carta_id_cartaLabel0" runat="server" Text='<%# Eval("carta_id_carta") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="curso_id_cursoLabel0" runat="server" Text='<%# Eval("curso_id_curso") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server"></th>
                                                <th runat="server">id</th>
                                                <th runat="server">nombre</th>
                                                <th runat="server">fecha_incio</th>
                                                <th runat="server">fecha_final</th>
                                                <th runat="server">tipo</th>
                                                <th runat="server">presentacion</th>
                                                <th runat="server">cuestionario</th>
                                                <th runat="server">codigo_qr</th>
                                                <th runat="server">salon_id_salon</th>
                                                <th runat="server">carta_id_carta</th>
                                                <th runat="server">curso_id_curso</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Button ID="DeleteButton1" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton1" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel3" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel1" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="fecha_incioLabel1" runat="server" Text='<%# Eval("fecha_incio") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="fecha_finalLabel1" runat="server" Text='<%# Eval("fecha_final") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="tipoLabel1" runat="server" Text='<%# Eval("tipo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="presentacionLabel1" runat="server" Text='<%# Eval("presentacion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="cuestionarioLabel1" runat="server" Text='<%# Eval("cuestionario") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="codigo_qrLabel1" runat="server" Text='<%# Eval("codigo_qr") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="salon_id_salonLabel1" runat="server" Text='<%# Eval("salon_id_salon") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="carta_id_cartaLabel1" runat="server" Text='<%# Eval("carta_id_carta") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="curso_id_cursoLabel1" runat="server" Text='<%# Eval("curso_id_curso") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceActividad" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Actividad
WHERE id_actividad = @id" InsertCommand="INSERT INTO Actividad( nombre, fecha_incio, tipo, presentacion, fecha_final, cuestionario, codigo_qr, carta_id_carta, salon_id_salon, curso_id_curso) VALUES (@nombre, @fecha_incio, @tipo, @presentacion, @fecha_final, @cuestionario, @codigo_qr, @carta_id_carta, @salon_id_salon, @curso_id_curso)" SelectCommand="SELECT [id_actividad] AS id, [nombre], [fecha_incio], [fecha_final], [tipo], [presentacion], [cuestionario], [codigo_qr], [salon_id_salon], [carta_id_carta], [curso_id_curso] FROM [Actividad]" UpdateCommand="UPDATE Actividad SET nombre = @nombre, tipo = @tipo, fecha_incio = @fecha_inicio, presentacion = @presentacion, fecha_final = @fecha_final, cuestionario = @cuestionario, codigo_qr = @codigo_qr, carta_id_carta = @carta_id_carta, salon_id_salon = @salon_id_salon, curso_id_curso = @curso_id_curso WHERE (id_actividad = @id)">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="nombre" />
                            <asp:Parameter Name="fecha_incio" />
                            <asp:Parameter Name="tipo" />
                            <asp:Parameter Name="presentacion" />
                            <asp:Parameter Name="fecha_final" />
                            <asp:Parameter Name="cuestionario" />
                            <asp:Parameter Name="codigo_qr" />
                            <asp:Parameter Name="carta_id_carta" />
                            <asp:Parameter Name="salon_id_salon" />
                            <asp:Parameter Name="curso_id_curso" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nombre" />
                            <asp:Parameter Name="tipo" />
                            <asp:Parameter Name="fecha_inicio" />
                            <asp:Parameter Name="presentacion" />
                            <asp:Parameter Name="fecha_final" />
                            <asp:Parameter Name="cuestionario" />
                            <asp:Parameter Name="codigo_qr" />
                            <asp:Parameter Name="carta_id_carta" />
                            <asp:Parameter Name="salon_id_salon" />
                            <asp:Parameter Name="curso_id_curso" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceAsignacion">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="usuario_estudianteLabel" runat="server" Text='<%# Eval("usuario_estudiante") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="curso_id_cursoLabel" runat="server" Text='<%# Eval("curso_id_curso") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="usuario_estudianteTextBox" runat="server" Text='<%# Bind("usuario_estudiante") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="curso_id_cursoTextBox" runat="server" Text='<%# Bind("curso_id_curso") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="usuario_estudianteTextBox" runat="server" Text='<%# Bind("usuario_estudiante") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="curso_id_cursoTextBox" runat="server" Text='<%# Bind("curso_id_curso") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="usuario_estudianteLabel" runat="server" Text='<%# Eval("usuario_estudiante") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="curso_id_cursoLabel" runat="server" Text='<%# Eval("curso_id_curso") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server">id</th>
                                                <th runat="server">usuario_estudiante</th>
                                                <th runat="server">curso_id_curso</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="usuario_estudianteLabel" runat="server" Text='<%# Eval("usuario_estudiante") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="curso_id_cursoLabel" runat="server" Text='<%# Eval("curso_id_curso") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceAsignacion" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Asignacion WHERE (id_asignacion = @id)" InsertCommand="INSERT INTO Asignacion(usuario_estudiante, curso_id_curso) VALUES (@usuario_estudiante, @curso_id_curso)" SelectCommand="SELECT id_asignacion AS id, usuario_estudiante, curso_id_curso FROM Asignacion" UpdateCommand="UPDATE Asignacion SET curso_id_curso = @curso_id_curso, usuario_estudiante = @usuario_estudiante
WHERE id_asignacion = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="usuario_estudiante" />
                            <asp:Parameter Name="curso_id_curso" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="curso_id_curso" />
                            <asp:Parameter Name="usuario_estudiante" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:ListView ID="ListView3" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceCarta">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="asuntoLabel" runat="server" Text='<%# Eval("asunto") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="contenidoLabel" runat="server" Text='<%# Eval("contenido") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="usuario_instructorLabel" runat="server" Text='<%# Eval("usuario_instructor") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="asuntoTextBox" runat="server" Text='<%# Bind("asunto") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="contenidoTextBox" runat="server" Text='<%# Bind("contenido") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="usuario_instructorTextBox" runat="server" Text='<%# Bind("usuario_instructor") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="asuntoTextBox" runat="server" Text='<%# Bind("asunto") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="contenidoTextBox" runat="server" Text='<%# Bind("contenido") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="usuario_instructorTextBox" runat="server" Text='<%# Bind("usuario_instructor") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="asuntoLabel" runat="server" Text='<%# Eval("asunto") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="contenidoLabel" runat="server" Text='<%# Eval("contenido") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="usuario_instructorLabel" runat="server" Text='<%# Eval("usuario_instructor") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server">id</th>
                                                <th runat="server">asunto</th>
                                                <th runat="server">contenido</th>
                                                <th runat="server">usuario_instructor</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="asuntoLabel" runat="server" Text='<%# Eval("asunto") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="contenidoLabel" runat="server" Text='<%# Eval("contenido") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="usuario_instructorLabel" runat="server" Text='<%# Eval("usuario_instructor") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceCarta" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Carta WHERE (id_carta = @id)" InsertCommand="INSERT INTO Carta(asunto, contenido, usuario_instructor) VALUES (@asunto, @contenido, @usuario_instructor)" SelectCommand="SELECT id_carta AS id, asunto, contenido, usuario_instructor FROM Carta" UpdateCommand="UPDATE Carta SET asunto = @asunto, contenido = @contenido, usuario_instructor = @usuario_instructor WHERE (id_carta = @id)">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="asunto" />
                            <asp:Parameter Name="contenido" />
                            <asp:Parameter Name="usuario_instructor" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="asunto" />
                            <asp:Parameter Name="contenido" />
                            <asp:Parameter Name="usuario_instructor" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <asp:ListView ID="ListView4" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceCurso">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="cicloLabel" runat="server" Text='<%# Eval("ciclo") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="cicloTextBox" runat="server" Text='<%# Bind("ciclo") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="cicloTextBox" runat="server" Text='<%# Bind("ciclo") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="cicloLabel" runat="server" Text='<%# Eval("ciclo") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server">id</th>
                                                <th runat="server">nombre</th>
                                                <th runat="server">ciclo</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="cicloLabel" runat="server" Text='<%# Eval("ciclo") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceCurso" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Curso WHERE (id_curso = @id)" InsertCommand="INSERT INTO Curso(nombre, ciclo) VALUES (@nombre, @ciclo)" SelectCommand="SELECT id_curso AS id, nombre, ciclo FROM Curso" UpdateCommand="UPDATE Curso SET nombre = @nombre, ciclo = @ciclo WHERE (id_curso = @id)">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="nombre" />
                            <asp:Parameter Name="ciclo" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nombre" />
                            <asp:Parameter Name="ciclo" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View5" runat="server">
                    <asp:ListView ID="ListView5" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceIncidenteInsumo">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="costoLabel" runat="server" Text='<%# Eval("costo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Eval("activo") %>' Enabled="false" />
                                </td>
                                <td>
                                    <asp:Label ID="prestamo_id_prestamoLabel" runat="server" Text='<%# Eval("prestamo_id_prestamo") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="costoTextBox" runat="server" Text='<%# Bind("costo") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Bind("activo") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="prestamo_id_prestamoTextBox" runat="server" Text='<%# Bind("prestamo_id_prestamo") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="costoTextBox" runat="server" Text='<%# Bind("costo") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Bind("activo") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="prestamo_id_prestamoTextBox" runat="server" Text='<%# Bind("prestamo_id_prestamo") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="costoLabel" runat="server" Text='<%# Eval("costo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Eval("activo") %>' Enabled="false" />
                                </td>
                                <td>
                                    <asp:Label ID="prestamo_id_prestamoLabel" runat="server" Text='<%# Eval("prestamo_id_prestamo") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server">id</th>
                                                <th runat="server">descripcion</th>
                                                <th runat="server">costo</th>
                                                <th runat="server">estado</th>
                                                <th runat="server">activo</th>
                                                <th runat="server">prestamo_id_prestamo</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="costoLabel" runat="server" Text='<%# Eval("costo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Eval("activo") %>' Enabled="false" />
                                </td>
                                <td>
                                    <asp:Label ID="prestamo_id_prestamoLabel" runat="server" Text='<%# Eval("prestamo_id_prestamo") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceIncidenteInsumo" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Incidente_insumo WHERE (id_incidente_insumo = @id)" InsertCommand="INSERT INTO Incidente_insumo(descripcion, costo, estado, activo, prestamo_id_prestamo) VALUES (@descripcion, @costo, @estado, @activo, @prestamo_id_prestamo)" SelectCommand="SELECT id_incidente_insumo AS id, descripcion, costo, estado, activo, prestamo_id_prestamo FROM Incidente_insumo" UpdateCommand="UPDATE Incidente_insumo SET descripcion = @descripcion, costo = @costo, estado = @estado, activo = @activo, prestamo_id_prestamo = @prestamo_id_prestamo WHERE (id_incidente_insumo = @id)">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="descripcion" />
                            <asp:Parameter Name="costo" />
                            <asp:Parameter Name="estado" />
                            <asp:Parameter Name="activo" />
                            <asp:Parameter Name="prestamo_id_prestamo" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="descripcion" />
                            <asp:Parameter Name="costo" />
                            <asp:Parameter Name="estado" />
                            <asp:Parameter Name="activo" />
                            <asp:Parameter Name="prestamo_id_prestamo" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View6" runat="server">
                    <asp:ListView ID="ListView6" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceIncidenteSalon">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="costoLabel" runat="server" Text='<%# Eval("costo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="actividad_id_actividadLabel" runat="server" Text='<%# Eval("actividad_id_actividad") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Eval("activo") %>' Enabled="false" />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="costoTextBox" runat="server" Text='<%# Bind("costo") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="actividad_id_actividadTextBox" runat="server" Text='<%# Bind("actividad_id_actividad") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Bind("activo") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="costoTextBox" runat="server" Text='<%# Bind("costo") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="actividad_id_actividadTextBox" runat="server" Text='<%# Bind("actividad_id_actividad") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Bind("activo") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="costoLabel" runat="server" Text='<%# Eval("costo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="actividad_id_actividadLabel" runat="server" Text='<%# Eval("actividad_id_actividad") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Eval("activo") %>' Enabled="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server">id</th>
                                                <th runat="server">descripcion</th>
                                                <th runat="server">estado</th>
                                                <th runat="server">costo</th>
                                                <th runat="server">actividad_id_actividad</th>
                                                <th runat="server">activo</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="costoLabel" runat="server" Text='<%# Eval("costo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="actividad_id_actividadLabel" runat="server" Text='<%# Eval("actividad_id_actividad") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Eval("activo") %>' Enabled="false" />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceIncidenteSalon" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Incidente_salon WHERE (id_incidente_salon = @id)" InsertCommand="INSERT INTO Incidente_salon(descripcion, costo, estado, actividad_id_actividad, activo, actividad_id_actividad) VALUES (@descripcion, @costo, @estado, @actividad_id_actividad, @activo,)" SelectCommand="SELECT id_incidente_salon AS id, descripcion, estado, costo, actividad_id_actividad, activo FROM Incidente_salon" UpdateCommand="UPDATE Incidente_salon SET descripcion = @descripcion, costo = @costo, estado = @estado, activo = @activo, actividad_id_actividad = @actividad_id_actividad WHERE (id_incidente_salon = @id)">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="descripcion" />
                            <asp:Parameter Name="costo" />
                            <asp:Parameter Name="estado" />
                            <asp:Parameter Name="actividad_id_actividad" />
                            <asp:Parameter Name="activo" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="descripcion" />
                            <asp:Parameter Name="costo" />
                            <asp:Parameter Name="estado" />
                            <asp:Parameter Name="activo" />
                            <asp:Parameter Name="actividad_id_actividad" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View7" runat="server">
                    <asp:ListView ID="ListView7" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceInsumo" InsertItemPosition="LastItem">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="disponibleCheckBox" runat="server" Checked='<%# Eval("disponible") %>' Enabled="false" />
                                </td>
                                <td>
                                    <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Eval("activo") %>' Enabled="false" />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="disponibleCheckBox" runat="server" Checked='<%# Bind("disponible") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="precioTextBox" runat="server" Text='<%# Bind("precio") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Bind("activo") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="disponibleCheckBox" runat="server" Checked='<%# Bind("disponible") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="precioTextBox" runat="server" Text='<%# Bind("precio") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Bind("activo") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="disponibleCheckBox" runat="server" Checked='<%# Eval("disponible") %>' Enabled="false" />
                                </td>
                                <td>
                                    <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Eval("activo") %>' Enabled="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server"></th>
                                                <th runat="server">id</th>
                                                <th runat="server">nombre</th>
                                                <th runat="server">descripcion</th>
                                                <th runat="server">estado</th>
                                                <th runat="server">disponible</th>
                                                <th runat="server">precio</th>
                                                <th runat="server">activo</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="disponibleCheckBox" runat="server" Checked='<%# Eval("disponible") %>' Enabled="false" />
                                </td>
                                <td>
                                    <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Eval("activo") %>' Enabled="false" />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceInsumo" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Insumo WHERE (id_insumo = @id)" InsertCommand="INSERT INTO Insumo(nombre, descripcion, estado, precio, disponible, activo) VALUES (@nombre, @descripcion, @estado, @precio, @disponible, @activo)
" SelectCommand="
SELECT id_insumo AS id, nombre, descripcion, estado, disponible, precio, activo FROM Insumo
" UpdateCommand="UPDATE Insumo SET nombre = @nombre, descripcion = @descripcion, estado = @estado, precio = @precio, disponible = @disponible, activo = @activo WHERE (id_insumo = @id)
">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="nombre" />
                            <asp:Parameter Name="descripcion" />
                            <asp:Parameter Name="estado" />
                            <asp:Parameter Name="precio" />
                            <asp:Parameter Name="disponible" />
                            <asp:Parameter Name="activo" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nombre" />
                            <asp:Parameter Name="descripcion" />
                            <asp:Parameter Name="estado" />
                            <asp:Parameter Name="precio" />
                            <asp:Parameter Name="disponible" />
                            <asp:Parameter Name="activo" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View8" runat="server">
                    <asp:ListView ID="ListView8" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceMatricula">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="asistenciaLabel" runat="server" Text='<%# Eval("asistencia") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="respuestas_cuestionarioLabel" runat="server" Text='<%# Eval("respuestas_cuestionario") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="usuario_estudianteLabel" runat="server" Text='<%# Eval("usuario_estudiante") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="actividad_id_actividadLabel" runat="server" Text='<%# Eval("actividad_id_actividad") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="asistenciaTextBox" runat="server" Text='<%# Bind("asistencia") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="respuestas_cuestionarioTextBox" runat="server" Text='<%# Bind("respuestas_cuestionario") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="usuario_estudianteTextBox" runat="server" Text='<%# Bind("usuario_estudiante") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="actividad_id_actividadTextBox" runat="server" Text='<%# Bind("actividad_id_actividad") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="asistenciaTextBox" runat="server" Text='<%# Bind("asistencia") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="respuestas_cuestionarioTextBox" runat="server" Text='<%# Bind("respuestas_cuestionario") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="usuario_estudianteTextBox" runat="server" Text='<%# Bind("usuario_estudiante") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="actividad_id_actividadTextBox" runat="server" Text='<%# Bind("actividad_id_actividad") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="asistenciaLabel" runat="server" Text='<%# Eval("asistencia") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="respuestas_cuestionarioLabel" runat="server" Text='<%# Eval("respuestas_cuestionario") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="usuario_estudianteLabel" runat="server" Text='<%# Eval("usuario_estudiante") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="actividad_id_actividadLabel" runat="server" Text='<%# Eval("actividad_id_actividad") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server">id</th>
                                                <th runat="server">asistencia</th>
                                                <th runat="server">respuestas_cuestionario</th>
                                                <th runat="server">usuario_estudiante</th>
                                                <th runat="server">actividad_id_actividad</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="asistenciaLabel" runat="server" Text='<%# Eval("asistencia") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="respuestas_cuestionarioLabel" runat="server" Text='<%# Eval("respuestas_cuestionario") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="usuario_estudianteLabel" runat="server" Text='<%# Eval("usuario_estudiante") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="actividad_id_actividadLabel" runat="server" Text='<%# Eval("actividad_id_actividad") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceMatricula" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Matricula WHERE (id_matricula = @id)" InsertCommand="INSERT INTO Matricula(respuestas_cuestionario, asistencia, actividad_id_actividad, usuario_estudiante) VALUES (@respuestas_cuestionario, @asistencia, @actividad_id_actividad, @usuario_estudiante)" SelectCommand="SELECT id_matricula AS id, asistencia, respuestas_cuestionario, usuario_estudiante, actividad_id_actividad FROM Matricula" UpdateCommand="UPDATE Matricula SET asistencia = @asistencia, respuestas_cuestionario = @respuestas_cuestionario, usuario_estudiante = @usuario_estudiante, actividad_id_actividad = @actividad_id_actividad WHERE (id_matricula = @id)">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="respuestas_cuestionario" />
                            <asp:Parameter Name="asistencia" />
                            <asp:Parameter Name="actividad_id_actividad" />
                            <asp:Parameter Name="usuario_estudiante" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="asistencia" />
                            <asp:Parameter Name="respuestas_cuestionario" />
                            <asp:Parameter Name="usuario_estudiante" />
                            <asp:Parameter Name="actividad_id_actividad" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View9" runat="server">
                    <asp:ListView ID="ListView9" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourcePrestamo">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="fechaLabel" runat="server" Text='<%# Eval("fecha") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="insumo_id_insumoLabel" runat="server" Text='<%# Eval("insumo_id_insumo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="usuario_id_usuarioLabel" runat="server" Text='<%# Eval("usuario_id_usuario") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="fechaTextBox" runat="server" Text='<%# Bind("fecha") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="insumo_id_insumoTextBox" runat="server" Text='<%# Bind("insumo_id_insumo") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="usuario_id_usuarioTextBox" runat="server" Text='<%# Bind("usuario_id_usuario") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="fechaTextBox" runat="server" Text='<%# Bind("fecha") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="insumo_id_insumoTextBox" runat="server" Text='<%# Bind("insumo_id_insumo") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="usuario_id_usuarioTextBox" runat="server" Text='<%# Bind("usuario_id_usuario") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="fechaLabel" runat="server" Text='<%# Eval("fecha") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="insumo_id_insumoLabel" runat="server" Text='<%# Eval("insumo_id_insumo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="usuario_id_usuarioLabel" runat="server" Text='<%# Eval("usuario_id_usuario") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server">id</th>
                                                <th runat="server">descripcion</th>
                                                <th runat="server">fecha</th>
                                                <th runat="server">estado</th>
                                                <th runat="server">insumo_id_insumo</th>
                                                <th runat="server">usuario_id_usuario</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="fechaLabel" runat="server" Text='<%# Eval("fecha") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="insumo_id_insumoLabel" runat="server" Text='<%# Eval("insumo_id_insumo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="usuario_id_usuarioLabel" runat="server" Text='<%# Eval("usuario_id_usuario") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourcePrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Prestamo WHERE (id_prestamo = @id)" InsertCommand="INSERT INTO Prestamo(descripcion, estado, fecha, insumo_id_insumo, usuario_id_usuario) VALUES (@descripcion, @estado, @fecha, @insumo_id_insumo, @usuario_id_usuario)" SelectCommand="SELECT id_prestamo AS id, descripcion, fecha, estado, insumo_id_insumo, usuario_id_usuario FROM Prestamo" UpdateCommand="UPDATE Prestamo SET descripcion = @descripcion, estado = @estado, fecha = @fecha, insumo_id_insumo = @insumo_id_insumo, usuario_id_usuario = @usuario_id_usuario
WHERE id_prestamo = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="descripcion" />
                            <asp:Parameter Name="estado" />
                            <asp:Parameter Name="fecha" />
                            <asp:Parameter Name="insumo_id_insumo" />
                            <asp:Parameter Name="usuario_id_usuario" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="descripcion" />
                            <asp:Parameter Name="estado" />
                            <asp:Parameter Name="fecha" />
                            <asp:Parameter Name="insumo_id_insumo" />
                            <asp:Parameter Name="usuario_id_usuario" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View10" runat="server">
                    <asp:ListView ID="ListView10" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceSalon" InsertItemPosition="LastItem">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="edificioLabel" runat="server" Text='<%# Eval("edificio") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Eval("activo") %>' Enabled="false" />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="edificioTextBox" runat="server" Text='<%# Bind("edificio") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Bind("activo") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="edificioTextBox" runat="server" Text='<%# Bind("edificio") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Bind("activo") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="edificioLabel" runat="server" Text='<%# Eval("edificio") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Eval("activo") %>' Enabled="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server"></th>
                                                <th runat="server">id</th>
                                                <th runat="server">nombre</th>
                                                <th runat="server">edificio</th>
                                                <th runat="server">estado</th>
                                                <th runat="server">activo</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="edificioLabel" runat="server" Text='<%# Eval("edificio") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="activoCheckBox" runat="server" Checked='<%# Eval("activo") %>' Enabled="false" />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceSalon" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Salon WHERE (id_salon = @id)" InsertCommand="INSERT INTO Salon(edificio, nombre, estado, activo) VALUES (@edificio, @nombre, @estado, @activo)" SelectCommand="SELECT id_salon AS id, nombre, edificio, estado, activo FROM Salon" UpdateCommand="UPDATE Salon SET nombre = @nombre, edificio = @edificio, estado = @estado, activo = @activo WHERE (id_salon = @id)">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="edificio" />
                            <asp:Parameter Name="nombre" />
                            <asp:Parameter Name="estado" />
                            <asp:Parameter Name="activo" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nombre" />
                            <asp:Parameter Name="edificio" />
                            <asp:Parameter Name="estado" />
                            <asp:Parameter Name="activo" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View11" runat="server">
                    <asp:ListView ID="ListView11" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceUsuarios" InsertItemPosition="LastItem">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="carneLabel" runat="server" Text='<%# Eval("carne") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="cuiLabel" runat="server" Text='<%# Eval("cui") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="contrasenaLabel" runat="server" Text='<%# Eval("contrasena") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="direccionLabel" runat="server" Text='<%# Eval("direccion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="telefonoLabel" runat="server" Text='<%# Eval("telefono") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="correoLabel" runat="server" Text='<%# Eval("correo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="fecha_de_nacimientoLabel" runat="server" Text='<%# Eval("fecha_de_nacimiento") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="tipoLabel" runat="server" Text='<%# Eval("tipo") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="carneTextBox" runat="server" Text='<%# Bind("carne") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="cuiTextBox" runat="server" Text='<%# Bind("cui") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="contrasenaTextBox" runat="server" Text='<%# Bind("contrasena") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="direccionTextBox" runat="server" Text='<%# Bind("direccion") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="telefonoTextBox" runat="server" Text='<%# Bind("telefono") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="correoTextBox" runat="server" Text='<%# Bind("correo") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="fecha_de_nacimientoTextBox" runat="server" Text='<%# Bind("fecha_de_nacimiento") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="tipoTextBox" runat="server" Text='<%# Bind("tipo") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="carneTextBox" runat="server" Text='<%# Bind("carne") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="cuiTextBox" runat="server" Text='<%# Bind("cui") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="contrasenaTextBox" runat="server" Text='<%# Bind("contrasena") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="direccionTextBox" runat="server" Text='<%# Bind("direccion") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="telefonoTextBox" runat="server" Text='<%# Bind("telefono") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="correoTextBox" runat="server" Text='<%# Bind("correo") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="fecha_de_nacimientoTextBox" runat="server" Text='<%# Bind("fecha_de_nacimiento") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="tipoTextBox" runat="server" Text='<%# Bind("tipo") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="carneLabel" runat="server" Text='<%# Eval("carne") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="cuiLabel" runat="server" Text='<%# Eval("cui") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="contrasenaLabel" runat="server" Text='<%# Eval("contrasena") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="direccionLabel" runat="server" Text='<%# Eval("direccion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="telefonoLabel" runat="server" Text='<%# Eval("telefono") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="correoLabel" runat="server" Text='<%# Eval("correo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="fecha_de_nacimientoLabel" runat="server" Text='<%# Eval("fecha_de_nacimiento") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="tipoLabel" runat="server" Text='<%# Eval("tipo") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server"></th>
                                                <th runat="server">id</th>
                                                <th runat="server">carne</th>
                                                <th runat="server">cui</th>
                                                <th runat="server">contrasena</th>
                                                <th runat="server">nombre</th>
                                                <th runat="server">direccion</th>
                                                <th runat="server">telefono</th>
                                                <th runat="server">correo</th>
                                                <th runat="server">fecha_de_nacimiento</th>
                                                <th runat="server">tipo</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="carneLabel" runat="server" Text='<%# Eval("carne") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="cuiLabel" runat="server" Text='<%# Eval("cui") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="contrasenaLabel" runat="server" Text='<%# Eval("contrasena") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="direccionLabel" runat="server" Text='<%# Eval("direccion") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="telefonoLabel" runat="server" Text='<%# Eval("telefono") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="correoLabel" runat="server" Text='<%# Eval("correo") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="fecha_de_nacimientoLabel" runat="server" Text='<%# Eval("fecha_de_nacimiento") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="tipoLabel" runat="server" Text='<%# Eval("tipo") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Usuario WHERE (id_usuario = @id)" InsertCommand="INSERT INTO Usuario(carne, cui, contrasena, direccion, nombre, telefono, correo, fecha_de_nacimiento, tipo) VALUES (@carne, @cui, @contrasena, @direccion, @nombre, @telefono, @correo, @fecha_de_nacimiento, 'estudiante')" SelectCommand="SELECT id_usuario AS id, carne, cui, contrasena, nombre, direccion, telefono, correo, fecha_de_nacimiento, tipo FROM Usuario WHERE tipo = 'estudiante'" UpdateCommand="UPDATE Usuario SET carne = @carne, cui = @cui, contrasena = @contraseña, nombre = @nombre, direccion = @direccion, telefono = @telefono, correo = @correo, fecha_de_nacimiento = @fecha_de_nacimiento, tipo = @tipo WHERE (id_usuario = @id)">
                        <DeleteParameters>
                            <asp:Parameter Name="id" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="carne" />
                            <asp:Parameter Name="cui" />
                            <asp:Parameter Name="contrasena" />
                            <asp:Parameter Name="direccion" />
                            <asp:Parameter Name="nombre" />
                            <asp:Parameter Name="telefono" />
                            <asp:Parameter Name="correo" />
                            <asp:Parameter Name="fecha_de_nacimiento" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="carne" />
                            <asp:Parameter Name="cui" />
                            <asp:Parameter Name="contraseña" />
                            <asp:Parameter Name="nombre" />
                            <asp:Parameter Name="direccion" />
                            <asp:Parameter Name="telefono" />
                            <asp:Parameter Name="correo" />
                            <asp:Parameter Name="fecha_de_nacimiento" />
                            <asp:Parameter Name="tipo" />
                            <asp:Parameter Name="id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
            </asp:MultiView>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>


</asp:Content>
