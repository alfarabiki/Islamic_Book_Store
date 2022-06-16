<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="AdminMenu.aspx.vb" Inherits="Administrator_AdminMenu" %>

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
        </telerik:RadCodeBlock>
    </div>
    <div>
        <table style="width: 100%;">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td>
                                <h1 style="color: #4EB058;">Menu List</h1>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadGrid ID="rgMenuList" runat="server" DataSourceID="dsMenuList" GroupPanelPosition="Top" AllowPaging="false">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="MENU_ID" DataSourceID="dsMenuList" CommandItemDisplay="Top"
                                        CommandItemSettings-AddNewRecordText="Add Menu" EditMode="PopUp">
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
                                            <telerik:GridBoundColumn DataField="MENU_ORDER" FilterControlAltText="Filter MENU_ORDER column" HeaderText="No."
                                                SortExpression="MENU_ORDER" UniqueName="MENU_ORDER" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="40px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="40px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MENU_ID" FilterControlAltText="Filter MENU_ID column" HeaderText="Menu ID"
                                                ReadOnly="True" SortExpression="MENU_ID" UniqueName="PARENT_ID" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="60px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PARENT_ID" FilterControlAltText="Filter PARENT_ID column" HeaderText="Parent ID"
                                                SortExpression="PARENT_ID" UniqueName="PARENT_ID" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="60px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MENU_DESCRIPTION" FilterControlAltText="Filter MENU_DESCRIPTION column" HeaderText="Description"
                                                SortExpression="MENU_DESCRIPTION" UniqueName="MENU_DESCRIPTION" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="170px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="170px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MENU_VALUE" FilterControlAltText="Filter MENU_VALUE column" HeaderText="Menu Value"
                                                SortExpression="MENU_VALUE" UniqueName="MENU_VALUE" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="400px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="400px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MENU_URL" FilterControlAltText="Filter MENU_URL column" HeaderText="Menu Url"
                                                SortExpression="MENU_URL" UniqueName="MENU_URL" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="400px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="400px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings EditFormType="Template" EditColumn-HeaderText="Add Menu">
                                            <PopUpSettings Modal="true" Width="400" />
                                            <FormTemplate>
                                                <table>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Parent ID</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtParentID" runat="server" Width="50" MaxLength="50" Text='<%# Bind("PARENT_ID")%>'>
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Description</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtDescription" runat="server" Width="250" MaxLength="50" Text='<%# Bind("MENU_DESCRIPTION")%>'>
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Menu Value</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtMenuValue" runat="server" Width="250" MaxLength="200" Text='<%# Bind("MENU_VALUE")%>'>
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Menu URL</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtMenuURL" runat="server" Width="250" MaxLength="200" Text='<%# Bind("MENU_URL")%>'>
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Menu Order</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtMenuOrder" runat="server" Width="50" MaxLength="50" Text='<%# Bind("MENU_ORDER")%>'>
                                                            </telerik:RadTextBox>
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
                    <asp:SqlDataSource ID="dsMenuList" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>"
                        SelectCommand="USP_LISTMENU" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ROLECODE" SessionField="rolecode" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

