<%@ Page Title="SINO | Captura de datos: Producción Gas Natural" Language="VB" MasterPageFile="~/SistemaInteligenciaNegociosOxiteno.master" AutoEventWireup="false" CodeFile="Produccion_Gas_Natural.aspx.vb" Inherits="Produccion_Gas_Natural" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="p_gn" ContentPlaceHolderID="MainContent" Runat="Server">
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
                <td colspan="13" class="style1">
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
                    Asociado Hidrocarburo</td>
                <td >
                    Asociado Nitrogeno</td>
                <td >
                    No Asociado</td>
                <td >
                    Región Marina</td>
                <td >
                    Región Sur</td>
                <td >
                    Región Norte</td>
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
                    <asp:TextBox ID="txtaHidrocarburo" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtaNitrogeno" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtNA" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtAguas" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtSur" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtNorte" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td  >
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
                        ControlToValidate="txtaHidrocarburo" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_5" runat="server" 
                        ControlToValidate="txtaNitrogeno" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_6" runat="server" 
                        ControlToValidate="txtNA" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_7" runat="server" 
                        ControlToValidate="txtAguas" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_8" runat="server" 
                        ControlToValidate="txtSur" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_9" runat="server" 
                        ControlToValidate="txtNorte" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
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
        <h2>Tabla de registros: [SINOXCarga002_ProduccionGasNatual] -- Producción</h2>
        <center>
            <asp:GridView ID="GV_Datos" runat="server" AutoGenerateColumns="False" 
                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                CellPadding="4" DataSourceID="SqlDS_PGN" ForeColor="Black" 
                AllowPaging="True" AllowSorting="True" Width="100%" CellSpacing="2" 
                PageSize="12" style="text-align: center">
                <Columns>
                    <asp:BoundField DataField="SINOXCarga002_Año" HeaderText="Año" 
                        SortExpression="SINOXCarga002_Año" />
                    <asp:BoundField DataField="SINOXCarga002_Mes" HeaderText="Mes" 
                        SortExpression="SINOXCarga002_Mes" />
                    <asp:BoundField DataField="SINOXCarga002_Total" HeaderText="Total" 
                        SortExpression="SINOXCarga002_Total" />
                    <asp:BoundField DataField="SINOXCarga002_AsociadoHidrocarburo" HeaderText="Asociado Hidrocarburo" 
                        SortExpression="SINOXCarga002_AsociadoHidrocarburo" />
                    <asp:BoundField DataField="SINOXCarga002_AsociadoNitrogeno" HeaderText="Asociado Nitrogeno" 
                        SortExpression="SINOXCarga002_AsociadoNitrogeno" />
                    <asp:BoundField DataField="SINOXCarga002_NoAsociado" HeaderText="No Asociado" 
                        SortExpression="SINOXCarga002_NoAsociado" />
                    <asp:BoundField DataField="SINOXCarga002_Marinas" 
                        HeaderText="Marinas" 
                        SortExpression="SINOXCarga002_Marinas" />
                    <asp:BoundField DataField="SINOXCarga002_Sur" 
                        HeaderText="Sur" SortExpression="SINOXCarga002_Sur" />
                    <asp:BoundField DataField="SINOXCarga002_Norte" HeaderText="Norte" 
                        SortExpression="SINOXCarga002_Norte" />
                    <asp:BoundField DataField="SINOXCarga002_UDM" HeaderText="UDM" 
                        SortExpression="SINOXCarga002_UDM" />
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
            <asp:SqlDataSource ID="SqlDS_PGN" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZSINOConnectionString1 %>" 
                SelectCommand="SELECT * FROM [SINOXCarga002_ProduccionGasNatual] ORDER BY [SINOXCarga002_Año] DESC, [SINOXCarga002_Mes] DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourcePruebas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZOI1_prueba %>" 
                SelectCommand="SELECT * FROM [BKUP_ProduccionGasNatual] ORDER BY [SINOXCarga002_Año] DESC, [SINOXCarga002_Mes] DESC">
            </asp:SqlDataSource>
        </center>
    </div>
</asp:Content>

