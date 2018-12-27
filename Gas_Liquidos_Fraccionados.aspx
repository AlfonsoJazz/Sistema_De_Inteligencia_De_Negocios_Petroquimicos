<%@ Page Title="SINO | Captura de datos: P. Gas Liquidos Fraccionados" Language="VB" MasterPageFile="~/SistemaInteligenciaNegociosOxiteno.master" AutoEventWireup="false" CodeFile="Gas_Liquidos_Fraccionados.aspx.vb" Inherits="Gas_Liquidos_Fraccionados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="G_L_F" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="Panel_main" runat="server">
        <h2>Producción de Gas Liquidos Fraccionados</h2>
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
                <td colspan="11" class="style1">
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
                    Etano</td>
                <td >
                    Gas Licuado</td>
                <td >
                    Gasolinas</td>
                <td >
                    Otros</td>
                <td >
                    Unidad de Medida
                </td>
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
                    <asp:TextBox ID="txtEtano" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtGasLicuado" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtGasolinas" onkeypress="return numbersonly(event)" 
                        runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtOtros" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
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
                        ToolTip="Edita el último registro en la base de datos" 
                        CausesValidation="false" Width="30px" style="height: 30px" />
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_4" runat="server" 
                        ControlToValidate="txtEtano" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_5" runat="server" 
                        ControlToValidate="txtGasLicuado" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_6" runat="server" 
                        ControlToValidate="txtGasolinas" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_7" runat="server" 
                        ControlToValidate="txtOtros" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
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
 <div id="PanelRevision" >
        <hr />
        <h2>Tabla de registros: [SINOXCarga003_Proceso_GasLiquidosFraccionados] -- 
            Producción</h2>
            <asp:GridView ID="GV_Datos" runat="server" AutoGenerateColumns="False" 
                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                CellPadding="4" DataSourceID="SQLDS_GLF_PROD" ForeColor="Black" 
            AllowPaging="True" AllowSorting="True" Width="100%" fon CellSpacing="2" 
            PageSize="12" style="text-align: center"> 
                <Columns>
                    <asp:BoundField DataField="SINOXCarga003_Año" HeaderText="Año" 
                        SortExpression="SINOXCarga003_Año" />
                    <asp:BoundField DataField="SINOXCarga003_Mes" HeaderText="Mes" 
                        SortExpression="SINOXCarga003_Mes" />
                    <asp:BoundField DataField="SINOXCarga003_LiquidosFraccionados" HeaderText="Liquidos Fraccionados" 
                        SortExpression="SINOXCarga003_LiquidosFraccionados" />
                    <asp:BoundField DataField="SINOXCarga003_LF_Etano" HeaderText="Etano" 
                        SortExpression="SINOXCarga003_LF_Etano" />
                    <asp:BoundField DataField="SINOXCarga003_LF_GasLicuado" HeaderText="Gas Licuado" 
                        SortExpression="SINOXCarga003_LF_GasLicuado" />
                    <asp:BoundField DataField="SINOXCarga003_LF_Gasolina" HeaderText="Gasolina" 
                        SortExpression="SINOXCarga003_LF_Gasolina" />
                    <asp:BoundField DataField="SINOXCarga003_LF_Otros" 
                        HeaderText="Otros" 
                        SortExpression="SINOXCarga003_LF_Otros" />
                    <asp:BoundField DataField="SINOXCarga003_UDM" 
                        HeaderText="UDM" SortExpression="SINOXCarga003_UDM" />
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
        <center>
            <asp:SqlDataSource ID="SQLDS_GLF_PROD" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZSINOConnectionString1 %>" 
                SelectCommand="SELECT * FROM [SINOXCarga003_Proceso_GasLiquidosFraccionados] ORDER BY [SINOXCarga003_Año] DESC, [SINOXCarga003_Mes] DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SQLDS_PruebasGLF" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZOI1_prueba %>" 
                SelectCommand="SELECT * FROM [BKUP_Proceso_GasLiquidosFraccionados] ORDER BY [SINOXCarga003_Año] DESC, [SINOXCarga003_Mes] DESC">
            </asp:SqlDataSource>
        </center>
    </div>
</asp:Content>

