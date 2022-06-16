<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="ChangePassword.aspx.vb" Inherits="Administrator_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        fieldset {
            width: 30%;
            display: block;
            margin-left: 2px;
            margin-right: 2px;
            padding-top: 0.35em;
            padding-bottom: 0.625em;
            padding-left: 0.75em;
            padding-right: 0.75em;
            border: 2px solid;
            border-color: #368EE0;
            border-radius: 8px;
            background-image: url(Images/LoginBackground.jpg);
        }
    </style>
    <div>
        <table style="width: 100%">
            <tr>
                <td align="center" style="padding-top: 40px;">
                    <h1 style="color: #4EB058;">Change Password</h1>
                </td>
            </tr>
            <tr>
                <td align="center" style="padding-top: 10px;">
                    <fieldset style="border-color: #E5E5E5;">
                        <table style="width: 500px">
                            <tr>
                                <td style="padding-left: 10px; padding-bottom: 10px;">New Password</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">
                                    <telerik:RadTextBox ID="rtbNewPassword" runat="server" MaxLength="250" TextMode="Password"></telerik:RadTextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredField1" runat="server" ValidationGroup="Insert"
                                        Text="Please, insert your password!" ControlToValidate="rtbNewPassword" ForeColor="red" Font-Bold="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 10px; padding-bottom: 10px;">Confirm Password</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">
                                    <telerik:RadTextBox ID="rtbConfirmPassword" runat="server" MaxLength="250" TextMode="Password"></telerik:RadTextBox><br />
                                    <asp:CompareValidator ID="RequiredField2" ControlToCompare="rtbNewPassword" runat="server" ValidationGroup="Insert"
                                        Text="Your password not match!" ControlToValidate="rtbConfirmPassword" ForeColor="red" Font-Bold="true"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 10px; padding-bottom: 10px;"></td>
                                <td style="padding-left: 10px; padding-bottom: 10px;"></td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">
                                    <telerik:RadButton ID="btnRegister" runat="server" Text="   Change   " ValidationGroup="Insert"></telerik:RadButton>
                                    <telerik:RadButton ID="btnCancel" runat="server" Text="   Cancel   "></telerik:RadButton>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

