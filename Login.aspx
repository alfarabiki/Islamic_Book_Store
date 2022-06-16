<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

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
            margin-bottom: 10px;
            padding-top: 0.35em;
            padding-bottom: 0.625em;
            padding-left: 0.75em;
            padding-right: 0.75em;
            border: 2px solid;
            border-color: #E5E5E5;
            border-radius: 8px;
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
    <form id="form1" runat="server" style="background-color: #4EB058">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <div style="background-image: url(Images/LoginBackground.jpg)">
            <telerik:RadNotification ID="RadNotification1" runat="server" Position="Center" Title="Warning!"></telerik:RadNotification>
            <table style="width: 100%;">
                <tr>
                    <td align="center">
                        <h2>::  Welcome To Islamic Bookstore  :: </h2>
                        <fieldset>
                            <table style="width: 360px;">
                                <tr>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">User Id</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">
                                        <telerik:RadTextBox ID="rtbUserId" runat="server" MaxLength="10"></telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 10px; padding-bottom: 10px;"> Password</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">
                                        <telerik:RadTextBox ID="rtbPasssword" runat="server" MaxLength="20" TextMode="Password"></telerik:RadTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-left: 10px; padding-bottom: 10px;"></td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;"></td>
                                    <td style="padding-left: 10px; padding-bottom: 10px;">
                                        <telerik:RadButton ID="btnLogin" runat="server" Text="    Login    "></telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table style="width: 100%;">
                <tr>
                    <td align="center">
                        <asp:Label ID="lblinfo" runat="server"> </asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
