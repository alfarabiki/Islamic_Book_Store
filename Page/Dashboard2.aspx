<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="Dashboard2.aspx.vb" Inherits="Page_Dashboard2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; padding-top: 10px;">
        <tr>
            <td align="left" style="padding-top: 20px;" colspan="12">
                <h1 style="color: #368EE0; text-align: center">Dashboard 2</h1>
                <div style="float: right; padding-right: 5px">
                    <telerik:RadButton ID="btnPage1" runat="server" Text="Page 1" ToolTip="Back To Page 1" />
                </div>
            </td>
        </tr>
        <tr>
            <td align="center" style="padding-top: 5px; vertical-align: top">
                <telerik:RadGrid ID="rgItem" runat="server" DataSourceID="dsItem" AllowPaging="true" PageSize="20" GroupPanelPosition="Top">
                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="C_ID" DataSourceID="dsItem" CommandItemDisplay="None">
                        <Columns>
                            <telerik:GridBoundColumn DataField="C_CODE" FilterControlAltText="Filter C_ID column" HeaderText="Kode"
                                SortExpression="C_ID" UniqueName="C_ID" EmptyDataText="-">
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="50px" BackColor="#4EB058" ForeColor="White" />
                                <ItemStyle HorizontalAlign="Center" Width="50" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="C_DESCRIPTION" FilterControlAltText="Filter C_DESCRIPTION column" HeaderText="Nama Barang"
                                SortExpression="C_DESCRIPTION" UniqueName="C_DESCRIPTION" EmptyDataText="-">
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="240px" BackColor="#4EB058" ForeColor="White" />
                                <ItemStyle HorizontalAlign="Left" Width="240px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="STATUS" FilterControlAltText="Filter STATUS column" HeaderText="Status"
                                SortExpression="STATUS" UniqueName="STATUS" EmptyDataText="-">
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="70px" BackColor="#4EB058" ForeColor="White" />
                                <ItemStyle HorizontalAlign="Left" Width="70px" />
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="dsItem" runat="server" SelectCommandType="StoredProcedure"
                    ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="USP_LISTITEM"></asp:SqlDataSource>
            </td>
            <td align="center" style="padding-top: 5px; vertical-align: top">
                <table>
                    <tr>
                        <td>
                            <telerik:RadHtmlChart ID="GrafikPembelian" ToolTip="Total Pembelian (IDR)" runat="server" Height="250" Transitions="true" DataSourceID="dsGrafikPembelian">
                                <PlotArea>
                                    <Series>
                                        <telerik:DonutSeries NameField="NAMA_BARANG" DataFieldY="TOTAL_HARGAPEMBELIAN">
                                            <Appearance>
                                                <FillStyle BackgroundColor="#4EB058" />
                                            </Appearance>
                                            <LabelsAppearance Visible="False"></LabelsAppearance>
                                            <TooltipsAppearance Color="White" DataFormatString="{0:#,##0.00}"></TooltipsAppearance>
                                            <LabelsAppearance Position="Center"></LabelsAppearance>
                                        </telerik:DonutSeries>                                        
                                    </Series>
                                    <XAxis DataLabelsField="ITEM_NAME">
                                        <LabelsAppearance></LabelsAppearance>
                                        <MinorGridLines Visible="true"></MinorGridLines>
                                        <MajorGridLines Visible="true"></MajorGridLines>
                                    </XAxis>
                                    <YAxis>
                                        <LabelsAppearance DataFormatString="{0:#,##0.00}" Mirror="true"></LabelsAppearance>
                                        <MinorGridLines Visible="true"></MinorGridLines>
                                        <MajorGridLines Visible="True"></MajorGridLines>
                                    </YAxis>
                                </PlotArea>
                                <Legend>
                                    <Appearance Position="Bottom" Align="End"></Appearance>
                                </Legend>
                                <ChartTitle>
                                    <Appearance>
                                        <TextStyle Bold="true" />
                                    </Appearance>
                                </ChartTitle>
                            </telerik:RadHtmlChart>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadHtmlChart ID="GrafikKetersediaan" runat="server" ToolTip="Jumlah Sisa Barang" Height="200" Transitions="true" DataSourceID="dsGrafikPembelian">
                                <PlotArea>
                                    <Series>
                                        <telerik:LineSeries Name="Sisa Barang" DataFieldY="SISA_BARANG">
                                            <Appearance>
                                                <FillStyle BackgroundColor="#368EE0" />
                                            </Appearance>
                                            <LineAppearance LineStyle="Smooth" />
                                            <MarkersAppearance MarkersType="Circle" Size="4" />
                                            <LabelsAppearance Visible="False"></LabelsAppearance>
                                            <TooltipsAppearance Color="White" DataFormatString="{0}"></TooltipsAppearance>
                                            <LabelsAppearance Position="Above"></LabelsAppearance>
                                        </telerik:LineSeries>                                       
                                    </Series>
                                    <XAxis DataLabelsField="ITEM_NAME">
                                        <LabelsAppearance></LabelsAppearance>
                                        <MinorGridLines Visible="true"></MinorGridLines>
                                        <MajorGridLines Visible="true"></MajorGridLines>
                                    </XAxis>
                                    <YAxis>
                                        <LabelsAppearance DataFormatString="{0}" Mirror="true"></LabelsAppearance>
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
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="dsGrafikPembelian" runat="server" SelectCommandType="StoredProcedure"
                    ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="USP_CHART"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

