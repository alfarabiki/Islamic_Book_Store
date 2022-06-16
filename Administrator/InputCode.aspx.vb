Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.IO
Partial Class Administrator_InputCode
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities

    Protected Sub rgInputCode_ItemCommand(sender As Object, e As Telerik.Web.UI.GridCommandEventArgs) Handles rgInputCode.ItemCommand
        Select Case e.CommandName
            Case RadGrid.PerformInsertCommandName
                Dim vItem As GridEditableItem = CType(e.Item, GridEditableItem)
                Dim inscode As New tCODE
                inscode.C_CODE = CType(vItem.FindControl("txtCODE"), RadTextBox).Text
                inscode.C_DESCRIPTION = CType(vItem.FindControl("txtDESC"), RadTextBox).Text
                inscode.C_GROUP = CType(vItem.FindControl("txtGROUP"), RadTextBox).Text
                inscode.C_ORDER = CType(vItem.FindControl("txtORDER"), RadNumericTextBox).Text
                inscode.CREATEDBY = Session("uid")
                inscode.CREATEDDATE = Now
                Try
                    db.tCODEs.Add(inscode)
                    db.SaveChanges()
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
                Catch ex As Exception
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
            Case RadGrid.UpdateCommandName
                Dim vItem As GridEditableItem = CType(e.Item, GridEditableItem)
                Dim datakey = vItem.GetDataKeyValue("C_ID").ToString()
                Dim updcode As tCODE = db.tCODEs.Where(Function(p) p.C_ID = datakey).FirstOrDefault()
                Try
                    vItem.UpdateValues(updcode)
                    db.SaveChanges()
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
                Catch ex As Exception
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
            Case RadGrid.DeleteCommandName
                Dim datakey As String = e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("C_ID").ToString
                Dim delcode As tCODE = db.tCODEs.Where(Function(p) p.C_ID = datakey).FirstOrDefault
                Try
                    db.tCODEs.Remove(delcode)
                    db.SaveChanges()
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
                Catch ex As Exception
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
        End Select
    End Sub
End Class
