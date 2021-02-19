<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarPrestamo.aspx.cs" Inherits="IPC2Proyecto.PaginasOperador.Prestamos.EditarPrestamo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <table class="nav-justified">
        <tr>
                                    <td class="modal-sm" style="width: 206px">
                                        &nbsp;
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="modal-sm" style="width: 206px">
                                        <h4>Descripcion:</h4>
                                    </td>
                                    <td>
                                        <table style="width:100%;">
                                            <tr>
                                                <td style="height: 30px"><asp:TextBox ID="txbDescripcion" runat="server" Width="264px" Height="44px" TextMode="MultiLine"></asp:TextBox></td>
                                                <td style="height: 30px">
                                                    <p class="text-danger">
                                                        <asp:Literal ID="LiteralError" runat="server"></asp:Literal>
                                                    </p>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                        <h4>
                                            Estado:</h4>
                    
                                    </td>
                                    <td style="height: 39px">
                                        <asp:DropDownList ID="ListEstado" runat="server" AutoPostBack="True">
                                            <asp:ListItem>resuelto</asp:ListItem>
                                            <asp:ListItem>pendiente</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="height: 39px"></td>
                                </tr>
                                <tr>
                                    <td class="modal-sm" style="width: 206px">
                    
                                        <h4>
                                            Fecha:</h4>
                    
                                    </td>
                                    <td>
                                        <table style="width:100%;">
                                            <tr>
                                                <td>
                                                    Dia: <asp:TextBox ID="txbDia" runat="server" ReadOnly="True"></asp:TextBox>
                                                </td>
                                                <td>Mes: <asp:TextBox ID="txbMes" runat="server" ReadOnly="True"></asp:TextBox>
                                                </td>
                                                <td>Año: <asp:TextBox ID="txbAno" runat="server"></asp:TextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                        <h4>
                                            Insumo:</h4>
                    
                                    </td>
                                    <td style="height: 39px">
                                        <asp:TextBox ID="txbNombreInsumo" runat="server" Width="125px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td style="height: 39px"></td>
                                </tr>
                                <tr>
                                    <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                        <h4>
                                            Carne :</h4>
                    
                                    </td>
                                    <td style="height: 39px">
                                        <asp:TextBox ID="txbCarneEstudiante" runat="server" Width="125px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td style="height: 39px"></td>
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

    <table style="width: 100%;" align="center">
        <tr>
            <td><h3 class="text-center">Incidente</h3></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceIncidentes">
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
                                            <th runat="server"></th>
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
                                <asp:Label ID="prestamo_id_prestamoLabel" runat="server" Text='<%# Eval("prestamo_id_prestamo") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourceIncidentes" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" DeleteCommand="DELETE FROM Incidente_insumo WHERE (id_incidente_insumo = @id)" SelectCommand="SELECT id_incidente_insumo AS id, descripcion, costo, estado, activo, prestamo_id_prestamo FROM Incidente_insumo WHERE (prestamo_id_prestamo = @idPrestamo)" UpdateCommand="UPDATE Incidente_insumo SET descripcion = @descripcion, costo = @costo, estado = @estado, activo = @activo, prestamo_id_prestamo = @prestamo_id_prestamo">
                    <DeleteParameters>
                        <asp:Parameter Name="id" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="idPrestamo" QueryStringField="idPrestamo" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="descripcion" />
                        <asp:Parameter Name="costo" />
                        <asp:Parameter Name="estado" />
                        <asp:Parameter Name="activo" />
                        <asp:Parameter Name="prestamo_id_prestamo" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="text-left">
                
                <table style="width:100%;">
                    <tr>
                        <td class="modal-sm" style="width: 353px">&nbsp;</td>
                        <td>
                
                <asp:Button ID="Button1" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="Button1_Click"/>
                        </td>
                    </tr>
                </table>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
