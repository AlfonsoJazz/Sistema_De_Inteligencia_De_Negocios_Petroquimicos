<%@ Page Title="SINO | Importación Etanol" Language="VB" MasterPageFile="~/SistemaInteligenciaNegociosOxiteno.master" AutoEventWireup="false" CodeFile="Importacion_Etanol.aspx.vb" Inherits="Importacion_Etanol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="i_e" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="Panel_main" runat="server">
        <h2>Importación Etanol</h2>
    <div id="Hidrocarburos_Liquidos_1">
        <%--script de solo numeros--%>
    <script type="text/javascript">
        function numbersonly(e) {
            var unicode = e.charCode ? e.charCode : e.keyCode
            if (unicode != 8 && unicode != 44) {
                if (unicode < 48 || unicode > 57) //if not a number
                { return false } //disable key press    
            }
        }  
    </script>
    
        <table id="Tabla_1" class="page2">
            <tr>
                <td colspan="12" class="style1">
                    <br />
                    Captura un nuevo registro
                    <asp:Label ID="Lerror" runat="server" style="color: #FF0000; font-weight: 700" 
                        Visible="False"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    Año</td>
                <td >
                    Mes</td>
                <td >
                    Etanol MT</td>
                <td >
                    Etanol MDB</td>
                <td >
                    Densidad</td>
                <td >
                    Factor</td>
                <td >
                    Días</td>
                <td >
                    Unidad de medida</td>
                <td >
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:DropDownList ID="dropAño" runat="server">
                    </asp:DropDownList>
                    <asp:TextBox ID="txtaño0" runat="server" CssClass="Txt" 
                        onkeypress="return numbersonly(event)" ReadOnly="True" Visible="False"></asp:TextBox>
                </td>
                <td >
                    <asp:DropDownList ID="dropMes" runat="server">
                    </asp:DropDownList>
                    <asp:TextBox ID="txtMes0" runat="server" CssClass="Txt" 
                        onkeypress="return numbersonly(event)" ReadOnly="True" Visible="False"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtMT" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtMDB" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtDensidad" onkeypress="" runat="server" CssClass="Txt" 
                        ReadOnly="True" Enabled="False"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtFactor" onkeypress="" runat="server" CssClass="Txt" 
                        ReadOnly="True" Enabled="False"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtDias" onkeypress="return numbersonly(event)" runat="server" 
                        CssClass="Txt" ReadOnly="True" Enabled="False"></asp:TextBox>
                </td>
                <td  >
                    <asp:TextBox ID="txtUDM" Text="MBD" runat="server" CssClass="Txt" 
                        ReadOnly="True" ToolTip="Miles de Barriles Diarios"></asp:TextBox>
                </td>
                <td class="style10" >
                    <asp:ImageButton ID="btn_edit" runat="server" ImageUrl="~/uiResources/saveicon.png" 
                        Width="30px" ToolTip="Actualizar registro en la base de datos" 
                        Visible="False"/>
                </td>
                <td class="style10">
                    <asp:ImageButton ID="btn_cancel" runat="server" 
                        ImageUrl="~/uiResources/delete.png"
                        ToolTip="Cancelar transacción" Visible="False" 
                        Width="30px" CausesValidation="false" />
                </td>
                <td class="style10">
                    <asp:ImageButton ID="add" runat="server" ImageUrl="~/uiResources/add_icon.png" 
                        ToolTip="Agregar registro a la base de datos" ValidationGroup="" Width="30px" />
                </td>
                <td class="style10">
                    <asp:ImageButton ID="editar" runat="server" ImageUrl="~/uiResources/Edit.png"
                        ToolTip="Edita el último registro en la base de datos" CausesValidation="false" Width="30px" />
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_4" runat="server" 
                        ControlToValidate="txtMT" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_5" runat="server" 
                        ControlToValidate="txtMDB" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_6" runat="server" 
                        ControlToValidate="txtDensidad" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_7" runat="server" 
                        ControlToValidate="txtFactor" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_8" runat="server" 
                        ControlToValidate="txtDias" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td  >
                        &nbsp;</td>
                <td  >
                        &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </asp:Panel>
    <br />
    <div id="PanelRevision">
        <hr />
        <h2>Tabla de registros: [SINOXCarga006_ImportacionEtanol] -- Producción</h2>
        <center>
            <asp:GridView ID="GV_Datos" runat="server" AutoGenerateColumns="False" 
                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                CellPadding="4" DataSourceID="SqlDS_Final_ImportEtanol" ForeColor="Black" 
                AllowPaging="True" AllowSorting="True" Width="100%" CellSpacing="2" 
                PageSize="12" style="text-align: center">
                <Columns>
                    <asp:BoundField DataField="SINOXCarga006_Año" HeaderText="Año" 
                        SortExpression="SINOXCarga006_Año" />
                    <asp:BoundField DataField="SINOXCarga006_Mes" HeaderText="Mes" 
                        SortExpression="SINOXCarga006_Mes" />
                    <asp:BoundField DataField="SINOXCarga006_EtanolMT" HeaderText="Etanol MT" 
                        SortExpression="SINOXCarga006_EtanolMT" />
                    <asp:BoundField DataField="SINOXCarga006_EtanolMDB" HeaderText="Etanol MDB" 
                        SortExpression="SINOXCarga006_EtanolMDB" />
                    <asp:BoundField DataField="SINOXCarga006_Densidad" HeaderText="Densidad" 
                        SortExpression="SINOXCarga006_Densidad" />
                    <asp:BoundField DataField="SINOXCarga006_Factor" HeaderText="Factor" 
                        SortExpression="SINOXCarga006_Factor" />
                    <asp:BoundField DataField="SINOXCarga006_Dias" 
                        HeaderText="Dias" 
                        SortExpression="SINOXCarga006_Dias" />
                    <asp:BoundField DataField="SINOXCarga003_UDM" 
                        HeaderText="UDM" 
                        SortExpression="SINOXCarga003_UDM" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDS_Final_ImportEtanol" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZSINOConnectionString1 %>" 
                SelectCommand="SELECT * FROM [SINOXCarga006_ImportacionEtanol] ORDER BY [SINOXCarga006_Año] DESC, [SINOXCarga006_Mes] DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_pruebas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZOI1_prueba %>" 
                SelectCommand="SELECT * FROM [BKUP_ImportacionEtanol] ORDER BY [SINOXCarga006_Año] DESC, [SINOXCarga006_Mes] DESC">
            </asp:SqlDataSource>
        </center>
    </div>
</asp:Content>

