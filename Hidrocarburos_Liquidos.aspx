<%@ Page Title="SINO | Captura de datos: P. Hidrocarburos Liquidos" Language="VB" MasterPageFile="~/SistemaInteligenciaNegociosOxiteno.master" AutoEventWireup="false" CodeFile="Hidrocarburos_Liquidos.aspx.vb" Inherits="Hidrocarburos_Liquidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
        </style>

</asp:Content>
<asp:Content ID="H_L" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="Panel_main" runat="server">
        <h2>Producción de Hidrocarburos Liquidos</h2>
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
                <td colspan="14" class="style1">
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
                    Crudo Pesado</td>
                <td >
                    Crudo Ligero</td>
                <td >
                    Crudo Super Ligero</td>
                <td >
                    Región Marina</td>
                <td >
                    Región Sur</td>
                <td >
                    Región Norte</td>
                <td >
                    Liquido Gas
                </td>
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
                    <asp:TextBox ID="txtCrudoPesado" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtCrudoLigero" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtCrudoSuperLigero" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtAguas" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtCrudoSur" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtCrudoNorte" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtLiquidoGas" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td  >
                    <title>Miles de Barriles Diarios</title>
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
                        ControlToValidate="txtCrudoPesado" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_5" runat="server" 
                        ControlToValidate="txtCrudoLigero" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_6" runat="server" 
                        ControlToValidate="txtCrudoSuperLigero" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_7" runat="server" 
                        ControlToValidate="txtAguas" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_8" runat="server" 
                        ControlToValidate="txtCrudoSur" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_9" runat="server" 
                        ControlToValidate="txtCrudoNorte" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_10" runat="server" 
                        ControlToValidate="txtLiquidoGas" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
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
        <h2>Tabla de registros: [SINOXCarga001_ProduccionHidrocarburosLiquidos] --Producción</h2>
        <center>
            <asp:GridView ID="GV_Datos" runat="server" AutoGenerateColumns="False" 
                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                CellPadding="4" DataSourceID="sqlds_final" ForeColor="Black" 
                AllowPaging="True" AllowSorting="True" Width="100%" 
                style="text-align: center" CellSpacing="2" PageSize="12">
                <Columns>
                    <asp:BoundField DataField="SINOXCarga001_Año" HeaderText="Año" 
                        SortExpression="SINOXCarga001_Año" />
                    <asp:BoundField DataField="SINOXCarga001_Mes" HeaderText="Mes" 
                        SortExpression="SINOXCarga001_Mes" />
                    <asp:BoundField DataField="SINOXCarga001_Total" HeaderText="Total" 
                        SortExpression="SINOXCarga001_Total" />
                    <asp:BoundField DataField="SINOXCarga001_TotalCrudo" HeaderText="Total Crudo" 
                        SortExpression="SINOXCarga001_TotalCrudo" />
                    <asp:BoundField DataField="SINOXCarga001_CrudoPesado" HeaderText="Crudo Pesado" 
                        SortExpression="SINOXCarga001_CrudoPesado" />
                    <asp:BoundField DataField="SINOXCarga001_CrudoLigero" HeaderText="Crudo Ligero" 
                        SortExpression="SINOXCarga001_CrudoLigero" />
                    <asp:BoundField DataField="SINOXCarga001_CrudoSuperLigero" 
                        HeaderText="Crudo SuperLigero" 
                        SortExpression="SINOXCarga001_CrudoSuperLigero" />
                    <asp:BoundField DataField="SINOXCarga001_AguasSineras" 
                        HeaderText="Región Marina" SortExpression="SINOXCarga001_AguasSineras" />
                    <asp:BoundField DataField="SINOXCarga001_CrudoSur" HeaderText="Crudo Sur" 
                        SortExpression="SINOXCarga001_CrudoSur" />
                    <asp:BoundField DataField="SINOXCarga001_CrudoNorte" HeaderText="Crudo Norte" 
                        SortExpression="SINOXCarga001_CrudoNorte" />
                    <asp:BoundField DataField="SINOXCarga001_LiquidoGas" HeaderText="Liquido Gas" 
                        SortExpression="SINOXCarga001_LiquidoGas" />
                    <asp:BoundField DataField="SINOXCarga001_UDM" HeaderText="UDM" 
                        SortExpression="SINOXCarga001_UDM" />
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
            <asp:SqlDataSource ID="sqlds_final" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZSINOConnectionString1 %>" 
                SelectCommand="SELECT * FROM [SINOXCarga001_ProduccionHidrocarburosLiquidos] ORDER BY [SINOXCarga001_Año] DESC, [SINOXCarga001_Mes] DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SQL_DS_HL" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZOI1_prueba %>" 
                
                SelectCommand="SELECT * FROM [BKUP_SINOXCarga001_ProduccionHidrocarburosLiquidos] ORDER BY [SINOXCarga001_Año] DESC, [SINOXCarga001_Mes] DESC">
            </asp:SqlDataSource>
        </center>
    </div>
</asp:Content>

