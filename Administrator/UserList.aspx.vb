Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.IO
Partial Class Administrator_UserList
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities

    Protected Sub rgUserList_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles rgUserList.ItemCommand
        Select Case e.CommandName
            Case RadGrid.PerformInsertCommandName
                Dim vItem As GridEditableItem = CType(e.Item, GridEditableItem)
                Dim insuser As New tUSER
                insuser.USER_ID = CType(vItem.FindControl("txtUserID"), RadNumericTextBox).Text
                insuser.USER_NAME = CType(vItem.FindControl("txtName"), RadTextBox).Text
                insuser.MULTIROLE = CType(vItem.FindControl("chkMultirole"), CheckBox).Checked
                insuser.USER_ROLE = CType(vItem.FindControl("rcbrole"), RadComboBox).SelectedValue
                insuser.USER_ADDRESS = CType(vItem.FindControl("txtAddress"), RadTextBox).Text
                insuser.USER_MOBILE = CType(vItem.FindControl("txtPhone"), RadTextBox).Text
                insuser.USER_MAIL = CType(vItem.FindControl("txtMail"), RadTextBox).Text
                insuser.USER_PASSWORD = CType(vItem.FindControl("txtPassword"), RadTextBox).Text
                insuser.CREATEDBY = Session("uid")
                insuser.CREATEDDATE = Now
                Try
                    db.tUSERs.Add(insuser)
                    db.SaveChanges()
                    rgUserList.Rebind()
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
                Catch ex As SqlException
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
            Case RadGrid.UpdateCommandName
                Dim vItem As GridEditableItem = CType(e.Item, GridEditableItem)
                Dim datakey = vItem.GetDataKeyValue("USER_ID").ToString()
                Dim upduser As tUSER = db.tUSERs.Where(Function(p) p.USER_ID = datakey).FirstOrDefault()
                upduser.UPDATEDBY = Session("uid")
                upduser.UPDATEDDATE = Now
                Try
                    vItem.UpdateValues(upduser)
                    db.SaveChanges()
                    rgUserList.Rebind()
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
                Catch ex As Exception
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
            Case RadGrid.DeleteCommandName
                Dim datakey As String = e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("USER_ID").ToString
                Dim deluser As tUSER = db.tUSERs.Where(Function(p) p.USER_ID = datakey).FirstOrDefault
                Try
                    db.tUSERs.Remove(deluser)
                    db.SaveChanges()
                    rgUserList.Rebind()
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
                Catch ex As Exception
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
        End Select
    End Sub

    Protected Sub rgUserList_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles rgUserList.ItemDataBound
        If TypeOf e.Item Is GridDataItem AndAlso e.Item.OwnerTableView.DataSourceID = "dsUserList" Then
            Dim item As GridDataItem = DirectCast(e.Item, GridDataItem)
            Dim lbl As Label = CType(e.Item.FindControl("numberLabel"), Label)
            lbl.Text = (e.Item.ItemIndex + 1).ToString
            'CType(item("trPass").Controls(0), TableRow).Visible = False
        End If
    End Sub
End Class
