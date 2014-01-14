<%@ page language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Detail_PostComment, App_Web_detail_postcomment.aspx.24b431c5" viewStateEncryptionMode="Always" %>

<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post your comment</title>
</head>
<body>
    <form id="form1" runat="server">
    <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblCommentTip" runat="server" resourcekey="lblCommentTip" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr style="border: 1px dotted #999999; size: 1" />
            </td>
        </tr>
        <tr>
            <td style="width:150px">
                <asp:Label ID="lblName" runat="server" resourcekey="lblName"></asp:Label>
            </td>
            <td >
             
                <asp:TextBox ID="txtName" runat="server" Columns="60"></asp:TextBox>
                <asp:Image ID="Image1"
                    runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg" ToolTip="Reuired"
                    AlternateText="Required" />
                <asp:RequiredFieldValidator ID="varName" runat="server" CssClass="NormalRed" ErrorMessage="You Must Enter a name"
                    resourcekey="Name.ErrorMessage" Display="Dynamic" ControlToValidate="txtName"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEmail" runat="server" resourcekey="lblEmail"></asp:Label>
             </td>
            <td >
                <asp:TextBox ID="txtEmail" runat="server" Columns="26"></asp:TextBox>
                <asp:Label ID="lblEmailExplanation" runat="server" ResourceKey="lblEmailExplanation"
                    CssClass="Normal" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblUrl" runat="server" resourcekey="lblUrl"></asp:Label>
             </td>
            <td >
                <asp:TextBox ID="txtUrl" runat="server" Columns="60"></asp:TextBox>
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
            <td colspan="2">
                <asp:Label ID="lblComment" runat="server" resourcekey="lblComment" Text="Comment:"></asp:Label>&nbsp;&nbsp;<asp:CheckBox
                    ID="chkPrivate" runat="server" Text="Private" resourcekey="chkPrivate"></asp:CheckBox>&nbsp;
                &nbsp;
                <asp:Button ID="btnAddComment" runat="server" resourcekey="btnAddComment" Text="Submit Comment"
                    OnClick="btnAddComment_Click" CssClass="CommandButton"></asp:Button>
                <asp:Label ID="lblCommentAdded" runat="server" resourcekey="lblCommentAdded" ForeColor="Green"
                    Visible="false" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:TextBox ID="txtComment" runat="server" Columns="80" TextMode="Multiline" Rows="5"></asp:TextBox>
                <asp:Image ID="Image5" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                    ToolTip="Reuired" AlternateText="Required" />
                <asp:RequiredFieldValidator ID="varComment" runat="server" CssClass="NormalRed" ErrorMessage="You Must Enter comment info"
                    resourcekey="Comment.ErrorMessage" Display="Dynamic" ControlToValidate="txtComment">* Required</asp:RequiredFieldValidator><br />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
