
Partial Class Page_IndexDetail
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            loaddata(Request("Id").ToString)
        End If
    End Sub
    Sub loaddata(ByVal item_id As String)
        Dim data = (From b In db.tITEMs
                     From c In db.tITEM_DETAIL.Where(Function(c) b.ITEM_ID = c.ITEM_ID).DefaultIfEmpty
                     From d In db.tCODEs.Where(Function(d) b.ITEM_NAME = d.C_CODE).DefaultIfEmpty
                     Where b.ITEM_ID = item_id)

        If data.Count > 0 Then
            lblItem_id.Text = data.SingleOrDefault.b.ITEM_ID
            lblTitlebook.Text = data.SingleOrDefault.d.C_DESCRIPTION
            Dim dataid As String = data.SingleOrDefault.c.DETAIL_ID
            rtbKategori.Text = data.SingleOrDefault.c.KATEGORI
            rtbPenerbit.Text = data.SingleOrDefault.c.PENERBIT
            rtbKondisi.Text = data.SingleOrDefault.c.KONDISI
            rtbJumlahBarang.Text = CInt(data.SingleOrDefault.b.BAL_QTY) & " Buah"
            rtbBahan.Text = data.SingleOrDefault.c.BAHAN
            rtbHarga.Text = "Rp. " & Format(data.SingleOrDefault.b.ITEM_PRICE, "#,##0")
            rtbDetilProduk.Text = data.SingleOrDefault.c.DETIL_PRODUK
        End If
    End Sub
End Class
