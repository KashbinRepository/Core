<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Settings_Type, App_Web_settings_type.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<table cellspacing="0" cellpadding="2" summary="CrossVideo type Settings Design Table"
    align="center" class="dnnFormItem" width="95%">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label1" runat="server" resourcekey="Tip_Template" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plTemplate" runat="server" ControlName="ddlTemplate"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTemplate" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plLinkTarget" ControlName="ddlLinkTarget" runat="server"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlLinkTarget" runat="server">
                <asp:ListItem Value="_self" resourcekey="li_LinkTarget_Self">_Self</asp:ListItem>
                <asp:ListItem Value="_blank" resourcekey="li_LinkTarget_Blank">_Blank</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowVideoCounts" runat="server" ControlName="chkShowVideoCounts">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowVideoCounts" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plDisplayRss" runat="server" ControlName="chkDisplayRss"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkDisplayRss" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label2" runat="server" resourcekey="Tip_TypeList" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plTypeList" runat="server" ControlName="cblType"></dnn:label>
        </td>
        <td>
            <asp:CheckBoxList ID="cblType" runat="server" RepeatColumns="4">
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowImage" runat="server" ControlName="chkShowImage"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowImage" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plImageWidth" runat="server" ControlName="txtImageWidth"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtImageWidth" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtImageWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plColCount" runat="server" ControlName="txtColCount"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtColCount" runat="server" Columns="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtColCount"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="True"></asp:LinkButton>&nbsp;
    <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdReturn" CssClass="dnnSecondaryAction"
        NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
</p>
