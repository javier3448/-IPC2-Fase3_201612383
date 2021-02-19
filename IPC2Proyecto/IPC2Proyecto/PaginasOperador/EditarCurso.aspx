<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarCurso.aspx.cs" Inherits="IPC2Proyecto.PaginasOperador.EditarCurso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <div class="jumbotron">
                    <h2>EditarCurso</h2>
                    <h4>Edicion de curso</h4>
                </div>
                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <table class="nav-justified">
                    <tr>
                        <td style="height: 43px">
                            <h4>Nombre</h4>
                        </td>
                        <td style="height: 43px">
                            <asp:TextBox ID="TBNombre" runat="server" Width="264px"></asp:TextBox>

                        </td>
                        <td style="height: 43px"></td>
                    </tr>
                 
                    <tr>
                        <td>
                            <h4>Ciclo:</h4>
                        </td>
                            <td>
                                <asp:DropDownList ID="DDLCiclo" runat="server">
                                    <asp:ListItem>semanal</asp:ListItem>
                                    <asp:ListItem>mensual</asp:ListItem>
                                    <asp:ListItem>anual</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top">
                            <h4>&nbsp;</h4>
                            <h4>Inicio: </h4>
                        </td>
                        <td>
                                <br />
                                <asp:TextBox ID="TBDateInicial" runat="server" Width="264px" ReadOnly="True" ></asp:TextBox>
                            <asp:Calendar ID="CalendarInicial" runat="server" OnSelectionChanged="CalendarInicial_SelectionChanged" style="margin-left: 2px"></asp:Calendar>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top">
                            <h4>&nbsp;</h4>
                            <h4>&nbsp;Fin: </h4>
                        </td>
                        <td>
                                <br />
                                <asp:TextBox ID="TBDateFinal" runat="server" Width="264px" ReadOnly="True"></asp:TextBox>
                            <asp:Calendar ID="CalendarFinal" runat="server" OnSelectionChanged="CalendarFinal_SelectionChanged"></asp:Calendar>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                     <tr>
                        <td style="height: 43px">
                        </td>
                        <td style="height: 43px">

                            <br />
                            <asp:Button ID="Aceptar" runat="server" Text="Aceptar" Class="btn btn-primary" OnClick="Aceptar_Click"/>
                            <br />

                        </td>
                        <td style="height: 43px"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 102px">
                
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceAsignaciones" InsertItemPosition="LastItem">
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
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
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
                                            <th runat="server"></th>
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
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
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
                <asp:SqlDataSource ID="SqlDataSourceAsignaciones" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Asignacion
WHERE curso_id_curso = @id" InsertCommand="INSERT INTO Asignacion(usuario_estudiante, curso_id_curso) VALUES (@usuario_estudiante, curso_id_curso)" SelectCommand="SELECT id_asignacion AS id, usuario_estudiante, curso_id_curso FROM Asignacion
WHERE curso_id_curso = @id_curso" UpdateCommand="UPDATE Asignacion SET usuario_estudiante = @usuario_estudiante, curso_id_curso = @curso_id_curso
WHERE id_curso = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="usuario_estudiante" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="id_curso" QueryStringField="id_curso" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="usuario_estudiante" />
                        <asp:Parameter Name="curso_id_curso" />
                        <asp:Parameter Name="id" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                
            </td>
        </tr>
        <tr>
                        <td style="vertical-align:top;">
                            <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceActividades" InsertItemPosition="LastItem">
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
                                            <asp:Label ID="tipoLabel" runat="server" Text='<%# Eval("tipo") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="fecha_incioLabel" runat="server" Text='<%# Eval("fecha_incio") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="presentacionLabel" runat="server" Text='<%# Eval("presentacion") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="fecha_finalLabel" runat="server" Text='<%# Eval("fecha_final") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="cuestionarioLabel" runat="server" Text='<%# Eval("cuestionario") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="codigo_qrLabel" runat="server" Text='<%# Eval("codigo_qr") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="carta_id_cartaLabel" runat="server" Text='<%# Eval("carta_id_carta") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="salon_id_salonLabel" runat="server" Text='<%# Eval("salon_id_salon") %>' />
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
                                            <asp:TextBox ID="tipoTextBox" runat="server" Text='<%# Bind("tipo") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="fecha_incioTextBox" runat="server" Text='<%# Bind("fecha_incio") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="presentacionTextBox" runat="server" Text='<%# Bind("presentacion") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="fecha_finalTextBox" runat="server" Text='<%# Bind("fecha_final") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="cuestionarioTextBox" runat="server" Text='<%# Bind("cuestionario") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="codigo_qrTextBox" runat="server" Text='<%# Bind("codigo_qr") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="carta_id_cartaTextBox" runat="server" Text='<%# Bind("carta_id_carta") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="salon_id_salonTextBox" runat="server" Text='<%# Bind("salon_id_salon") %>' />
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
                                            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tipoTextBox" runat="server" Text='<%# Bind("tipo") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="fecha_incioTextBox" runat="server" Text='<%# Bind("fecha_incio") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="presentacionTextBox" runat="server" Text='<%# Bind("presentacion") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="fecha_finalTextBox" runat="server" Text='<%# Bind("fecha_final") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="cuestionarioTextBox" runat="server" Text='<%# Bind("cuestionario") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="codigo_qrTextBox" runat="server" Text='<%# Bind("codigo_qr") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="carta_id_cartaTextBox" runat="server" Text='<%# Bind("carta_id_carta") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="salon_id_salonTextBox" runat="server" Text='<%# Bind("salon_id_salon") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="curso_id_cursoTextBox" runat="server" Text='<%# Bind("curso_id_curso") %>' />
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
                                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="tipoLabel" runat="server" Text='<%# Eval("tipo") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="fecha_incioLabel" runat="server" Text='<%# Eval("fecha_incio") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="presentacionLabel" runat="server" Text='<%# Eval("presentacion") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="fecha_finalLabel" runat="server" Text='<%# Eval("fecha_final") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="cuestionarioLabel" runat="server" Text='<%# Eval("cuestionario") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="codigo_qrLabel" runat="server" Text='<%# Eval("codigo_qr") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="carta_id_cartaLabel" runat="server" Text='<%# Eval("carta_id_carta") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="salon_id_salonLabel" runat="server" Text='<%# Eval("salon_id_salon") %>' />
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
                                                        <th runat="server"></th>
                                                        <th runat="server">id</th>
                                                        <th runat="server">nombre</th>
                                                        <th runat="server">tipo</th>
                                                        <th runat="server">fecha_incio</th>
                                                        <th runat="server">presentacion</th>
                                                        <th runat="server">fecha_final</th>
                                                        <th runat="server">cuestionario</th>
                                                        <th runat="server">codigo_qr</th>
                                                        <th runat="server">carta_id_carta</th>
                                                        <th runat="server">salon_id_salon</th>
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
                                            <asp:Label ID="tipoLabel" runat="server" Text='<%# Eval("tipo") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="fecha_incioLabel" runat="server" Text='<%# Eval("fecha_incio") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="presentacionLabel" runat="server" Text='<%# Eval("presentacion") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="fecha_finalLabel" runat="server" Text='<%# Eval("fecha_final") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="cuestionarioLabel" runat="server" Text='<%# Eval("cuestionario") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="codigo_qrLabel" runat="server" Text='<%# Eval("codigo_qr") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="carta_id_cartaLabel" runat="server" Text='<%# Eval("carta_id_carta") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="salon_id_salonLabel" runat="server" Text='<%# Eval("salon_id_salon") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="curso_id_cursoLabel" runat="server" Text='<%# Eval("curso_id_curso") %>' />
                                        </td>
                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSourceActividades" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Actividad WHERE (id_actividad = @id)" InsertCommand="INSERT INTO Actividad(nombre, tipo, fecha_incio, fecha_final, presentacion, cuestionario, codigo_qr, carta_id_carta, salon_id_salon, curso_id_curso) VALUES (@nombre, @tipo, @fecha_incio, @fecha_final, @presentacion, @cuestionario, @codigo_qr, @carta_id_carta, @salon_id_salon, @curso_id_curso)" SelectCommand="SELECT id_actividad AS id, nombre, tipo, fecha_incio, presentacion, fecha_final, cuestionario, codigo_qr, carta_id_carta, salon_id_salon, curso_id_curso FROM Actividad WHERE (curso_id_curso = @id_curso)" UpdateCommand="UPDATE Actividad SET tipo = @tipo, nombre = @nombre, fecha_incio = @fecha_incio, fecha_final = @fecha_final, presentacion = @presentacion, cuestionario = @cuestionario, codigo_qr = @codigo_qr, carta_id_carta = @carta_id_carta, salon_id_salon = @salon_id_salon WHERE (id_actividad = @id)">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="nombre" />
                                    <asp:Parameter Name="tipo" />
                                    <asp:Parameter Name="fecha_incio" />
                                    <asp:Parameter Name="fecha_final" />
                                    <asp:Parameter Name="presentacion" />
                                    <asp:Parameter Name="cuestionario" />
                                    <asp:Parameter Name="codigo_qr" />
                                    <asp:Parameter Name="carta_id_carta" />
                                    <asp:Parameter Name="salon_id_salon" />
                                    <asp:Parameter Name="curso_id_curso" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="0" Name="id_curso" QueryStringField="id_curso" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="tipo" />
                                    <asp:Parameter Name="nombre" />
                                    <asp:Parameter Name="fecha_incio" />
                                    <asp:Parameter Name="fecha_final" />
                                    <asp:Parameter Name="presentacion" />
                                    <asp:Parameter Name="cuestionario" />
                                    <asp:Parameter Name="codigo_qr" />
                                    <asp:Parameter Name="carta_id_carta" />
                                    <asp:Parameter Name="salon_id_salon" />
                                    <asp:Parameter Name="id" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <br />
                        </td>
                        <td style="vertical-align:top; text-align:center; width: 115px;">
                            <br />
                        </td>
                        <td>
                                &nbsp;</td>
                    </tr>
    </table>
</asp:Content>
