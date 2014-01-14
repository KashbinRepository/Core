<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Settings_Author, App_Web_settings_author.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="0" cellpadding="2" width="95%" border="0" align="center" class="dnnFormItem">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plType" runat="server" ControlName="ddlType"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlType" runat="server" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label1" runat="server" resourcekey="Tip_Template" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTemplate" runat="server" ControlName="ddlTemplate"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTemplate" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label2" runat="server" resourcekey="Tip_ListPage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plVideoListPage" runat="server" ControlName="ddlVideoListPage"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlVideoListPage" CssClass="Normal" DataValueField="TabId"
                DataTextField="IndentedTabName" runat="server" Width="60%">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plLinkTarget" ControlName="ddlLinkTarget" runat="server"></dnn:label>
        </td>
        <td >
            <asp:DropDownList ID="ddlLinkTarget" runat="server">
                <asp:ListItem Value="_self" resourcekey="li_LinkTarget_Self">_Self</asp:ListItem>
                <asp:ListItem Value="_blank" resourcekey="li_LinkTarget_Blank">_Blank</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plSortFiled" ControlName="ddlSortFiled" runat="server"></dnn:label>
        </td>
        <td >
            <asp:DropDownList ID="ddlSortFiled" runat="server">
                <asp:ListItem Value="AuthorName" resourcekey="li_SortFiled_AuthorName">AuthorName</asp:ListItem>
                <asp:ListItem Value="VideoCounts" resourcekey="li_SortFiled_VideoCounts">VideoCounts</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plColCount" runat="server" ControlName="txtColCount"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtColCount" runat="server" Columns="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtColCount"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plDisplayVideoCounts" runat="server" ControlName="chkDisplayVideoCounts">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayVideoCounts" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plDisplayAvatar" runat="server" ControlName="chkDisplayAvatar"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayAvatar" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plDisplayRss" runat="server" ControlName="chkDisplayRss"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayRss" runat="server" />
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="True"></asp:LinkButton>&nbsp;&nbsp;
    <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdReturn" CssClass="dnnSecondaryAction"
        NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
</p>
