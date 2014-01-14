<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.AdminVideo_Author, App_Web_adminvideo_author.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table width="98%" cellpadding="1" cellspacing="1" class="dnnFormItem" align="center"
    runat="server" id="tblAuthorList">
    <tr>
        <td>
            <asp:Label ID="lblType" runat="server" resourcekey="lblType" />
            <asp:DropDownList ID="ddlType" runat="server" DataTextField="Name" DataValueField="Id" Width="200px"
                AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CellPadding="1"  CellSpacing="1"  GridLines="None" BackColor="Gray"

                Width="100%" PageSize="100" DataKeyNames="UserId" ForeColor="#333333" 
                AllowPaging="True" OnRowCommand="gvList_RowCommand">
                <Columns>
                    <asp:TemplateField  ItemStyle-HorizontalAlign="left">
                        <HeaderTemplate>
                            <asp:Label ID="lblUserId" runat="server" resourcekey="lblUserId"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUserIdField" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Avatar" SortExpression="Avatar">
                        <HeaderTemplate>
                            <asp:Label ID="lblAvatar" runat="server" resourcekey="lblAvatar"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Image ID="imgAvatar" runat="server" ImageUrl='<%#GetGravatarUrl(Eval("AvatarEmail").ToString(),"48") %>'>
                            </asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="left">
                        <HeaderTemplate>
                            <asp:Label ID="lblDisplayName" runat="server" resourcekey="lblDisplayName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayNameField" runat="server" Text='<%# Eval("DisplayName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="left">
                        <HeaderTemplate>
                            <asp:Label ID="lblAvatarEmail" runat="server" resourcekey="lblAvatarEmail"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAvatarEmailField" runat="server" Text='<%# Eval("AvatarEmail") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="right">
                        <HeaderTemplate>
                            <asp:Label ID="lblVideoCounts" runat="server" resourcekey="lblVideoCounts"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblVideoCountsField" runat="server" Text='<%# Eval("VideoCounts") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField >
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Sel"
                                CommandArgument='<%# Eval("UserId")%>' ToolTip='<%#Localization.GetString("imgEdit", LocalResourceFile)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgDelete" runat="server" AlternateText='<%#Localization.GetString("imgDelete", LocalResourceFile)%>'
                                ToolTip='<%#Localization.GetString("imgDelete", LocalResourceFile)%>' CommandArgument='<%#Eval("UserId") %>'
                                CausesValidation="False" CommandName="Del" ImageUrl="~/images/delete.gif" OnClientClick="return confirm('Delete author will also delete his/her videos,Are you sure to delete this item?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"  />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                <EditRowStyle BackColor="#999999" />
                <PagerSettings FirstPageImageUrl="~/DesktopModules/CrossVideo/images/First.gif" LastPageImageUrl="~/DesktopModules/CrossVideo/images/Last.gif"
                    NextPageImageUrl="~/DesktopModules/CrossVideo/images/Next1.gif" PreviousPageImageUrl="~/DesktopModules/CrossVideo/images/Previous.gif"
                    Mode="NextPreviousFirstLast" />
            </asp:GridView>
        </td>
    </tr>
</table>
<table width="98%" cellpadding="1" cellspacing="1" class="dnnFormItem" align="center"
    runat="server" id="tblAuthorInfo">
    <tr>
        <td style="width: 200px">
            <dnn:Label ID="plEmail" runat="server"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtEmail" TabIndex="1" runat="server" Width="30%"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="Tip_InvalidEmail"
                runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ControlToValidate="txtEmail"/>

            <asp:Label ID="lblEmailExplanation" runat="server" ResourceKey="lblEmailExplanation"></asp:Label>
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
        <td style="width: 100%" colspan="2">
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <dnn:TextEditor ID="txtBiography" Width="100%" Height="250" runat="server" />
        </td>
    </tr>
</table>
<p align="center" id="pInfo" runat="server">
    <asp:LinkButton ID="lbtnUpdate" OnClick="lbtnUpdate_Click" CssClass="dnnPrimaryAction"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="False"></asp:LinkButton>&nbsp;&nbsp;
    <asp:LinkButton ID="lbtnCancel" OnClick="lbtnCancel_Click" resourcekey="cmdCancel"
        runat="server" BorderStyle="none" Text="Cancel" CausesValidation="False" CssClass="dnnSecondaryAction"></asp:LinkButton>
</p>
