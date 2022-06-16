<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="RolesMenu.aspx.vb" Inherits="Administrator_RolesMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="color: #4EB058; padding-top: 10px; padding-bottom: 10px;">Role Permission</h1>
    <table>
        <tr>
            <td style="padding-left: 10px;">Position</td>
            <td style="padding-left: 5px;">:</td>
            <td style="padding-left: 5px;">
                <telerik:RadComboBox ID="rcbRole" runat="server" DataSourceID="DS_ROLE"
                    DataTextField="ROLE_DESCRIPTION" DataValueField="ROLE_CODE" Width="280px" Height="100px"
                    Filter="Contains" EmptyMessage="                << Select Position >>">
                </telerik:RadComboBox>
            </td>
        </tr>
    </table>
    <table style="width: 100%;">
        <tr>
            <td style="padding-top: 10px;" align="center">
                <telerik:RadButton runat="server" ID="btnShow" Text="Show"></telerik:RadButton>
            </td>
        </tr>
    </table>
    <br />
    <table style="width: 100%">
        <tr>
            <td align="center">
                <telerik:RadTreeList runat="server" ID="rtlMenu" DataSourceID="DS_MENU" DataKeyNames="MENU_ID" ParentDataKeyNames="PARENT_ID" AutoGenerateColumns="False">
                    <Columns>
                        <telerik:TreeListBoundColumn HeaderText="Menu Name" DataField="MENU_DESCRIPTION"></telerik:TreeListBoundColumn>
                        <telerik:TreeListBoundColumn HeaderText="ID" DataField="MENU_ID" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="300" Visible="false"
                            ItemStyle-HorizontalAlign="Center">
                        </telerik:TreeListBoundColumn>
                        <telerik:TreeListTemplateColumn HeaderText="SELECT" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="25px"
                            UniqueName="SELECT">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkSelect" />
                            </ItemTemplate>
                        </telerik:TreeListTemplateColumn>
                        <telerik:TreeListTemplateColumn HeaderText="INSERT" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="25px"
                            UniqueName="INSERT">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkInsert" />
                            </ItemTemplate>
                        </telerik:TreeListTemplateColumn>
                        <telerik:TreeListTemplateColumn HeaderText="UPDATE" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="25px"
                            UniqueName="UPDATE">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkUpdate" />
                            </ItemTemplate>
                        </telerik:TreeListTemplateColumn>
                        <telerik:TreeListTemplateColumn HeaderText="DELETE" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="25px"
                            UniqueName="DELETE">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkDelete" />
                            </ItemTemplate>
                        </telerik:TreeListTemplateColumn>
                        <telerik:TreeListTemplateColumn HeaderText="REPORT" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="25px"
                            UniqueName="REPORT">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkReport" />
                            </ItemTemplate>
                        </telerik:TreeListTemplateColumn>
                    </Columns>
                </telerik:RadTreeList>
            </td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td style="padding-top: 20px;" align="center">
                <telerik:RadButton ID="btnSave" runat="server" Text="Save" />
            </td>
        </tr>
    </table>
    <asp:EntityDataSource ID="DS_MENU" runat="server" ConnectionString="name=ISLAMIC_BOOKSTOREEntities" DefaultContainerName="ISLAMIC_BOOKSTOREEntities"
        EnableFlattening="False" EntitySetName="tMENUs" OrderBy="it.[MENU_ORDER]">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="DS_ROLE" runat="server" ConnectionString="name=ISLAMIC_BOOKSTOREEntities" DefaultContainerName="ISLAMIC_BOOKSTOREEntities"
        EnableFlattening="False" EntitySetName="tROLEs">
    </asp:EntityDataSource>
</asp:Content>

