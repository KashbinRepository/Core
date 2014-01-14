<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.AdminGeneral_Role, App_Web_admingeneral_role.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<table width="98%" class="Normal" align="center" runat="server" id="tblButton">
    <tr valign="top">
        <td align="center">
            <dnn:CommandButton ID="btnAdd" runat="server" ResourceKey="btnAdd" ImageUrl="~/images/add.gif"
                OnCommand="btnAdd_Click" CausesValidation="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnUpdate" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                OnCommand="btnUpdate_Click" Visible="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDelete" runat="server" ResourceKey="cmdDelete" ImageUrl="~/images/delete.gif"
                OnCommand="btnDelete_Click" Visible="false" CausesValidation="false" OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<table width="98%" class="dnnFormItem" align="center" runat="server" id="tblList">
    <tr visible="true" id="trGrid" runat="server" valign="top">
        <td align="left" valign="top">
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="None" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="RoleId" OnRowCommand="gvList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecores" Text='<%# Localization.GetString("NoRecords",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblRoleId" runat="server" Text='<%# Eval("RoleId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblRoleName" runat="server" resourcekey="lblRoleName">RoleName</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRoleNameData" runat="server" Text='<%# Eval("RoleName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="right">
                        <HeaderTemplate>
                            <asp:Label ID="lblDiskQuote" runat="server" resourcekey="lblDiskQuote">DiskQuote</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDiskQuoteData" runat="server" Text='<%#Eval("DiskQuote") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="right">
                        <HeaderTemplate>
                            <asp:Label ID="lblVideoCount" runat="server" resourcekey="lblVideoCount">VideoCount</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblVideoCountData" runat="server" Text='<%# Eval("VideoCount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblAllowImport" runat="server" resourcekey="lblAllowImport" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkAllowImportData" runat="server" Checked='<%# Eval("AllowImport") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("RoleId")%>' ToolTip='<%#Localization.GetString("imgEdit",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>' />
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("RoleId")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
    <tr runat="server" id="trLegend">
        <td>
            <div class="dnnTreeLegend" id="divLegend" runat="server">
                <h4>
                    <asp:Label ID="lblLegend" runat="server" resourcekey="lblLegend" /></h4>
                <div class="dtlItem">
                    <img alt="" id="Img1" runat="server" src="~/images/edit.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblEdit" runat="server" Text='<%#Localization.GetString("imgEdit", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img7" runat="server" src="~/images/delete.gif" />&nbsp;=&nbsp;
                    <asp:Literal ID="lblDelete" runat="server" Text='<%#Localization.GetString("imgDel", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </td>
    </tr>
    <tr runat="server" id="trDetail" visible="False" width="100%">
        <td>
            <table width="100%" cellspacing="2" cellpadding="2" border="0" class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" resourcekey="Tip_Role" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td  style="width: 200px">
                        <dnn:Label ID="plRole" runat="server" />
                    </td>
                    <td >
                        <asp:DropDownList ID="ddlRole" runat="server" DataTextField="RoleName" DataValueField="RoleId"
                            Width="450px">
                        </asp:DropDownList>
                        <asp:TextBox ID="txtRoleName" runat="server" Columns="70" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" resourcekey="Tip_DiskQuota" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td >
                        <dnn:Label ID="plDiskQuote" runat="server" ControlName="txtDiskQuote" />
                    </td>
                    <td  align="left">
                        <asp:TextBox ID="txtDiskQuote" runat="server" Columns="10" Text="50"></asp:TextBox>
                        <asp:Label ID="lblDiskQuoteTip" runat="server" resourcekey="lblDiskQuoteTip"></asp:Label>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtDiskQuote"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label3" runat="server" resourcekey="Tip_VideoCount" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td >
                        <dnn:Label ID="plVideoCount" runat="server" ControlName="txtVideoCount" />
                    </td>
                    <td  align="left">
                        <asp:TextBox ID="txtVideoCount" runat="server" Columns="10" Text="-1"></asp:TextBox>
                        <asp:Label ID="lblVideoCountTip" runat="server" resourcekey="lblDiskQuoteTip"></asp:Label>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="^-?\d+$" ControlToValidate="txtVideoCount"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td >
                        <dnn:Label ID="plAllowImport" runat="server" />
                    </td>
                    <td >
                        <asp:CheckBox ID="chkAllowImport" runat="server" Checked="true" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
