<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.AdminVideo_Video, App_Web_adminvideo_video.ascx.24b431c5" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<script type="text/javascript">
    function checkAll_Video() {
        if ($(":checkbox[id*='chkAll_Video']").prop("checked") == false) {
            $(":checkbox[id*='chkItem_Video']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Video']").prop("checked", false);
        }
    }

    function checkAll_Image() {
        if ($(":checkbox[id*='chkAll_Image']").prop("checked") == false) {
            $(":checkbox[id*='chkItem_Image']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Image']").prop("checked", false);
        }
    }
    function checkAll_Attachment() {
        if ($(":checkbox[id*='chkAll_Attachment']").prop("checked") == false) {
            $(":checkbox[id*='chkItem_Attachment']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem_Attachment']").prop("checked", false);
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
        if (!isNaN(parseInt(currTab)))
        {
            currTab = parseInt(currTab);
        }
        $("#tabs").tabs({ selected: currTab });
    });
   
</script>
<asp:HiddenField runat="server" ID="hidLastTab" Value="#divBasic" />
<table width="100%" align="center" runat="server" id="tblButton" class="dnnFormItem">
    <tr>
        <td align="center">
            <dnn:CommandButton ID="btnDeleteSelected" runat="server" ResourceKey="btnDeleteSelected"
                CausesValidation="false" ImageUrl="~/images/delete.gif" OnCommand="btnDeleteSelected_Click"
                OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItems",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;&nbsp;
            <asp:Label ID="lblChangeVideoStatus" runat="server" resourcekey="lblChangeVideoStatus" />
            <asp:DropDownList ID="ddlChangeVideoStatus" runat="server" Width="200px">
                <asp:ListItem Value="Authed" Selected="True" resourcekey="li_ChangeVideoStatus_Authed"></asp:ListItem>
                <asp:ListItem Value="UnAuthed" resourcekey="li_ChangeVideoStatus_UnAuthed"></asp:ListItem>
                <asp:ListItem Value="Active" resourcekey="li_ChangeVideoStatus_Active"></asp:ListItem>
                <asp:ListItem Value="UnActive" resourcekey="li_ChangeVideoStatus_UnActive"></asp:ListItem>
                <asp:ListItem Value="Featured" resourcekey="li_ChangeVideoStatus_Featured"></asp:ListItem>
                <asp:ListItem Value="UnFeatured" resourcekey="li_ChangeVideoStatus_UnFeatured"></asp:ListItem>
                <asp:ListItem Value="Private" resourcekey="li_ChangeVideoStatus_Private"></asp:ListItem>
                <asp:ListItem Value="UnPrivate" resourcekey="li_ChangeVideoStatus_UnPrivate"></asp:ListItem>
                <asp:ListItem Value="Protected" resourcekey="li_ChangeVideoStatus_Protected"></asp:ListItem>
                <asp:ListItem Value="UnProtected" resourcekey="li_ChangeVideoStatus_UnProtected"></asp:ListItem>
            </asp:DropDownList>
            <dnn:CommandButton ID="btnChangeVideoStatus" runat="server" CausesValidation="false"
                ImageUrl="~/desktopmodules/crossvideo/images/accept.png" ResourceKey="btnChangeVideoStatus"
                OnCommand="btnChangeVideoStatus_Click" />
            <dnn:CommandButton ID="btnUpdate" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                OnCommand="btnUpdate_Click" Visible="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDelete" runat="server" ResourceKey="cmdDelete" ImageUrl="~/images/delete.gif"
                OnCommand="btnDelete_Click" Visible="false" CausesValidation="false" OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnBackToList" runat="server" ResourceKey="btnBackToList"
                CausesValidation="false" Visible="false" ImageUrl="~/DesktopModules/CrossVideo/images/up.gif"
                OnCommand="btnBackToList_Click" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<table width="100%" align="center" runat="server" id="tblVideoList" class="dnnFormItem">
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
            <br />
            <asp:Label ID="lblType" runat="server" resourcekey="lblType" />
            <asp:DropDownList ID="ddlType" runat="server" DataTextField="Name" DataValueField="Id" Width="200px"
                AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
            </asp:DropDownList>
            &nbsp;&nbsp;
            <asp:Label ID="lblAuthor" runat="server" resourcekey="lblAuthor" />
            <asp:DropDownList ID="ddlAuthor" runat="server" DataTextField="DisplayName" DataValueField="UserId" Width="200px"/>
            <asp:Label ID="lblVideoCategory" runat="server" resourcekey="lblVideoCategory" />
            <asp:DropDownList ID="ddlCategory" runat="server" DataTextField="Name" DataValueField="Id" Width="200px"/>
            <br />
            <asp:Label ID="lblVideoStatus" runat="server" resourcekey="lblVideoStatus" />
            <asp:DropDownList ID="ddlVideoStatus" runat="server" Width="200px">
                <asp:ListItem Value="All" Selected="True" resourcekey="li_VideoStatus_All"></asp:ListItem>
                <asp:ListItem Value="UnAuthed" resourcekey="li_VideoStatus_UnAuthed"></asp:ListItem>
                <asp:ListItem Value="UnActive" resourcekey="li_VideoStatus_UnActive"></asp:ListItem>
                <asp:ListItem Value="Featured" resourcekey="li_VideoStatus_Featured"></asp:ListItem>
                <asp:ListItem Value="Expired" resourcekey="li_VideoStatus_Expired"></asp:ListItem>
                <asp:ListItem Value="Private" resourcekey="li_VideoStatus_Private"></asp:ListItem>
                <asp:ListItem Value="Protected" resourcekey="li_VideoStatus_Protected"></asp:ListItem>
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
            <asp:Label ID="lblVideoTitle" runat="server" resourcekey="lblVideoTitle1" />
            <asp:TextBox ID="txtSearch" runat="server" Width="200px"></asp:TextBox>
            <dnn:CommandButton ID="btnSearch" runat="server" CausesValidation="false" ImageUrl="~/images/icon_search_16px.gif"
                ResourceKey="btnSearch" OnCommand="btnSearch_Click" />
        </td>
    </tr>
    <tr align="left">
        <td>
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" Width="100%"
                CellPadding="1" CellSpacing="1" GridLines="None" BackColor="Gray" ForeColor="#333333"
                 DataKeyNames="Id" OnRowCommand="gvList_RowCommand" OnDataBinding="gvList_DataBinding">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecordes" Text='<%# Localization.GetString("NoRecords", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll_Video" runat="server" onclick="checkAll_Video()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem_Video" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='40' BorderStyle="Solid"
                                BorderWidth="1" BorderColor="DarkGray" ID='imgVideo' ImageAlign="AbsMiddle" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblCreator" runat="server" resourcekey="lblCreator"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreatorData" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblTitle" runat="server" resourcekey="lblTitle">Title</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlVideoTitleData" runat="server" Text='<%# Eval("Title") %>' Target="_blank"
                                NavigateUrl='<%#GetVideoUrl(Convert.ToString(Eval("Id"))) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="right">
                        <HeaderTemplate>
                            <asp:Label ID="lblDisplayOrder" runat="server" resourcekey="lblDisplayOrder">Index</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayOrderData" runat="server" Text='<%# Eval("DisplayOrder") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="right">
                        <HeaderTemplate>
                            <asp:Label ID="lblViews" runat="server" resourcekey="lblViews">Views</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblViewsData" runat="server" Text='<%# Eval("Views") %>'></asp:Label>
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
                            <asp:Label ID="lblAuthed" runat="server" resourcekey="lblAuthed">Authed</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkAuthedField" runat="server" Checked='<%# Eval("Authed") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblActive" runat="server" resourcekey="lblActive">Active</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkActiveField" runat="server" Checked='<%# Eval("Active") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblPrivate" runat="server" resourcekey="lblPrivate">Private</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkPrivateField" runat="server" Checked='<%# Eval("Private") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblProtected" runat="server" resourcekey="lblProtected"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkProtectedField" runat="server" Checked='<%# Eval("Protected") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured">Featured</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkFeaturedField" runat="server" Checked='<%# Eval("Featured") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblExpired" runat="server" resourcekey="lblExpired">Expired</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkExpiredField" runat="server" Checked='<%# Eval("Expired") %>'
                                Enabled="false" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
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
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblRelatedInfo" runat="server" resourcekey="lblRelatedInfo"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgAttachment" runat="server" CausesValidation="False" CommandName="Attachment"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgAttachment",LocalResourceFile)%>'
                                ImageUrl="~/DesktopModules/CrossVideo/images/Attachment.gif" AlternateText='<%#Localization.GetString("imgAttachment", LocalResourceFile)%>'
                                Visible="<%#Settings_Portal.General.EnableDocument%>" />
                            <asp:ImageButton ID="imgImage" runat="server" CausesValidation="False" CommandName="Image"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgImage",LocalResourceFile)%>'
                                ImageUrl="~/DesktopModules/CrossVideo/images/image.gif" AlternateText='<%#Localization.GetString("imgImage", LocalResourceFile)%>'
                                Visible="<%#Settings_Portal.General.EnableImage%>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
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
                    <br />
                    <br />
                    <img alt="" id="Img6" runat="server" src="~/images/icon_dashboard_16px.gif" />
                    <asp:Literal ID="lblToggleFeatured" runat="server" Text='<%#Localization.GetString("imgToggleFeatured", LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img7" runat="server" src="~/images/delete.gif" />
                    <asp:Literal ID="lblDelete" runat="server" Text='<%#Localization.GetString("imgDel", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img8" runat="server" src="~/DesktopModules/CrossVideo/images/Attachment.gif" />
                    <asp:Literal ID="lblAttachment" runat="server" Text='<%#Localization.GetString("imgAttachment",LocalResourceFile)%>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    <img alt="" id="Img11" runat="server" src="~/DesktopModules/CrossVideo/images/image.gif" />
                    <asp:Literal ID="lblImage" runat="server" Text='<%#Localization.GetString("imgImage", LocalResourceFile)%>' />
                </div>
            </div>
        </td>
    </tr>
</table>
<div id="divVideoDetail" runat="server">
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
            <%if (CurrentType.AllowGoogleMap)
              {%>
            <li><a href="#divMap"><span>
                <%#Localization.GetString("divMap", LocalResourceFile)%></span></a> </li>
            <%} %>
            <li><a href="#divCategory"><span>
                <%#Localization.GetString("divCategory", LocalResourceFile)%></span></a> </li>
            <li><a href="#divTag"><span>
                <%#Localization.GetString("divTag", LocalResourceFile)%></span></a> </li>
            <%if (HasManagePermission)
              {%>
            <li><a href="#divPermission"><span>
                <%#Localization.GetString("divPermission", LocalResourceFile)%></span></a> </li>
            <%} %>
            <%if (CurrentType.FieldEnable_Summary)
              {%>
            <li><a href="#divSummary"><span>
                <%#Localization.GetString("divSummary", LocalResourceFile)%></span></a> </li>
            <%} %>
            <%if (CurrentType.FieldEnable_Description)
              {%>
            <li><a href="#divDetail"><span>
                <%#Localization.GetString("divDetail", LocalResourceFile)%></span></a>
                <%} %>
            </li>
            <li id="Li1" runat="server" visible='<%#CurrentType.FieldEnable_Field1 %>'><a href="#divField1">
                <span>
                    <%#CurrentType.Field1Title%></span></a> </li>
            <li id="Li2" runat="server" visible='<%#CurrentType.FieldEnable_Field2 %>'><a href="#divField2">
                <span>
                    <%#CurrentType.Field2Title%></span></a> </li>
            <li id="Li3" runat="server" visible='<%#CurrentType.FieldEnable_Field3 %>'><a href="#divField3">
                <span>
                    <%#CurrentType.Field3Title%></span></a> </li>
            <li id="Li4" runat="server" visible='<%#CurrentType.FieldEnable_Field4 %>'><a href="#divField4">
                <span>
                    <%#CurrentType.Field4Title%></span></a> </li>
            <li id="Li5" runat="server" visible='<%#CurrentType.FieldEnable_Field5 %>'><a href="#divField5">
                <span>
                    <%#CurrentType.Field5Title%></span></a> </li>
        </ul>
        <div id="divBasic" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                 <tr>
                    <td style="width: 250px">
                        <dnn:Label ID="plTitle" runat="server" ControlName="txtTitle"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitle" Width="350px" runat="server" /><asp:Image ID="Image1" runat="server"
                            ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg" ToolTip="Reuired"
                            AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="varTitle" runat="server" CssClass="NormalRed" ErrorMessage="You Must Enter video title"
                            resourcekey="Required" Display="Dynamic" ControlToValidate="txtTitle">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plVideoDuration" runat="server" ControlName="txtVideoDuration" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtVideoDuration" Columns="20" runat="server" />
                    </td>
                </tr>
                <%if (CurrentType.FieldEnable_Author)
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plAuthor" runat="server" ControlName="txtAuthor"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAuthor" Width="300px" runat="server" />
                    </td>
                </tr>
                <%} %>
                <%if (CurrentType.FieldEnable_Source)
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plSource" runat="server" ControlName="txtSource"></dnn:Label>
                    </td>
                    <td>
                         <asp:TextBox ID="txtSource" Width="350px" runat="server" />
                    </td>
                </tr>
                <%} %>
                <%if (CurrentType.FieldEnable_Quote)
                  {%>
                <tr>
                    <td>
                        <dnn:Label ID="plQuote" runat="server" ControlName="chkQuote"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkQuote" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <%} %>
                <%if (CurrentType.FieldEnable_LinkUrl)
                  {%>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label6" runat="server" resourcekey="Tip_LinkUrl" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="middle">
                        <dnn:Label ID="plLinkUrl" runat="server" ControlName="ctlInfo" Text="Link Url"></dnn:Label>
                    </td>
                    <td>
                        <dnn:URL ID="ctlLinkUrl" runat="server" Width="400px" ShowLog="False" ShowNone="True"
                            ShowFiles="true" ShowTabs="true" ShowTrack="False"></dnn:URL>
                    </td>
                </tr>
                <%} %>
                <%if (HasManagePermission)
                  {%>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label7" runat="server" resourcekey="Tip_ViewOrder" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td >
                        <dnn:Label ID="plDisplayOrder" runat="server" ControlName="txtName" Text="Order" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtDisplayOrder" Columns="6" runat="server" Text="100" />
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtDisplayOrder" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFeatured" runat="server" ControlName="chkFeatured"></dnn:Label>
                    </td>
                    <td>
                         <asp:CheckBox ID="chkFeatured" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <dnn:Label ID="plAuthed" runat="server" ControlName="chkAuthed"></dnn:Label>
                    </td>
                    <td>
                           <asp:CheckBox ID="chkAuthed" runat="server"
                            Checked="true" />
                    </td>
                </tr>
                <%} %>
                <tr>
                    <td>
                        <dnn:Label ID="plActive" runat="server" ControlName="chkActive"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkActive" runat="server"
                            Checked="true"></asp:CheckBox>
                    </td>
                </tr>
                  <tr>
                    <td colspan="2">
                        <asp:Label ID="Label14" runat="server" resourcekey="Tip_PublishDate" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plPublishDate" runat="server" ControlName="txtPublishDate" Text="Publish Date" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPublishDate" MaxLength="10" Columns="10" runat="server" />
                        <asp:HyperLink ID="lbtnCalendar" Text="Calendar" resourcekey="Calendar" CssClass="CommandButton"
                            runat="server" />
                        <asp:CompareValidator ID="valPublishDate" runat="server" CssClass="NormalRed" ControlToValidate="txtPublishDate"
                            resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                            Display="Dynamic" Type="Date" Operator="DataTypeCheck" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plExpireDate" runat="server" ControlName="txtExpireDate" Text="Expire Date" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtExpireDate" MaxLength="10" Columns="10" runat="server" />
                        <asp:HyperLink ID="lbtnCalendarExpire" resourcekey="Calendar" CssClass="CommandButton"
                            runat="server" />
                        <asp:CompareValidator ID="valExpireDate" runat="server" CssClass="NormalRed" ControlToValidate="txtExpireDate"
                            resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                            Display="Dynamic" Type="Date" Operator="DataTypeCheck" />
                    </td>
                </tr>
            </table>
            <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Table ID="tblUserDefinedField" runat="server" summary="Edit User Defined Design Table"
                            Width="100%" Visible="false">
                        </asp:Table>
                    </td>
                </tr>
            </table>
        </div>
        <%if (CurrentType.AllowGoogleMap)
          {%>
        <div id="divMap" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label8" runat="server" resourcekey="Tip_GoogleMap" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plLatitude" runat="server" ControlName="txtLatitude"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLatitude" Columns="60" runat="server" />
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeDecimal"
                            ForeColor="Red" runat="server" ValidationExpression="^(-?\d+)(\.\d+)?$" ControlToValidate="txtLatitude" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plLongitude" runat="server" ControlName="txtLongitude"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLongitude" Columns="60" runat="server" />
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeDecimal"
                            ForeColor="Red" runat="server" ValidationExpression="^(-?\d+)(\.\d+)?$" ControlToValidate="txtLongitude" />
                    </td>
                </tr>

                 <tr>
                    <td>
                        <dnn:Label ID="plMapTitle" runat="server" ControlName="txtMapTitle"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMapTitle" Columns="60" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Image ID="Image11" runat="server" ImageUrl="~/desktopmodules/CrossVideo/images/GoogleMap_Sample.jpg" /><br />
                        <%=LocalizeString("Tip_GoogleMap_Sample")%>
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <div id="divCategory" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td>
                        <asp:Label ID="lbl_Tip_SelectCategory" runat="server"  CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
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
            <table cellspacing="0" cellpadding="2" border="0">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label10" runat="server" resourcekey="lblTagTip" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
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
                        <asp:DropDownList ID="ddlPopularTag" runat="server" DataTextField="Tag" Width="300px"
                            DataValueField="Tag">
                        </asp:DropDownList>
                        <asp:LinkButton ID="lbtnAddTag" runat="server" resourcekey="lbtnAddTag" CssClass="CommandButton"
                            OnClientClick="addTag();return false;"></asp:LinkButton>
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
                        <asp:Label ID="Label11" runat="server" resourcekey="Tip_ManagePermission" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        <dnn:Label ID="plViewRoles" runat="server" ControlName="cblViewRoles" Text="View Roles">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblViewRoles" runat="server" CssClass="Normal" RepeatColumns="4"
                            CellPadding="0" CellSpacing="0">
                        </asp:CheckBoxList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plDownloadRoles" runat="server" ControlName="cblDownloadRoles"></dnn:Label>
                    </td>
                    <td>
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
                    <td>
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
                    <td>
                        <dnn:Label ID="plAllowRating" runat="server" Text="Allow Rating" ControlName="chkAllowRating">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAllowRating" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRatingRoles" runat="server" ControlName="cblRatingRoles" Text="Rating Roles">
                        </dnn:Label>
                    </td>
                    <td>
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
                    <td>
                        <dnn:Label ID="plAllowRecommend" runat="server" ControlName="chkAllowRecommend">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAllowRecommend" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plRecommendRoles" runat="server" ControlName="cblRecommendRoles">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblRecommendRoles" runat="server" CssClass="Normal" RepeatColumns="4"
                            CellPadding="0" CellSpacing="0">
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_Summary)
          {%>
        <div id="divSummary" class="dnnFormItem" style="height: 100%">
            <table id="tblSummary" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label12" runat="server" resourcekey="Tip_Summary" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="txtSummary" Width="100%" Height="200px" runat="server" TextMode="MultiLine" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_Description)
          {%>
        <div id="divDetail" class="dnnFormItem" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtDetail" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_Field1)
          {%>
        <div id="divField1" class="dnnFormItem" style="height: 100%">
            <table id="tblField1" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField1" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_Field2)
          {%>
        <div id="divField2" class="dnnFormItem" style="height: 100%">
            <table id="tblField2" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField2" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_Field3)
          {%>
        <div id="divField3" class="dnnFormItem" style="height: 100%">
            <table id="tblField3" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField3" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_Field4)
          {%>
        <div id="divField4" class="dnnFormItem" style="height: 100%">
            <table id="tblField4" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField4" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
        <%if (CurrentType.FieldEnable_Field5)
          {%>
        <div id="divField5" class="dnnFormItem" style="height: 100%">
            <table id="tblField5" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField5" Width="100%" Height="600px" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%} %>
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
<table id="tblAttachment" cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem"
    runat="server">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblAttachmentList" runat="server" CssClass="SubHead"></asp:Label><br />
            <asp:GridView ID="gvAttachmentList" runat="server" DataKeyNames="Id" Width="100%"
                AutoGenerateColumns="False" OnRowCommand="gvAttachmentList_RowCommand" ForeColor="#333333"
                CellPadding="1" CellSpacing="1" GridLines="None" BackColor="Gray">
                <RowStyle CssClass="DataGrid_Item" BackColor="#F7F6F3" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    <asp:Label ID="Label1" Text='<%# Localization.GetString("NoRecords", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server" CssClass="Normal"></asp:Label>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle CssClass="DataGrid_Header" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll_Attachment" runat="server" onclick="checkAll_Attachment()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem_Attachment" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="20px" />
                        <HeaderStyle Width="20px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="left">
                        <HeaderTemplate>
                            <asp:Label ID="lblFilePath" runat="server" resourcekey="lblFilePath"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFilePathField" runat="server" Text='<%# Bind("FilePath") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDelete" runat="server" ResourceKey="imgDelete" ImageUrl="~/images/delete.gif"
                                CommandName="Del" CommandArgument='<%#Eval("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" runat="server" id="tblImageList" align="left">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblImageList" runat="server" CssClass="SubHead"></asp:Label><br />
            <asp:GridView ID="gvImageList" runat="server" AutoGenerateColumns="False" Width="100%"
                CellPadding="1" CellSpacing="1" GridLines="None" BackColor="Gray" ForeColor="#333333"
                CssClass="Normal" DataKeyNames="Id" OnRowCommand="gvImageList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecores" Text='<%# Localization.GetString("NoRecords", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAll_Image" runat="server" onclick="checkAll_Image()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem_Image" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='40' BorderStyle="Solid"
                                BorderWidth="1" BorderColor="DarkGray" ID='imgImage' ImageAlign="Left" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblTitle" runat="server" resourcekey="lblImageTitle">Title</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTitleField" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblImagePath" runat="server" resourcekey="lblImagePath"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblImagePathField" runat="server" Text='<%#Eval("ImagePath") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblDescription" runat="server" resourcekey="lblDescription"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDescriptionField" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
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
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
</table>

