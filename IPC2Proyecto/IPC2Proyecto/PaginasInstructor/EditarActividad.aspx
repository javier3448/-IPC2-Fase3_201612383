<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarActividad.aspx.cs" Inherits="IPC2Proyecto.PaginasInstructor.EditarActividad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table class="nav-justified">
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                                
                            </td>
                            <td>
                                <p class="text-danger">
                                    &nbsp;</p>
                                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>            
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                                <h4>Nombre:</h4>
                            </td>
                            <td>
                                <table style="width:100%;">
                                    <tr>
                                        <td><asp:TextBox ID="txbNombre" runat="server" Width="264px" ReadOnly="True"></asp:TextBox></td>
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
                                <asp:TextBox ID="txbTipo" runat="server" Width="264px" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px">
                    
                                <h4>
                                    Inicio:</h4>
                    
                            </td>
                            <td>
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            Dia: <asp:TextBox ID="txbDiaInicio" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>Mes: <asp:TextBox ID="txbMesInicio" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>Año: <asp:TextBox ID="txbAnoInicio" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>Hora: <asp:TextBox ID="txbHoraInicio" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                <h4>
                                    Final:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            Dia: <asp:TextBox ID="txbDiaFinal" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>Mes: <asp:TextBox ID="txbMesFinal" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>Año: <asp:TextBox ID="txbAnoFinal" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>Hora: <asp:TextBox ID="txbHoraFinal" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;  vertical-align:top">
                    
                                <h4>
                                    Carta:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <table style="width:100%;">
                                    <tr>
                                        <td style="height: 25px; width: 127px;">id:<asp:TextBox ID="txbIdCarta" runat="server" Width="70px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td style="height: 25px">
                                            <asp:Panel ID="Panel1" runat="server" Height="350px" ScrollBars="Both" Width="433px">
                                                <asp:Image ID="ImagenCarta" runat="server" />
                                            </asp:Panel>
                                        </td>
                                        <td style="height: 25px"></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                <h4>
                                    Salon:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            &nbsp;<asp:TextBox ID="txbSalonId" runat="server" ReadOnly="True"></asp:TextBox>
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
                                    Curso:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <asp:TextBox ID="txbCurso" runat="server" Width="263px" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                <h4>
                                    Presentacion:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <br />
                                <asp:TextBox ID="txbPresentacion" runat="server" Width="263px" ReadOnly="True"></asp:TextBox>
                                <asp:Button ID="BTNDescargarPresentacion" runat="server" Text="Descargar" Class="btn btn-primary" CssClass="btn-info" OnClick="BTNDescargarPresentacion_Click"/>
                                <p class="text-success">
                                <asp:Literal runat="server" ID="LiteralPresentacion" />
                                </p>
                                <br />
                                <asp:FileUpload ID="FileUploadPresentacion" runat="server" />
                                <asp:Button ID="BTNSubirPresentacion" runat="server" Text="Subir" Class="btn btn-primary" CssClass="btn-info" OnClick="BTNSubirPresentacion_Click"/>
                                <br />
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                <h4>
                                    Cuestionario:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <br />
                                <asp:TextBox ID="txbCuestionario" runat="server" Width="263px"></asp:TextBox>
                                <asp:Button ID="BTNDescargarCuestionario" runat="server" Text="Descargar" Class="btn btn-primary" CssClass="btn-info" OnClick="BTNDescargarCuestionario_Click"/>
                                <p class="text-success">  
                                    <asp:Literal runat="server" ID="LiteralCuestionario" />
                                </p>
                                <br />
                                <asp:FileUpload ID="FileUploadCuestionario" runat="server" />
                                <asp:Button ID="BTNSubirCuestionario" runat="server" Text="Subir" Class="btn btn-primary" CssClass="btn-info" OnClick="BTNSubirCuestionario_Click"/>
                                <br />
                            </td>
                            <td style="height: 39px"></td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 206px; height: 39px;">
                    
                                <h4>
                                    QR:</h4>
                    
                            </td>
                            <td style="height: 39px">
                                <asp:TextBox ID="txbCodigo" runat="server" Width="263px" ReadOnly="True"></asp:TextBox>
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

</asp:Content>
