<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarActividad.aspx.cs" Inherits="IPC2Proyecto.PaginasOperador.EditarActividad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width:100%;">
        <tr>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td>
                <table class="nav-justified">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="FailureText" />
                            </p>
                        </td>
                    </tr>    
                    <tr>
                            <td class="modal-sm" style="width: 206px">
                                <h4>Nombre:</h4>
                            </td>
                            <td>
                                <table style="width:100%;">
                                    <tr>
                                        <td><asp:TextBox ID="txbNombre" runat="server" Width="264px"></asp:TextBox></td>
                                        <td><asp:Literal ID="LiteralIdSalon" runat="server"></asp:Literal></td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                <h4>
                                    Tipo:</h4>
                    
                            </td>
                            <td>
                                <asp:DropDownList ID="ListTipo" runat="server" AutoPostBack="True">
                                    <asp:ListItem>lab</asp:ListItem>
                                    <asp:ListItem>curso</asp:ListItem>
                                    <asp:ListItem>taller</asp:ListItem>
                                    <asp:ListItem>mantenimiento</asp:ListItem>
                                    <asp:ListItem>feriado</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                <h4>
                                    Fecha:</h4>
                    
                            </td>
                            <td>
                                <asp:TextBox ID="TBFecha" runat="server" ReadOnly="True" Width="264px"></asp:TextBox>
                                <asp:Calendar ID="CalendarFecha" runat="server" OnSelectionChanged="CalendarFecha_SelectionChanged" style="margin-left: 2px"></asp:Calendar>
                            </td>
                
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                <h4>
                                    Hora:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <table style="width:100%;">
                                    <tr>
                                        <td>Inicio:<asp:TextBox ID="TBHoraInicio" runat="server"></asp:TextBox>
                                        </td>
                                        <td>Final:<asp:TextBox ID="TBHoraFinal" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                <h4>
                                    Carta:</h4>
                    
                            </td>
                            <td>
                                id:<asp:TextBox ID="txbIdCarta" runat="server" Width="70px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 32px;">
                    
                                <h4>
                                    Salon:</h4>
                    
                            </td>
                            <td style="height: 32px">
                                <asp:DropDownList ID="DDLSalon" runat="server" DataSourceID="SqlDataSourceSalons" DataTextField="nombre" DataValueField="id_salon">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceSalons" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" SelectCommand="SELECT id_salon, nombre FROM Salon"></asp:SqlDataSource>
                            </td>
                            <td style="height: 32px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                <h4>
                                    Curso:</h4>
                    
                            </td>
                            <td>
                                <asp:DropDownList ID="DDLCurso" runat="server" DataSourceID="SqlDataSourceCurso" DataTextField="nombre" DataValueField="id_curso">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceCurso" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" SelectCommand="SELECT id_curso, nombre FROM Curso"></asp:SqlDataSource>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
            
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                            </td>
                            <td style="height: 39px">
                                &nbsp;</td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                &nbsp;</td>
                            <td>
                                <table style="width:100%;">
                                    <tr>
                                        <td style="width: 331px">
                                <asp:Button ID="Save" runat="server" Text="Guardar" Class="btn btn-primary" OnClick="Save_Click"/>
                                        </td>
                                        <td>
                                            <asp:Button ID="Cancel" runat="server" Text="Cancelar" Class="btn btn-primary" OnClick="Cancel_Click"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><h3 class="text-center">Matriculaciones</h3></td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceAsignacion" InsertItemPosition="LastItem">
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
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
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
                                            <th runat="server"></th>
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
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
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

                        </td>
                    </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><h3 class="text-center">Incidentes</h3></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceIncidentes" InsertItemPosition="LastItem">
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
                                <asp:TextBox ID="actividad_id_actividadTextBox" runat="server" Text='<%# Bind("actividad_id_actividad") %>' />
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
                                            <th runat="server"></th>
                                            <th runat="server">id</th>
                                            <th runat="server">descripcion</th>
                                            <th runat="server">costo</th>
                                            <th runat="server">estado</th>
                                            <th runat="server">activo</th>
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
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
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
                                <asp:Label ID="actividad_id_actividadLabel" runat="server" Text='<%# Eval("actividad_id_actividad") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>

                        <asp:SqlDataSource ID="SqlDataSourceIncidentes" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Incidente_salon WHERE (id_incidente_salon = @id)" InsertCommand="INSERT INTO Incidente_salon(costo, descripcion, estado, activo, actividad_id_actividad) VALUES (@costo, @descripcion, @estado, @activo, @actividad_id_actividad)" SelectCommand="SELECT id_incidente_salon AS id, descripcion, costo, estado, activo, actividad_id_actividad FROM Incidente_salon WHERE (actividad_id_actividad = @idQueryString)" UpdateCommand="UPDATE Incidente_salon SET costo = @costo, descripcion = @descripcion, estado = @estado, activo = @activo, actividad_id_actividad = @actividad_id_actividad">
                            <DeleteParameters>
                                <asp:Parameter Name="id" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="costo" />
                                <asp:Parameter Name="descripcion" />
                                <asp:Parameter Name="estado" />
                                <asp:Parameter Name="activo" />
                                <asp:Parameter Name="actividad_id_actividad" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="idQueryString" QueryStringField="idActividad" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="costo" />
                                <asp:Parameter Name="descripcion" />
                                <asp:Parameter Name="estado" />
                                <asp:Parameter Name="activo" />
                                <asp:Parameter Name="actividad_id_actividad" />
                            </UpdateParameters>
                </asp:SqlDataSource>

                        </td>
                    </tr>
    </table>

    <asp:SqlDataSource ID="SqlDataSourceAsignacion" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Matricula WHERE (id_matricula = @id)" InsertCommand="INSERT INTO Matricula(asistencia, respuestas_cuestionario, usuario_estudiante, actividad_id_actividad) VALUES (@asistencia, @respuestas_cuestionario, @usuario_estudiante, @actividad_id_actividad)" SelectCommand="SELECT id_matricula AS id, asistencia, respuestas_cuestionario, usuario_estudiante, actividad_id_actividad FROM Matricula WHERE (actividad_id_actividad = @idQueryString)" UpdateCommand="UPDATE Matricula SET asistencia = @asistencia, respuestas_cuestionario = @respuestas_cuestionario, usuario_estudiante = @usuario_estudiante, actividad_id_actividad = @actividad_id_actividad
WHERE id_matricula = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="asistencia" />
            <asp:Parameter Name="respuestas_cuestionario" />
            <asp:Parameter Name="usuario_estudiante" />
            <asp:Parameter Name="actividad_id_actividad" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idQueryString" QueryStringField="idActividad" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="asistencia" />
            <asp:Parameter Name="respuestas_cuestionario" />
            <asp:Parameter Name="usuario_estudiante" />
            <asp:Parameter Name="actividad_id_actividad" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
