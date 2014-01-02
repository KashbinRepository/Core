<%@ Control Language="C#" AutoEventWireup="false" Inherits="MICROS.Modules.MyCentralBanner.Settings" Codebehind="Settings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="0" cellpadding="2" border="0" summary="MyCentralBanner Settings Design Table">
    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblBannerOption" runat="server" controlname="RadioButtonListBannerOption"
                suffix="Banner Animation Options:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:RadioButtonList ID="RadioButtonListBannerOption" runat="server">
                <asp:ListItem Text="Fixed" Value="Fixed"></asp:ListItem>
                <asp:ListItem Text="Fade" Value="Fade"></asp:ListItem>
                <asp:ListItem Text="FadeZoom" Value="FadeZoom"></asp:ListItem>
                <asp:ListItem Text="Cover" Value="Cover"></asp:ListItem>
                <asp:ListItem Text="UnCover" Value="UnCover"></asp:ListItem>
                <asp:ListItem Text="Scroll" Value="Scroll"></asp:ListItem>
                <asp:ListItem Text="Slide" Value="Slide"></asp:ListItem>
                <asp:ListItem Text="Wipe" Value="Wipe"></asp:ListItem>
                <asp:ListItem Text="No Animation" Value="NoAnimation"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblShowLogo" runat="server" controlname="chkShowLogo"
                suffix="Show Logo:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkShowLogo" Text="" TextAlign="Right" runat="server" />
        </td>
    </tr>
</table>

