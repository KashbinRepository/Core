<%@ Control Language="C#" AutoEventWireup="false" Inherits="Samarpan.Modules.Navigation.Settings"
    CodeBehind="Settings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="0" cellpadding="2" border="0" summary="Navigation Settings Design Table">
    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblLoadByItSelf" runat="server" controlname="chkLoadByItSelf" suffix="LoadByItSelf:">
            </dnn:label>
        </td>
        <td valign="bottom" colspan="2">
            <asp:CheckBox ID="chkLoadByItSelf" Text="" TextAlign="Right" runat="server" Checked="True" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:Label ID="lblLoginLink" Text="Login Link:" runat="server"></asp:Label>
        </td>
        <td valign="bottom" colspan="2">
            <asp:TextBox ID="txtLoginLink" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:Label ID="lblSignOutRedirectLink" Text="SignOut Redirect Link:" runat="server"></asp:Label>
        </td>
        <td valign="bottom" colspan="2">
            <asp:TextBox ID="txtSignOutRedirectLink" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:Label ID="lblNavText" Text="Nav Text:" runat="server"></asp:Label>
        </td>
        <td valign="bottom">
            <asp:Label ID="lblNavLink" Text="Nav Link:" runat="server"></asp:Label>
        </td>
        <td valign="bottom">
            <asp:Label ID="lblAnonymous" Text="Hide if Anonymous" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:TextBox ID="txtNavText1" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtNavLink1" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkAnonymousLink1" Text="" TextAlign="Right" runat="server" Checked="false" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:TextBox ID="txtNavText2" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtNavLink2" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkAnonymousLink2" Text="" TextAlign="Right" runat="server" Checked="false" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:TextBox ID="txtNavText3" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtNavLink3" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkAnonymousLink3" Text="" TextAlign="Right" runat="server" Checked="false" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:TextBox ID="txtNavText4" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtNavLink4" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkAnonymousLink4" Text="" TextAlign="Right" runat="server" Checked="false" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:TextBox ID="txtNavText5" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtNavLink5" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkAnonymousLink5" Text="" TextAlign="Right" runat="server" Checked="false" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:TextBox ID="txtNavText6" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtNavLink6" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkAnonymousLink6" Text="" TextAlign="Right" runat="server" Checked="false" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:TextBox ID="txtNavText7" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtNavLink7" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
         <td valign="bottom">
            <asp:CheckBox ID="chkAnonymousLink7" Text="" TextAlign="Right" runat="server" Checked="false" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:TextBox ID="txtNavText8" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtNavLink8" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkAnonymousLink8" Text="" TextAlign="Right" runat="server" Checked="false" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:TextBox ID="txtNavText9" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtNavLink9" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkAnonymousLink9" Text="" TextAlign="Right" runat="server" Checked="false" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <asp:TextBox ID="txtNavText10" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtNavLink10" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkAnonymousLink10" Text="" TextAlign="Right" runat="server" Checked="false" />
        </td>
    </tr>
</table>
