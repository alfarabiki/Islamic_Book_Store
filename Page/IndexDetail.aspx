<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="IndexDetail.aspx.vb" Inherits="Page_IndexDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        fieldset {
            display: block;
            margin-left: 2px;
            margin-right: 2px;
            padding-top: 0.35em;
            padding-bottom: 0.625em;
            padding-left: 0.75em;
            padding-right: 0.75em;
            border: 2px solid;
            border-color: #368EE0;
            border-radius: 4px;
        }

        legend {
            width: 220px;
            padding-left: 10px;
            font-weight: bold;
            font-size: medium;
            font-style: normal;
            font-variant: small-caps;
            border: none;
        }
    </style>
    <fieldset style="border-color: #E5E5E5;">
        <legend style="padding-top: 5px;">Rincian Informasi Produk</legend>
        <table style="width: 100%">
            <tr>
                <td style="padding-left: 5px; padding-top: 5px; vertical-align: top; width: 420px">
                    <telerik:RadImageGallery ID="RadRotator1" runat="server" Height="450" Width="400" RenderMode="Lightweight"
                        DataSourceID="dsDocument" DataImageField="FILE_PATH" DataKeyNames="FILE_ID">
                    </telerik:RadImageGallery>
                </td>
                <td style="padding-left: 5px; padding-top: 5px; vertical-align: top;">
                    <table style="width: 100%">
                        <tr>
                            <td colspan="3" style="padding-left: 2px; padding-bottom: 10px; font-weight: bold; font-size: larger">
                                <asp:Label ID="lblTitlebook" runat="server"></asp:Label>
                                <asp:Label ID="lblItem_id" runat="server" Visible="false"></asp:Label>
                            </td>                            
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox ID="rtbLabel1" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text="Kategori" Width="150">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="rtbtitikdua1" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text=":" Width="20px">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="rtbKategori" runat="server" Width="100%" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox ID="rtbLabel2" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text="Penerbit" Width="150">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="rtbtitikdua2" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text=":" Width="20px">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="rtbPenerbit" runat="server" Width="100%" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox ID="rtbLabel3" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text="Kondisi" Width="150">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="rtbtitikdua3" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text=":" Width="20px">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="rtbKondisi" runat="server" Width="100%" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox ID="rtbLabel4" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text="Bahan Sampul" Width="150">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="rtbtitikdua4" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text=":" Width="20px">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="rtbBahan" runat="server" Width="100%" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox ID="rtbLabel5" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text="Total Barang" Width="150">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="rtbtitikdua5" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text=":" Width="20px">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="rtbJumlahBarang" runat="server" Width="100%" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox ID="rtbLabel6" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text="Harga" Width="150">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="rtbtitikdua6" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text=":" Width="20px">
                                </telerik:RadTextBox>
                            </td>
                            <td style="vertical-align: top;">
                                <telerik:RadTextBox ID="rtbHarga" runat="server" Width="100%" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox ID="rtbLabel7" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text="Detail Produk" Width="150">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox ID="rtbtitikdua7" runat="server" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" Text=":" Width="20px">
                                </telerik:RadTextBox>
                            </td>
                            <td style="vertical-align: top;">
                                <telerik:RadTextBox ID="rtbDetilProduk" runat="server" Width="100%" Font-Size="Large" Enabled="false" ForeColor="Black"
                                    BorderColor="Transparent" BackColor="Transparent" TextMode="MultiLine" Rows="8">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="padding-left: 20px; padding-bottom: 10px; font-weight: bold; font-size: larger">Daftar Buku</td>
                        </tr>
                        <tr>
                            <td style="padding-left: 20px;">
                                <telerik:RadGrid ID="rgListBook" DataSourceID="dsListBuku" Width="350" runat="server" AllowFilteringByColumn="True" AllowSorting="True" AutoGenerateColumns="False">
                                    <MasterTableView DataKeyNames="ITEM_ID" AutoGenerateColumns="False" CommandItemDisplay="None">
                                        <Columns>
                                            <telerik:GridHyperLinkColumn HeaderText="Temukan referensi lainnya disini :" DataNavigateUrlFields="ITEM_ID,FOLDER_PAGE,APPLICATION_PAGE" AutoPostBackOnFilter="true"
                                                DataNavigateUrlFormatString="~/{1}/{2}.aspx?ITEM_ID={0}" DataTextField="C_DESCRIPTION"
                                                UniqueName="C_DESCRIPTION" CurrentFilterFunction="Contains" ShowFilterIcon="false" FilterControlWidth="100%">
                                                <HeaderStyle Width="140px" HorizontalAlign="Left" Font-Bold="true" />
                                                <ItemStyle Width="140px" HorizontalAlign="Left" ForeColor="#368EE0" Font-Underline="true" />
                                            </telerik:GridHyperLinkColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings>
                                        <Scrolling ScrollHeight="215" AllowScroll="true" UseStaticHeaders="true" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </td>
                        </tr>
                        <tr>
                            <td style="margin-top: 50px; margin-bottom: 50px; margin-left: 40px; float: Left">
                                <asp:Button ID="btnBack" PostBackUrl="~/Page/Index.aspx" runat="server" Text="      Back     " BackColor="#368EE0" />
                            </td>
                            <td style="margin-top: 50px; margin-bottom: 50px; margin-left: 10px; margin-right: 50px; float: right">
                                <h1 class="gradation" style="color: #368EE0">© Coypyright :: 2020</h1>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="dsDocument" runat="server" SelectCommandType="StoredProcedure"
            ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="SP_FILE">
            <SelectParameters>
                <asp:QueryStringParameter Name="ITEM_ID" QueryStringField="Id" DbType="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsListBuku" runat="server" SelectCommandType="StoredProcedure"
            ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="USP_LIST_BUKU"></asp:SqlDataSource>
    </fieldset>
</asp:Content>

