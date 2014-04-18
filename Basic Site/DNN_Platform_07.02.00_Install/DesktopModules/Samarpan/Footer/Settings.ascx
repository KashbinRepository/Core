<%@ Control Language="C#" AutoEventWireup="false" Inherits="Samarpan.Modules.Footer.Settings"
    CodeBehind="Settings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="0" cellpadding="2" border="0" summary="Footer Settings Design Table">
    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblCopyRight" runat="server" controlname="chkCopyRight"
                suffix="Show CopyRight:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkCopyRight" Text="" TextAlign="Right" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblCopyRightText" runat="server" controlname="txtCopyRightText"
                suffix="CopyRight Text:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtCopyRightText" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
    </tr>

    
    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblPrivacy" runat="server" controlname="chkPrivacy"
                suffix="Show Privacy:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkPrivacy" Text="" TextAlign="Right" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblPrivacyText" runat="server" controlname="txtPrivacyLink"
                suffix="Privacy Link:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtPrivacyLink" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
    </tr>

    
    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblContactUs" runat="server" controlname="chkContactUs"
                suffix="Show Contact Us:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkContactUs" Text="" TextAlign="Right" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblContactUsText" runat="server" controlname="txtContactUsLink"
                suffix="Contact Us Link:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtContactUsLink" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
    </tr>
    
    
    
    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblFacebookLink" runat="server" controlname="lblFacebookLink"
                suffix="Facebook Link:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtFacebookLink" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
    </tr>

 <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblYoutubeLink" runat="server" controlname="lblYoutubeLink"
                suffix="Youtube Link:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtYoutubeLink" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
    </tr>
    
    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblLogo" runat="server" controlname="chkLogo"
                suffix="Show Logo:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkLogo" Text="" TextAlign="Right" runat="server" />
        </td>
    </tr>
    
    
   

</table>
