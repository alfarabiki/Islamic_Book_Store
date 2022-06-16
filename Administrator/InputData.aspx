<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="InputData.aspx.vb" Inherits="Administrator_InputData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                var popUp;
                function PopUpShowing(sender, eventArgs) {
                    popUp = eventArgs.get_popUp();
                    var screenSize = $telerik.getViewPortSize();
                    var gridtop = sender.get_element().offsetTop;
                    var gridWidth = screenSize.width;
                    var gridHeight = screenSize.height;
                    var popUpWidth = popUp.style.width.substr(0, popUp.style.width.indexOf("px"));
                    var popUpHeight = popUp.style.height.substr(0, popUp.style.height.indexOf("px"));
                    popUp.style.left = Math.round(((gridWidth - popUpWidth) / 2 + sender.get_element().offsetLeft)).toString() + "px";
                    popUp.style.top = (gridtop + 100).toString() + "px";
                }
            </script>
            <script type="text/javascript">
                function closeRadWindow() {
                    var masterTable = $find("<%=rgInputData.ClientID%>").get_masterTableView();
                    masterTable.rebind();
                }
            </script>
        </telerik:RadCodeBlock>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" EnableAJAX="True">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="rcbITEMNAME">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="rcbITEMUNIT" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="rcbITEMSTATUS" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtITEMPRICE" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtITEMQTY" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtTOTALQTY" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtTOTALPRICE" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtPURCQTY" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtBALQTY" LoadingPanelID="AjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="rcbITEMUNIT">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="txtITEMPRICE" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtITEMQTY" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtTOTALQTY" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtTOTALPRICE" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtPURCQTY" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtBALQTY" LoadingPanelID="AjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="rcbITEMSTATUS">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="txtITEMPRICE" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtITEMQTY" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtTOTALQTY" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtTOTALPRICE" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtPURCQTY" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtBALQTY" LoadingPanelID="AjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="txtITEMPRICE">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="txtTOTALPRICE" LoadingPanelID="AjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="txtITEMQTY">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="txtTOTALQTY" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtTOTALPRICE" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtPURCQTY" LoadingPanelID="AjaxLoadingPanel1" />
                        <telerik:AjaxUpdatedControl ControlID="txtBALQTY" LoadingPanelID="AjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="AjaxLoadingPanel1" runat="server" />
    </div>
    <div>
        <table style="width: 100%;">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td>
                                <h1 style="color: #4EB058;">Input Data</h1>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadGrid ID="rgInputData" runat="server" DataSourceID="dsInputData" GroupPanelPosition="Top">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="ITEM_ID" DataSourceID="dsInputData" CommandItemDisplay="Top"
                                        CommandItemSettings-AddNewRecordText="Input Buku" EditMode="PopUp">
                                        <Columns>
                                            <telerik:GridButtonColumn ConfirmText="Delete this Data?" ConfirmDialogType="RadWindow"
                                                ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete" UniqueName="DELETE">
                                                <HeaderStyle HorizontalAlign="Center" Width="20" Font-Bold="true" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="20" CssClass="MyImageButton" />
                                            </telerik:GridButtonColumn>
                                            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="Edit">
                                                <HeaderStyle HorizontalAlign="Center" Width="20" Font-Bold="true" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="20" />
                                            </telerik:GridEditCommandColumn>                                           
                                            <telerik:GridButtonColumn ButtonType="ImageButton" ImageUrl="~/Images/view_detail.png" CommandName="cmdFiles"
                                                HeaderText="Files" Text="Files" UniqueName="FILES">
                                                <HeaderStyle Width="40" Font-Bold="true" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </telerik:GridButtonColumn>
                                            <telerik:GridBoundColumn DataField="NAME_DESCRIPTION" FilterControlAltText="Filter NAME_DESCRIPTION column" HeaderText="Judul Buku"
                                                SortExpression="NAME_DESCRIPTION" UniqueName="NAME_DESCRIPTION" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="350px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="350px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ITEM_NAME" FilterControlAltText="Filter ITEM_NAME column" HeaderText="Code Barang"
                                                SortExpression="ITEM_NAME" UniqueName="ITEM_NAME" EmptyDataText="-" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="250px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="250" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ITEM_PRICE" FilterControlAltText="Filter ITEM_PRICE column" HeaderText="Harga"
                                                SortExpression="ITEM_PRICE" UniqueName="ITEM_PRICE" EmptyDataText="-" DataFormatString="{0:#,##0.00}">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="130px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Right" Width="130px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ITEM_QTY" FilterControlAltText="Filter ITEM_QTY column" HeaderText="Jumlah"
                                                ReadOnly="True" SortExpression="ITEM_QTY" UniqueName="ITEM_QTY" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="60px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="TOTAL_QTY" FilterControlAltText="Filter TOTAL_QTY column" HeaderText="Total Barang"
                                                ReadOnly="True" SortExpression="TOTAL_QTY" UniqueName="TOTAL_QTY" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PURC_QTY" FilterControlAltText="Filter PURC_QTY column" HeaderText="Jumlah Terjual"
                                                ReadOnly="True" SortExpression="PURC_QTY" UniqueName="PURC_QTY" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="BAL_QTY" FilterControlAltText="Filter BAL_QTY column" HeaderText="Sisa Total"
                                                ReadOnly="True" SortExpression="BAL_QTY" UniqueName="BAL_QTY" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="UNIT_DESCRIPTION" FilterControlAltText="Filter UNIT_DESCRIPTION column" HeaderText="Satuan"
                                                SortExpression="UNIT_DESCRIPTION" UniqueName="UNIT_DESCRIPTION" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="60px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ITEM_UNIT" FilterControlAltText="Filter ITEM_UNIT column" HeaderText="Satuan"
                                                SortExpression="ITEM_UNIT" UniqueName="ITEM_UNIT" EmptyDataText="-" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="60px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="TOTAL_PRICE" FilterControlAltText="Filter TOTAL_PRICE column" HeaderText="Total Harga"
                                                SortExpression="TOTAL_PRICE" UniqueName="TOTAL_PRICE" EmptyDataText="-" DataFormatString="{0:#,##0.00}">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="150px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Right" Width="150px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="STATUS_DESCRIPTION" FilterControlAltText="Filter STATUS_DESCRIPTION column" HeaderText="Status"
                                                SortExpression="STATUS_DESCRIPTION" UniqueName="STATUS_DESCRIPTION" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ITEM_STATUS" FilterControlAltText="Filter ITEM_STATUS column" HeaderText="Status"
                                                SortExpression="ITEM_STATUS" UniqueName="ITEM_STATUS" EmptyDataText="-" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings EditFormType="Template" EditColumn-HeaderText="Add Item">
                                            <PopUpSettings Modal="true" Width="400" />
                                            <FormTemplate>
                                                <table>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Judul Buku</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadComboBox ID="rcbITEMNAME" runat="server" Width="270px"
                                                                AutoPostBack="true" OnSelectedIndexChanged="rcbITEMNAME_SelectedIndexChanged"
                                                                SelectedValue='<%# Bind("ITEM_NAME")%>' Enabled='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "True", "False")%>'
                                                                DataSourceID="dsItemName" DataTextField="C_DESCRIPTION" DataValueField="C_CODE" Filter="Contains">
                                                            </telerik:RadComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Satuan</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadComboBox ID="rcbITEMUNIT" runat="server" AutoPostBack="true" OnSelectedIndexChanged="tot"
                                                                SelectedValue='<%# Bind("ITEM_UNIT")%>' EmptyMessage="Select Unit.."
                                                                DataSourceID="dsItemUnit" DataTextField="C_DESCRIPTION" DataValueField="C_CODE" Filter="Contains">
                                                            </telerik:RadComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Status</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadComboBox ID="rcbITEMSTATUS" runat="server" AutoPostBack="true" OnSelectedIndexChanged="tot"
                                                                SelectedValue='<%# Bind("ITEM_STATUS")%>' EmptyMessage="Select Status.."
                                                                DataSourceID="dsItemStatus" DataTextField="C_DESCRIPTION" DataValueField="C_CODE" Filter="Contains">
                                                            </telerik:RadComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Harga</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadNumericTextBox ID="txtITEMPRICE" runat="server" AutoPostBack="true"
                                                                Width="150" OnTextChanged="tot" Text='<%# Bind("ITEM_PRICE")%>'>
                                                            </telerik:RadNumericTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Jumlah</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadNumericTextBox ID="txtITEMQTY" runat="server" AutoPostBack="true"
                                                                Width="50" OnTextChanged="tot"
                                                                NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="" Text='<%# Bind("ITEM_QTY")%>'>
                                                            </telerik:RadNumericTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Total Barang</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadNumericTextBox ID="txtTOTALQTY" runat="server" AutoPostBack="true"
                                                                Width="50" OnTextChanged="tot" Enabled="false"
                                                                NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="" Text='<%# Bind("TOTAL_QTY")%>'>
                                                            </telerik:RadNumericTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Jumlah Terjual</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadNumericTextBox ID="txtPURCQTY" runat="server" AutoPostBack="true"
                                                                Width="50" OnTextChanged="tot" Enabled="false"
                                                                NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="" Text='<%# Bind("PURC_QTY")%>'>
                                                            </telerik:RadNumericTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Sisa Total</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadNumericTextBox ID="txtBALQTY" runat="server" AutoPostBack="true"
                                                                Width="50" OnTextChanged="tot" Enabled="false"
                                                                NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="" Text='<%# Bind("BAL_QTY")%>'>
                                                            </telerik:RadNumericTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Total Harga</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadNumericTextBox ID="txtTOTALPRICE" runat="server" AutoPostBack="true"
                                                                Width="150" Enabled="false" Font-Bold="true" Text='<%# Bind("TOTAL_PRICE")%>'>
                                                            </telerik:RadNumericTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td style="padding: 50px;">
                                                            <telerik:RadButton ID="BtnInsert" runat="server" ValidationGroup="Insert" Width="70"
                                                                Text='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "Save", "Update")%>'
                                                                CommandName='<%# IIf( DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'>
                                                            </telerik:RadButton>
                                                            <telerik:RadButton ID="BtnCancel" runat="server" ValidationGroup="Cancel" Text="Cancel" Width="70"
                                                                CommandName="Cancel">
                                                            </telerik:RadButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </FormTemplate>
                                        </EditFormSettings>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn column" ButtonType="ImageButton">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <ClientEvents OnPopUpShowing="PopUpShowing" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </td>
                        </tr>
                    </table>
                    <asp:EntityDataSource ID="dsItemStatus" runat="server" ConnectionString="name=ISLAMIC_BOOKSTOREEntities" DefaultContainerName="ISLAMIC_BOOKSTOREEntities"
                        EnableFlattening="False" EntitySetName="tCODEs" Where="it.[C_GROUP] = @C_GROUP">
                        <WhereParameters>
                            <asp:Parameter Name="C_GROUP" DefaultValue="Status" Type="String" />
                        </WhereParameters>
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="dsItemName" runat="server" ConnectionString="name=ISLAMIC_BOOKSTOREEntities" DefaultContainerName="ISLAMIC_BOOKSTOREEntities"
                        EnableFlattening="False" EntitySetName="tCODEs" Where="it.[C_GROUP] = @C_GROUP" OrderBy="it.[C_ORDER]">
                        <WhereParameters>
                            <asp:Parameter Name="C_GROUP" DefaultValue="Book" Type="String" />
                        </WhereParameters>
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="dsItemUnit" runat="server" ConnectionString="name=ISLAMIC_BOOKSTOREEntities" DefaultContainerName="ISLAMIC_BOOKSTOREEntities"
                        EnableFlattening="False" EntitySetName="tCODEs" Where="it.[C_GROUP] = @C_GROUP" OrderBy="it.[C_ORDER]">
                        <WhereParameters>
                            <asp:Parameter Name="C_GROUP" DefaultValue="Unit" Type="String" />
                        </WhereParameters>
                    </asp:EntityDataSource>
                    <asp:SqlDataSource ID="dsInputData" runat="server" SelectCommandType="StoredProcedure"
                        ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="USP_INPUTDATA"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <telerik:RadWindow ID="RdwView" VisibleOnPageLoad="false" Modal="false" runat="server"
            VisibleStatusbar="false" Style="display: none; z-index: 100000000000;" OnClientClose="closeRadWindow"
            AutoSize="false" AutoSizeBehaviors="Default" Animation="Slide" AnimationDuration="400"
            DestroyOnClose="true">
        </telerik:RadWindow>
    </div>
</asp:Content>

