Imports Telerik.Web.UI

Partial Class Administrator_InputDetailData
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities
    Protected Sub rgInputDetailData_ItemCommand(sender As Object, e As Telerik.Web.UI.GridCommandEventArgs) Handles rgInputDetailData.ItemCommand
        Select Case e.CommandName
            Case RadGrid.UpdateCommandName
                Dim vItem As GridEditableItem = CType(e.Item, GridEditableItem)
                Dim datakey = vItem.GetDataKeyValue("DETAIL_ID").ToString()
                Dim data = (From a In db.tITEM_DETAIL Where a.DETAIL_ID = datakey)
                If data.Count > 0 Then
                    Dim upditem As tITEM_DETAIL = db.tITEM_DETAIL.Where(Function(p) p.DETAIL_ID = datakey).FirstOrDefault()
                    Try
                        upditem.ITEM_ID = CType(vItem.FindControl("rcbJudulBuku"), RadComboBox).SelectedValue
                        upditem.FOLDER_PAGE = CType(vItem.FindControl("rtbFolderPage"), RadTextBox).Text
                        upditem.APPLICATION_PAGE = CType(vItem.FindControl("rtbApplicationPage"), RadTextBox).Text
                        upditem.KATEGORI = CType(vItem.FindControl("rtbKategori"), RadTextBox).Text
                        upditem.PENERBIT = CType(vItem.FindControl("rtbPenerbit"), RadTextBox).Text
                        upditem.KONDISI = CType(vItem.FindControl("rtbKondisi"), RadTextBox).Text
                        upditem.BAHAN = CType(vItem.FindControl("rtbBahan"), RadTextBox).Text
                        upditem.DETIL_PRODUK = CType(vItem.FindControl("rtbDetilProduk"), RadTextBox).Text
                        upditem.UPDATEDBY = Session("uid")
                        upditem.UPDATEDDATE = Now
                        db.SaveChanges()
                        CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Update Success")
                    Catch ex As Exception
                        CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                    End Try
                Else
                    Dim insitem As New tITEM_DETAIL
                    insitem.DETAIL_ID = System.Guid.NewGuid.ToString
                    insitem.ITEM_ID = CType(vItem.FindControl("rcbJudulBuku"), RadComboBox).SelectedValue
                    insitem.FOLDER_PAGE = CType(vItem.FindControl("rtbFolderPage"), RadTextBox).Text
                    insitem.APPLICATION_PAGE = CType(vItem.FindControl("rtbApplicationPage"), RadTextBox).Text
                    insitem.KATEGORI = CType(vItem.FindControl("rtbKategori"), RadTextBox).Text
                    insitem.PENERBIT = CType(vItem.FindControl("rtbPenerbit"), RadTextBox).Text
                    insitem.KONDISI = CType(vItem.FindControl("rtbKondisi"), RadTextBox).Text
                    insitem.BAHAN = CType(vItem.FindControl("rtbBahan"), RadTextBox).Text
                    insitem.DETIL_PRODUK = CType(vItem.FindControl("rtbDetilProduk"), RadTextBox).Text
                    insitem.CREATEDBY = Session("uid")
                    insitem.CREATEDDATE = Now
                    Try
                        db.tITEM_DETAIL.Add(insitem)
                        db.SaveChanges()
                        CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Update Success")
                    Catch ex As Exception
                        CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                    End Try
                End If
        End Select
    End Sub
End Class
