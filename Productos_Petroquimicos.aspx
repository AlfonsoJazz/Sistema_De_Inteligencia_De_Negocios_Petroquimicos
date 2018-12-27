<%@ Page Title="SINO | Elaboración de productos petroquímicos" Language="VB" MasterPageFile="~/SistemaInteligenciaNegociosOxiteno.master" AutoEventWireup="false" CodeFile="Productos_Petroquimicos.aspx.vb" Inherits="Productos_Petroquimicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="e_p_p" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="Panel_main" runat="server">
        <h2>Producción de Productos Petroquímicos</h2>
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
                <td colspan="20" class="style1">
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
                    Dicloretano</td>
                <td >
                    Amoníaco</td>
                <td >
                    Benceno</td>
                <td >
                    Cloruro de Vinilo</td>
                <td >
                    Estireno</td>
                <td >
                    Etileno</td>
                <td >
                    Oxido de Etileno</td>
                <td>
                    Polietileno de alta densidad</td>
                <td>
                    Polietileno de baja densidad</td>
                <td>
                    Polietileno lineal de baja densidad</td>
                <td>
                    Propileno(b)</td>
                <td>
                    Tolueno</td>
                <td>
                    Otros</td>
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
                    <asp:TextBox ID="txtDicloretano" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtAmoniaco" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtBenceno" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtC_Vinilo" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtEstireno" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txt_Etileno" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtO_Etileno" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txt_PAD" runat="server" CssClass="Txt" onkeypress="return numbersonly(event)"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txt_PBD" runat="server" CssClass="Txt" onkeypress="return numbersonly(event)"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txt_PLBD" runat="server" CssClass="Txt" onkeypress="return numbersonly(event)"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtPropilenoB" runat="server" CssClass="Txt" onkeypress="return numbersonly(event)"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtTolueno" runat="server" CssClass="Txt" onkeypress="return numbersonly(event)"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtOtros" runat="server" CssClass="Txt" onkeypress="return numbersonly(event)"></asp:TextBox>
                </td>
                <td  >
                    <asp:TextBox ID="txtUDM" Text="MT" runat="server" CssClass="Txt" 
                        ReadOnly="True" ToolTip="Miles de Toneladas"></asp:TextBox>
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
                        ControlToValidate="txtDicloretano" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_5" runat="server" 
                        ControlToValidate="txtAmoniaco" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_6" runat="server" 
                        ControlToValidate="txtBenceno" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_7" runat="server" 
                        ControlToValidate="txtC_Vinilo" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_8" runat="server" 
                        ControlToValidate="txtEstireno" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_9" runat="server" 
                        ControlToValidate="txt_Etileno" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_10" runat="server" 
                        ControlToValidate="txtO_Etileno" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFV_11" runat="server" 
                        ControlToValidate="txt_PAD" ErrorMessage="Campo Requerido" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFV_12" runat="server" 
                        ControlToValidate="txt_PBD" ErrorMessage="Campo Requerido" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFV_15" runat="server" 
                        ControlToValidate="txt_PLBD" ErrorMessage="Campo Requerido" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFV_13" runat="server" 
                        ControlToValidate="txtPropilenoB" ErrorMessage="Campo Requerido" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFV_14" runat="server" 
                        ControlToValidate="txtTolueno" ErrorMessage="Campo Requerido" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFV_16" runat="server" 
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
    <div id="PanelRevision">
        <hr />
        <h2>Tabla de registros: [SINOXCarga005_ProductoPetroquimicos] -- Producción</h2>
        <center>
            <asp:GridView ID="GV_Datos" runat="server" AutoGenerateColumns="False" 
                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                CellPadding="4" DataSourceID="SqlDS_Final_P_P" ForeColor="Black" 
                AllowPaging="True" AllowSorting="True" Width="100%" CellSpacing="2" 
                PageSize="12">
                <Columns>
                    <asp:BoundField DataField="SINOXCarga005_Año" HeaderText="Año" 
                        SortExpression="SINOXCarga005_Año" />
                    <asp:BoundField DataField="SINOXCarga005_Mes" HeaderText="Mes" 
                        SortExpression="SINOXCarga005_Mes" />
                    <asp:BoundField DataField="SINOXCarga005_Total" HeaderText="Total" 
                        SortExpression="SINOXCarga005_Total" />
                    <asp:BoundField DataField="SINOXCarga005_Dicloroetano" HeaderText="Dicloroetano" 
                        SortExpression="SINOXCarga005_Dicloroetano" />
                    <asp:BoundField DataField="SINOXCarga005_Amoniaco" HeaderText="Amoniaco" 
                        SortExpression="SINOXCarga005_Amoniaco" />
                    <asp:BoundField DataField="SINOXCarga005_Benceno" HeaderText="Benceno" 
                        SortExpression="SINOXCarga005_Benceno" />
                    <asp:BoundField DataField="SINOXCarga005_ClorurodeVinilo" 
                        HeaderText="Cloruro de Vinilo" 
                        SortExpression="SINOXCarga005_ClorurodeVinilo" />
                    <asp:BoundField DataField="SINOXCarga005_Estireno" 
                        HeaderText="Estireno" 
                        SortExpression="SINOXCarga005_Estireno" />
                    <asp:BoundField DataField="SINOXCarga005_Etileno" HeaderText="Etileno" 
                        SortExpression="SINOXCarga005_Etileno" />
                    <asp:BoundField DataField="SINOXCarga005_OxidodeEtileno" HeaderText="Oxido de Etileno" 
                        SortExpression="SINOXCarga005_OxidodeEtileno" />
                    <asp:BoundField DataField="SINOXCarga005_PolietilenoAltaDensidad" HeaderText="Polietileno Alta Densidad" 
                        SortExpression="SINOXCarga005_PolietilenoAltaDensidad" />
                    <asp:BoundField DataField="SINOXCarga005_PolietilenoBajaDensidad" HeaderText="Polietileno Baja Densidad" 
                        SortExpression="SINOXCarga005_PolietilenoBajaDensidad" />
                    <asp:BoundField DataField="SINOXCarga005_PolietilenoLinealBajaDensidad" 
                        HeaderText="Polietileno Lineal Baja Densidad" 
                        SortExpression="SINOXCarga005_PolietilenoLinealBajaDensidad" />
                    <asp:BoundField DataField="SINOXCarga005_Propilenob" 
                        HeaderText="Propilenob" 
                        SortExpression="SINOXCarga005_Propilenob" />
                    <asp:BoundField DataField="SINOXCarga005_Tolueno" 
                        HeaderText="Tolueno" SortExpression="SINOXCarga005_Tolueno" />
                    <asp:BoundField DataField="SINOXCarga005_Otros" 
                        HeaderText="Otros" SortExpression="SINOXCarga005_Otros" />
                    <asp:BoundField DataField="SINOXCarga005_UDM" HeaderText="UDM" 
                        SortExpression="SINOXCarga005_UDM" />
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
            <asp:SqlDataSource ID="SqlDS_Final_P_P" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZSINOConnectionString1 %>" 
                SelectCommand="SELECT * FROM [SINOXCarga005_ProductoPetroquimicos] ORDER BY [SINOXCarga005_Año] DESC, [SINOXCarga005_Mes] DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SQLDS_Pruebas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZOI1_prueba %>" 
                SelectCommand="SELECT * FROM [BKUP_ProductoPetroquimicos] ORDER BY [SINOXCarga005_Año] DESC, [SINOXCarga005_Mes] DESC">
            </asp:SqlDataSource>
        </center>
    </div>
</asp:Content>

