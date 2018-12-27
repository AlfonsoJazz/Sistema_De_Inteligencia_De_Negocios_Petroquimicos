﻿Imports System.Data
Imports System.Web
Imports System.Web.UI.Control
Imports System.Configuration.ConfigurationManager
Imports System.Data.SqlClient

Partial Class Gas_Liquidos_Fraccionados
    Inherits System.Web.UI.Page
    ' Private CadenaConexion As String = ConfigurationManager.ConnectionStrings("ZSINOConnectionString1").ConnectionString
    Private CadenaConexionPrueba As String = ConfigurationManager.ConnectionStrings("ZOI1_prueba").ConnectionString
    Private tabla3 As String = "SINOXCarga003_Proceso_GasLiquidosFraccionados"
    'u es la unidad de medida
    Private u3 As Integer = 1
    'Si el mes siguiente es igual a enero entonces agrega el siguiente año y el mes de enero tambien si no, solo este año y el siguiente mes
    Private mes As Integer
    'Si el mes siguiente es igual a enero entonces agrega el siguiente año y el mes de enero tambien si no, solo este año y el siguiente mes
    Private AñoSiguiente, MesSiguiente As Integer
    'para borrar todos los textbox al guardar en gridview
    Public Sub ClearTextBox(parent As Control)
        For Each child As Control In parent.Controls
            ClearTextBox(child)
        Next
        If TryCast(parent, TextBox) IsNot Nothing Then
            TryCast(parent, TextBox).Text = [String].Empty
            TryCast(parent, TextBox).BorderColor = Nothing
        End If
    End Sub

    REM metodo para poner en rojo campos a editar
    Public Sub Resalta_Textbox()
        Dim txt() As TextBox = {txtEtano, txtGasLicuado, txtGasolinas, txtOtros}
        For Each TextBox In txt
            TextBox.BorderColor = Drawing.Color.Red
        Next
    End Sub
    REM Renderizado de los elementos
    'renderiza unidad medida
    Protected Sub txtUDM_TextChanged(sender As Object, e As System.EventArgs) Handles txtUDM.PreRender
        txtUDM.Text = "MBD"
    End Sub
    Protected Sub dropAño_PreRender(sender As Object, e As System.EventArgs) Handles dropAño.PreRender
        Dim año As Integer
        dropAño.Items.Clear()
        Try
            Using cnn As New SqlConnection(CadenaConexionPrueba)
                Dim cmd_año As SqlCommand = cnn.CreateCommand
                Dim dt_año As New DataTable
                Dim dta As New SqlDataAdapter(cmd_año)
                'Dim r As DataRow = dt_año.Rows(0)
                cmd_año.CommandType = CommandType.StoredProcedure
                cmd_año.Parameters.Add("@TABLA_CONSULTA", SqlDbType.NVarChar).Value = tabla3
                cmd_año.CommandText = "usp_SINO_Solicita_Mes_Año"
                cnn.Open()
                cmd_año.ExecuteNonQuery()
                dta.Fill(dt_año)
                'MesSiguiente = Convert.ToInt32(dt_año.Rows(0)(1))
                año = Convert.ToInt32(dt_año.Rows(0)(0))
                MesSiguiente = Convert.ToInt32(dt_año.Rows(0)(1))
                cnn.Close() : cnn.Dispose() : cmd_año.Dispose()
            End Using
            If MesSiguiente + 1 = 13 Then
                AñoSiguiente = año + 1
                dropAño.Items.Add(año)
                dropAño.Items.Add(AñoSiguiente)
            Else
                dropAño.Items.Add(año)
            End If
        Catch ex As Exception
            Lerror.Visible = True : Lerror.Text = ex.Message.ToString
            ELog.save(Me, ex.Message.ToString)
        End Try
    End Sub
    Protected Sub dropMes_PreRender(sender As Object, e As System.EventArgs) Handles dropMes.PreRender
        Dim mes As Integer
        Dim enero As Integer = 1
        dropMes.Items.Clear()
        Try
            Using cnn As New SqlConnection(CadenaConexionPrueba)
                Dim cmd_mes As SqlCommand = cnn.CreateCommand
                Dim dt_mes As New DataTable
                Dim dta As New SqlDataAdapter(cmd_mes)
                'Dim r As DataRow = dt_año.Rows(0)
                cmd_mes.CommandType = CommandType.StoredProcedure
                cmd_mes.Parameters.Add("@TABLA_CONSULTA", SqlDbType.NVarChar).Value = tabla3
                cmd_mes.CommandText = "usp_SINO_Solicita_Mes_Año"
                cnn.Open()
                cmd_mes.ExecuteNonQuery()
                dta.Fill(dt_mes)
                mes = Convert.ToInt32(dt_mes.Rows(0)(1))
                cnn.Close() : cnn.Dispose() : cmd_mes.Dispose()
            End Using
            If mes + 1 = 13 Then
                dropMes.Items.Add(mes)
                dropMes.Items.Add(enero)
            Else
                dropMes.Items.Add(mes + 1)
                'dropMes.Items.Add(mes)
            End If
        Catch ex As Exception
            Lerror.Visible = True : Lerror.Text = ex.Message.ToString
            ELog.save(Me, ex.Message.ToString)
        End Try
    End Sub

    'recupera el ultimo registro en ser capturado de la tabla en cuestion para ser modificado
    Protected Sub editar_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles editar.Click
        Try
            Using con As New SqlConnection(CadenaConexionPrueba)
                Dim cmd_recupera_registro As SqlCommand = con.CreateCommand
                Dim dtr As New DataTable
                Dim r_a As New SqlDataAdapter(cmd_recupera_registro)
                cmd_recupera_registro.CommandType = CommandType.StoredProcedure
                cmd_recupera_registro.Parameters.Add("@TABLA_CONSULTA", SqlDbType.NChar).Value = tabla3
                cmd_recupera_registro.CommandText = "usp_SINO_Solicita_Ultimo_Registro"
                con.Open()
                cmd_recupera_registro.ExecuteNonQuery()
                r_a.Fill(dtr)
                txtaño0.Text = Convert.ToInt32(dtr.Rows(0)(0))
                txtMes0.Text = Convert.ToInt32(dtr.Rows(0)(1))
                txtEtano.Text = Convert.ToInt32(dtr.Rows(0)(3))
                txtGasLicuado.Text = Convert.ToInt32(dtr.Rows(0)(4))
                txtGasolinas.Text = Convert.ToInt32(dtr.Rows(0)(5))
                txtOtros.Text = Convert.ToInt32(dtr.Rows(0)(6))
                con.Close() : con.Dispose() : cmd_recupera_registro.Dispose()
                Me.Resalta_Textbox()
            End Using
        Catch ex As Exception
            Lerror.Visible = True : Lerror.Text = ex.Message.ToString
            ELog.save(Me, ex.Message.ToString)
        Finally
            GV_Datos.Rows(0).BackColor = Drawing.Color.DarkBlue : GV_Datos.Rows(0).ForeColor = Drawing.Color.White
            'controles de edicion de registro recuperado
            btn_edit.Visible = True
            btn_cancel.Visible = True
            add.Visible = False
            editar.Visible = False
            'mes
            txtMes0.Visible = True
            dropMes.Visible = False
            txtaño0.Visible = True
            dropAño.Visible = False
        End Try
    End Sub
    'boton cancelar movimiento de actualizacion 
    Protected Sub btn_cancel_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_cancel.Click
        Dim parent As Object = Panel_main
        Me.ClearTextBox(parent)
        btn_edit.Visible = False
        btn_cancel.Visible = False
        add.Visible = True
        editar.Visible = True
        txtMes0.Visible = False
        dropMes.Visible = True
        txtaño0.Visible = False
        dropAño.Visible = True
        GV_Datos.Rows(0).BackColor = Drawing.Color.White : GV_Datos.Rows(0).ForeColor = Drawing.Color.Black
    End Sub
    REM IMPERATIVO CAMBIAR CADENAS DE CONEXION BOTON EDITAR REGISTRO RECUPERADO
    'Actualiza el registro que se mando a llamar 
    Protected Sub btn_edit_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles btn_edit.Click
        Try
            Using con_editar_recuperado As New SqlConnection(CadenaConexionPrueba)
                Dim cmd_editar_recuperado As SqlCommand = con_editar_recuperado.CreateCommand
                cmd_editar_recuperado.CommandType = CommandType.StoredProcedure
                cmd_editar_recuperado.Parameters.Add("@AÑO", SqlDbType.Int).Value = Convert.ToInt32(txtaño0.Text)
                cmd_editar_recuperado.Parameters.Add("@MES", SqlDbType.Int).Value = Convert.ToInt32(txtMes0.Text)
                cmd_editar_recuperado.Parameters.Add("@ETANOL", SqlDbType.Decimal).Value = Convert.ToDecimal(txtEtano.Text)
                cmd_editar_recuperado.Parameters.Add("@GAS_LICUADO", SqlDbType.Decimal).Value = Convert.ToDecimal(txtGasLicuado.Text)
                cmd_editar_recuperado.Parameters.Add("@GASOLINA", SqlDbType.Decimal).Value = Convert.ToDecimal(txtGasolinas.Text)
                cmd_editar_recuperado.Parameters.Add("@OTROS", SqlDbType.Decimal).Value = Convert.ToDecimal(txtOtros.Text)
                cmd_editar_recuperado.Parameters.Add("@UNIDAD_MEDIDA", SqlDbType.Int).Value = Convert.ToInt32(u3)
                cmd_editar_recuperado.CommandText = "usp_SINO_UPDATE_GasLiquidosFraccionados"
                con_editar_recuperado.Open()
                cmd_editar_recuperado.ExecuteNonQuery()
                cmd_editar_recuperado.Dispose()
                con_editar_recuperado.Close() : con_editar_recuperado.Dispose()
            End Using
            Dim parent As Object = Panel_main
            Me.ClearTextBox(parent)
            btn_edit.Visible = False
            btn_cancel.Visible = False
            add.Visible = True
            editar.Visible = True
        Catch ex As Exception
            Lerror.Visible = True : Lerror.Text = ex.Message.ToString
            ELog.save(Me, ex.Message.ToString)
        Finally
            'GV_Datos.DataBind()
            txtMes0.Visible = False
            dropMes.Visible = True
            txtaño0.Visible = False
            dropAño.Visible = True
            GV_Datos.DataBind()
        End Try
    End Sub
    REM es imperativo cambiar la cadena de conexion por que se está usando la de prueba
    'añade un registro a la tabla en cuestion 
    Protected Sub add_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles add.Click
        Try
            Using con_add As New SqlConnection(CadenaConexionPrueba)
                Dim cmd_add As SqlCommand = con_add.CreateCommand
                cmd_add.CommandType = CommandType.StoredProcedure
                cmd_add.Parameters.Add("@AÑO", SqlDbType.Int).Value = Convert.ToInt32(dropAño.SelectedValue)
                cmd_add.Parameters.Add("@MES", SqlDbType.Int).Value = Convert.ToInt32(dropMes.SelectedValue)
                cmd_add.Parameters.Add("@ETANO", SqlDbType.Decimal).Value = Convert.ToDecimal(txtEtano.Text)
                cmd_add.Parameters.Add("@GAS_LICUADO", SqlDbType.Decimal).Value = Convert.ToDecimal(txtGasLicuado.Text)
                cmd_add.Parameters.Add("@GASOLINA", SqlDbType.Decimal).Value = Convert.ToDecimal(txtGasolinas.Text)
                cmd_add.Parameters.Add("@OTROS", SqlDbType.Decimal).Value = Convert.ToDecimal(txtOtros.Text)
                cmd_add.Parameters.Add("@UNIDAD_MEDIDA", SqlDbType.Int).Value = Convert.ToInt32(u3)
                cmd_add.CommandText = "usp_SINO_NuevoRegistro_Gas_Liquido_Fraccionados"
                con_add.Open()
                cmd_add.ExecuteScalar()
                cmd_add.Dispose()
                con_add.Close() : con_add.Dispose()
            End Using
        Catch ex As Exception
            Lerror.Visible = True : Lerror.Text = ex.Message.ToString
            ELog.save(Me, ex.Message.ToString)
        Finally
            Dim parent As Object = Panel_main
            Me.ClearTextBox(parent)
            GV_Datos.DataBind()
        End Try
    End Sub


End Class
