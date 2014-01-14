<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Settings_Search, App_Web_settings_search.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="0" cellpadding="2"  border="0" class="dnnFormItem">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plType" runat="server" ControlName="ddlType"></dnn:label>
        </td>
        <td>
            <asp:DropDownList ID="ddlType" runat="server" DataTextField="Name" DataValueField="Id" />
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
        <td colspan="2" >
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
            <dnn:label ID="plInputWidth" runat="server" ControlName="txtInputWidth"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtInputWidth" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtInputWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowCategory" runat="server" ControlName="chkShowCategory"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCategory" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plCategoryWidth" runat="server" ControlName="txtCategoryWidth"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtCategoryWidth" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtCategoryWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBreakOnCategory" runat="server" ControlName="chkBreakOnCategory">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBreakOnCategory" CssClass="Normal" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowAuthorList" runat="server" ControlName="chkShowAuthorList">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuthorList" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plAuthorListWidth" runat="server" ControlName="txtAuthorListWidth">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtAuthorListWidth" runat="server" Columns="4"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtAuthorListWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plBreakOnAuthorList" runat="server" ControlName="chkBreakOnAuthorList">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkBreakOnAuthorList" CssClass="Normal" runat="server" />
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="True"></asp:LinkButton>&nbsp;&nbsp;
    <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdReturn" CssClass="dnnSecondaryAction"
        NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
</p>
