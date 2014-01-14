<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.AdminVideo_YouTubeRss, App_Web_adminvideo_youtuberss.ascx.24b431c5" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<script type="text/javascript">
    function checkAll_Rss() {
        if ($(":checkbox[id*='chkAll_Rss']").prop("checked") == false) {
            $(":checkbox[id*='chkItem_Rss']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Rss']").prop("checked", false);
        }
    }
    function addTag() {
        var tag = document.getElementById("<%=ddlPopularTag.ClientID%>").value;
        var allTag = $(":text[id*='txtTag']").get();
        for (var i = 0; i < allTag.length; i++) {
            if (allTag[i].value == "") {
                allTag[i].value = tag;
                break;
            }
        }
        return false;
    }

    $(function () {
        $("#tabs").tabs();
        var currTab = $("#<%= hidLastTab.ClientID %>").val();
        if (!isNaN(parseInt(currTab)))//如果当前存储的是数字,则转换其为整数
        {
            currTab = parseInt(currTab);
        }
        $("#tabs").tabs({ selected: currTab });
    });
</script>
<asp:HiddenField runat="server" ID="hidLastTab" Value="#divBasic" />
<table width="100%" align="center" runat="server" id="tblButton" class="dnnFormItem">
    <tr valign="top">
        <td align="center">
            <asp:Label ID="lblType" runat="server" resourcekey="lblType" />
            <asp:DropDownList ID="ddlType" runat="server" DataTextField="Name" DataValueField="Id" Width="200px"
                AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
            </asp:DropDownList>
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDeleteSelected" runat="server" ResourceKey="btnDeleteSelected"
                CausesValidation="false" ImageUrl="~/images/delete.gif" OnCommand="btnDeleteSelected_Click"
                OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItems",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
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
            <dnn:CommandButton ID="btnImportNow" runat="server" ResourceKey="btnImportNow" CausesValidation="false"
                Visible="false" ImageUrl="~/DesktopModules/CrossVideo/images/watch.png" OnCommand="btnImportNow_Click" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<table width="100%" align="center" runat="server" id="tblRssList" class="dnnFormItem">
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
            <br />
            <asp:Label ID="lblAuthor" runat="server" resourcekey="lblAuthor" />
            <asp:DropDownList ID="ddlAuthor" runat="server" DataTextField="Text" DataValueField="Value" Width="200px"/>
            <asp:Label ID="lblRssStatus" runat="server" resourcekey="lblRssStatus" />
            <asp:DropDownList ID="ddlVideoStatus" runat="server" Width="200px">
                <asp:ListItem Value="All" Selected="True" resourcekey="li_RssStatus_All"></asp:ListItem>
                <asp:ListItem Value="UnAuthed" resourcekey="li_RssStatus_UnAuthed"></asp:ListItem>
                <asp:ListItem Value="Featured" resourcekey="li_RssStatus_Featured"></asp:ListItem>
                <asp:ListItem Value="UnActive" resourcekey="li_RssStatus_UnActive"></asp:ListItem>
                <asp:ListItem Value="Private" resourcekey="li_RssStatus_Private"></asp:ListItem>
                <asp:ListItem Value="Protected" resourcekey="li_RssStatus_Protected"></asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblPageSize" runat="server" resourcekey="lblPageSize" />
            <asp:DropDownList ID="ddlPageSize" runat="server" Width="80px">
                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                <asp:ListItem Text="20" Value="20" Selected="True"></asp:ListItem>
                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                <asp:ListItem Text="40" Value="40"></asp:ListItem>
                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                <asp:ListItem Text="60" Value="60"></asp:ListItem>
                <asp:ListItem Text="70" Value="70"></asp:ListItem>
                <asp:ListItem Text="80" Value="80"></asp:ListItem>
                <asp:ListItem Text="90" Value="90"></asp:ListItem>
                <asp:ListItem Text="100" Value="100"></asp:ListItem>
                 <asp:ListItem Text="200" Value="200"></asp:ListItem>
                <asp:ListItem Text="500" Value="500"></asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblRssTitle" runat="server" resourcekey="lblRssTitle1" />
            <asp:TextBox ID="txtSearch" runat="server" Width="200px"></asp:TextBox>
            <dnn:CommandButton ID="btnSearch" runat="server" CausesValidation="false" ImageUrl="~/images/icon_search_16px.gif"
                ResourceKey="btnSearch" OnCommand="btnSearch_Click" />
        </td>
    </tr>
    <tr align="left" valign="top">
        <td>
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" Width="100%"
                CellPadding="1" CellSpacing="1" GridLines="None" BackColor="Gray" ForeColor="#333333"
                 DataKeyNames="Id" OnRowCommand="gvList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll_Rss" runat="server" onclick="checkAll_Rss()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem_Rss" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="left">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreator" runat="server" resourcekey="lblCreator"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreatorData" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="left">
                        <HeaderTemplate>
                            <asp:Label ID="lblTitle" runat="server" resourcekey="lblTitle">Title</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTitleField" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="right">
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate">Created Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%#  Convert.ToDateTime(Eval("CreatedDate")).ToShortDateString() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblBelongToSerial" runat="server" resourcekey="lblBelongToSerial"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkBelongToSerialField" runat="server" Checked='<%# Convert.ToString(Eval("MasterVideoId"))!="-1" %>'
                                Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblAuthed" runat="server" resourcekey="lblAuthed">Authed</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkAuthedField" runat="server" Checked='<%# Eval("Authed") %>'
                                Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblActive" runat="server" resourcekey="lblActive">Active</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkActiveField" runat="server" Checked='<%# Eval("Active") %>'
                                Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblPrivate" runat="server" resourcekey="lblPrivate">Private</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkPrivateField" runat="server" Checked='<%# Eval("Private") %>'
                                Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProtected" runat="server" resourcekey="lblProtected"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkProtectedField" runat="server" Checked='<%# Eval("Protected") %>'
                                Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured">Featured</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkFeaturedField" runat="server" Checked='<%# Eval("Featured") %>'
                                Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>' />
                            <asp:ImageButton ID="imgToggleAuthed" runat="server" CausesValidation="False" CommandName="Auth"
                                CommandArgument='<%# Eval("Id")%>' Visible="<%#HasManagePermission%>" AlternateText='<%#Localization.GetString("imgToggleAuthed", LocalResourceFile)%>'
                                ImageUrl="~/images/icon_authentication_16px.gif" ToolTip='<%#Localization.GetString("imgToggleAuthed", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgToggleActive" runat="server" CausesValidation="False" CommandName="Active"
                                CommandArgument='<%# Eval("Id")%>' AlternateText='<%#Localization.GetString("imgToggleActive", LocalResourceFile)%>'
                                ImageUrl="~/images/icon_moduledefinitions_16px.gif" ToolTip='<%#Localization.GetString("imgToggleActive", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgTogglePrivate" runat="server" CausesValidation="False" CommandName="Private"
                                CommandArgument='<%# Eval("Id")%>' AlternateText='<%#Localization.GetString("imgTogglePrivate", LocalResourceFile)%>'
                                ImageUrl="~/images/action_move.gif" ToolTip='<%#Localization.GetString("imgTogglePrivate", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgToggleProtected" runat="server" CausesValidation="False"
                                CommandName="Protected" CommandArgument='<%# Eval("Id")%>' AlternateText='<%#Localization.GetString("imgToggleProtected", LocalResourceFile)%>'
                                ImageUrl="~/images/stop.gif" ToolTip='<%#Localization.GetString("imgToggleProtected", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgToggleFeatured" runat="server" CausesValidation="False" CommandName="Featured"
                                CommandArgument='<%# Eval("Id")%>' Visible="<%#HasManagePermission%>" AlternateText='<%#Localization.GetString("imgToggleFeatured", LocalResourceFile)%>'
                                ImageUrl="~/images/icon_dashboard_16px.gif" ToolTip='<%#Localization.GetString("imgToggleFeatured", LocalResourceFile)%>' />
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr>
        <td>
            <cross:PagingControl ID="ctlPagingControl" runat="server" Mode="PostBack" OnPageChanged="ctlPagingControl_PageChanged" />
        </td>
    </tr>
    <tr>
        <td>
            <div class="dnnTreeLegend" runat="server" id="divLegend">
                <h4>
                    <asp:Label ID="lblLegend" runat="server" resourcekey="lblLegend" /></h4>
                <div class="dtlItem">
                    <img alt="" id="Img1" runat="server" src="~/images/edit.gif" />
                    <asp:Literal ID="lblEdit" runat="server" Text='<%#Localization.GetString("imgEdit", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img3" runat="server" src="~/images/icon_authentication_16px.gif" />
                    <asp:Literal ID="lblToggleAuthed" runat="server" Text='<%#Localization.GetString("imgToggleAuthed", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img4" runat="server" src="~/images/icon_moduledefinitions_16px.gif" />
                    <asp:Literal ID="lblToggleActive" runat="server" Text='<%#Localization.GetString("imgToggleActive", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img5" runat="server" src="~/images/action_move.gif" />
                    <asp:Literal ID="lblTogglePrivate" runat="server" Text='<%#Localization.GetString("imgTogglePrivate", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img12" runat="server" src="~/images/stop.gif" />
                    <asp:Literal ID="lblToggleProtected" runat="server" Text='<%#Localization.GetString("imgToggleProtected", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img6" runat="server" src="~/images/icon_dashboard_16px.gif" />
                    <asp:Literal ID="lblToggleFeatured" runat="server" Text='<%#Localization.GetString("imgToggleFeatured", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img7" runat="server" src="~/images/delete.gif" />
                    <asp:Literal ID="lblDelete" runat="server" Text='<%#Localization.GetString("imgDel", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </td>
    </tr>
</table>
<div id="divRssDetail" runat="server">
    <div class="dnnFormItem dnnFormHelp dnnClear">
        <p align="right">
            <span>
                <asp:Image ID="Image7" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg" />
                <%=LocalizeString("RequiredFields")%>
            </span>
        </p>
    </div>
    <div id="tabs" style="width: 100%; overflow: auto">
        <ul>
            <li><a href="#divBasic"><span>
                <%#Localization.GetString("divBasic", LocalResourceFile)%></span></a> </li>
            <li><a href="#divCategory"><span>
                <%#Localization.GetString("divCategory", LocalResourceFile)%></span></a> </li>
            <li><a href="#divTag"><span>
                <%#Localization.GetString("divTag", LocalResourceFile)%></span></a> </li>
            <%if (HasManagePermission)
              {%>
            <li><a href="#divPermission"><span>
                <%#Localization.GetString("divPermission", LocalResourceFile)%></span></a> </li>
            <%} %>
        </ul>
        <div id="divBasic" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label5" runat="server" resourcekey="Tip_RssType" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plRssType" runat="server" ControlName="rblRssType" />
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblRssType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblRssType_SelectedIndexChanged">
                            <asp:ListItem Value="StandardFeeds" resourcekey="li_RssType_StandardFeeds" Selected="True" />
                            <asp:ListItem Value="UserSpecific" resourcekey="li_RssType_UserSpecific" />
                            <asp:ListItem Value="CustomizeCategoryAndTag" resourcekey="li_RssType_CustomizeCategoryAndTag" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plTitle" runat="server" ControlName="txtTitle"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitle" Columns="100" runat="server" /><asp:Image ID="Image1"
                            runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="varTitle" runat="server" CssClass="NormalRed" ErrorMessage="You Must Enter rss title"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtTitle">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr valign="top">
                    <td>
                        <dnn:Label ID="plMaxRecord" runat="server" ControlName="txtMaxRecord"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMaxRecord" Columns="10" runat="server" Text="50" />
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtMaxRecord" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" resourcekey="Tip_DefaultValue" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
                <%if (CurrentType.FieldEnable_Author)
                  {%>
                <tr valign="top">
                    <td>
                        <dnn:Label ID="plAuthor" runat="server" ControlName="txtAuthor"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAuthor" Columns="100" runat="server" />
                    </td>
                </tr>
                <%} %>
                <%if (CurrentType.FieldEnable_Source)
                  {%>
                <tr valign="top">
                    <td>
                        <dnn:Label ID="plSource" runat="server" ControlName="txtSource"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSource" Columns="100" runat="server" />
                    </td>
                </tr>
                <%} %>
                <%if (CurrentType.FieldEnable_Quote)
                  {%>
                <tr valign="top">
                    <td>
                        <dnn:Label ID="plQuote" runat="server" ControlName="chkQuote"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkQuote" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <%} %>
                <%if (HasManagePermission)
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plRssStatus" runat="server" ControlName="chkFeatured" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFeatured" runat="server" resourcekey="chkFeatured" Text="Featured" />
                        &nbsp;
                        <asp:CheckBox ID="chkAuthed" runat="server" Text="Authed" resourcekey="chkAuthed"
                            Checked="true" />&nbsp;&nbsp;
                    </td>
                </tr>
                <%} %>
                <tr valign="top">
                    <td>
                        <dnn:Label ID="plActive" runat="server" ControlName="chkActive"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkActive" runat="server" Text="Active" resourcekey="chkActive"
                            Checked="true"></asp:CheckBox>
                    </td>
                </tr>
            </table>
            <dnn:SectionHead ID="secStandardFeeds" runat="server" Section="tblStandardFeeds"
                ResourceKey="secStandardFeeds" IncludeRule="True" IsExpanded="True" CssClass="SubHead"
                Visible="false"></dnn:SectionHead>
            <table cellspacing="2" cellpadding="2" width="100%"  runat="server" id="tblStandardFeeds"
                visible="false">
                <tr>
                    <td  style="width: 200px">
                        <dnn:Label ID="plStandardFeedsType" ControlName="ddlStandardFeedsType" runat="server">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlStandardFeedsType" runat="server" Width="300px">
                            <asp:ListItem Value="StandardFeeds_RecentlyFeatured" resourcekey="li_StandardFeeds_RecentlyFeatured"></asp:ListItem>
                            <asp:ListItem Value="StandardFeeds_TopRated" resourcekey="li_StandardFeeds_TopRated"></asp:ListItem>
                            <asp:ListItem Value="StandardFeeds_TopFavorites" resourcekey="li_StandardFeeds_TopFavorites"></asp:ListItem>
                            <asp:ListItem Value="StandardFeeds_MostViewed" resourcekey="li_StandardFeeds_MostViewed"></asp:ListItem>
                            <asp:ListItem Value="StandardFeeds_MostPopular" resourcekey="li_StandardFeeds_MostPopular"></asp:ListItem>
                            <asp:ListItem Value="StandardFeeds_MostRecent" resourcekey="li_StandardFeeds_MostRecent"></asp:ListItem>
                            <asp:ListItem Value="StandardFeeds_MostDiscussed" resourcekey="li_StandardFeeds_MostDiscussed"></asp:ListItem>
                            <asp:ListItem Value="StandardFeeds_MostLinked" resourcekey="li_StandardFeeds_MostLinked"></asp:ListItem>
                            <asp:ListItem Value="StandardFeeds_MostResponded" resourcekey="li_StandardFeeds_MostResponded"></asp:ListItem>
                            <asp:ListItem Value="StandardFeeds_WatchOnMobile" resourcekey="li_StandardFeeds_WatchOnMobile"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td >
                        <dnn:Label ID="plRegionSpecific" ControlName="ddlRegionSpecific" runat="server">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRegionSpecific" runat="server" Width="300px">
                            <asp:ListItem Value="-1" resourcekey="None_Specified"></asp:ListItem>
                            <asp:ListItem Value="AU" resourcekey="li_Australia"></asp:ListItem>
                            <asp:ListItem Value="BR" resourcekey="li_Brazil"></asp:ListItem>
                            <asp:ListItem Value="CA" resourcekey="li_Canada"></asp:ListItem>
                            <asp:ListItem Value="FR" resourcekey="li_France"></asp:ListItem>
                            <asp:ListItem Value="DE" resourcekey="li_Germany"></asp:ListItem>
                            <asp:ListItem Value="GB" resourcekey="li_GreatBritain"></asp:ListItem>
                            <asp:ListItem Value="NL" resourcekey="li_Holland"></asp:ListItem>
                            <asp:ListItem Value="HK" resourcekey="li_HongKong"></asp:ListItem>
                            <asp:ListItem Value="IE" resourcekey="li_Ireland"></asp:ListItem>
                            <asp:ListItem Value="IT" resourcekey="li_Italy"></asp:ListItem>
                            <asp:ListItem Value="JP" resourcekey="li_Japan"></asp:ListItem>
                            <asp:ListItem Value="MX" resourcekey="li_Mexico"></asp:ListItem>
                            <asp:ListItem Value="NZ" resourcekey="li_NewZealand"></asp:ListItem>
                            <asp:ListItem Value="PL" resourcekey="li_Poland"></asp:ListItem>
                            <asp:ListItem Value="RU" resourcekey="li_Russia"></asp:ListItem>
                            <asp:ListItem Value="KR" resourcekey="li_SouthKorea"></asp:ListItem>
                            <asp:ListItem Value="ES" resourcekey="li_Spain"></asp:ListItem>
                            <asp:ListItem Value="TW" resourcekey="li_Taiwan"></asp:ListItem>
                            <asp:ListItem Value="US" resourcekey="li_UnitedStates"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plTimeSpecific" ControlName="ddlTimeSpecific" runat="server"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTimeSpecific" runat="server" Width="300px">
                            <asp:ListItem Value="all_time" resourcekey="li_All_time"></asp:ListItem>
                            <asp:ListItem Value="this_month" resourcekey="li_This_month"></asp:ListItem>
                            <asp:ListItem Value="this_week" resourcekey="li_This_week"></asp:ListItem>
                            <asp:ListItem Value="today" resourcekey="li_Today"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <dnn:SectionHead ID="secUserSpecific" runat="server" Section="tblUserSpecific" ResourceKey="secUserSpecific"
                Visible="false" IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:SectionHead>
            <table cellspacing="2" cellpadding="2" width="100%" runat="server" id="tblUserSpecific"
                visible="false">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plUserAccount" ControlName="txtUserAccount" runat="server"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserAccount" runat="server" Columns="40" />
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="NormalRed"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtUserAccount" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plUserSpecific" ControlName="ddlUserSpecific" runat="server" />
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblUserSpecific" runat="server">
                            <asp:ListItem Value="UserSpecific_Uploads" resourcekey="li_UserSpecific_Uploads"
                                Selected="True"></asp:ListItem>
                            <asp:ListItem Value="UserSpecific_Favorites" resourcekey="li_UserSpecific_Favorites"></asp:ListItem>
                            <asp:ListItem Value="UserSpecific_PlayLists" resourcekey="li_UserSpecific_PlayLists"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label6" runat="server" resourcekey="Tip_UserPlayList" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plUserPlayList" ControlName="txtUserPlayList" runat="server"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserPlayList" runat="server" Columns="100" />
                    </td>
                </tr>
            </table>
            <dnn:SectionHead ID="secCustomizeCategoryAndTag" runat="server" Section="tblCustomizeCategoryAndTag"
                ResourceKey="secCustomizeCategoryAndTag" Visible="false" IncludeRule="True" IsExpanded="True"
                CssClass="SubHead"></dnn:SectionHead>
            <table cellspacing="2" cellpadding="2" width="100%" runat="server" id="tblCustomizeCategoryAndTag"
                visible="false">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plCategory" runat="server" ControlName="cblCategory"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblCategory" runat="server" RepeatColumns="4">
                            <asp:ListItem Value="Film" resourcekey="li_Film"></asp:ListItem>
                            <asp:ListItem Value="Autos" resourcekey="li_Autos"></asp:ListItem>
                            <asp:ListItem Value="Music" resourcekey="li_Music"></asp:ListItem>
                            <asp:ListItem Value="Animals" resourcekey="li_Animals"></asp:ListItem>
                            <asp:ListItem Value="Sports" resourcekey="li_Sports"></asp:ListItem>
                            <asp:ListItem Value="Travel" resourcekey="li_Travel"></asp:ListItem>
                            <asp:ListItem Value="Comedy" resourcekey="li_Comedy"></asp:ListItem>
                            <asp:ListItem Value="People" resourcekey="li_People"></asp:ListItem>
                            <asp:ListItem Value="News" resourcekey="li_News"></asp:ListItem>
                            <asp:ListItem Value="Entertainment" resourcekey="li_Entertainment"></asp:ListItem>
                            <asp:ListItem Value="Education" resourcekey="li_Education"></asp:ListItem>
                            <asp:ListItem Value="Howto" resourcekey="li_Howto"></asp:ListItem>
                            <asp:ListItem Value="Nonprofit" resourcekey="li_Nonprofit"></asp:ListItem>
                            <asp:ListItem Value="Tech" resourcekey="li_Tech"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plTags" ControlName="txtTags" runat="server"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTags" runat="server" Columns="60" />
                    </td>
                </tr>
            </table>
            <dnn:SectionHead ID="secAdvanced" runat="server" Section="tblAdvanced" ResourceKey="secAdvanced"
                IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:SectionHead>
            <table cellspacing="2" cellpadding="2" width="100%" runat="server" id="tblAdvanced">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plSearchTerm" runat="server" ControlName="txtSearchTerm" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtSearchTerm" runat="server" Columns="60" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label7" runat="server" resourcekey="Tip_VideoAuthor" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plVideoAuthor" runat="server" ControlName="txtVideoAuthor"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVideoAuthor" runat="server" Columns="60"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOrderBy" ControlName="ddlOrderBy" runat="server" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlOrderBy" runat="server" Width="300px">
                            <asp:ListItem Value="relevance" resourcekey="li_Relevance"></asp:ListItem>
                            <asp:ListItem Value="published" resourcekey="li_Published"></asp:ListItem>
                            <asp:ListItem Value="viewCount" resourcekey="li_ViewCount"></asp:ListItem>
                            <asp:ListItem Value="rating" resourcekey="li_Rating"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <%if (HasManagePermission)
          {%>
        <div id="divPermission" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label8" runat="server" resourcekey="Tip_ManagePermission" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plViewRoles" runat="server" ControlName="cblViewRoles" Text="View Roles">
                        </dnn:Label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="cblViewRoles" runat="server" CssClass="Normal" RepeatColumns="4"
                            CellPadding="0" CellSpacing="0">
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <dnn:Label ID="plDownloadRoles" runat="server" ControlName="cblDownloadRoles"></dnn:Label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="cblDownloadRoles" runat="server" CssClass="Normal" RepeatColumns="4"
                            CellPadding="0" CellSpacing="0">
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblPortalDisableComment" runat="server" resourcekey="lblPortalDisableComment"
                            CssClass="NormalRed" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plAllowComment" runat="server" Text="Allow Comment" ControlName="chkAllowComment">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAllowComment" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plCommentRoles" runat="server" Text="Comment Roles" ControlName="cblCommentRoles">
                        </dnn:Label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="cblCommentRoles" runat="server" CssClass="Normal" ResourceKey="chkCommentRoles"
                            RepeatColumns="4" CellPadding="0" CellSpacing="0">
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plAutoAuthComment" runat="server" Text="Auto Authorize Comment" ControlName="chkAutoAuthComment">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAutoAuthComment" runat="server"></asp:CheckBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblPortalDisableRating" runat="server" resourcekey="lblPortalDisableRating"
                            CssClass="NormalRed" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <dnn:Label ID="plAllowRating" runat="server" Text="Allow Rating" ControlName="chkAllowRating">
                        </dnn:Label>
                    </td>
                    <td valign="top">
                        <asp:CheckBox ID="chkAllowRating" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <dnn:Label ID="plRatingRoles" runat="server" ControlName="cblRatingRoles" Text="Rating Roles">
                        </dnn:Label>
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="cblRatingRoles" runat="server" CssClass="Normal" RepeatColumns="4"
                            CellPadding="0" CellSpacing="0">
                        </asp:CheckBoxList>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblPortalDisableRecommend" runat="server" resourcekey="lblPortalDisableRecommend"
                            CssClass="NormalRed" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <dnn:Label ID="plAllowRecommend" runat="server" ControlName="chkAllowRecommend">
                        </dnn:Label>
                    </td>
                    <td valign="top">
                        <asp:CheckBox ID="chkAllowRecommend" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <dnn:Label ID="plRecommendRoles" runat="server" ControlName="cblRecommendRoles" />
                    </td>
                    <td valign="top">
                        <asp:CheckBoxList ID="cblRecommendRoles" runat="server" CssClass="Normal" RepeatColumns="4"
                            CellPadding="0" CellSpacing="0">
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <div id="divCategory" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" resourcekey="Tip_SelectCategory" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TreeView ID="tvCategory" runat="server" ImageSet="XPFileExplorer" NodeIndent="10"
                            PathSeparator="/" ShowCheckBoxes="All" ExpandDepth="-1">
                            <ParentNodeStyle Font-Bold="False" />
                            <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                            <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                VerticalPadding="0px" />
                            <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                NodeSpacing="0px" VerticalPadding="2px" />
                        </asp:TreeView>
                    </td>
                </tr>
            </table>
        </div>
        <div id="divTag" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label10" runat="server" resourcekey="Tip_AddTag" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="txtTag1" Width="300px" runat="server" Visible="true" /><br />
                        <asp:TextBox ID="txtTag2" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag3" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag4" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag5" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag6" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag7" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag8" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag9" Width="300px" runat="server" /><br />
                        <asp:TextBox ID="txtTag10" Width="300px" runat="server" />
                    </td>
                </tr>
                <tr align="left">
                    <td style="width: 150px">
                        <dnn:Label ID="plPopularTag" runat="server" ControlName="ddlPopularTag" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPopularTag" runat="server" Width="300px" DataTextField="Tag"
                            DataValueField="Tag">
                        </asp:DropDownList>
                        <asp:LinkButton ID="lbtnAddTag" runat="server" resourcekey="lbtnAddTag" CssClass="dnnPrimaryAction"
                            OnClientClick="addTag();return false;"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <table width="100%" class="Normal" visible="false">
        <tr>
            <td align="center">
                <dnn:CommandButton ID="btnUpdate1" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                    OnCommand="btnUpdate_Click" Visible="false" />
                &nbsp;&nbsp;
                <dnn:CommandButton ID="btnDelete1" runat="server" ResourceKey="cmdDelete" ImageUrl="~/images/delete.gif"
                    OnCommand="btnDelete_Click" Visible="false" CausesValidation="false" OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                &nbsp;&nbsp;
                <dnn:CommandButton ID="btnCancel1" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                    OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            </td>
        </tr>
    </table>
</div>

