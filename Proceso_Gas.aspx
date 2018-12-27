<%@ Page Title="SINO | Captura de datos: Proceso de Gas" Language="VB" MasterPageFile="~/SistemaInteligenciaNegociosOxiteno.master" AutoEventWireup="false" CodeFile="Proceso_Gas.aspx.vb" Inherits="Proceso_Gas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Ps_G" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="Panel_main" runat="server">
        <h2>Proceso Gas</h2>
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
                <td colspan="10" class="style1">
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
                    Gas Humedo Amargo</td>
                <td >
                    Gas Humedo Dulce</td>
                <td >
                    Gas Seco</td>
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
                    <asp:TextBox ID="txtGasHumedoAmargo" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtGasHumedoDulce" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtGasSeco" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td  >
                    <title>Miles de Barriles Diarios</title>
                    <asp:TextBox ID="txtUDM" Text="MMPCD" runat="server" CssClass="Txt" 
                        ReadOnly="True" ToolTip="Millones de Pies cubicos Diarios"></asp:TextBox>
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
                        ControlToValidate="txtGasHumedoAmargo" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_5" runat="server" 
                        ControlToValidate="txtGasHumedoDulce" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_6" runat="server" 
                        ControlToValidate="txtGasSeco" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
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
        <h2>Tabla de registros: [SINOXCarga004_Proceso_Gas] -- Producción</h2>
        <center>
            <asp:GridView ID="GV_Datos" runat="server" AutoGenerateColumns="False" 
                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                CellPadding="4" DataSourceID="SqlDS_Proceso_Gas_Final" ForeColor="Black" 
                AllowPaging="True" AllowSorting="True" 
                DataKeyNames="SINOXCarga004_Año,SINOXCarga004_Mes" Width="100%" 
                CellSpacing="2" PageSize="12" style="text-align: center">
                <Columns>
                    <asp:BoundField DataField="SINOXCarga004_Año" HeaderText="Año" 
                        SortExpression="SINOXCarga004_Año" ReadOnly="True" />
                    <asp:BoundField DataField="SINOXCarga004_Mes" HeaderText="Mes" 
                        SortExpression="SINOXCarga004_Mes" ReadOnly="True" />
                    <asp:BoundField DataField="SINOXCarga004_GasHumedoAmardo" HeaderText="Gas Humedo Amargo" 
                        SortExpression="SINOXCarga004_GasHumedoAmardo" />
                    <asp:BoundField DataField="SINOXCarga004_GasHumedoDulce" HeaderText="Gas Humedo Dulce" 
                        SortExpression="SINOXCarga004_GasHumedoDulce" />
                    <asp:BoundField DataField="SINOXCarga004_GasSeco" HeaderText="Gas Seco" 
                        SortExpression="SINOXCarga004_GasSeco" />
                    <asp:BoundField DataField="SINOXCarga004_UDM" HeaderText="UDM" 
                        SortExpression="SINOXCarga004_UDM" />
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
            <asp:SqlDataSource ID="SqlDS_Proceso_Gas_Final" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZSINOConnectionString1 %>" 
                SelectCommand="SELECT * FROM [SINOXCarga004_Proceso_Gas] ORDER BY [SINOXCarga004_Año] DESC, [SINOXCarga004_Mes] DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDS_Pruebas_procesoGas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZOI1_prueba %>" 
                SelectCommand="SELECT * FROM [BKUP_Proceso_Gas] ORDER BY [SINOXCarga004_Año] DESC, [SINOXCarga004_Mes] DESC">
            </asp:SqlDataSource>
        </center>
    </div>

</asp:Content>

