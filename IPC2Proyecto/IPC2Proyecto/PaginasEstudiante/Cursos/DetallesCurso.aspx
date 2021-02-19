<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallesCurso.aspx.cs" Inherits="IPC2Proyecto.PaginasEstudiante.Cursos.DetallesCurso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <div class="jumbotron">
                    <h2>Detalles de curso</h2>
                    <h4>Si desea asignarse presione el boton Asignar</h4>
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
                            <asp:TextBox ID="TBNombre" runat="server" Width="264px" ReadOnly="True"></asp:TextBox>

                        </td>
                        <td style="height: 43px"></td>
                    </tr>
                 
                    <tr>
                        <td>
                            <h4>Ciclo:</h4>
                        </td>
                            <td>
                                <asp:TextBox ID="TBCiclo" runat="server" ReadOnly="True" Width="260px"></asp:TextBox>
                            </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <h4>Catedratico:</h4>
                        </td>
                            <td>
                                <asp:TextBox ID="TBCatedratico" runat="server" ReadOnly="True" Width="260px"></asp:TextBox>
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
                            <asp:Calendar ID="CalendarInicial" runat="server" style="margin-left: 2px" Enabled="False"></asp:Calendar>
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
                            <asp:Calendar ID="CalendarFinal" runat="server" Enabled="False"></asp:Calendar>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                     <tr>
                        <td style="height: 43px">
                        </td>
                        <td style="height: 43px">

                            <br />
                            <asp:Button ID="Asignar" runat="server" Text="Asignar" Class="btn btn-primary" OnClick="Asignar_Click"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RadioButton ID="RBTraslapes" runat="server" Text="Traslapes" />
                            <br />
                            <br />

                        </td>
                        <td style="height: 43px"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
                        <td style="vertical-align:top;">
                            <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceActividad">
                                <AlternatingItemTemplate>
                                    <tr style="background-color: #FFFFFF;color: #284775;">
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
                                            <asp:Label ID="_SalonLabel" runat="server" Text='<%# Eval("_Salon") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="edificioLabel" runat="server" Text='<%# Eval("edificio") %>' />
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
                                            <asp:TextBox ID="_SalonTextBox" runat="server" Text='<%# Bind("_Salon") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="edificioTextBox" runat="server" Text='<%# Bind("edificio") %>' />
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
                                            <asp:TextBox ID="fecha_incioTextBox" runat="server" Text='<%# Bind("fecha_incio") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="fecha_finalTextBox" runat="server" Text='<%# Bind("fecha_final") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="_SalonTextBox" runat="server" Text='<%# Bind("_Salon") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="edificioTextBox" runat="server" Text='<%# Bind("edificio") %>' />
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
                                            <asp:Label ID="fecha_incioLabel" runat="server" Text='<%# Eval("fecha_incio") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="fecha_finalLabel" runat="server" Text='<%# Eval("fecha_final") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="_SalonLabel" runat="server" Text='<%# Eval("_Salon") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="edificioLabel" runat="server" Text='<%# Eval("edificio") %>' />
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
                                                        <th runat="server">fecha_incio</th>
                                                        <th runat="server">fecha_final</th>
                                                        <th runat="server">_Salon</th>
                                                        <th runat="server">edificio</th>
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
                                            <asp:Label ID="fecha_incioLabel" runat="server" Text='<%# Eval("fecha_incio") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="fecha_finalLabel" runat="server" Text='<%# Eval("fecha_final") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="_SalonLabel" runat="server" Text='<%# Eval("_Salon") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="edificioLabel" runat="server" Text='<%# Eval("edificio") %>' />
                                        </td>
                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSourceActividad" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" SelectCommand="SELECT Actividad.id_actividad AS id, Actividad.nombre, Actividad.fecha_incio, Actividad.fecha_final, Salon.nombre AS _Salon, Salon.edificio FROM Actividad INNER JOIN Salon ON Actividad.salon_id_salon = Salon.id_salon WHERE (Actividad.curso_id_curso = @id_curso)">
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="0" Name="id_curso" QueryStringField="id_curso" />
                                </SelectParameters>
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
