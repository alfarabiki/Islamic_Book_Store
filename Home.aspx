<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Images/logo_login.jpg" rel="shortcut icon" type="image/x-icon" />
    <title>&nbsp;&nbsp;:: ISLAMIC BOOKSTORE ::</title>
    <link href="Css/islamicbookstore.css" rel="stylesheet" />
    <script src="Css/menu.js"></script>
    <script>
        /* ========================
               JAM dan TANGGAL
        ==========================*/
        function date_time(id) {
            date = new Date;
            year = date.getFullYear();
            month = date.getMonth();
            months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
            d = date.getDate();
            day = date.getDay();
            days = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
            h = date.getHours();
            if (h < 10) {
                h = "0" + h;
            }
            m = date.getMinutes();
            if (m < 10) {
                m = "0" + m;
            }
            s = date.getSeconds();
            if (s < 10) {
                s = "0" + s;
            }
            result = '' + days[day] + ', ' + d + ' ' + months[month] + ' ' + year + ' | ' + h + ':' + m + ':' + s;
            document.getElementById(id).innerHTML = result;
            setTimeout('date_time("' + id + '");', '1000');
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <cc1:msgBox ID="MsgBox1" runat="server" />
        <div class="containerTop">
            <div class="topBG1">
                <div class="tanggalan1">
                    <asp:Label ID="lblrole" CssClass="tanggalan1" runat="server"></asp:Label>
                </div>
                <div class="tanggalan" id="date_time"></div>
                <script type="text/javascript">window.onload = date_time('date_time');</script>
                <div class="topNav">
                </div>
            </div>
            <div class="topBG2">
                <div style="margin-left: 5px; margin-top: 20px; margin-right: 5px;">
                    <telerik:RadNotification ID="RadNotif" runat="server" AutoCloseDelay="10" Width="250" Title="Information"></telerik:RadNotification>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <telerik:RadMenu ID="RM_Menu" runat="server" DataFieldID="MENU_ID"
                        DataNavigateUrlField="MENU_URL" DataSourceID="DS_Menu" DataTextField="MENU_DESCRIPTION" DataValueField="MENU_VALUE" DataFieldParentID="PARENT_ID">
                    </telerik:RadMenu>
                    <asp:SqlDataSource ID="DS_MENU" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>"
                        SelectCommand="USP_LISTMENU" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ROLECODE" SessionField="rolecode" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div style="margin-top: 90px; margin-bottom: 50px; bottom: 50px; padding-left: 5px; padding-right: 5px;">
            <table style="width: 100%">
                <tr>
                    <td align="center" style="padding-bottom: 1px;" colspan="2">
                        <h2 style="color: #4EB058;padding-bottom:2px">اَلسَّلاَمُ عَلَيْكُمْ وَرَحْمَةُ اللهِ وَبَرَكَاتُهُ</h2>
                        <h1 style="color: #368EE0;">Welcome to the Islamic Bookstore. Thank you. Enjoy</h1>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <telerik:RadHtmlChart ID="GrafikPembelian" runat="server" ToolTip="Top 7 Best Seller" Height="270" Transitions="true" DataSourceID="dsGrafikPembelian">
                            <PlotArea>
                                <Series>
                                    <telerik:ColumnSeries Name="Total Barang" DataFieldY="TOTAL_BARANG">
                                        <Appearance>
                                            <FillStyle BackgroundColor="Blue" />
                                        </Appearance>
                                        <LabelsAppearance Visible="False"></LabelsAppearance>
                                        <TooltipsAppearance Color="White" DataFormatString="{0}"></TooltipsAppearance>
                                        <LabelsAppearance Position="Center"></LabelsAppearance>
                                    </telerik:ColumnSeries>
                                    <telerik:ColumnSeries Name="Total Pembelian" DataFieldY="TOTAL_PEMBELIAN">
                                        <Appearance>
                                            <FillStyle BackgroundColor="Green" />
                                        </Appearance>
                                        <LabelsAppearance Visible="False"></LabelsAppearance>
                                        <TooltipsAppearance Color="White" DataFormatString="{0}"></TooltipsAppearance>
                                        <LabelsAppearance Position="Center"></LabelsAppearance>
                                    </telerik:ColumnSeries>
                                    <telerik:ColumnSeries Name="Total Sisa" DataFieldY="SISA_BARANG">
                                        <Appearance>
                                            <FillStyle BackgroundColor="Red" />
                                        </Appearance>
                                        <LabelsAppearance Visible="False"></LabelsAppearance>
                                        <TooltipsAppearance Color="White" DataFormatString="{0}"></TooltipsAppearance>
                                        <LabelsAppearance Position="Center"></LabelsAppearance>
                                    </telerik:ColumnSeries>
                                </Series>
                                <XAxis DataLabelsField="NAMA_BARANG">
                                    <LabelsAppearance></LabelsAppearance>
                                    <MinorGridLines Visible="true"></MinorGridLines>
                                    <MajorGridLines Visible="true"></MajorGridLines>
                                </XAxis>
                                <YAxis>
                                    <LabelsAppearance DataFormatString="{0}"></LabelsAppearance>
                                    <MinorGridLines Visible="true"></MinorGridLines>
                                    <MajorGridLines Visible="True"></MajorGridLines>
                                </YAxis>
                            </PlotArea>
                            <Legend>
                                <Appearance Position="Bottom"></Appearance>
                            </Legend>
                            <ChartTitle>
                                <Appearance>
                                    <TextStyle Bold="true" />
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                        <asp:SqlDataSource ID="dsGrafikPembelian" runat="server" SelectCommandType="StoredProcedure"
                            ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="USP_CHART_TOP7"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <telerik:RadHtmlChart ID="GrafikPeminjaman" runat="server" Height="200" Transitions="true" DataSourceID="dsGrafikPeminjaman">
                            <PlotArea>
                                <Series>
                                    <telerik:ColumnSeries Name="Total Barang" DataFieldY="TOTAL_BARANG">
                                        <Appearance>
                                            <FillStyle BackgroundColor="Purple" />
                                        </Appearance>
                                        <LabelsAppearance Visible="False"></LabelsAppearance>
                                        <TooltipsAppearance Color="White" DataFormatString="{0}"></TooltipsAppearance>
                                        <LabelsAppearance Position="Center"></LabelsAppearance>
                                    </telerik:ColumnSeries>
                                    <telerik:ColumnSeries Name="Total Peminjaman" DataFieldY="TOTAL_PEMINJAMAN">
                                        <Appearance>
                                            <FillStyle BackgroundColor="Salmon" />
                                        </Appearance>
                                        <LabelsAppearance Visible="False"></LabelsAppearance>
                                        <TooltipsAppearance Color="White" DataFormatString="{0}"></TooltipsAppearance>
                                        <LabelsAppearance Position="Center"></LabelsAppearance>
                                    </telerik:ColumnSeries>
                                    <telerik:ColumnSeries Name="Total Sisa" DataFieldY="SISA_BARANG">
                                        <Appearance>
                                            <FillStyle BackgroundColor="Orange" />
                                        </Appearance>
                                        <LabelsAppearance Visible="False"></LabelsAppearance>
                                        <TooltipsAppearance Color="White" DataFormatString="{0}"></TooltipsAppearance>
                                        <LabelsAppearance Position="Center"></LabelsAppearance>
                                    </telerik:ColumnSeries>
                                </Series>
                                <XAxis DataLabelsField="NAME_BARANG">
                                    <LabelsAppearance></LabelsAppearance>
                                    <MinorGridLines Visible="true"></MinorGridLines>
                                    <MajorGridLines Visible="true"></MajorGridLines>
                                </XAxis>
                                <YAxis>
                                    <LabelsAppearance DataFormatString="{0}"></LabelsAppearance>
                                    <MinorGridLines Visible="true"></MinorGridLines>
                                    <MajorGridLines Visible="True"></MajorGridLines>
                                </YAxis>
                            </PlotArea>
                            <Legend>
                                <Appearance Position="Right"></Appearance>
                            </Legend>
                            <ChartTitle>
                                <Appearance>
                                    <TextStyle Bold="true" />
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadHtmlChart>
                        <asp:SqlDataSource ID="dsGrafikPeminjaman" runat="server" SelectCommandType="StoredProcedure"
                            ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="USP_CHART_BORROW"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <div style="font-size: 14px; text-align: center; font-family: Calibri; margin-bottom: 1px; bottom: 0px; padding-top: 5px; padding-bottom: 5px; position: fixed; width: 100%; background-color: #3FD47E;">
        © Copyright :: 2020 BAYIKAWAK All Rights Reserved
    </div>
</body>
</html>
