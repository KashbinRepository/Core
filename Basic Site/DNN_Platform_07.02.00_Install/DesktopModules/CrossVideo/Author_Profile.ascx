<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Author_Profile, App_Web_author_profile.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table width="98%" cellpadding="1" cellspacing="1" class="dnnFormItem" align="center">
    <tr>
        <td style="width: 300px">
            <dnn:Label ID="plProtectPassword" runat="server" />
        </td>
        <td>
            <asp:TextBox ID="txtProtectPassword" runat="server" Columns="20" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plEmail" runat="server"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server"  Columns="15"></asp:TextBox>
            <asp:Label ID="lblEmailExplanation"
                runat="server" ResourceKey="lblEmailExplanation"></asp:Label>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="Tip_InvalidEmail"
                runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ControlToValidate="txtEmail"/>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Image ID="imgGravatarPreview" runat="server"></asp:Image>
        </td>
        <td>
            <br />
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblBiography" runat="server" resourcekey="lblBiography" />
            <br />
        </td>
    </tr>
    <tr valign="top">
        <td width="100%" colspan="2">
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <dnn:TextEditor ID="txtBiography" Width="100%" Height="300px" runat="server" />
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton ID="lbtnUpdate" runat="server" resourcekey="cmdUpdate" CausesValidation="false"
        CssClass="dnnPrimaryAction" OnClick="lbtnUpdate_Click"></asp:LinkButton>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" CssClass="dnnSecondaryAction"
        NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
</p>
