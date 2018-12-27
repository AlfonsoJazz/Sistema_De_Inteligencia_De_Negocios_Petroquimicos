Imports System.Data
Imports System.Web
Imports System.Web.UI.Control
Imports System.Configuration.ConfigurationManager
Imports System.Data.SqlClient
Imports System.Web.Util.Transactions
Imports System.Activities
Imports System.Transactions

Partial Class Gas_Natural_Comp
    Inherits System.Web.UI.Page
    Private CadenaConexionPrueba As String = ConfigurationManager.ConnectionStrings("ZSINOConnectionString1").ConnectionString
    'Private CadenaConexionPrueba As String = ConfigurationManager.ConnectionStrings("ZOI1_prueba").ConnectionString
    Private tabla7 As String = "SINOXCarga007_GasNatualComplejos"
    Private u7 As Integer = 4
    Private AñoSiguiente, MesSiguiente As Integer

    REM Metodo para borrar todos los textbox al guardar en gridview
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
    Public Sub Resalta_Textbox(parent As Control)
        For Each child As Control In parent.Controls
            Resalta_Textbox(child)
        Next
        If TryCast(parent, TextBox) IsNot Nothing Then
            TryCast(parent, TextBox).BorderColor = Drawing.Color.Red
        End If
    End Sub
    REM prerender del campo año
    Protected Sub txt_Año_PreRender(sender As Object, e As System.EventArgs) Handles txt_Año.PreRender
        Dim año As Integer
        'dropAño.Items.Clear()
        txt_Año.Text = String.Empty
        Try
            Using cnn As New SqlConnection(CadenaConexionPrueba)
                Dim cmd_año As SqlCommand = cnn.CreateCommand
                Dim dt_año As New DataTable
                Dim dta As New SqlDataAdapter(cmd_año)
                'Dim r As DataRow = dt_año.Rows(0)
                cmd_año.CommandType = CommandType.StoredProcedure
                cmd_año.Parameters.Add("@TABLA_CONSULTA", SqlDbType.NVarChar).Value = tabla7
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
                txt_Año.Text = AñoSiguiente.ToString
                'dropAño.Items.Add(AñoSiguiente)
                'dropAño.Items.Add(año)
            Else
                txt_Año.Text = año
                'dropAño.Items.Add(año)
            End If
        Catch ex As Exception
            Lerror.Visible = True : Lerror.Text = ex.Message.ToString
            ELog.save(Me, ex.Message.ToString)
        End Try
    End Sub
    REM prerender del campo mes
    Protected Sub txtMes_PreRender(sender As Object, e As System.EventArgs) Handles txtMes.PreRender
        Dim Este_mes As Integer
        Dim enero As Integer = 1
        txtMes.Text = String.Empty
        'dropMes.Items.Clear()
        Try
            Using cnn As New SqlConnection(CadenaConexionPrueba)
                Dim cmd_mes As SqlCommand = cnn.CreateCommand
                Dim dt_mes As New DataTable
                Dim dta As New SqlDataAdapter(cmd_mes)
                'Dim r As DataRow = dt_año.Rows(0)
                cmd_mes.CommandType = CommandType.StoredProcedure
                cmd_mes.Parameters.Add("@TABLA_CONSULTA", SqlDbType.NVarChar).Value = tabla7
                cmd_mes.CommandText = "usp_SINO_Solicita_Mes_Año"
                cnn.Open()
                cmd_mes.ExecuteNonQuery()
                dta.Fill(dt_mes)
                Este_mes = Convert.ToInt32(dt_mes.Rows(0)(1))
                cnn.Close() : cnn.Dispose() : cmd_mes.Dispose()
            End Using
            If Este_mes + 1 = 13 Then
                txtMes.Text = enero
                'dropMes.Items.Add(enero)
                'dropMes.Items.Add(mes)
            Else
                MesSiguiente = Este_mes + 1
                txtMes.Text = MesSiguiente
                'dropMes.Items.Add(mes)
                'dropMes.Items.Add(mes + 1)
            End If
        Catch ex As Exception
            Lerror.Visible = True : Lerror.Text = ex.Message.ToString
            ELog.save(Me, ex.Message.ToString)
        End Try
    End Sub
    REM Cancela la transaccion de modificar datos recuperados y oculta los elementos que necesita
    Private Sub borrar_todo()
        Dim parent As Object = Panel_main
        Me.ClearTextBox(parent)
        Guardar_Registros_Nuevos.Visible = True
        Editar_Ultimo_Registro.Visible = True
        Actualizar_Registros.Visible = False
        CancelarEdicion.Visible = False
        txt_Mes0.Visible = False
        txtMes.Visible = True
        txt_Año0.Visible = False
        txt_Año.Visible = True
        Lerror.Visible = False
        For i As Integer = 0 To 17
            GV_Datos.Rows(i).BackColor = Drawing.Color.White : GV_Datos.Rows(i).ForeColor = Drawing.Color.Black
        Next
    End Sub
    REM botn que llama el metodo borrar todo
    Protected Sub CancelarEdicion_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles CancelarEdicion.Click
        Me.borrar_todo()
        'GV_Datos.Rows(0).BackColor = Drawing.Color.White : GV_Datos.Rows(0).ForeColor = Drawing.Color.Black
    End Sub
    REM Selecciona el ultimo registro de la base de datos y lo muestra para que sea modificado 
    Protected Sub Editar_Ultimo_Registro_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles Editar_Ultimo_Registro.Click
        Try
            Using con As New SqlConnection(CadenaConexionPrueba)
                Dim cmd_recupera_registro As SqlCommand = con.CreateCommand
                Dim dtr As New DataTable
                Dim r_a As New SqlDataAdapter(cmd_recupera_registro)
                Dim index As Integer
                cmd_recupera_registro.CommandType = CommandType.StoredProcedure
                cmd_recupera_registro.Parameters.Add("@TABLA_CONSULTA", SqlDbType.NChar).Value = "SINOXCarga007_GasNatualComplejos"
                cmd_recupera_registro.CommandText = "usp_SINO_Solicita_Ultimo_Registro"
                con.Open()
                cmd_recupera_registro.ExecuteNonQuery()
                r_a.Fill(dtr)
                con.Close() : con.Dispose() : cmd_recupera_registro.Dispose() : r_a.Dispose()
                txt_Año0.Text = Convert.ToInt32(dtr.Rows(0)(0))
                txt_Mes0.Text = Convert.ToInt32(dtr.Rows(0)(1))
                'Do While index <> dtr.Rows.Count
                For Each r As DataRow In dtr.Rows
                    If (dtr.Rows(index)(3)).ToString = "Gas Asociado" Then
                        Select Case (dtr.Rows(index)(5)).ToString
                            Case "Cantarell"
                                txt_Cantarell.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Ku-Maloob-Zaap"
                                txt_Ku_Maloob_Zaap.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Abkatún-Pol Chuc"
                                txt_Abkatun_Pol_Chuc.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Litoral de Tabasco"
                                txt_Litoral_de_Tabasco.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Activo de Producción Poza Rica-Altamira"
                                txt_Activo_de_Produccion_Poza_Rica_Altamira.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Activo Integral Aceite Terciario del Golfo"
                                txt_Activo_Integral_Aceite_Terciario_del_Golfo.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Activo Integral Burgos"
                                txt_Activo_Integral_Burgos.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Activo Integral Veracruz"
                                txt_Activo_Integral_Veracruz.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Bellota-Jujo"
                                txt_Bellota_Jujo.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Cinco Presidentes"
                                txt_Cinco_Presidentes.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Macuspana-Muspac"
                                txt_Macuspana_Muspac.Text = Convert.ToDecimal(dtr.Rows(index)(6))
                                REM existe un campo sin espacio de este valor en la tabla
                            Case "Macuspana-Muspac "
                                txt_Macuspana_Muspac.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Samaria-Luna"
                                txtSamaria_Luna.Text = Convert.ToDecimal(dtr.Rows(index)(6))
                        End Select

                    ElseIf (dtr.Rows(index)(3)).ToString = "Gas No Asociado" Then
                        Select Case (dtr.Rows(index)(5)).ToString
                            Case "Activo de Producción Poza Rica-Altamira"
                                txt_Activo_de_Produccion_Poza_Rica_Altamira_No_Asociado.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Activo Integral Burgos"
                                txt_Activo_Integral_Burgos_No_Asociado.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Activo Integral Veracruz"
                                txt_Activo_Integral_Veracruz_No_Asociado.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Cinco Presidentes"
                                txt_Cinco_Presidentes_No_Asociado.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Macuspana-Muspac"
                                txt_Macuspana_Muspac_No_Asociado.Text = Convert.ToDecimal(dtr.Rows(index)(6))
                                REM caso de este campo con espacio al final tambien 
                            Case "Macuspana-Muspac "
                                txt_Macuspana_Muspac_No_Asociado.Text = Convert.ToDecimal(dtr.Rows(index)(6))

                            Case "Samaria-Luna"
                                txt_Samaria_Luna_No_Asociado.Text = Convert.ToDecimal(dtr.Rows(index)(6))
                        End Select
                    End If
                    index = index + 1
                Next
                dtr.Dispose()
            End Using
            Dim parent As Object = Panel_main
            Me.Resalta_Textbox(parent)
            For i As Integer = 0 To 17
                GV_Datos.Rows(i).BackColor = Drawing.Color.DarkBlue : GV_Datos.Rows(i).ForeColor = Drawing.Color.White
            Next
            Lerror.Visible = True : Lerror.Text = "Favor de verificar la captura de los campos en rojo"
        Catch ex As Exception
            Lerror.Visible = True : Lerror.Text = ex.Message.ToString
            ELog.save(Me, ex.Message.ToString)
        Finally

            'GV_Datos.Rows(0).BackColor = Drawing.Color.DarkBlue : GV_Datos.Rows(0).ForeColor = Drawing.Color.White
            ''controles de edicion de registro recuperado
            'btn_edit.Visible = True
            'btn_cancel.Visible = True
            'add.Visible = False
            'editar.Visible = False
            ''mes
            txtMes.Visible = False
            txt_Mes0.Visible = True : txt_Mes0.BorderColor = Nothing
            'dropMes.Visible = False
            txt_Año.Visible = False
            txt_Año0.Visible = True : txt_Año0.BorderColor = Nothing
            'dropAño.Visible = False
            Guardar_Registros_Nuevos.Visible = False
            Editar_Ultimo_Registro.Visible = False
            Actualizar_Registros.Visible = True
            CancelarEdicion.Visible = True
        End Try
    End Sub
    REM Nuevo registro, este metodo funciona con arreglos y no con un bulk, en el futuro puede ser modificado para que soporte mas usuarios en linea a la vez 
    Protected Sub Guardar_Registros_Nuevos_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles Guardar_Registros_Nuevos.Click
        'Dim comando As String = "INSERT INTO SINOXCarga007_GasNatualComplejos VALUES"
        Dim comando As String = "INSERT INTO BKUP_GasNatualComplejos VALUES"
        Dim oAño As Integer = txt_Año.Text
        Dim oMes As Integer = txtMes.Text
        Dim oGN As String = Gas_Natural.Text

        REM Volumen
        Dim contador, i As Integer
        Dim Region As String = String.Empty
        Dim tipo As String = String.Empty
        Dim complejo() As String = {Cantarell.Text, Ku_Maloob_Zaap0.Text, Abkatun_Pol_Chuc.Text, Litoral_de_Tabasco.Text, Activo_de_Produccion_Poza_Rica_Altamira.Text, _
                                    Activo_Integral_Aceite_Terciario_del_Golfo.Text, Activo_Integral_Burgos.Text, Activo_Integral_Veracruz.Text, Bellota_Jujo.Text, Cinco_Presidentes.Text, _
                                    Macuspana_Muspac.Text, Samaria_Luna.Text, Activo_de_Produccion_Poza_Rica_Altamira_No_Asociado.Text, Activo_Integral_Burgos_No_Asociado.Text, _
                                    Activo_Integral_Veracruz_No_Asociado.Text, Cinco_Presidentes_No_Asociado.Text, Macuspana_Muspac_No_Asociado.Text, Samaria_Luna_No_Asociado.Text}

        Dim volumen() As Decimal = {txt_Cantarell.Text, txt_Ku_Maloob_Zaap.Text, txt_Abkatun_Pol_Chuc.Text, txt_Litoral_de_Tabasco.Text, txt_Activo_de_Produccion_Poza_Rica_Altamira.Text, _
                                    txt_Activo_Integral_Aceite_Terciario_del_Golfo.Text, txt_Activo_Integral_Burgos.Text, txt_Activo_Integral_Veracruz.Text, txt_Bellota_Jujo.Text, _
                                    txt_Cinco_Presidentes.Text, txt_Macuspana_Muspac.Text, txtSamaria_Luna.Text, txt_Activo_de_Produccion_Poza_Rica_Altamira_No_Asociado.Text, _
                                    txt_Activo_Integral_Burgos_No_Asociado.Text, txt_Activo_Integral_Veracruz_No_Asociado.Text, txt_Cinco_Presidentes_No_Asociado.Text, _
                                    txt_Macuspana_Muspac_No_Asociado.Text, txt_Samaria_Luna_No_Asociado.Text}
        'Lerror.Visible = True : Lerror.Text = comando & " ( " & oAño & "," & oMes & ", '" & oGN & "' ," & " '" & tGA & "' ," & " '" & rMN & "' ," & " '" & ctrl & "' , " & txt_Cantarell.Text & " ," & "4" & ")"
        Using Inserts As New TransactionScope()
            Try
                Using con_nuevo As New SqlConnection(CadenaConexionPrueba)
                    Dim cmd_nuevo_registro As SqlCommand = con_nuevo.CreateCommand
                    con_nuevo.Open()
                    REM con el for vamos agarrando el arreglo de datos tanto de complejo como de tipo y bolimen
                    For n As Integer = 0 To 17
                        If contador = 0 Then
                            Region = Region_Marina_Noreste.Text
                            tipo = Gas_Asociado.Text
                        ElseIf contador = 2 Then
                            Region = Region_Marina_Suroeste.Text
                        ElseIf contador = 4 Then
                            Region = Region_Norte.Text
                        ElseIf contador = 8 Then
                            Region = Region_Sur.Text
                        ElseIf contador = 12 Then
                            Region = Region_Norte_No_asociado.Text
                            tipo = Gas_No_Asociado.Text
                        ElseIf contador = 15 Then
                            Region = Region_Sur_No_Asociado.Text
                        End If
                        REM Insert
                        cmd_nuevo_registro.CommandText = comando & _
                        " ( " & oAño & "," & oMes & ", '" & oGN & "' ," & " '" & tipo & "' ," & " '" & Region & "' ," & " '" & complejo(n).ToString & "' , " & volumen(n) & " ," & "4" & ")"
                        i = cmd_nuevo_registro.ExecuteNonQuery() : cmd_nuevo_registro.Dispose()
                        If i = 1 Then
                            contador = contador + 1
                        End If
                    Next
                    If contador = 18 Then
                        Inserts.Complete()
                        Me.borrar_todo()
                        Advise.Visible = True : Advise.Text = "Datos guardados con éxito"
                    Else
                        Inserts.Dispose()
                    End If
                    con_nuevo.Close() : con_nuevo.Dispose()
                End Using
            Catch ex As Exception
                Lerror.Visible = True : Lerror.Text = ex.Message.ToString
                ELog.save(Me, ex.Message.ToString)
                Inserts.Dispose()
            End Try
        End Using
        GV_Datos.DataBind()
    End Sub
    REM actualiza los registros recuperados
    Protected Sub Actualizar_Registros_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles Actualizar_Registros.Click
        Dim update As String = "UPDATE BKUP_GasNatualComplejos SET "
        
        Dim oMes As Integer = txt_Mes0.Text
        Dim oGN As String = Gas_Natural.Text
        REM Volumen
        Dim contador, i As Integer
        Dim Region As String = String.Empty
        Dim tipo As String = String.Empty
        Dim complejo() As String = {Cantarell.Text, Ku_Maloob_Zaap0.Text, Abkatun_Pol_Chuc.Text, Litoral_de_Tabasco.Text, Activo_de_Produccion_Poza_Rica_Altamira.Text, _
                                    Activo_Integral_Aceite_Terciario_del_Golfo.Text, Activo_Integral_Burgos.Text, Activo_Integral_Veracruz.Text, Bellota_Jujo.Text, Cinco_Presidentes.Text, _
                                    Macuspana_Muspac.Text, Samaria_Luna.Text, Activo_de_Produccion_Poza_Rica_Altamira_No_Asociado.Text, Activo_Integral_Burgos_No_Asociado.Text, _
                                    Activo_Integral_Veracruz_No_Asociado.Text, Cinco_Presidentes_No_Asociado.Text, Macuspana_Muspac_No_Asociado.Text, Samaria_Luna_No_Asociado.Text}

        Dim volumen() As Decimal = {txt_Cantarell.Text, txt_Ku_Maloob_Zaap.Text, txt_Abkatun_Pol_Chuc.Text, txt_Litoral_de_Tabasco.Text, txt_Activo_de_Produccion_Poza_Rica_Altamira.Text, _
                                    txt_Activo_Integral_Aceite_Terciario_del_Golfo.Text, txt_Activo_Integral_Burgos.Text, txt_Activo_Integral_Veracruz.Text, txt_Bellota_Jujo.Text, _
                                    txt_Cinco_Presidentes.Text, txt_Macuspana_Muspac.Text, txtSamaria_Luna.Text, txt_Activo_de_Produccion_Poza_Rica_Altamira_No_Asociado.Text, _
                                    txt_Activo_Integral_Burgos_No_Asociado.Text, txt_Activo_Integral_Veracruz_No_Asociado.Text, txt_Cinco_Presidentes_No_Asociado.Text, _
                                    txt_Macuspana_Muspac_No_Asociado.Text, txt_Samaria_Luna_No_Asociado.Text}
        Dim w() As String = {"SINOXCarga007_Año = ", "SINOXCarga007_Mes = ", "SINOXCarga007_Origen = ", "SINOXCarga007_Tipo = ", _
                             "SINOXCarga007_Region = ", "SINOXCarga007_Complejo = ", "SINOXCarga007_Vol = ", "SINOXCarga007_UDM = "}
        Dim oAño As Integer = txt_Año0.Text
        REM test
        'ELog.save(Me, update & w(0) & oAño & ", " & _
        '                    w(1) & oMes & ", " & _
        '                    w(2) & "'" & oGN & "', " & _
        '                    w(3) & "'" & tipo & "', " & _
        '                    w(4) & "'" & Region & "', " & _
        '                    w(5) & "'" & complejo(0) & "', " & _
        '                    w(6) & volumen(0) & ", " & _
        '                    w(7) & "4" & _
        '                    " WHERE " & w(0) & oAño & " AND " & w(1) & oMes & " AND " & w(2) & "'" & oGN & "' AND " & w(3) & "'" & tipo & "' AND " & w(4) & "'" & Region & "' AND " & w(5) & "'" & complejo(0) & "'")
        Using Actualiza_registros As New TransactionScope
            Try
                Using con_u As New SqlConnection(CadenaConexionPrueba)
                    Dim cmd_update As SqlCommand = con_u.CreateCommand
                    con_u.Open()
                    For n As Integer = 0 To 17
                        If contador = 0 Then
                            Region = Region_Marina_Noreste.Text
                            tipo = Gas_Asociado.Text
                        ElseIf contador = 2 Then
                            Region = Region_Marina_Suroeste.Text
                        ElseIf contador = 4 Then
                            Region = Region_Norte.Text
                        ElseIf contador = 8 Then
                            Region = Region_Sur.Text
                        ElseIf contador = 12 Then
                            Region = Region_Norte_No_asociado.Text
                            tipo = Gas_No_Asociado.Text
                        ElseIf contador = 15 Then
                            Region = Region_Sur_No_Asociado.Text
                        End If
                        REM Update
                        cmd_update.CommandText = update & _
                            w(0) & oAño & ", " & _
                            w(1) & oMes & ", " & _
                            w(2) & "'" & oGN & "', " & _
                            w(3) & "'" & tipo & "', " & _
                            w(4) & "'" & Region & "', " & _
                            w(5) & "'" & complejo(n) & "', " & _
                            w(6) & volumen(n) & ", " & _
                            w(7) & "4" & _
                            " WHERE " & w(0) & oAño & " AND " & w(1) & oMes & " AND " & w(2) & "'" & oGN & "' AND " & w(3) & "'" & tipo & "' AND " & w(4) & "'" & Region & "' AND " & w(5) & "'" & complejo(n) & "'"

                        i = cmd_update.ExecuteNonQuery() : cmd_update.Dispose()
                        If i = 1 Then
                            contador = contador + 1
                        End If
                    Next
                    If contador = 18 Then
                        Actualiza_registros.Complete()
                        Me.borrar_todo()
                        Advise.Visible = True : Advise.Text = "Datos guardados con éxito"
                    Else
                        Actualiza_registros.Dispose()
                    End If
                    con_u.Close() : con_u.Dispose()
                End Using
            Catch ex As Exception
                Lerror.Visible = True : Lerror.Text = ex.Message.ToString
                ELog.save(Me, ex.Message.ToString)
                Actualiza_registros.Dispose()
            End Try
        End Using
        GV_Datos.DataBind()
    End Sub
End Class