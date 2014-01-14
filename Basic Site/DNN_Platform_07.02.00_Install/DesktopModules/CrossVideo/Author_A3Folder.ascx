<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Author_A3Folder, App_Web_author_a3folder.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table width="80%" class="dnnFormItem" align="center" runat="server" id="tblButton">
    <tr valign="top">
        <td align="center">
            <dnn:CommandButton ID="btnAdd" runat="server" ResourceKey="btnAdd" ImageUrl="~/images/add.gif"
                OnCommand="btnAdd_Click" CausesValidation="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnUpdate" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                OnCommand="btnUpdate_Click" Visible="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDelete" runat="server" ResourceKey="cmdDelete" ImageUrl="~/images/delete.gif"
                OnCommand="btnDelete_Click" Visible="false" CausesValidation="false" OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteConfirm_Related",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<table width="80%" class="dnnFormItem" align="center" runat="server" id="tblList">
    <tr visible="true" id="trGrid" runat="server" valign="top">
        <td align="left" valign="top">
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                CellSpacing="1" GridLines="None" BackColor="Gray" Width="100%" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecores" Text='<%# Localization.GetString("NoRecords",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField Visible="false">
                        <HeaderTemplate>
                            <asp:Label ID="lblId" runat="server" resourcekey="lblId"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblIdField" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblName" runat="server" resourcekey="lblName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNameField" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>' />
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteConfirm_Related",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
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
    <tr runat="server" id="trDetail" visible="False" width="100%" align="left" class="dnnFormItem">
        <td>
            <table width="100%" cellspacing="2" cellpadding="2" border="0">
                <tr align="left">
                    <td  style="width: 150px">
                        <dnn:Label ID="plName" runat="server" ControlName="txtName"></dnn:Label>
                    </td>
                    <td >
                        <asp:TextBox ID="txtName" runat="server" Width="250"></asp:TextBox>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="valRequired" runat="server" Text="Required." ControlToValidate="txtName"
                            Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
