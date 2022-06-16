Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.IO
Partial Class Administrator_InputData
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        RdwView.VisibleOnPageLoad = False
        If Not Page.IsPostBack Then
            RdwView.InitialBehaviors = WindowBehaviors.Maximize
            If Session("BrowserHeight") <> "" Then
                RdwView.Height = Val(Session("BrowserHeight")) - 100
                RdwView.Width = Val(Session("BrowserWidth")) - 100
            End If
        End If
    End Sub
    Protected Sub rgInputData_ItemCommand(sender As Object, e As Telerik.Web.UI.GridCommandEventArgs) Handles rgInputData.ItemCommand
        Select Case e.CommandName
            Case RadGrid.PerformInsertCommandName
                Dim vItem As GridEditableItem = CType(e.Item, GridEditableItem)
                Dim insitem As New tITEM
                insitem.ITEM_ID = System.Guid.NewGuid.ToString
                insitem.ITEM_NAME = CType(vItem.FindControl("rcbITEMNAME"), RadComboBox).SelectedValue
                insitem.ITEM_UNIT = CType(vItem.FindControl("rcbITEMUNIT"), RadComboBox).SelectedValue
                insitem.ITEM_PRICE = CType(vItem.FindControl("txtITEMPRICE"), RadNumericTextBox).Text
                insitem.PURC_QTY = CType(vItem.FindControl("txtPURCQTY"), RadNumericTextBox).Text
                insitem.BAL_QTY = CType(vItem.FindControl("txtBALQTY"), RadNumericTextBox).Text
                insitem.ITEM_QTY = CType(vItem.FindControl("txtITEMQTY"), RadNumericTextBox).Text
                insitem.TOTAL_PRICE = CType(vItem.FindControl("txtTOTALPRICE"), RadNumericTextBox).Text
                insitem.ITEM_STATUS = CType(vItem.FindControl("rcbITEMSTATUS"), RadComboBox).SelectedValue
                insitem.CREATEDBY = Session("uid")
                insitem.CREATEDDATE = Now
                Try
                    db.tITEMs.Add(insitem)
                    db.SaveChanges()
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
                Catch ex As Exception
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
            Case RadGrid.UpdateCommandName
                Dim vItem As GridEditableItem = CType(e.Item, GridEditableItem)
                Dim datakey = vItem.GetDataKeyValue("ITEM_ID").ToString()
                Dim upditem As tITEM = db.tITEMs.Where(Function(p) p.ITEM_ID = datakey).FirstOrDefault()
                Try
                    vItem.UpdateValues(upditem)
                    db.SaveChanges()
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
                Catch ex As Exception
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
            Case RadGrid.DeleteCommandName
                Dim datakey As String = e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("ITEM_ID").ToString
                Dim delitem As tITEM = db.tITEMs.Where(Function(p) p.ITEM_ID = datakey).FirstOrDefault
                Try
                    db.tITEMs.Remove(delitem)
                    db.SaveChanges()
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
                Catch ex As Exception
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
            Case "cmdFiles"
                RdwView.NavigateUrl = "~/Page/UploadFile.aspx?ID=" & e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("ITEM_ID").ToString
                RdwView.VisibleOnPageLoad = True
        End Select
    End Sub
    Private Function functotalQty(ByVal qty As Decimal, ByVal unit As String) As Decimal
        If unit = "UNT01" Then
            functotalQty = qty * 1
        ElseIf unit = "UNT02" Then
            functotalQty = qty * 12
        ElseIf unit = "UNT03" Then
            functotalQty = qty * 20
        ElseIf unit = "UNT04" Then
            functotalQty = qty * 144
        End If
        functotalQty = functotalQty
    End Function
    Private Function totalAmount(ByVal qty As Decimal, ByVal price As Decimal, ByVal unit As String) As Decimal
        If unit = "UNT01" Then
            totalAmount = qty * price
        ElseIf unit = "UNT02" Then
            totalAmount = qty * 12 * price
        ElseIf unit = "UNT03" Then
            totalAmount = qty * 20 * price
        ElseIf unit = "UNT04" Then
            totalAmount = qty * 144 * price
        End If
        totalAmount = totalAmount
    End Function
    Protected Sub tot(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim unit As RadComboBox = CType(sender.NamingContainer.FindControl("rcbITEMUNIT"), RadComboBox)
        Dim sts As RadComboBox = CType(sender.NamingContainer.FindControl("rcbITEMSTATUS"), RadComboBox)
        Dim qty As RadNumericTextBox = CType(sender.NamingContainer.FindControl("txtITEMQTY"), RadNumericTextBox)
        Dim totalqty As RadNumericTextBox = CType(sender.NamingContainer.FindControl("txtTOTALQTY"), RadNumericTextBox)
        Dim purcqty As RadNumericTextBox = CType(sender.NamingContainer.FindControl("txtPURCQTY"), RadNumericTextBox)
        Dim balqty As RadNumericTextBox = CType(sender.NamingContainer.FindControl("txtBALQTY"), RadNumericTextBox)
        Dim price As RadNumericTextBox = CType(sender.NamingContainer.FindControl("txtITEMPRICE"), RadNumericTextBox)
        Dim totalAmmount As RadNumericTextBox = CType(sender.NamingContainer.FindControl("txtTOTALPRICE"), RadNumericTextBox)
        
        If sts.SelectedValue = "STS01" Then
            qty.Enabled = True
            totalqty.DbValue = functotalQty(qty.DbValue, unit.SelectedValue)
            price.Enabled = False
            price.Text = "0"
            totalAmmount.Text = "0"
            qty.MinValue = purcqty.DbValue
            balqty.DbValue = totalqty.DbValue - purcqty.DbValue
        ElseIf sts.SelectedValue = "STS02" Then
            qty.Enabled = False
            price.Enabled = True
            qty.Text = "0"
            totalqty.Text = "0"
            qty.MinValue = purcqty.DbValue
            totalAmmount.Text = "0"
            balqty.DbValue = totalqty.DbValue - purcqty.DbValue
        Else
            qty.Enabled = True
            totalqty.DbValue = functotalQty(qty.DbValue, unit.SelectedValue)
            qty.MinValue = purcqty.DbValue
            balqty.DbValue = totalqty.DbValue - purcqty.DbValue
            price.Enabled = True
            If qty.Text = "" Or price.Text = "" Then
                totalAmmount.Text = "0"
            Else
                totalAmmount.DbValue = totalAmount(qty.DbValue, price.DbValue, unit.SelectedValue)
            End If
        End If
    End Sub
    Protected Sub rcbITEMNAME_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs)
        Dim unit As RadComboBox = CType(sender.NamingContainer.FindControl("rcbITEMUNIT"), RadComboBox)
        Dim sts As RadComboBox = CType(sender.NamingContainer.FindControl("rcbITEMSTATUS"), RadComboBox)
        Dim qty As RadNumericTextBox = CType(sender.NamingContainer.FindControl("txtITEMQTY"), RadNumericTextBox)
        Dim purcqty As RadNumericTextBox = CType(sender.NamingContainer.FindControl("txtPURCQTY"), RadNumericTextBox)
        Dim balqty As RadNumericTextBox = CType(sender.NamingContainer.FindControl("txtBALQTY"), RadNumericTextBox)
        Dim totalqty As RadNumericTextBox = CType(sender.NamingContainer.FindControl("txtTOTALQTY"), RadNumericTextBox)
        Dim price As RadNumericTextBox = CType(sender.NamingContainer.FindControl("txtITEMPRICE"), RadNumericTextBox)
        Dim totalAmmount As RadNumericTextBox = CType(sender.NamingContainer.FindControl("txtTOTALPRICE"), RadNumericTextBox)
        unit.ClearSelection()
        sts.ClearSelection()
        qty.Text = "0"
        totalqty.Text = "0"
        purcqty.Text = "0"
        balqty.Text = "0"
        price.Text = "0"
        totalAmmount.Text = "0"
    End Sub
End Class
