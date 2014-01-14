<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Settings_Detail, App_Web_settings_detail.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<dnn:sectionhead ID="secGeneral" runat="server" Section="tblGeneral" ResourceKey="secGeneral"
    IncludeRule="True" IsExpanded="True" CssClass="SubHead"></dnn:sectionhead>
<table cellspacing="0" cellpadding="2" width="100%" border="0" runat="server" id="tblGeneral"
    class="dnnFormItem">
    <tr>
        <td style="width: 250px">
            <dnn:label ID="plType" runat="server" ControlName="ddlType" />
        </td>
        <td>
            <asp:DropDownList ID="ddlType" runat="server" DataTextField="Name" DataValueField="Id"
                AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
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
            <dnn:label ID="plTemplate" runat="server" ControlName="ddlTemplate" />
        </td>
        <td>
            <asp:DropDownList ID="ddlTemplate" CssClass="dnnFormItem" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label2" runat="server" resourcekey="Tip_TabStyle" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTabStyle" runat="server" ControlName="ddlTabStyle" />
        </td>
        <td>
            <asp:DropDownList ID="ddlTabStyle" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plCheckXhtmlDocType" runat="server" ControlName="chkCheckXhtmlDocType">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkCheckXhtmlDocType" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowTitle" runat="server" ControlName="chkShowTitle" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowTitle" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowUserName" runat="server" ControlName="chkShowUserName" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowUserName" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowCreatedDate" runat="server" ControlName="chkShowCreatedDate">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCreatedDate" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowAuthorAvatar" runat="server" ControlName="chkShowAuthorAvatar">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuthorAvatar" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowAuthorBiography" runat="server" ControlName="chkShowAuthorBiography">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuthorBiography" runat="server" />
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Source %>">
        <td>
            <dnn:label ID="plShowSource" runat="server" ControlName="chkShowSource" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowSource" runat="server" />
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Author %>">
        <td>
            <dnn:label ID="plShowAuthor" runat="server" ControlName="chkShowAuthor" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowAuthor" runat="server" />
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Summary %>">
        <td>
            <dnn:label ID="plShowSummary" runat="server" ControlName="chkShowSummary" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowSummary" runat="server" />
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Description %>">
        <td>
            <dnn:label ID="plShowDescription" runat="server" ControlName="chkShowDescription" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowDescription" runat="server" />
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Field1 %>">
        <td>
            <dnn:label ID="plShowField1" runat="server" ControlName="chkShowField1" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowField1" runat="server" />
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Field2 %>">
        <td>
            <dnn:label ID="plShowField2" runat="server" ControlName="chkShowField2" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowField2" runat="server" />
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Field3 %>">
        <td>
            <dnn:label ID="plShowField3" runat="server" ControlName="chkShowField3" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowField3" runat="server" />
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Field4 %>">
        <td>
            <dnn:label ID="plShowField4" runat="server" ControlName="chkShowField4" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowField4" runat="server" />
        </td>
    </tr>
    <tr runat="server" visible="<%#CurrentType.FieldEnable_Field5 %>">
        <td>
            <dnn:label ID="plShowField5" runat="server" ControlName="chkShowField5" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowField5" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowViews" runat="server" ControlName="chkShowViews" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowViews" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowAttachment" runat="server" ControlName="chkShowAttachment">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAttachment" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowReturn" runat="server" ControlName="chkShowReturn" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowReturn" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowAddFavorite" runat="server" ControlName="chkShowAddFavorite">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAddFavorite" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowAddWatch" runat="server" ControlName="chkShowAddWatch"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAddWatch" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowAddTicket" runat="server" ControlName="chkShowAddTicket"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowAddTicket" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowPrint" runat="server" ControlName="chkShowPrint" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowPrint" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowDownload" runat="server" ControlName="chkShowDownload" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowDownload" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowReportAbuse" runat="server" ControlName="chkShowReportAbuse" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowReportAbuse" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowSocialBookmarks" runat="server" ControlName="chkShowSocialBookmarks">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowSocialBookmarks" runat="server" />
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secPlayer" runat="server" Section="tblPlayer" ResourceKey="secPlayer"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblPlayer" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label3" runat="server" resourcekey="Tip_BuiltInPlayer" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 30px">
        </td>
        <td>
            <dnn:sectionhead ID="secPlayer_General" runat="server" Section="tblPlayer_General"
                ResourceKey="secPlayer_General" IncludeRule="True" IsExpanded="True" CssClass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" runat="server" id="tblPlayer_General">
              
                <tr>
                    <td style="width: 250px">
                        <dnn:label ID="plJw66_Controls" runat="server" ControlName="chkJw66_Controls"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkJw66_Controls" />
                    </td>
                </tr>
                  <tr>
                    <td colspan="2">
                        <asp:Label ID="Label13" runat="server" resourcekey="Tip_Primary" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plJw66_Primary" runat="server" ControlName="ddlJw66_Primary"></dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlJw66_Primary" runat="server">
                            <asp:ListItem Value="html5" ResourceKey="liPrimary_html5" />
                            <asp:ListItem Value="flash" ResourceKey="liPrimary_flash" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plJw66_Skin" runat="server" ControlName="ddlJw66_Skin"></dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlJw66_Skin" runat="server">
                            <asp:ListItem Value="Six" resourcekey="liSkin_Six" />
                            <asp:ListItem Value="Five" resourcekey="liSkin_Five" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label9" runat="server" resourcekey="Tip_PlayerWidth" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plJw66_Width" runat="server" ControlName="txtJw66_Width" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtJw66_Width" runat="server" Columns="12"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" resourcekey="MustBeInteger" ForeColor="Red"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtJw66_Width"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label10" runat="server" resourcekey="Tip_Aspectratio" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plJw66_Aspectratio" runat="server" ControlName="txtJw66_Aspectratio" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtJw66_Aspectratio" runat="server" Columns="12"></asp:TextBox>
                        <asp:CheckBox runat="server" ID="chkJw66_EnableAspectratio" resourcekey="chkJw66_EnableAspectratio" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label11" runat="server" resourcekey="Tip_PlayerHeight" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plJw66_Height" runat="server" ControlName="txtJw66_Height" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtJw66_Height" runat="server" Columns="12"></asp:TextBox>
                         <asp:RegularExpressionValidator ID="Regularexpressionvalidator2" resourcekey="MustBeInteger" ForeColor="Red"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtJw66_Height"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="width: 30px">
        </td>
        <td>
            <dnn:sectionhead ID="secPlayer_PlayBack" runat="server" Section="tblPlayer_PlayBack"
                ResourceKey="secPlayer_PlayBack" IncludeRule="True" IsExpanded="True" CssClass="SubHead">
            </dnn:sectionhead>
            <table id="tblPlayer_PlayBack" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label12" runat="server" resourcekey="Tip_AutoStart" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 250px">
                        <dnn:label ID="plJw66_AutoStart" runat="server" ControlName="chkJw66_AutoStart">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkJw66_AutoStart" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plJw66_Fallback" runat="server" ControlName="chkJw66_Fallback"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkJw66_Fallback" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plJw66_Mute" runat="server" ControlName="chkJw66_Mute"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkJw66_Mute" />
                    </td>
                </tr>
               
                <tr>
                    <td>
                        <dnn:label ID="plJw66_Repeat" runat="server" ControlName="chkJw66_Repeat"></dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkJw66_Repeat" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plJw66_DisplayTitle" runat="server" ControlName="chkJw66_DisplayTitle">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkJw66_DisplayTitle" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plJw66_StageVideo" runat="server" ControlName="chkJw66_StageVideo">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="chkJw66_StageVideo" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label6" runat="server" resourcekey="Tip_Stretching" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:label ID="plJw66_Stretching" runat="server" ControlName="ddlJw66_Stretching">
                        </dnn:label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlJw66_Stretching" runat="server" Width="400px">
                            <asp:ListItem Value="none" ResourceKey="liStretching_none" />
                            <asp:ListItem Value="exactfit" ResourceKey="liStretching_exactfit" />
                            <asp:ListItem Value="uniform" ResourceKey="liStretching_uniform" />
                            <asp:ListItem Value="fill" ResourceKey="liStretching_fill" />
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secGoogleMap" runat="server" Section="tblGoogleMap" ResourceKey="secGoogleMap"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblGoogleMap" cellspacing="0" cellpadding="2" border="0" class="dnnFormItem"
    runat="server">
    <tr>
        <td style="width: 200px">
            <dnn:label ID="plShowGoogleMap" runat="server" ControlName="chkShowGoogleMap"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowGoogleMap" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label4" runat="server" resourcekey="Tip_GoogleMapZoom" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plGoogleMapZoom" runat="server" ControlName="txtGoogleMapZoom"></dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtGoogleMapZoom" runat="server" Columns="6"></asp:TextBox>0 -
            18
            <asp:RangeValidator ID="rang1" runat="server" ControlToValidate="txtGoogleMapZoom"
                ForeColor="Red" resourcekey="MustBetween0To18" MinimumValue="0" MaximumValue="18"
                Type="Integer"></asp:RangeValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="Label5" runat="server" resourcekey="Tip_GoogleMapStyle" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plGoogleMapStyle" runat="server" ControlName="txtGoogleMapStyle">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtGoogleMapStyle" runat="server" Columns="60"></asp:TextBox>
            <asp:Image ID="Image15" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGoogleMapStyle"
                ForeColor="Red" resourcekey="Required" ID="RequiredFieldValidator3" />
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secTag" runat="server" Section="tblTag" ResourceKey="secTag"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblTag" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem">
    <tr>
        <td style="width: 250px">
            <dnn:label ID="plShowTags" runat="server" ControlName="chkShowTags" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowTags" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plTagsPerRow" runat="server" ControlName="txtTagsPerRow" />
        </td>
        <td>
            <asp:TextBox ID="txtTagsPerRow" runat="server" Columns="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator3" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtTagsPerRow"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secComment" runat="server" Section="tblComment" ResourceKey="secComment"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblComment" cellspacing="0" cellpadding="2" border="0" runat="server"
    class="dnnFormItem">
    <tr>
        <td style="width: 250px">
            <dnn:label ID="plShowComment" runat="server" ControlName="chkShowComment" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowComment" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowCommentAvatar" runat="server" ControlName="chkShowCommentAvatar">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowCommentAvatar" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plCommentRowCount" runat="server" ControlName="txtCommentRowCount">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtCommentRowCount" runat="server" Columns="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator4" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtCommentRowCount"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secRating" runat="server" Section="tblRating" ResourceKey="secRating"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblRating" cellspacing="0" cellpadding="2" border="0" runat="server" class="dnnFormItem">
    <tr>
        <td style="width: 250px">
            <dnn:label ID="plShowRating" runat="server" ControlName="chkShowRating" />
        </td>
        <td>
            <asp:CheckBox ID="chkShowRating" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRatingImage" runat="server" ControlName="ddlRatingImage" />
        </td>
        <td>
            <asp:DropDownList ID="ddlRatingImage" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRatingRowCount" runat="server" ControlName="txtRatingRowCount">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRatingRowCount" runat="server" Columns="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator12" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRatingRowCount" />
        </td>
    </tr>
</table>
<%--<dnn:sectionhead ID="secYouTubePlayer" runat="server" Section="tblYouTubePlayer"
    ResourceKey="secYouTubePlayer" IncludeRule="True" IsExpanded="false" CssClass="SubHead"
    Visible="true"></dnn:sectionhead>
<table id="tblYouTubePlayer" cellspacing="0" cellpadding="2" border="0" runat="server"
    class="dnnFormItem" visible="true">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label6" runat="server" resourcekey="Tip_YouTubePlayer" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 250px">
            <dnn:label ID="plYT_Width" runat="server" ControlName="txtYT_Width" />
        </td>
        <td>
            <asp:TextBox ID="txtYT_Width" runat="server" Columns="12"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator13" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtYT_Width" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plYT_Height" runat="server" ControlName="txtYT_Height" />
        </td>
        <td>
            <asp:TextBox ID="txtYT_Height" runat="server" Columns="12"></asp:TextBox>px
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator14" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtYT_Height" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plYT_ShowRel" runat="server" ControlName="chkYT_ShowRel"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkYT_ShowRel" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plYT_AutoPlay" runat="server" ControlName="chkYT_AutoPlay"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkYT_AutoPlay" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plYT_Loop" runat="server" ControlName="chkYT_Loop"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkYT_Loop" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plYT_DisableKb" runat="server" ControlName="chkYT_DisableKb"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkYT_DisableKb" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plYT_EnhancedGenieMenu" runat="server" ControlName="chkYT_EnhancedGenieMenu">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkYT_EnhancedGenieMenu" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plYT_Border" runat="server" ControlName="chkYT_Border"></dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkYT_Border" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plYT_PrimaryBorderColor" runat="server" ControlName="txtYT_PrimaryBorderColor">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtYT_PrimaryBorderColor" runat="server" Columns="8"></asp:TextBox>
            <a id="pickYT_PrimaryBorderColor" name="pickYT_PrimaryBorderColor" href="javascript:void(PickYT_PrimaryBorderColor())"
                target="_self">
                <asp:Image ID="Image13" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossVideo/images/ColorPick.jpg" /></a>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plYT_SecondaryBorderColor" runat="server" ControlName="txtYT_SecondaryBorderColor">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtYT_SecondaryBorderColor" runat="server" Columns="8"></asp:TextBox>
            <a id="pickYT_SecondaryBorderColor" name="pickYT_SecondaryBorderColor" href="javascript:void(PickYT_SecondaryBorderColor())"
                target="_self">
                <asp:Image ID="Image1" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/CrossVideo/images/ColorPick.jpg" /></a>
        </td>
    </tr>
</table>--%>
<dnn:sectionhead ID="secUDField" runat="server" Section="tblUDField" ResourceKey="secUDField"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead" Visible="false"></dnn:sectionhead>
<table id="tblUDField" cellspacing="0" cellpadding="2" border="0" runat="server"
    class="dnnFormItem" visible="false">
    <tr>
        <td colspan="2">
            <asp:Label ID="Label7" runat="server" resourcekey="Tip_UdField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 250px">
            <dnn:label ID="plUseBuiltInTemplate" runat="server" ControlName="chkUseBuiltInTemplate">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkUseBuiltInTemplate" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDFieldList" runat="server" ControlName="cblUDFieldList"></dnn:label>
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
            <asp:TextBox ID="txtUDField_ImageWidth" runat="server" Columns="6"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plUDField_ImageHeight" runat="server" ControlName="txtUDField_ImageHeight">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtUDField_ImageHeight" runat="server" Columns="6"></asp:TextBox>
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
<dnn:sectionhead ID="secRelatedVideo" runat="server" Section="tblRelatedVideo" ResourceKey="secRelatedVideo"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblRelatedVideo" cellspacing="0" cellpadding="2" border="0" class="dnnFormItem"
    runat="server">
    <tr>
        <td style="width: 250px">
            <dnn:label ID="plShowRelatedVideo" runat="server" ControlName="chkShowRelatedVideo">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowRelatedVideo" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plShowRelatedVideoImage" runat="server" ControlName="chkShowRelatedVideoImage">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowRelatedVideoImage" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRelatedVideoRow" runat="server" ControlName="txtRelatedVideoRow">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRelatedVideoRow" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator5" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRelatedVideoRow"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRelatedVideoColumn" runat="server" ControlName="txtRelatedVideoColumn">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRelatedVideoColumn" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator10" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRelatedVideoColumn"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secWatchHistory" runat="server" Section="tblWatchHistory" ResourceKey="secWatchHistory"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblWatchHistory" cellspacing="0" cellpadding="2" border="0" class="dnnFormItem"
    runat="server">
    <tr>
        <td style="width: 250px">
            <dnn:label ID="plShowWatchHistory" runat="server" ControlName="chkShowWatchHistory">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowWatchHistory" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plWatchHistoryCount" runat="server" ControlName="txtWatchHistoryCount">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtWatchHistoryCount" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator8" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtWatchHistoryCount"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<dnn:sectionhead ID="secRelatedImage" runat="server" Section="tblRelatedImage" ResourceKey="secRelatedImage"
    IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:sectionhead>
<table id="tblRelatedImage" cellspacing="0" cellpadding="2" border="0" class="dnnFormItem"
    runat="server">
    <tr>
        <td style="width: 250px">
            <dnn:label ID="plShowRelatedImage" runat="server" ControlName="chkShowRelatedImage">
            </dnn:label>
        </td>
        <td>
            <asp:CheckBox ID="chkShowRelatedImage" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRelatedImagePerRow" runat="server" ControlName="txtRelatedImagePerRow">
            </dnn:label>
        </td>
        <td>
            <asp:TextBox ID="txtRelatedImagePerRow" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator9" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRelatedImagePerRow"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label ID="plRelatedImageWidth" runat="server" ControlName="txtRelatedImageWidth" />
        </td>
        <td>
            <asp:TextBox ID="txtRelatedImageWidth" runat="server" Columns="6"></asp:TextBox>
            <asp:RegularExpressionValidator ID="Regularexpressionvalidator11" resourcekey="MustBeInteger"
                runat="server" ValidationExpression="\d*" ControlToValidate="txtRelatedImageWidth"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<p align="center">
    <asp:LinkButton CssClass="dnnPrimaryAction" ID="cmdUpdate" OnClick="cmdUpdate_Click"
        resourcekey="cmdUpdate" runat="server" BorderStyle="none" Text="Update"></asp:LinkButton>&nbsp;
    <asp:HyperLink runat="server" ID="hlCancel" ResourceKey="cmdReturn" CssClass="dnnSecondaryAction"
        NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
</p>
