<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Settings_List, App_Web_settings_list.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<table cellspacing="0" cellpadding="2" width="95%" summary="Video list Settings Design Table"
    class="dnnFormItem" align="center">
    <tr>
        <td>
            <dnn:sectionhead ID="secGeneral" runat="server" Section="tblGeneral" ResourceKey="secGeneral"
                IncludeRule="True" IsExpanded="true" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblGeneral" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td style="width: 250px">
                        <dnn:label ID="plType" runat="server" ControlName="ddlType" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlType" runat="server" DataTextField="Name" DataValueField="Id"
                            AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" resourcekey="Tip_Template" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plTemplate" runat="server" ControlName="ddlTemplate" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTemplate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" resourcekey="Tip_DetailTab" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plDetailTab" runat="server" ControlName="ddlDetailTab" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDetailTab" DataValueField="TabId" DataTextField="IndentedTabName"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plListType" ControlName="ddlListType" runat="server" />
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlListStyle" runat="server">
                            <asp:ListItem Value="List" resourcekey="li_ListStyle_List">List</asp:ListItem>
                            <asp:ListItem Value="Grid" resourcekey="li_ListStyle_Grid">Grid</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label3" runat="server" resourcekey="Tip_AcceptSearchParm" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plAcceptSearchParm" runat="server" ControlName="chkAcceptSearchParm" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chkAcceptSearchParm" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plVideoType" runat="server" ControlName="ddlVideoType" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlVideoType" runat="server">
                            <asp:ListItem Value="-1" Selected="True" resourcekey="li_All" />
                            <asp:ListItem Value="0" resourcekey="li_VideoType_Single" />
                            <asp:ListItem Value="1" resourcekey="li_VideoType_Serial" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plFeaturedStatus" runat="server" ControlName="ddlFeaturedStatus" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFeaturedStatus" runat="server">
                            <asp:ListItem Value="2" Selected="True" resourcekey="li_All" />
                            <asp:ListItem Value="0" resourcekey="li_FeaturedStatus_UnFeatured" />
                            <asp:ListItem Value="1" resourcekey="li_FeaturedStatus_Featured" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plQuotedStatus" runat="server" ControlName="ddlQuotedStatus" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlQuotedStatus" runat="server">
                            <asp:ListItem Value="2" Selected="True" resourcekey="li_All" />
                            <asp:ListItem Value="0" resourcekey="li_QuotedStatus_UnQuoted" />
                            <asp:ListItem Value="1" resourcekey="li_QuotedStatus_Quoted" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plProtectedStatus" runat="server" ControlName="ddlProtectedStatus" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProtectedStatus" runat="server">
                            <asp:ListItem Value="2" Selected="True" resourcekey="li_All" />
                            <asp:ListItem Value="0" resourcekey="li_ProtectedStatus_UnProtected" />
                            <asp:ListItem Value="1" resourcekey="li_ProtectedStatus_Protected" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plSortField" runat="server" Text="Sort By" ControlName="ddlSortField" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSortField" runat="server">
                            <asp:ListItem Value="Recent" Selected="True" resourcekey="li_SortField_Recent" />
                            <asp:ListItem Value="Views" resourcekey="li_SortField_Views" />
                            <asp:ListItem Value="Popular" resourcekey="li_SortField_Popular" />
                            <asp:ListItem Value="Comment" resourcekey="li_SortField_Comment" />
                            <asp:ListItem Value="RecommendUp" resourcekey="li_SortField_RecommendUp" />
                            <asp:ListItem Value="Rating" resourcekey="li_SortField_Rating" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plLinkTarget" ControlName="ddlLinkTarget" runat="server" />
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlLinkTarget" runat="server">
                            <asp:ListItem Value="_self" resourcekey="li_LinkTarget_Self">_Self</asp:ListItem>
                            <asp:ListItem Value="_blank" resourcekey="li_LinkTarget_Blank">_Blank</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:sectionhead ID="secCategory" runat="server" Section="tblCategory" ResourceKey="secCategory"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblCategory" cellspacing="0" cellpadding="2" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label4" runat="server" resourcekey="Tip_Category" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 250px">
                        <dnn:label ID="plCategory" runat="server" ControlName="tvCategory" />
                    </td>
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
        </td>
    </tr>
    <tr>
        <td>
            <dnn:sectionhead ID="secAuthor" runat="server" Section="tblAuthor" ResourceKey="secAuthor"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblAuthor" cellspacing="0" cellpadding="2" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label5" runat="server" resourcekey="Tip_Author" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 250px">
                        <dnn:label ID="plAuthor" runat="server" ControlName="cblType" />
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblAuthor" runat="server" RepeatColumns="4">
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:sectionhead ID="secImage" runat="server" Section="tblImage" ResourceKey="secImage"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblImage" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td style="width: 250px">
                        <dnn:label ID="plShowImage" runat="server" ControlName="chkShowImage" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowImage" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowImageOnly" runat="server" ControlName="chkShowImageOnly" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowImageOnly" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plImageWidth" runat="server" ControlName="txtImageWidth" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtImageWidth" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtImageWidth"></asp:RegularExpressionValidator><asp:CheckBox
                                ID="chkForceImageWidth" runat="server" Text="Force Image Width" resourcekey="chkForceImageWidth">
                            </asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plImageHeight" runat="server" ControlName="txtImageHeight" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtImageHeight" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator13" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtImageHeight"></asp:RegularExpressionValidator><asp:CheckBox
                                ID="chkForceImageHeight" runat="server" Text="Force Image Height" resourcekey="chkForceImageHeight">
                            </asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:sectionhead ID="secPaging" runat="server" Section="tblPaging" ResourceKey="secPaging"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblPaging" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td style="width: 250px">
                        <dnn:label ID="plPaging" runat="server" ControlName="chkShowPage"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowPage" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plRowCount" runat="server" ControlName="txtRowCount"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRowCount" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtRowCount"></asp:RegularExpressionValidator>
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
                        <dnn:label ID="plPageSpan" runat="server" ControlName="txtPageSpan"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPageSpan" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtPageSpan"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowPageInfo" runat="server" ControlName="chkShowPageInfo"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowPageInfo" runat="server"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:sectionhead ID="secRoll" runat="server" Text="Roll" Section="tblRoll" ResourceKey="secRoll"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblRoll" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td style="width: 250px">
                        <dnn:label ID="plRoll" runat="server" Text="Roll" ControlName="chkRoll"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRoll" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plDirection" runat="server" ControlName="ddlDirection"></dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDirection" runat="server">
                            <asp:ListItem Value="Up" resourcekey="li_Direction_Up">UP</asp:ListItem>
                            <asp:ListItem Value="Down" resourcekey="li_Direction_Down">DOWN</asp:ListItem>
                            <asp:ListItem Value="Left" resourcekey="li_Direction_Left">LEFT</asp:ListItem>
                            <asp:ListItem Value="Right" resourcekey="li_Direction_Right">RIGHT</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plMarHeight" runat="server" ControlName="txtMarHeight"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMarHeight" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator5" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtMarHeight"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plScrollAmount" runat="server" ControlName="txtScrollAmount"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtScrollAmount" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtScrollAmount"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:sectionhead ID="secMoreVideos" runat="server" Section="tblMoreVideos" ResourceKey="secMoreVideos"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblMoreVideos" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label6" runat="server" resourcekey="Tip_MoreVideo" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 250px">
                        <dnn:label ID="plMoreVideos" runat="server" ControlName="chkMoreVideos"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkMoreVideos" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plMoreVideosText" runat="server" ControlName="txtMoreVideosText">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMoreVideosText" runat="server" Columns="40"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plMoreVideosLink" runat="server" ControlName="ddlMoreVideosLink">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlMoreVideosLink" DataValueField="TabId" DataTextField="IndentedTabName"
                            runat="server" Width="60%">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:sectionhead ID="secRss" runat="server" Section="tblRss" ResourceKey="secRss"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblRss" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td style="width: 250px">
                        <dnn:label ID="plDisplayRss" runat="server" ControlName="chkDisplayRss"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkDisplayRss" runat="server"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:sectionhead ID="secContent" runat="server" Section="tblContent" ResourceKey="secContent"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
            <table id="tblContent" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label7" runat="server" resourcekey="Tip_DisplayContent" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 250px">
                        <dnn:label ID="plShowSearch" runat="server" ControlName="chkShowSearch"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowSearch" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowSortInSearch" runat="server" ControlName="chkShowSortInSearch" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowSortInSearch" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowTitle" runat="server" ControlName="chkShowTitle"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowTitle" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plTitleLength" runat="server" ControlName="txtTitleLength"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitleLength" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator8" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtTitleLength"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowDuration" runat="server" ControlName="chkShowDuration" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowDuration" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowUserName" runat="server" ControlName="chkShowUserName"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowUserName" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowAuthor" runat="server" ControlName="chkShowAuthor"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowAuthor" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowSource" runat="server" ControlName="chkShowSource"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowSource" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowRecommend" runat="server" ControlName="chkShowRecommend"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowRecommend" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowSummary" runat="server" ControlName="chkShowSummary"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowSummary" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plSummaryLength" runat="server" ControlName="txtSummaryLength"></dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSummaryLength" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator7" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtSummaryLength"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowCreatedDate" runat="server" ControlName="chkShowCreatedDate" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowCreatedDate" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowFeaturedField" runat="server" ControlName="chkShowFeaturedField" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowFeaturedField" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowViews" runat="server" ControlName="chkShowViews"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowViews" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowComments" runat="server" ControlName="chkShowComments"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowComments" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plShowRating" runat="server" ControlName="chkShowRating"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkShowRating" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plRatingImage" runat="server" ControlName="ddlRatingImage"></dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRatingImage" runat="server" Width="60%">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:sectionhead ID="secUDField" runat="server" Section="tblUDField" ResourceKey="secUDField"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead" Visible="false"></dnn:sectionhead>
            <table id="tblUDField" cellspacing="0" cellpadding="2" border="0" runat="server"
                visible="false">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label8" runat="server" resourcekey="Tip_UdField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plUseBuiltInTemplate" runat="server" ControlName="chkUseBuiltInTemplate" />
                    </td>
                    <td>
                        <asp:CheckBox ID="chkUseBuiltInTemplate" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 250px">
                        <dnn:label ID="plUDFieldList" runat="server" ControlName="cblUDFieldList" />
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblUDFieldList" runat="server" RepeatColumns="2" RepeatDirection="Horizontal"
                            DataTextField="FieldName" DataValueField="Id">
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plUDField_ImageWidth" runat="server" ControlName="txtUDField_ImageWidth">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUDField_ImageWidth" runat="server" Columns="4"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plUDField_ImageHeight" runat="server" ControlName="txtUDField_ImageHeight" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUDField_ImageHeight" runat="server" Columns="4"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plUDField_CheckBoxList_Enabled" runat="server" ControlName="chkUDField_CheckBoxList_Enabled">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkUDField_CheckBoxList_Enabled" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plUDField_CheckBoxList_RepeatColumns" runat="server" ControlName="txtUDField_CheckBoxList_RepeatColumns">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUDField_CheckBoxList_RepeatColumns" runat="server" Columns="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator15" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtUDField_CheckBoxList_RepeatColumns"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update" CausesValidation="true"></asp:LinkButton>&nbsp;
    <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdReturn" CssClass="dnnSecondaryAction"
        NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
</p>
