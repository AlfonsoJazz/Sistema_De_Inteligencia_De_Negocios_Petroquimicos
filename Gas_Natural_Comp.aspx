<%@ Page Title="SINO | Gas Natural [Complejos]" Language="VB" MasterPageFile="~/SistemaInteligenciaNegociosOxiteno.master" AutoEventWireup="false" CodeFile="Gas_Natural_Comp.aspx.vb" Inherits="Gas_Natural_Comp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style37
        {
            height: 22px;
            width: 23%;
        }
        .style39
        {
            border: thin solid #e6e6e6;
            width: 141px;
        }
        .style44
        {
            height: 22px;
            width: 128px;
            text-align: center;
        }
        .style45
        {
            border: thin solid #e6e6e6;
            width: 8%;
        }
        .style49
        {
            height: 22px;
            width: 104px;
        }
        .style53
        {
            height: 15px;
            text-align: center;
        }
        .style54
        {
            height: 21px;
            width: 23%;
        }
        .style55
        {
            width: 128px;
            text-align: center;
        }
        .style56
        {
            width: 23%;
        }
        .style57
        {
            border: thin solid #e6e6e6;
            width: 24%;
        }
        .style58
        {
            border: thin solid #e6e6e6;
            width: 24%;
            height: 26px;
        }
        .style59
        {
            width: 104px;
            height: 26px;
        }
        .style60
        {
            width: 128px;
            text-align: center;
            height: 26px;
        }
        .style61
        {
            width: 23%;
            height: 26px;
            color: #00CC00;
        }
        .style62
        {
            height: 15px;
            width: 104px;
        }
        .style63
        {
            width: 104px;
        }
        .style64
        {
            height: 15px;
            width: 20px;
        }
        .style65
        {
            width: 20px;
        }
        .style66
        {
            height: 22px;
            width: 20px;
        }
        .style67
        {
            width: 20px;
            height: 26px;
        }
        </style>
</asp:Content>
<asp:Content ID="Contenido_gas_natural_complejos" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
<!--
    function filterFloat(evt, input) {
        // Backspace = 8, Enter = 13, ‘0′ = 48, ‘9′ = 57, ‘.’ = 46, ‘-’ = 43
        var key = window.Event ? evt.which : evt.keyCode;
        var chark = String.fromCharCode(key);
        var tempValue = input.value + chark;
        if (key >= 48 && key <= 57) {
            if (filter(tempValue) === false) {
                return false;
            } else {
                return true;
            }
        } else {
            if (key == 8 || key == 13 || key == 0) {
                return true;
            } else if (key == 46) {
                if (filter(tempValue) === false) {
                    return false;
                } else {
                    return true;
                }
            } else {
                return false;
            }
        }
    }
    function filter(__val__) {
        var preg = /^([0-9]+\.?[0-9]{0,2})$/;
        if (preg.test(__val__) === true) {
            return true;
        } else {
            return false;
        }

    }
-->
</script>
    <%--Contenido principal--%>

    <asp:Panel ID="Panel_main" runat="server">
        <table style="width: 100%;">
            <tr>
                <td class="Celdas" colspan="3">
                    <h2>Gas Natural [Complejos]</h2></td>
                <td class="style57">
                    <asp:Label ID="año" runat="server" Text="Año"></asp:Label>
                </td>
                <td class="style64">
                    &nbsp;</td>
                <td class="style62">
                    <asp:TextBox ID="txt_Año" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)" ReadOnly="True"></asp:TextBox>
                    <asp:TextBox ID="txt_Año0" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)" ReadOnly="True" Visible="False"></asp:TextBox>
                </td>
                <td class="style53" colspan="2">
                    <asp:Label ID="Lerror" runat="server" style="color: #FF0000" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="Celdas" colspan="3">
                   Captura de Nuevo Registro </td>
                <td class="style57">
                    <asp:Label ID="lblMes" runat="server" Text="Mes"></asp:Label>
                </td>
                <td class="style65">
                    &nbsp;</td>
                <td class="style63">
                    <asp:TextBox ID="txtMes" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)" ReadOnly="True" 
                        ValidationGroup="__designer:mapid=&quot;155e&quot;"></asp:TextBox>
                    <asp:TextBox ID="txt_Mes0" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)" ReadOnly="True" Visible="False"></asp:TextBox>
                </td>
                <td class="style55">
                    Unidad de Medida</td>
                <td class="style56">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style45" rowspan="18">
                    <asp:Label ID="Gas_Natural" runat="server" Text="Gas Natural"></asp:Label>
&nbsp; </td>
                <td class="style45" rowspan="12">
                    <asp:Label ID="Gas_Asociado" runat="server" Text="Gas Asociado"></asp:Label>
                </td>
                <td class="style39" rowspan="2">
                    <asp:Label ID="Region_Marina_Noreste" runat="server" 
                        Text="Región Marina Noreste"></asp:Label>
                </td>
                <td class="style57">
                    <asp:Label ID="Cantarell" runat="server" Text="Cantarell"></asp:Label>
                </td>
                <td class="style65">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txt_Cantarell" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style63">
             
                    <asp:TextBox ID="txt_Cantarell" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style55">
                    <asp:Label ID="Label1" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style56">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style57">
                    <asp:Label ID="Ku_Maloob_Zaap0" runat="server" Text="Ku-Maloob-Zaap"></asp:Label>
                </td>
                <td class="style66">
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                         ControlToValidate="txt_Ku_Maloob_Zaap" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style49">
                    <asp:TextBox ID="txt_Ku_Maloob_Zaap" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style44">
                    <asp:Label ID="Label2" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                    </td>
                <td class="style37">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style39" rowspan="2">
                    <asp:Label ID="Region_Marina_Suroeste" runat="server" 
                        Text="Región Marina Suroeste "></asp:Label>
                </td>
                <td class="style57">
                    <asp:Label ID="Abkatun_Pol_Chuc" runat="server" Text="Abkatún-Pol Chuc"></asp:Label>
                </td>
                <td class="style64">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txt_Abkatun_Pol_Chuc" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style62">
                    <asp:TextBox ID="txt_Abkatun_Pol_Chuc" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style44">
                    <asp:Label ID="Label3" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style54">
                </td>
            </tr>
            <tr>
                <td class="style57">
                    <asp:Label ID="Litoral_de_Tabasco" runat="server" Text="Litoral de Tabasco"></asp:Label>
                </td>
                <td class="style64">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txt_Litoral_de_Tabasco" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style62">
                    <asp:TextBox ID="txt_Litoral_de_Tabasco" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style44">
                    <asp:Label ID="Label4" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style54">
                </td>
            </tr>
            <tr>
                <td class="style39" rowspan="4">
                    <asp:Label ID="Region_Norte" runat="server" Text="Región Norte"></asp:Label>
                </td>
                <td class="style57">
                    <asp:Label ID="Activo_de_Produccion_Poza_Rica_Altamira" runat="server" Text="Activo de Producción Poza Rica-Altamira"></asp:Label>
                </td>
                <td class="style65">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txt_Activo_de_Produccion_Poza_Rica_Altamira" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style63">
                    <asp:TextBox ID="txt_Activo_de_Produccion_Poza_Rica_Altamira" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style55">
                    <asp:Label ID="Label5" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style56">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style57">
                    <asp:Label ID="Activo_Integral_Aceite_Terciario_del_Golfo" runat="server" Text="Activo Integral Aceite Terciario del Golfo"></asp:Label>
                </td>
                <td class="style65">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="txt_Activo_Integral_Aceite_Terciario_del_Golfo" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style63">
                    <asp:TextBox ID="txt_Activo_Integral_Aceite_Terciario_del_Golfo" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style55">
                    <asp:Label ID="Label6" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style56">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style58">
                    <asp:Label ID="Activo_Integral_Burgos" runat="server" Text="Activo Integral Burgos"></asp:Label>
                </td>
                <td class="style67">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="txt_Activo_Integral_Burgos" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style59">
                    <asp:TextBox ID="txt_Activo_Integral_Burgos" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style60">
                    <asp:Label ID="Label7" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style61">
                    </td>
            </tr>
            <tr>
                <td class="style57">
                    <asp:Label ID="Activo_Integral_Veracruz" runat="server" Text="Activo Integral Veracruz"></asp:Label>
                </td>
                <td class="style65">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="txt_Activo_Integral_Veracruz" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style63">
                    <asp:TextBox ID="txt_Activo_Integral_Veracruz" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style55">
                    <asp:Label ID="Label8" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style56">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style39" rowspan="4">
                    <asp:Label ID="Region_Sur" runat="server" Text="Región Sur"></asp:Label>
                </td>
                <td class="style57">
                    <asp:Label ID="Bellota_Jujo" runat="server" Text="Bellota-Jujo"></asp:Label>
                </td>
                <td class="style65">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="txt_Bellota_Jujo" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style63">
                    <asp:TextBox ID="txt_Bellota_Jujo" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style55">
                    <asp:Label ID="Label9" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style56">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style57">
                    <asp:Label ID="Cinco_Presidentes" runat="server" Text="Cinco Presidentes"></asp:Label>
                </td>
                <td class="style65">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="txt_Cinco_Presidentes" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style63">
                    <asp:TextBox ID="txt_Cinco_Presidentes" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style55">
                    <asp:Label ID="Label10" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style56">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style57">
                    <asp:Label ID="Macuspana_Muspac" runat="server" Text="Macuspana-Muspac"></asp:Label>
                </td>
                <td class="style65">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="txt_Macuspana_Muspac" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style63">
                    <asp:TextBox ID="txt_Macuspana_Muspac" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style55">
                    <asp:Label ID="Label11" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style56">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style57">
                    <asp:Label ID="Samaria_Luna" runat="server" Text="Samaria-Luna"></asp:Label>
                </td>
                <td class="style64">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="txtSamaria_Luna" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style62">
                    <asp:TextBox ID="txtSamaria_Luna" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style44">
                    <asp:Label ID="Label12" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style54">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style45" rowspan="6">
                    <asp:Label ID="Gas_No_Asociado" runat="server" Text="Gas No Asociado"></asp:Label>
                </td>
                <td class="style39" rowspan="3">
                    <asp:Label ID="Region_Norte_No_asociado" runat="server" Text="Región Norte"></asp:Label>
                </td>
                <td class="style57">
                    <asp:Label ID="Activo_de_Produccion_Poza_Rica_Altamira_No_Asociado" runat="server" Text="Activo de Producción Poza Rica-Altamira"></asp:Label>
                </td>
                <td class="style65">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="txt_Activo_de_Produccion_Poza_Rica_Altamira_No_Asociado" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style63">
                    <asp:TextBox ID="txt_Activo_de_Produccion_Poza_Rica_Altamira_No_Asociado" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style55">
                    <asp:Label ID="Label13" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style56">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style58">
                    <asp:Label ID="Activo_Integral_Burgos_No_Asociado" runat="server" Text="Activo Integral Burgos"></asp:Label>
                </td>
                <td class="style67">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                        ControlToValidate="txt_Activo_Integral_Burgos_No_Asociado" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style59">
                    <asp:TextBox ID="txt_Activo_Integral_Burgos_No_Asociado" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style60">
                    <asp:Label ID="Label14" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style61">
                    <asp:Label ID="Advise" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style57">
                    <asp:Label ID="Activo_Integral_Veracruz_No_Asociado" runat="server" Text="Activo Integral Veracruz"></asp:Label>
                </td>
                <td class="style65">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                        ControlToValidate="txt_Activo_Integral_Veracruz_No_Asociado" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style63">
                    <asp:TextBox ID="txt_Activo_Integral_Veracruz_No_Asociado" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style55">
                    <asp:Label ID="Label15" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style56" rowspan="2">
                    <asp:ImageButton ID="Actualizar_Registros" runat="server" Height="40px" 
                        ImageUrl="~/uiResources/Guardar Ultimo Registro.png" 
                        ToolTip="Haga clic para actualizar registro en la base de datos" 
                        Visible="False" Width="95px" AlternateText="Guardar cambios" />
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="CancelarEdicion" runat="server" Height="40px" 
                        ImageUrl="~/uiResources/cancelaredicion.png" 
                        ToolTip="Haga clic para cancelar la edición de datos actual" Visible="False" 
                        Width="95px" CausesValidation="False" 
                        AlternateText="Cancelar la edicion" />
                </td>
            </tr>
            <tr>
                <td class="style39" rowspan="3">
                    <asp:Label ID="Region_Sur_No_Asociado" runat="server" Text="Región Sur"></asp:Label>
                </td>
                <td class="style57">
                    <asp:Label ID="Cinco_Presidentes_No_Asociado" runat="server" Text="Cinco Presidentes"></asp:Label>
                </td>
                <td class="style65">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                        ControlToValidate="txt_Cinco_Presidentes_No_Asociado" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style63">
                    <asp:TextBox ID="txt_Cinco_Presidentes_No_Asociado" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style55">
                    <asp:Label ID="Label16" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style57">
                    <asp:Label ID="Macuspana_Muspac_No_Asociado" runat="server" Text="Macuspana-Muspac"></asp:Label>
                </td>
                <td class="style65">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                        ControlToValidate="txt_Macuspana_Muspac_No_Asociado" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style63">
                    <asp:TextBox ID="txt_Macuspana_Muspac_No_Asociado" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style55">
                    <asp:Label ID="Label17" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
                <td class="style56" rowspan="2">
              
                    <asp:ImageButton ID="Guardar_Registros_Nuevos" runat="server" 
                        ImageUrl="~/uiResources/guardar_base_1.png" Width="115px" Height="40px" 
                        ToolTip="Haga clic para guardar los registros actuales en la base de datos" 
                        AlternateText="Guardar registros en la base de datos"/>
                    &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="Editar_Ultimo_Registro" runat="server" 
                        Height="40px" ImageUrl="~/uiResources/Editar_Ultimo_Registro.png" 
                        ToolTip="Haga clic para editar el último registro capturado en la base de datos" 
                        Width="115px" CausesValidation="False" 
                        AlternateText="Editar el ultimo registro" />
                    &nbsp; </td>
            </tr>
            <tr>
                <td class="style57">
                    <asp:Label ID="Samaria_Luna_No_Asociado" runat="server" Text="Samaria-Luna"></asp:Label>
                </td>
                <td class="style65">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                        ControlToValidate="txt_Samaria_Luna_No_Asociado" ErrorMessage="X" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td class="style63">
                    <asp:TextBox ID="txt_Samaria_Luna_No_Asociado" runat="server" CssClass="Txt" 
                        onkeypress="return filterFloat(event,this)"></asp:TextBox>
                </td>
                <td class="style55">
                    <asp:Label ID="labelchu" runat="server" Text="MMPCD" 
                        ToolTip="Millones de Pies Cúbicos Diarios"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <hr />
    <asp:Panel ID="Panel_Preview" runat="server">
    <h2>Tabla de registros: [SINOXCarga007_GasNatualComplejos] -- Producción</h2>
        <asp:GridView ID="GV_Datos" runat="server" AutoGenerateColumns="False" 
            DataSourceID="DS_FINAL" Width="100%" AllowPaging="True" 
            AllowSorting="True" BackColor="#CCCCCC" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" 
            ForeColor="Black" PageSize="18" style="text-align: center">
            <Columns>
                <asp:BoundField DataField="SINOXCarga007_Año" HeaderText="Año" 
                    SortExpression="SINOXCarga007_Año" />
                <asp:BoundField DataField="SINOXCarga007_Mes" HeaderText="Mes" 
                    SortExpression="SINOXCarga007_Mes" />
                <asp:BoundField DataField="SINOXCarga007_Origen" 
                    HeaderText="Origen" SortExpression="SINOXCarga007_Origen" />
                <asp:BoundField DataField="SINOXCarga007_Tipo" HeaderText="Tipo" 
                    SortExpression="SINOXCarga007_Tipo" />
                <asp:BoundField DataField="SINOXCarga007_Region" 
                    HeaderText="Region" SortExpression="SINOXCarga007_Region" />
                <asp:BoundField DataField="SINOXCarga007_Complejo" 
                    HeaderText="Complejo" SortExpression="SINOXCarga007_Complejo" />
                <asp:BoundField DataField="SINOXCarga007_Vol" HeaderText="Vol" 
                    SortExpression="SINOXCarga007_Vol" />
                <asp:BoundField DataField="SINOXCarga007_UDM" HeaderText="UDM" 
                    SortExpression="SINOXCarga007_UDM" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="DS_FINAL" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ZSINOConnectionString1 %>" 
            SelectCommand="SELECT * FROM [SINOXCarga007_GasNatualComplejos] ORDER BY [SINOXCarga007_Año] DESC, [SINOXCarga007_Mes] DESC">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DS_Pruebas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ZOI1_prueba %>" 
            SelectCommand="SELECT * FROM [BKUP_GasNatualComplejos] ORDER BY [SINOXCarga007_Año] DESC, [SINOXCarga007_Mes] DESC">
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

