<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FormRegister.aspx.vb" Inherits="FormRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Images/logo_login.jpg" rel="shortcut icon" type="image/x-icon" />
    <title>&nbsp;&nbsp;:: ISLAMIC BOOKSTORE ::</title>
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

        legend {
            width: 150px;
            padding-left: 10px;
            font-weight: bold;
            font-size: medium;
            font-style: italic;
            font-variant: small-caps;
            border: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <div>
            <table style="width: 100%;">
                <tr>
                    <td align="center">
                        <h2>::  Form Register  :: </h2>
                        <asp:Label ID="permit" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblinfo" runat="server" ForeColor="#4EB058"></asp:Label>
                        <fieldset style="border-color: #E5E5E5;">
                            <table style="width: 500px">
                                <tr>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">User Id</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">
                                        <telerik:RadTextBox ID="rtbUserId" runat="server" MaxLength="10" ForeColor="#4EB058" Enabled="false"></telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">Name</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">
                                        <telerik:RadTextBox ID="rtbName" runat="server" MaxLength="250" Width="250"></telerik:RadTextBox>
                                        <asp:Label ID="lblmandatory2" runat="server" Text="*" ForeColor="#368EE0" Font-Size="Larger"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">Address</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">
                                        <telerik:RadTextBox ID="rtbAddress" runat="server" MaxLength="500" Width="250" TextMode="MultiLine"></telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">Mobile</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">
                                        <telerik:RadTextBox ID="rtbMobile" runat="server" MaxLength="150" Width="250"></telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">Email</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">
                                        <telerik:RadTextBox ID="rtbEmail" runat="server" MaxLength="250" Width="250"></telerik:RadTextBox>
                                        <asp:Label ID="lblmandatory3" runat="server" Text="*" ForeColor="#368EE0" Font-Size="Larger"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">Password</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">
                                        <telerik:RadTextBox ID="rtbPassword" runat="server" MaxLength="250" TextMode="Password"></telerik:RadTextBox>
                                        <asp:Label ID="lblmandatory4" runat="server" Text="*" ForeColor="#368EE0" Font-Size="Larger"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">Confirm Password</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">
                                        <telerik:RadTextBox ID="rtbConfirmPassword" runat="server" MaxLength="250" TextMode="Password"></telerik:RadTextBox>
                                        <asp:Label ID="lblmandatory5" runat="server" Text="*" ForeColor="#368EE0" Font-Size="Larger"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 10px; padding-bottom: 10px;"></td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;"></td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">
                                        <telerik:RadButton ID="btnRegister" runat="server" Text="   Register   " CommandName="Insert"></telerik:RadButton>
                                        <telerik:RadButton ID="btnBack" runat="server" Text="      Back      " CommandName="Cancel"></telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </div>
        <telerik:RadNotification ID="RadNotification1" runat="server" Position="Center" Title="Warning!"></telerik:RadNotification>
    </form>
</body>
</html>
