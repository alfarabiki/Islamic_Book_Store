Imports Telerik.Web.UI

Partial Class Page_Profile
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            loaddata(Session("uid"))
        End If
    End Sub
    Sub loaddata(ByVal UserId As String)
        Dim data = (From a In db.tUSERs Where a.USER_ID = UserId)
        If data.Count > 0 Then
            rtbUserId.Text = data.SingleOrDefault.USER_ID
            rtbName.Text = data.SingleOrDefault.USER_NAME
            rtbAddress.Text = data.SingleOrDefault.USER_ADDRESS
            rtbMobile.Text = data.SingleOrDefault.USER_MOBILE
            rtbEmail.Text = data.SingleOrDefault.USER_MAIL
            If data.SingleOrDefault.MULTIROLE = True Then
                MyRole.Visible = True
            Else
                MyRole.Visible = False
            End If
        End If
    End Sub
    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Dim userId As String = Session("uid")
        Dim upditem As tUSER = db.tUSERs.Where(Function(p) p.USER_ID = userId).FirstOrDefault()
        upditem.USER_NAME = rtbName.Text
        upditem.USER_ADDRESS = rtbAddress.Text
        upditem.USER_MOBILE = rtbMobile.Text
        upditem.USER_MAIL = rtbEmail.Text
        Try
            db.SaveChanges()
            Response.Redirect("~/Home.aspx")
        Catch ex As Exception
            CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
        End Try
    End Sub
    Private Sub rgSelectRole_ItemCommand(sender As Object, e As Telerik.Web.UI.GridCommandEventArgs) Handles rgSelectRole.ItemCommand
        Select Case e.CommandName
            Case "cmdselect"
                Dim dataItem As GridDataItem = CType(e.Item, GridDataItem)
                Dim datakey As String = dataItem.OwnerTableView.DataKeyValues(dataItem.ItemIndex)("ASSIGNMENT_ID").ToString
                Dim data = (From myrole In db.vMYROLEs _
                            Where myrole.ASSIGNMENT_ID = datakey _
                            Select New With {.userid = myrole.USER_ID,
                                             .rolename = myrole.ROLE_DESCRIPTION,
                                             .rolecode = myrole.ROLE_CODE}).FirstOrDefault
                Session("rolename") = data.rolename
                Session("rolecode") = data.rolecode
                Dim iduser As String = data.userid
                Dim upduser As tUSER = db.tUSERs.Where(Function(p) p.USER_ID = iduser).FirstOrDefault()
                upduser.USER_ROLE = data.rolecode
                db.SaveChanges()

                If data.rolecode.Contains("RC002") Then
                    Response.Redirect("~/Page/Dashboard.aspx")
                Else
                    Response.Redirect("~/Home.aspx")
                End If
        End Select
    End Sub
End Class