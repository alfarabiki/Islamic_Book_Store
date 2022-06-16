Imports Telerik.Web.UI

Partial Class Cart
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            loaddata(Session("uid"))
        End If
    End Sub
    Sub loaddata(ByVal uid As String)
        Dim MyCart = (From a In db.tCARTs
                      From b In db.tPURCHASINGs.Where(Function(b) a.CART_ID = b.CART_ID).DefaultIfEmpty
                      Where a.USER_ID = uid And b.PAYMENT_STATUS Is Nothing)
        If MyCart.Count > 0 Then
            paymentarea.Visible = True
        Else
            paymentarea.Visible = False
        End If
    End Sub
    Protected Sub rgCartList_ItemCommand(sender As Object, e As Telerik.Web.UI.GridCommandEventArgs) Handles rgCartList.ItemCommand
        Select Case e.CommandName
            Case "cmdDetail"
                Dim datakey As String = e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("CART_ID").ToString
                Response.Redirect("~/CartDetail.aspx?Id=" & datakey)
            Case RadGrid.DeleteCommandName
                Dim datakey As String = e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("CART_ID").ToString
                Dim delCart As tCART = db.tCARTs.Where(Function(p) p.CART_ID = datakey).SingleOrDefault
                Try
                    db.tCARTs.Remove(delCart)
                    Dim ITEM_ID As String = delCart.ITEM_ID
                    Dim uITEM As tITEM = db.tITEMs.Where(Function(p) p.ITEM_ID = ITEM_ID).SingleOrDefault
                    Dim cancelQty As Decimal = uITEM.PURC_QTY - delCart.ITEM_QTY
                    uITEM.PURC_QTY = cancelQty

                    Dim balQty As Decimal = uITEM.BAL_QTY + delCart.ITEM_QTY
                    uITEM.BAL_QTY = balQty


                    If delCart.ITEM_STATUS = "BELI" Then
                        If balQty > 0 Then
                            uITEM.ITEM_STATUS = "STS03"
                        Else
                            uITEM.ITEM_STATUS = "STS02"
                        End If
                    End If
                    db.SaveChanges()
                    Response.Redirect("~/Cart.aspx")
                Catch ex As Exception
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                End Try
        End Select
    End Sub

    Protected Sub btnPayment_Click(sender As Object, e As EventArgs) Handles btnPayment.Click
        rwPaymentShow()
        rwPayment.VisibleOnPageLoad = True
    End Sub
    Public Sub rwPaymentShow()
        rwPayment.Title = "Pembayaran"
        Dim script As String = "function f(){$find(""" + rwPayment.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim vitem As GridEditableItem = Nothing
        For Each vitem In rgCartList.Items
            If vitem("PAYMENT_STATUS").Text.Equals("Belum Terbayar") Then
                Dim datakey As String = vitem.GetDataKeyValue("CART_ID").ToString
                If rcbBankCode.SelectedValue Is Nothing Then
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Silahkan Pilih Bank Terlebih Dahulu!")
                Else
                    Dim insitem As New tPURCHASING
                    insitem.PURC_ID = System.Guid.NewGuid.ToString
                    insitem.CART_ID = datakey
                    insitem.PAYMENT_DATE = Date.Now
                    insitem.PAYMENT_STATUS = "Telah Dibayar"
                    db.tPURCHASINGs.Add(insitem)
                    db.SaveChanges()
                End If
            End If
        Next
        Response.Redirect("~/Cart.aspx")
    End Sub
    Protected Sub rcbBankCode_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs)
        kodebayar.Visible = True
        If rcbBankCode.SelectedValue = "147" Then
            lblkodepembayaran.Text = "Kode Pembayaran : <b>86018237</b>"
        ElseIf rcbBankCode.SelectedValue = "427" Then
            lblkodepembayaran.Text = "Kode Pembayaran : <b>9000018237</b>"
        ElseIf rcbBankCode.SelectedValue = "451" Then
            lblkodepembayaran.Text = "Kode Pembayaran : <b>1908718237</b>"
        End If
    End Sub

    Protected Sub rgCartList_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles rgCartList.ItemDataBound
        If TypeOf e.Item Is GridDataItem Then
            Dim item As GridDataItem = DirectCast(e.Item, GridDataItem)
            If item("PAYMENT_STATUS").Text.Equals("Belum Terbayar") Then
                CType(item("Cancel").Controls(0), Button).Visible = True
            Else
                CType(item("Cancel").Controls(0), Button).Visible = False
            End If
        End If
    End Sub
End Class
