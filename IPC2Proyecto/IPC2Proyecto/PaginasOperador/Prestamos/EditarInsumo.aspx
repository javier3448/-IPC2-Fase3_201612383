<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarInsumo.aspx.cs" Inherits="IPC2Proyecto.PaginasOperador.Prestamos.EditarInsumo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td>
                <table class="nav-justified">
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                                <h4>Nombre:</h4>
                            </td>
                            <td>
                                <table style="width:100%;">
                                    <tr>
                                        <td><asp:TextBox ID="txbNombre" runat="server" Width="264px"></asp:TextBox></td>
                                        <td>
                                            <p class="text-danger">
                                                <asp:Literal runat="server" ID="FailureText" />
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                <h4>
                                    Descripcion:</h4>
                    
                            </td>
                            <td><asp:TextBox ID="txbDescripcion" runat="server" TextMode="MultiLine" Height="75px" ScrollBars="Both" Width="265px"></asp:TextBox></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                <h4>
                                    Estado:</h4>
                    
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListEstado" runat="server">
                                    <asp:ListItem>excelente</asp:ListItem>
                                    <asp:ListItem>bueno</asp:ListItem>
                                    <asp:ListItem>regular</asp:ListItem>
                                    <asp:ListItem>malo</asp:ListItem>
                                    <asp:ListItem>inhabilitado</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                <h4>
                                    Precio:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <table class="nav-justified">
                                    <tr>
                                        <td>
                                            &nbsp;<asp:TextBox ID="txbPrecio" runat="server" CssClass="drop"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                <h4>
                                    Disponible:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <asp:RadioButton ID="RadioButtonSi" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButtonDisponible_CheckedChanged" Text="Si" />
                                <br />
                                <asp:RadioButton ID="RadioButtonNo" runat="server" AutoPostBack="True" OnCheckedChanged="RadioButtonDisponible0_CheckedChanged" Text="No" />
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
            
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                            </td>
                            <td style="height: 39px">
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                &nbsp;</td>
                            <td>
                                <table style="width:100%;">
                                    <tr>
                                        <td style="width: 331px">
                                <asp:Button ID="Save" runat="server" Text="Guardar" Class="btn btn-primary" OnClick="Save_Click" />
                                        </td>
                                        <td>
                                            <asp:Button ID="Cancel" runat="server" Text="Cancelar" Class="btn btn-primary" OnClick="Cancel_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table style="width: 100%;" align="center">
        <tr>
            <td><h3 class="text-center">Prestamos</h3></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourcePrestamos">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFFFFF;color: #284775;">
                            <td>
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
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
                                <asp:Label ID="usuario_id_usuarioLabel" runat="server" Text='<%# Eval("usuario_id_usuario") %>' />
                            </td>
                            <td>
                                <asp:Button ID="btnDetalles" runat="server" Text="Detalles" OnCommand="btnDetallesCommand" CommandName='<%# Eval("id") %>'/>
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
                                <asp:TextBox ID="usuario_id_usuarioTextBox" runat="server" Text='<%# Bind("usuario_id_usuario") %>' />
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
                                <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                            </td>
                            <td>
                                <asp:Label ID="fechaLabel" runat="server" Text='<%# Eval("fecha") %>' />
                            </td>
                            <td>
                                <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                            </td>
                            <td>
                                <asp:Label ID="usuario_id_usuarioLabel" runat="server" Text='<%# Eval("usuario_id_usuario") %>' />
                            </td>
                            <td>
                                <asp:Button ID="btnDetalles" runat="server" Text="Detalles" OnCommand="btnDetallesCommand" CommandName='<%# Eval("id") %>' />
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
                                            <th runat="server">fecha</th>
                                            <th runat="server">estado</th>
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
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
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
                                <asp:Label ID="usuario_id_usuarioLabel" runat="server" Text='<%# Eval("usuario_id_usuario") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourcePrestamos" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" SelectCommand="SELECT id_prestamo AS id, descripcion, fecha, estado, usuario_id_usuario FROM Prestamo
WHERE insumo_id_insumo = @idInsumo" UpdateCommand="UPDATE Prestamo SET descripcion = @descripcion, fecha = @fecha, estado = @estado, usuario_id_usuario = @usuario_id_usuario">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="idInsumo" QueryStringField="idInsumo" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="descripcion" />
                        <asp:Parameter Name="fecha" />
                        <asp:Parameter Name="estado" />
                        <asp:Parameter Name="usuario_id_usuario" />
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
                
                <asp:Button ID="Agregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="Agregar_Click"/>
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
