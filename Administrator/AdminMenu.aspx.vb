Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.IO
Partial Class Administrator_AdminMenu
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities
    Protected Sub rgMenuList_ItemCommand(sender As Object, e As Telerik.Web.UI.GridCommandEventArgs) Handles rgMenuList.ItemCommand
        Select Case e.CommandName
            Case RadGrid.PerformInsertCommandName
                Dim vItem As GridEditableItem = CType(e.Item, GridEditableItem)
                Dim insmenu As New tMENU
                If Not CType(vItem.FindControl("txtParentID"), RadTextBox).Text.Equals("") Then
                    insmenu.PARENT_ID = CType(vItem.FindControl("txtParentID"), RadTextBox).Text
                End If
                insmenu.MENU_DESCRIPTION = CType(vItem.FindControl("txtDescription"), RadTextBox).Text
                insmenu.MENU_VALUE = CType(vItem.FindControl("txtMenuValue"), RadTextBox).Text
                insmenu.MENU_URL = CType(vItem.FindControl("txtMenuURL"), RadTextBox).Text
                insmenu.MENU_ORDER = CType(vItem.FindControl("txtMenuOrder"), RadTextBox).Text
                insmenu.CREATEDBY = Session("uid")
                insmenu.CREATEDDATE = Now
                Try
                    db.tMENUs.Add(insmenu)
                    db.SaveChanges()
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
                Catch ex As Exception
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
            Case RadGrid.UpdateCommandName
                Dim vItem As GridEditableItem = CType(e.Item, GridEditableItem)
                Dim datakey = vItem.GetDataKeyValue("MENU_ID").ToString()
                Dim updmenu As tMENU = db.tMENUs.Where(Function(p) p.MENU_ID = datakey).FirstOrDefault()
                Try
                    vItem.UpdateValues(updmenu)
                    db.SaveChanges()
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
                Catch ex As Exception
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
            Case RadGrid.DeleteCommandName
                Dim datakey As String = e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("MENU_ID").ToString
                Dim delmenu As tMENU = db.tMENUs.Where(Function(p) p.MENU_ID = datakey).FirstOrDefault
                Try
                    db.tMENUs.Remove(delmenu)
                    db.SaveChanges()
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
                Catch ex As Exception
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
        End Select
    End Sub
End Class
