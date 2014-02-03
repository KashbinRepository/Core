<%@ Control language="C#" Inherits="DotNetNuke.Modules.abContactForm.View" AutoEventWireup="false"  Codebehind="View.ascx.cs" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>

<asp:Label ID="lblSenderName" runat="server" Text="Your Name:"></asp:Label>
&nbsp;<asp:TextBox ID="txtSenderName" runat="server" Width="25%"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvSenderName" runat="server" 
    ControlToValidate="txtSenderName" ErrorMessage="Required Field!" 
    ForeColor="#CC3300"></asp:RequiredFieldValidator>
<br /><br />
<asp:Label ID="lblSenderEmail" runat="server" Text="Your Email:"></asp:Label>
&nbsp;<asp:TextBox ID="txtSenderEmail" runat="server" CausesValidation="True" 
    Width="25%"></asp:TextBox>
<asp:RegularExpressionValidator ID="revSenderEmail" runat="server" 
    ControlToValidate="txtSenderEmail" ErrorMessage="Invalid Email Address!" 
    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
    ForeColor="#CC3300"></asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="rfvSenderEmail" runat="server" 
    ControlToValidate="txtSenderEmail" ErrorMessage="Required Field!" 
    ForeColor="#CC3300"></asp:RequiredFieldValidator>
<br /><br />
<asp:Label ID="lblMessage" runat="server" Text="Type your message:"></asp:Label>
&nbsp;<asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
    ControlToValidate="txtMessage" ErrorMessage="Please type your message!" 
    ForeColor="#CC3300"></asp:RequiredFieldValidator>
<br />
<asp:TextBox ID="txtMessage" runat="server" Rows="10" TextMode="MultiLine" 
    Width="75%"></asp:TextBox>
<br />

<div>
    <asp:Label ID="lblCaptach" runat="server" Font-Bold="True" ForeColor="#FF3300"
        Visible="False" Text="Enter the letters show in the box."></asp:Label>
    <dnn:CaptchaControl ID="captchaControl" runat="server" CaptchaHeight="40px" CaptchaWidth="130px"
        BorderStyle="None" ErrorMessage="Invalid! Entry is case sensitive" ErrorStyle-CssClass="dnnFormMessage dnnFormError dnnCaptcha"
        Text="Enter the text shown in the box" Visible="False" Expiration="180" />
    </div>
<br /><br /><br />
<div>
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" /></div>
<asp:HyperLink ID="hlReturn" runat="server" NavigateUrl="~/" Visible="False">Return to Site</asp:HyperLink>



