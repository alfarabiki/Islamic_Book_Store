
Partial Class ForSale_IslamicBooksSale
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            loaddata(Request("ITEM_ID").ToString)
        End If
    End Sub
    Sub loaddata(ByVal item_id As String)
        Dim data = (From a In db.tITEMs
                    From b In db.tITEM_DETAIL.Where(Function(b) a.ITEM_ID = b.ITEM_ID).DefaultIfEmpty
                    From c In db.tCODEs.Where(Function(c) a.ITEM_UNIT = c.C_CODE).DefaultIfEmpty
                    From d In db.tCODEs.Where(Function(d) a.ITEM_NAME = d.C_CODE).DefaultIfEmpty
                    From e In db.tCODEs.Where(Function(e) a.ITEM_STATUS = e.C_CODE).DefaultIfEmpty
                    Where a.ITEM_ID = item_id)
        If data.Count > 0 Then
            Dim dataid As String = data.SingleOrDefault.b.DETAIL_ID
            lblTitlebook.Text = data.SingleOrDefault.d.C_DESCRIPTION
            rtbKategori.Text = data.SingleOrDefault.b.KATEGORI
            rtbPenerbit.Text = data.SingleOrDefault.b.PENERBIT
            rtbKondisi.Text = data.SingleOrDefault.b.KONDISI
            rtbBahan.Text = data.SingleOrDefault.b.BAHAN
            rtbStock.Text = CInt(data.SingleOrDefault.a.BAL_QTY) & " Buah"
            rtbDetilProduk.Text = data.SingleOrDefault.b.DETIL_PRODUK
            rtbStatus.Text = data.SingleOrDefault.e.C_DESCRIPTION
            lblprice.Text = "Rp. " & Format(data.SingleOrDefault.a.ITEM_PRICE, "#,00")
            hfPrice.Value = data.SingleOrDefault.a.ITEM_PRICE
        End If
        Qty.MaxValue = data.SingleOrDefault.a.BAL_QTY
    End Sub

    Protected Sub btnAddToCart_Click(sender As Object, e As EventArgs) Handles btnAddToCart.Click
        If Qty.Value > 0 Then
            Dim insitem As New tCART
            insitem.CART_ID = System.Guid.NewGuid.ToString
            insitem.ITEM_ID = Request("ITEM_ID").ToString
            insitem.ITEM_QTY = Qty.Value
            insitem.ITEM_PRICE = hfPrice.Value
            insitem.TOTAL_PRICE = Qty.Value * hfPrice.Value
            insitem.ITEM_STATUS = "BELI"
            insitem.USER_ID = Session("uid")
            insitem.CREATEDBY = Session("uid")
            insitem.CREATEDDATE = Now
            Try
                db.tCARTs.Add(insitem)
                Dim ITEM_ID As String = Request("ITEM_ID").ToString
                Dim uITEM As tITEM = db.tITEMs.Where(Function(p) p.ITEM_ID = ITEM_ID).SingleOrDefault
                Dim PurchaseQty As Decimal = uITEM.PURC_QTY + Qty.Value
                uITEM.PURC_QTY = PurchaseQty

                uITEM.BAL_QTY = uITEM.TOTAL_QTY - PurchaseQty

                Dim balQty As Decimal = uITEM.BAL_QTY
                If balQty > 0 Then
                    uITEM.ITEM_STATUS = "STS03"
                Else
                    uITEM.ITEM_STATUS = "STS02"
                End If
                db.SaveChanges()
                Response.Redirect("~/ForSale/IslamicBooksSale.aspx?ITEM_ID=" & Request("ITEM_ID").ToString)
            Catch ex As Exception
                CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
            End Try
        Else
            CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Minimum Qty = 1")
        End If
    End Sub
End Class
