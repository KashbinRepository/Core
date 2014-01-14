<%@ page language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Detail_PostRating, App_Web_detail_postrating.aspx.24b431c5" viewStateEncryptionMode="Always" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post your rating</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblRatingTip" runat="server" resourcekey="lblRatingTip" /><br />
                    <hr style="border: 1px dotted #999999; size: 1" />
                </td>
            </tr>
            <tr>
                <td style="width:150px">
                    <asp:Label ID="lblYourRating" resourcekey="lblYourRating" runat="server" />
                </td>
                <td>
                    <asp:RadioButtonList ID="rblRating" RepeatDirection="Horizontal" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRatingInfo" resourcekey="lblRatingInfo" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="txtRatingInfo" runat="server" Columns="50" TextMode="Multiline"
                        Rows="5" />
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg" ToolTip="Reuired"
                        AlternateText="Required" />
                    <asp:RequiredFieldValidator ID="varRating" runat="server" CssClass="NormalRed" ErrorMessage="Required"
                    resourcekey="Rating.ErrorMessage" Display="Dynamic" ControlToValidate="txtRatingInfo">* Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
            <td colspan="2">
                <dnn:CaptchaControl ID="ctlCaptcha"  runat="server" CssClass="Normal" ErrorMessage="Invalid captcha, please check it" 
                    CaptchaLength="4" ErrorStyle-CssClass="NormalRed" CaptchaWidth="130" CaptchaHeight="40">
                </dnn:CaptchaControl><br />
                <asp:Label ID="lblErrorCaptcha" resourcekey="lblErrorCaptcha" runat="server"  Visible="false" ForeColor="Red"/>
            </td>
        </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnPost" runat="server" Text="Rating" resourcekey="bthPost" OnClick="btnPost_Click"
                        CssClass="CommandButton" />
                    <asp:Label ID="lblRatingAdded" runat="server" resourcekey="lblRatingAdded" ForeColor="Green"
                        Visible="false" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
