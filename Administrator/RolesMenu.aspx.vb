Imports Telerik.Web.UI

Partial Class Administrator_RolesMenu
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities
    Private Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim role As String = rcbRole.SelectedValue
        Dim getMenu = (From s In db.tROLESMENUs Where s.ROLE_CODE = role)
        db.tROLESMENUs.RemoveRange(getMenu)
        db.SaveChanges()
        For Each item As TreeListDataItem In rtlMenu.Items
            Dim sMenu As New tROLESMENU
            sMenu.RM_ID = System.Guid.NewGuid.ToString
            sMenu.MENU_ID = item.GetDataKeyValue("MENU_ID").ToString
            sMenu.ROLE_CODE = rcbRole.SelectedValue
            sMenu.SELECT = CType(item("SELECT").FindControl("chkSelect"), CheckBox).Checked
            sMenu.INSERT = CType(item("INSERT").FindControl("chkInsert"), CheckBox).Checked
            sMenu.UPDATE = CType(item("UPDATE").FindControl("chkUpdate"), CheckBox).Checked
            sMenu.DELETE = CType(item("DELETE").FindControl("chkDelete"), CheckBox).Checked
            sMenu.REPORT = CType(item("REPORT").FindControl("chkReport"), CheckBox).Checked
            sMenu.CREATEDBY = Session("uid")
            sMenu.CREATEDDATE = Date.Now
            db.tROLESMENUs.Add(sMenu)
            db.SaveChanges()
        Next
        CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Permissions has been saved")
    End Sub

    Protected Sub btnShow_Click(sender As Object, e As EventArgs) Handles btnShow.Click
        rtlMenu.ExpandAllItems()
        For Each item As TreeListDataItem In rtlMenu.Items
            Dim datakey As String = item.GetDataKeyValue("MENU_ID").ToString
            Dim sMenu = (From s In db.tROLESMENUs Where s.MENU_ID = datakey _
                         And s.ROLE_CODE = rcbRole.SelectedValue)
            If sMenu.Count > 0 Then
                CType(item("INSERT").FindControl("chkInsert"), CheckBox).Checked = sMenu.FirstOrDefault.INSERT
                CType(item("SELECT").FindControl("chkSelect"), CheckBox).Checked = sMenu.FirstOrDefault.SELECT
                CType(item("UPDATE").FindControl("chkUpdate"), CheckBox).Checked = sMenu.FirstOrDefault.UPDATE
                CType(item("DELETE").FindControl("chkDelete"), CheckBox).Checked = sMenu.FirstOrDefault.DELETE
                CType(item("REPORT").FindControl("chkReport"), CheckBox).Checked = sMenu.FirstOrDefault.REPORT
            End If
        Next
    End Sub
End Class
