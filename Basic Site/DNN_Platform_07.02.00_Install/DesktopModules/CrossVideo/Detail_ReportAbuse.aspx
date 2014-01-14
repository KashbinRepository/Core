<%@ page language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Detail_ReportAbuse, App_Web_detail_reportabuse.aspx.24b431c5" viewStateEncryptionMode="Always" %>

<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report Abuse</title>
</head>
<body>
    <form id="form1" runat="server">
    <table cellspacing="0" cellpadding="2" border="0" align="left" width="100%" class="Normal"
        runat="server" id="tblReport">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblAbuse" runat="server" CssClass="SubHead" resourcekey="lblAbuse" /><br />
            </td>
        </tr>
        <tr>
            <td style="width:150px">
                <asp:Label ID="lblName" runat="server" resourcekey="lblName" />
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" Columns="30" />
                <asp:Image ID="Image3" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                    ToolTip="Reuired" AlternateText="Required" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName"
                    Display="Dynamic" resourcekey="Required" CssClass="NormalRed" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEmail" runat="server" resourcekey="lblEmail" />
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Columns="30" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAbuseTitle" runat="server" resourcekey="lblAbuseTitle" />
            </td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" Columns="60" />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                    ToolTip="Reuired" AlternateText="Required" />
                <asp:RequiredFieldValidator ID="valNameRequired" runat="server" ControlToValidate="txtTitle"
                    Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td valign="middle">
                <asp:Label ID="lblAbuseDescription" runat="server" resourcekey="lblAbuseDescription" />
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" Columns="60" TextMode="Multiline"
                    Rows="10" />
                <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                    ToolTip="Reuired" AlternateText="Required" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescription"
                    Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td colspan="2">
                <dnn:CaptchaControl ID="ctlCaptcha"  runat="server" CssClass="Normal" ErrorMessage="Invalid captcha, please check it"
                    CaptchaLength="4" ErrorStyle-CssClass="NormalRed" CaptchaWidth="130" CaptchaHeight="40">
                </dnn:CaptchaControl>
                <br />
                <asp:Label ID="lblErrorCaptcha" resourcekey="lblErrorCaptcha" runat="server"  Visible="false" ForeColor="Red"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <dnn:CommandButton ID="btnCreateAbuse" runat="server" ResourceKey="btnCreateAbuse"
                    ImageUrl="~/images/add.gif" OnCommand="btnCreateAbuse_Click" />
                &nbsp;&nbsp;
                <asp:HyperLink runat="server" Target="_blank" ID="hlViewAbuse" resourcekey="hlViewAbuse" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="lblAdded" runat="server" resourcekey="lblAdded" ForeColor="Green"
                    Visible="false" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br /> 
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
