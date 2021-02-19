<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendario.aspx.cs" Inherits="IPC2Proyecto.PaginasOperador.Calendario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 20px" class="text-center">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="id_salon" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ModelDatabase1 %>" SelectCommand="SELECT id_salon, nombre FROM Salon WHERE (activo = 1)"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width:100%; height: 390px;">
                        <tr>
                            <td style="height: 20px; width: 122px"></td>
                            <td style="height: 20px; width: 565px"></td>
                            <td style="height: 20px"></td>
                        </tr>
                        <tr>
                            <td style="height: 20px; width: 122px">&nbsp;</td>
                            <td class="text-left" style="height: 20px; width: 565px">
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="300px" NextPrevFormat="ShortMonth" Width="500px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                                    <DayStyle BackColor="#CCCCCC" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                                    <TodayDayStyle BackColor="#999999" ForeColor="White" />
                                </asp:Calendar>
                            </td>
                            <td style="height: 20px">
                                <asp:Panel ID="Panel1" runat="server" Height="350px" ScrollBars="Both">
                                    <asp:Table ID="Table1" runat="server" BorderColor="Black" BorderStyle="Solid" CellPadding="10" CellSpacing="5" Font-Size="Large" ViewStateMode="Disabled" CssClass="table-condensed">
                                    </asp:Table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="modal-sm" style="width: 122px">&nbsp;</td>
                            <td style="width: 565px">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</asp:Content>

