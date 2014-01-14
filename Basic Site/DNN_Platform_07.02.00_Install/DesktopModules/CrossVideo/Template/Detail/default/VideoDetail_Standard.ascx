<%@ control language="C#" autoeventwireup="true" enableviewstate="true" inherits="Cross.Modules.Video.View.VideoDetail, App_Web_videodetail_standard.ascx.224e1302" %>
<%@ Register TagPrefix="Cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<script type="text/javascript">
    function addFavorite(url, title) {
        if (document.all) {
            window.external.addFavorite(url, title);
        }
        else if (window.sidebar) {
            window.sidebar.addPanel(title, url, "");
        }
    }
    function initializeMap() {
        var showGoogleMap = '<%=ShowGoogleMap%>';
        if (showGoogleMap.toLowerCase() != "true") {
            return;
        }
        // initlize google map options
        var latlng = new google.maps.LatLng(parseFloat('<%=objVideo.Latitude%>'), parseFloat('<%=objVideo.Longitude%>'));

        var myOptions = {
            zoom: parseInt('<%=Settings_Detail.GoogleMap.GoogleMapZoom%>'),
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map($('#divGoogleMap')[0], myOptions);

        var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            title: "<%=string.IsNullOrEmpty(objVideo.MapTitle)?objVideo.Title:objVideo.MapTitle%>"
        });
        return map;
    }

    function recommendUp() {
        $.get('<%=FullDomainName+"/desktopmodules/CrossVideo/Detail_Recommend.aspx" %>',
          { VideoId: '<%=VideoId.ToString() %>', SerialId: '<%=objVideoToPlay.Id.ToString()%>', UserId: '<%=UserId.ToString() %>', Recommend: '1' },
          function (data) {
              if (data != '-1') {
                  $("#<%= lblUpVotes.ClientID %>").text(data.split(',')[0]);
                  $("#<%= lblDownVotes.ClientID %>").text(data.split(',')[1]);
              }
          }
          );
    }
    function recommendDown() {
        $.get('<%=FullDomainName+"/desktopmodules/CrossVideo/Detail_Recommend.aspx" %>',
          { VideoId: '<%=VideoId.ToString() %>', SerialId: '<%=objVideoToPlay.Id.ToString()%>', UserId: '<%=UserId.ToString() %>', Recommend: '-1' },
          function (data) {
              if (data != '-1') {
                  $("#<%= lblUpVotes.ClientID %>").text(data.split(',')[0]);
                  $("#<%= lblDownVotes.ClientID %>").text(data.split(',')[1]);
              }
          }
          );
    }
    $(function () {
        initializeMap();
        var tabsCounts = '<%=TabCounts%>';
        //only display jquery tabs when currently have more than 1 tabs to show
        if (parseInt(tabsCounts) > 1) {
            // using jquery tabs to show detail information
            $("#tabs").tabs();
            var currTab = $("#<%= hidLastTab.ClientID %>").val();
            if (!isNaN(parseInt(currTab)))//if current value is number, try parse it as integer
            {
                currTab = parseInt(currTab);
            }
            $("#tabs").tabs({ selected: currTab });

            //Switch google map display
            var map = null;
            var showGoogleMap = '<%=ShowGoogleMap%>';
            $('#tabs').bind('tabsshow', function (event, ui) {
                if (ui.panel.id == 'divGoogleMap' && !map && showGoogleMap.toLowerCase() == "true") {
                    map = initializeMap();
                    google.maps.event.trigger(map, 'resize');
                }
            });
        }
        var showRelatedImages = '<%=ShowRelatedImage%>';
        //using fancy box plug-in to display related images as gallery when ShowRelatedImage==true
        if (showRelatedImages.toLowerCase() == "true") {
            $("a[rel=group_relatedimage]").fancybox({
                'transitionIn': 'none',
                'transitionOut': 'none',
                'titlePosition': 'over',
                'titleFormat': function (title, currentArray, currentIndex, currentOpts) {
                    return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
                }
            });
        }
        //using fancy box plug-in to display add ticket/post comment/post rating/add play list...inline
        $("#<%= hlAddTicket.ClientID %>").fancybox({
            'width': '90%',
            'height': '70%',
            'autoScale': true,
            'transitionIn': 'none',
            'transitionOut': 'none',
            'type': 'iframe'
        });
        $("#<%= hlReportAbuse.ClientID %>").fancybox({
            'width': '90%',
            'height': '80%',
            'autoScale': true,
            'transitionIn': 'none',
            'transitionOut': 'none',
            'type': 'iframe'
        });

        $("#<%= hlAddToPlayList.ClientID %>").fancybox({
            'width': '90%',
            'height': '70%',
            'autoScale': true,
            'transitionIn': 'none',
            'transitionOut': 'none',
            'type': 'iframe'
        });

        $("#<%= hlPostComment.ClientID %>").fancybox({
            'width': '90%',
            'height': '90%',
            'autoScale': true,
            'transitionIn': 'none',
            'transitionOut': 'none',
            'type': 'iframe'
        });

        $("#<%= hlPostRating.ClientID %>").fancybox({
            'width': '90%',
            'height': '70%',
            'autoScale': true,
            'transitionIn': 'none',
            'transitionOut': 'none',
            'type': 'iframe'
        });
    });

    
</script>
<asp:HiddenField runat="server" ID="hidLastTab" Value="0" />
<!--     Video title ,print,add favorite,return ,download-->
<table cellspacing="2" cellpadding="2" width="100%" class="Normal">
    <tr valign="top">
        <td align="left">
            <asp:Label ID="lblTitle" runat="server" CssClass="Head" Text="<%#VideoTitle%>" Visible='<%#Settings_Detail.General.ShowTitle%>' />
        </td>
        <td align="right">
            <!--     add ticket  -->
            <%if (Settings_Detail.General.ShowAddTicket)  { %>
            <asp:HyperLink ID="hlAddTicket" runat="server" class="thickbox" NavigateUrl='<%#FullDomainName+"/desktopmodules/CrossVideo/Detail_AddTicket.aspx?VideoId="+VideoId.ToString()+"&SerialId="+objVideoToPlay.Id.ToString()+"&UserId="+UserId.ToString() %>'>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/action_help.gif" />
                <asp:Label ID="lblAddTicket" runat="server" resourcekey="lblAddTicket" />
            </asp:HyperLink>
            <%} %>
            <!--     report abuse  -->
            <%if (Settings_Detail.General.ShowReportAbuse)  { %>
            &nbsp;
            <asp:HyperLink ID="hlReportAbuse" runat="server" class="thickbox" NavigateUrl='<%#FullDomainName+"/desktopmodules/CrossVideo/Detail_ReportAbuse.aspx?VideoId="+VideoId.ToString()+"&SerialId="+objVideoToPlay.Id.ToString()+"&UserId="+UserId.ToString()
                    %>'>
                <asp:Image ID="Image4" runat="server" ImageUrl="~/desktopmodules/CrossVideo/images/report.png" />
                <asp:Label ID="lblReportAbuse" runat="server" resourcekey="lblReportAbuse" />
            </asp:HyperLink>
            <%} %>
            <!--     add watch  -->
            <%if (Settings_Detail.General.ShowAddWatch) { %>
            &nbsp;
            <asp:HyperLink ID="hlAddToPlayList" runat="server" class="thickbox" NavigateUrl='<%#FullDomainName+"/desktopmodules/CrossVideo/Detail_AddToPlayList.aspx?VideoId="+VideoId.ToString()+"&SerialId="+objVideoToPlay.Id.ToString()+"&UserId="+UserId.ToString()
                    %>'>
                <asp:Image ID="Image5" runat="server" ImageUrl="~/desktopmodules/CrossVideo/images/Trackback.png" />
                <asp:Label ID="lblAddToPlayList" runat="server" resourcekey="lblAddToPlayList" />
            </asp:HyperLink>
            <%} %>
            <!--     download  -->
            <%if (Settings_Detail.General.ShowDownload && objVideoToPlay.UrlMode.ToUpper() == "F")
                           { %>
            &nbsp;
            <asp:HyperLink ID="hlDownload" runat="server" Target="_blank" NavigateUrl='<%#objVideoToPlay.VideoPath%>'>
                <asp:Image ID="Image6" runat="server" ImageUrl="~/desktopmodules/CrossVideo/images/download.gif" />
                <asp:Label ID="lblDownload" runat="server" resourcekey="lblDownload" />
            </asp:HyperLink>
            <%} %>
            <!-- print -->
            <%if (Settings_Detail.General.ShowPrint)
              { %>
            &nbsp; <a href="#" onclick="javascript:window.print();return false;" style="cursor: hand"
                class="Normal">
                <asp:Image ID="imgPrint" runat="server" ImageUrl="~/images/print.gif" />
                <asp:Label ID="lblPrint" runat="server" resourcekey="lblPrint" />
            </a>
            <%} %>
            <!-- add favorite -->
            <%if (Settings_Detail.General.ShowAddFavorite)
              { %>
            &nbsp;&nbsp;
            <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/AddFavorite.gif" />
            <a style="cursor: hand" class='Normal' href="javascript:addFavorite('<%=Request.Url.AbsoluteUri%>','<%=BasePage.Title%>');">
                <asp:Label ID="lblAddFavorite" runat="server" resourcekey="lblAddFavorite" />
            </a>
            <%} %>
            <!-- return  -->
            <%if (Settings_Detail.General.ShowReturn)
              { %>
            <script type="text/javascript">
                if (document.referrer) {
                    var localeReturn = '<%=DotNetNuke.UI.Utilities.ClientAPI.GetSafeJSString(Localization.GetString("Return", LocalResourceFile))%>';
                    var str = document.referrer;
                    str = '&nbsp;&nbsp;&nbsp;&nbsp;<a href="' + str + '">' + localeReturn + '</a>';
                    document.write(str);
                }
            </script>
            <%} %>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr style="border: 1px dotted #999999; size: 2" />
        </td>
    </tr>
</table>
<!--   video player,video infor  -->
<table cellspacing="2" cellpadding="2" width="100%" class="Normal">
    <!--     video player  -->
    <tr>
        <td>
            <div id="divPassword" runat="server">
                <asp:Label ID="lblPassword" runat="server" resourcekey="lblPassword" />
                <asp:TextBox ID="txtPassword" runat="server" Columns="20" />&nbsp;
                <asp:Button ID="btnPassword" runat="server" resourcekey="btnPassword" CssClass="CommandButton"
                    OnClick="btnPassword_Click" />
                <asp:Label ID="lblInvalidPassword" runat="server" resourcekey="lblInvalidPassword"
                    CssClass="NormalRed" Visible="false" />
            </div>
            <div id="divVideoContent" runat="server">
            </div>
            <asp:Literal ID="litVideo" runat="server" Text='<%#VideoContent %>' />
        </td>
        <td valign="top">
            <!-- video infor  -->
            <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                <!--     serial list -->
                <%if (objVideo.VideoType == 1){%>
                <tr>
                    <td colspan="2">
                        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lblSerialList" ResourceKey="lblSerialList" CssClass="SubHead" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <hr style="border: 1px dotted #999999; size: 2" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DataList ID="dlSerialList" runat="server" RepeatColumns="1" Width="100%">
                                        <ItemTemplate>
                                            <asp:HyperLink CssClass="Normal" ID="hlTitle" runat="server" Text='<%# Convert.ToString(Eval("Title")) +".."+ Convert.ToString( Eval("Duration")) %>'
                                                NavigateUrl='<%#GetSerialUrl(Convert.ToString(Eval("Id"))) %>' />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%} %>
                <!--     watch history -->
                <%if (Settings_Detail.WatchHistory.ShowWatchHistory)
              {%>
                <tr>
                    <td colspan="2">
                        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lblWatchHistory" ResourceKey="lblWatchHistory" CssClass="SubHead" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <hr style="border: 1px dotted #999999; size: 2" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblLogin" runat="server" ResourceKey="lblLogin" Visible="false" />
                                    <asp:DataList ID="dlWatchHistory" runat="server" RepeatColumns="1" Width="100%">
                                        <ItemTemplate>
                                            <asp:HyperLink CssClass="Normal" ID="hlTitle" runat="server" Text='<%# Convert.ToString(Eval("VideoTitle")) %>'
                                                NavigateUrl='<%#GetVideoUrl(Convert.ToString(Eval("VideoId")),Convert.ToString(Eval("VideoTitle"))) %>' />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%} %>
                <tr>
                    <td colspan="2">
                        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lblVideoInfo" ResourceKey="lblVideoInfo" CssClass="SubHead" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <hr style="border: 1px dotted #999999; size: 2" />
                                </td>
                            </tr>
                            <tr runat="server" visible='<%#Settings_Detail.General.ShowUserName %>'>
                                <td colspan="2">
                                    <!-- Creator -->
                                    <asp:Label ID="lblCreator" ResourceKey="lblCreator" runat="server" />
                                    <!-- user avatar-->
                                    <asp:Image ID="imgAuthorAvatar" runat="server" ImageUrl='<%#GetGravatarUrl(objAuthor.AvatarEmail,"32") %>'
                                        Visible="<%#Settings_Detail.General.ShowAuthorAvatar %>" ImageAlign="AbsMiddle">
                                    </asp:Image>
                                    <!-- user name-->
                                    <asp:HyperLink ID="hlUserName" runat="server" Text="<%#objVideo.UserName%>" NavigateUrl='<%#GetUserNavigate(objVideo.UserId.ToString()) %>'
                                        Target="_blank" />
                                </td>
                            </tr>
                            <!-- views and recommend -->
                            <tr runat="server" visible='<%#Settings_Detail.General.ShowViews || (Settings_Portal.Recommend.AllowRecommend && objVideo.AllowRecommend) %>'>
                                <td colspan="2">
                                    <!-- views -->
                                    <%if (Settings_Detail.General.ShowViews)
                                      {%>
                                    <asp:Label ID="lblViews" runat="server" resourcekey="lblViews" />
                                    <asp:Label ID="lblViewsField" runat="server" Text="<%#objVideoToPlay.Views %>" />
                                    <%} %>
                                    <!-- recommend -->
                                    <%if (Settings_Portal.Recommend.AllowRecommend && objVideo.AllowRecommend)
                                      {%>
                                    &nbsp;&nbsp;<asp:Label ID="lblUpVote" runat="server" resourcekey="lblUpVote" />
                                    <asp:Label ID="lblUpVotes" runat="server" />
                                    <asp:ImageButton ID="ibtnUp" runat="server" resourcekey="ibtnUp" CssClass="CommandButton"
                                        CausesValidation="false" AlternateText="Rate it up" ToolTip="Rete it up" ImageUrl="~/DesktopModules/CrossVideo/images/Up.gif"
                                        OnClientClick="recommendUp();return false" />
                                    <asp:Label ID="lblDownVote" runat="server" resourcekey="lblDownVote" />
                                    <asp:Label ID="lblDownVotes" runat="server" />
                                    <asp:ImageButton ID="ibtngDown" runat="server" resourcekey="ibtnDown" CssClass="CommandButton"
                                        CausesValidation="false" ImageUrl="~/DesktopModules/CrossVideo/images/Down.gif"
                                        OnClientClick="recommendDown();return false" />
                                    <asp:Label ID="lblRecommendNeedLoggedIn" resourcekey="lblRecommendNeedLoggedIn" ForeColor="red"
                                        runat="server" Visible="False"></asp:Label>
                                    <%} %>
                                </td>
                            </tr>
                            <!-- comments and rating -->
                            <tr runat="server" visible='<%#Settings_Detail.General.ShowComment || Settings_Detail.General.ShowRating %>'>
                                <td colspan="2">
                                    <!-- comments -->
                                    <%if (Settings_Detail.General.ShowComment)
                                      {%>
                                    <asp:Label ID="lblCommentCount" runat="server" resourcekey="lblCommentCount" />
                                    <asp:Label ID="lblCommentCountField" runat="server" Text="<%#objVideoToPlay.CommentCount %>" />
                                    <%} %>
                                    <!-- rating -->
                                    <%if (Settings_Detail.General.ShowRating)
                                      {%>
                                    &nbsp;&nbsp;<asp:Label ID="lblRatingAverage" runat="server" resourcekey="lblRatingAverage" />
                                    <asp:Label ID="lblRatingAverageField" runat="server" Text="<%#objVideoToPlay.RatingAverage %>" />
                                    <%} %>
                                </td>
                            </tr>
                            <!-- date -->
                            <tr runat="server" visible='<%#Settings_Detail.General.ShowCreatedDate %>'>
                                <td colspan="2">
                                    <asp:Label ID="lblCreateDate" ResourceKey="lblCreateDate" runat="server" />
                                    <asp:Label ID="lblCreateDateField" runat="server" Text="<%#objVideo.CreatedDate.ToString()%>" />
                                </td>
                            </tr>
                            <!-- author -->
                            <tr runat="server" visible='<%#Settings_Detail.General.ShowAuthor && objVideo.Author.Trim() != "" && objType.FieldEnable_Author %>'>
                                <td colspan="2">
                                    <asp:Label ID="lblAuthor" ResourceKey="lblAuthor" runat="server" />
                                    <asp:Label ID="lblAuthorField" runat="server" Text="<%#objVideo.Author%>" />
                                </td>
                            </tr>
                            <!-- source -->
                            <tr runat="server" visible='<%#Settings_Detail.General.ShowSource && objVideo.Source.Trim() != "" && objType.FieldEnable_Source %>'>
                                <td colspan="2">
                                    <asp:Label ID="lblSource" runat="server" ResourceKey="lblSource" />
                                    <asp:Label ID="lblSourceField" runat="server" Text="<%#objVideo.Source%>" />
                                </td>
                            </tr>
                            <!--  customized attributes  -->
                            <tr>
                                <td colspan="2">
                                    <table runat="server" id="tblUserDefinedField" border="0" cellspacing="0" cellpadding="0"
                                        class="Normal" align="left">
                                    </table>
                                </td>
                            </tr>
                            <!--  Summary  -->
                            <tr runat="server" visible="<%#Settings_Detail.General.ShowSummary && objType.FieldEnable_Summary&&!string.IsNullOrEmpty(objVideo.Summary.Trim()) %>">
                                <td colspan="2">
                                    <br />
                                    &nbsp;&nbsp;<%#objVideo.Summary.ToString().Replace(Microsoft.VisualBasic.Constants.vbCrLf, "<br/>")%>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr style="border: 1px dotted #999999; size: 2" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!--  tags  -->
                <%if (Settings_Detail.General.ShowTags)
                  { %>
                <tr>
                    <td style="width: 10%">
                        <asp:Label ID="lblTags" runat="server" resourcekey="lblTags" />
                    </td>
                    <td style="width: 90%">
                        <asp:DataList ID="dlTags" runat="server" RepeatColumns="<%#Settings_Detail.General.TagsPerRow%>"
                            Width="100%">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlTag" runat="server" NavigateUrl='<%#GetTagNavigate(Convert.ToString(Eval("TagId")))%>'
                                    Target="_blank" Text='<%#Convert.ToString(Eval("Tag")) %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
                <%} %>
                <!--   social bookmarks -->
                <tr>
                    <td colspan="2">
                        <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                            <tr>
                                <td id="ShareBadgePRO_Toolbar">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!-- tabs -->
<table cellspacing="2" cellpadding="2" width="100%" class="Normal">
    <tr>
        <td>
            <div id="tabs" style="width: 100%; overflow: auto">
                <ul>
                    <li runat="server" visible='<%#Settings_Detail.General.ShowDescription&& objType.FieldEnable_Description&&!string.IsNullOrEmpty(objVideo.Description.Trim()) %>'>
                        <a href="#divDescription"><span>
                            <%#Localization.GetString("tabDescription",LocalResourceFile)%></span></a>
                    </li>
                    <li runat="server" visible='<%#Settings_Detail.General.ShowField1&&objType.FieldEnable_Field1&&!string.IsNullOrEmpty(objVideo.Field1.Trim()) %>'>
                        <a href="#divField1"><span>
                            <%#objType.Field1Title%></span></a> </li>
                    <li runat="server" visible='<%#Settings_Detail.General.ShowField2&&objType.FieldEnable_Field2&&!string.IsNullOrEmpty(objVideo.Field2.Trim()) %>'>
                        <a href="#divField2"><span>
                            <%#objType.Field2Title%></span></a> </li>
                    <li runat="server" visible='<%#Settings_Detail.General.ShowField3&&objType.FieldEnable_Field3&&!string.IsNullOrEmpty(objVideo.Field3.Trim()) %>'>
                        <a href="#divField3"><span>
                            <%#objType.Field3Title%></span></a> </li>
                    <li runat="server" visible='<%#Settings_Detail.General.ShowField4&&objType.FieldEnable_Field4&&!string.IsNullOrEmpty(objVideo.Field4.Trim()) %>'>
                        <a href="#divField4"><span>
                            <%#objType.Field4Title%></span></a> </li>
                    <li runat="server" visible='<%#Settings_Detail.General.ShowField5&&objType.FieldEnable_Field5&&!string.IsNullOrEmpty(objVideo.Field5.Trim()) %>'>
                        <a href="#divField5"><span>
                            <%#objType.Field5Title%></span></a> </li>
                    <li runat="server" visible='<%#ShowGoogleMap %>'><a href="#divGoogleMap"><span>
                        <%#Localization.GetString("tabGoogleMap",LocalResourceFile)%></span></a> </li>
                    <li runat="server" visible='<%#ShowAttachment %>'><a href="#divAttachment"><span>
                        <%#Localization.GetString("tabAttachment",LocalResourceFile)%></span></a> </li>
                    <li runat="server" visible='<%#ShowRelatedImage %>'><a href="#divRelatedImage"><span>
                        <%#Localization.GetString("tabRelatedImage",LocalResourceFile)%></span></a>
                    </li>
                    <li runat="server" visible='<%#Settings_Portal.Comment.AllowComment && objVideo.AllowComment&&Settings_Detail.General.ShowComment %>'>
                        <a href="#divComment"><span>
                            <%#Localization.GetString("tabComment",LocalResourceFile)%></span></a> </li>
                    <li runat="server" visible='<%#Settings_Portal.Rating.AllowRating && Settings_Detail.General.ShowRating &&   objVideo.AllowRating %>'>
                        <a href="#divRating"><span>
                            <%#Localization.GetString("tabRating",LocalResourceFile)%></span></a> </li>
                    <li runat="server" visible='<%#ShowRelatedVideo %>'><a href="#divRelatedVideo"><span>
                        <%#Localization.GetString("tabRelatedVideo",LocalResourceFile)%></span></a>
                    </li>
                    <li runat="server" visible='<%#Settings_Detail.General.ShowAuthorBiography&&!string.IsNullOrEmpty(objAuthor.Biography.Trim())%>'>
                        <a href="#divAboutAuthor"><span>
                            <%#Localization.GetString("tabAboutAuthor",LocalResourceFile)%></span></a>
                    </li>
                </ul>
                <!--  Description  -->
                <%if (Settings_Detail.General.ShowDescription && objType.FieldEnable_Description && !string.IsNullOrEmpty(objVideo.Description))
                  {%>
                <div id="divDescription" style="height: 100%">
                    <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                        <!--  Description  -->
                        <tr>
                            <td>
                                <br />
                                <%#Server.HtmlDecode(objVideo.Description)%>
                            </td>
                        </tr>
                    </table>
                </div>
                <%} %>
                <!--  Field1  -->
                <%if (Settings_Detail.General.ShowField1 && objType.FieldEnable_Field1 && !string.IsNullOrEmpty(objVideo.Field1.Trim()))
                  {%>
                <div id="divField1" style="height: 100%">
                    <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                        <tr align="left">
                            <td>
                                <%#Server.HtmlDecode(objVideo.Field1)%>
                            </td>
                        </tr>
                    </table>
                </div>
                <%} %>
                <!--  Field2  -->
                <%if (Settings_Detail.General.ShowField2 && objType.FieldEnable_Field2 && !string.IsNullOrEmpty(objVideo.Field2.Trim()))
                  {%>
                <div id="divField2" style="height: 100%">
                    <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                        <tr align="left">
                            <td>
                                <%#Server.HtmlDecode(objVideo.Field2)%>
                            </td>
                        </tr>
                    </table>
                </div>
                <%} %>
                <!--  Field3  -->
                <%if (Settings_Detail.General.ShowField3 && objType.FieldEnable_Field3 && !string.IsNullOrEmpty(objVideo.Field3.Trim()))
                  {%>
                <div id="divField3" style="height: 100%">
                    <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                        <tr align="left">
                            <td>
                                <%#Server.HtmlDecode(objVideo.Field3)%>
                            </td>
                        </tr>
                    </table>
                </div>
                <%} %>
                <!--  Field4  -->
                <%if (Settings_Detail.General.ShowField4 && objType.FieldEnable_Field4 && !string.IsNullOrEmpty(objVideo.Field4.Trim()))
                  {%>
                <div id="divField4" style="height: 100%">
                    <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                        <tr align="left">
                            <td>
                                <%#Server.HtmlDecode(objVideo.Field4)%>
                            </td>
                        </tr>
                    </table>
                </div>
                <%} %>
                <!--  Field5  -->
                <%if (Settings_Detail.General.ShowField5 && objType.FieldEnable_Field5 && !string.IsNullOrEmpty(objVideo.Field5.Trim()))
                  {%>
                <div id="divField5" style="height: 100%">
                    <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                        <tr align="left">
                            <td>
                                <%#Server.HtmlDecode(objVideo.Field5)%>
                            </td>
                        </tr>
                    </table>
                </div>
                <%} %>
                <!--  Google map  -->
                <%if (ShowGoogleMap)
                  {%>
                <div id="divGoogleMap" style="<%#Settings_Detail.GoogleMap.GoogleMapStyle%>">
                </div>
                <%} %>
                <!--  attachment  -->
                <%if (ShowAttachment)
                  {%>
                <div id="divAttachment" style="height: 100%">
                    <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                        <tr align="left">
                            <td>
                                <asp:Label ID="lblAttacmentNeedLoggedIn" resourcekey="lblAttacmentNeedLoggedIn" ForeColor="red"
                                    runat="server"></asp:Label>
                                <asp:DataList ID="dlAttachment" runat="server" Width="100%" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hlAttachment" runat="server" NavigateUrl='<%#Convert.ToString(Eval("FilePath"))%>'
                                            Target="_blank" Text='<%#Convert.ToString(Eval("FilePath")) %>'>
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                </div>
                <%} %>
                <!--  related Image  -->
                <%if (ShowRelatedImage)
                  {%>
                <div id="divRelatedImage">
                    <table cellspacing="2" cellpadding="2" width="100%" class="Normal" visible='false'>
                        <tr align="left">
                            <td>
                                <asp:DataList ID="dlRelatedImage" runat="server" Width="100%" ItemStyle-HorizontalAlign="Left"
                                    RepeatColumns='<%#Settings_Detail.RelatedImage.RelatedImagePerRow%>'>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td valign="top" align="left">
                                                    <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%#Eval("ImagePath")%>' Target="_blank"
                                                        rel="group_relatedimage" Title='<%#Convert.ToString(Eval("Title")) %>'>
                                                        <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                                            Width='<%#Settings_Detail.RelatedImage.RelatedImageWidth%>' BorderColor="DarkGray"
                                                            ID='Image3' ImageAlign="Left" />
                                                    </asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="center">
                                                    <asp:HyperLink ID="hlTitle" runat="server" Text='<%# Convert.ToString(Eval("Title")) %>'
                                                        Target="_blank" NavigateUrl='<%#Eval("ImagePath")%>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                </div>
                <%} %>
                <!--    comment information table  -->
                <%if (Settings_Portal.Comment.AllowComment && objVideo.AllowComment && Settings_Detail.General.ShowComment)
                  {%>
                <div id="divComment">
                    <table cellspacing="2" cellpadding="2" width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="lblCommentHead" resourcekey="lblCommentHead" runat="server" CssClass="SubHead" />
                                &nbsp;&nbsp;
                                <asp:HyperLink ID="hlPostComment" runat="server" class="thickbox" NavigateUrl='<%#FullDomainName+"/desktopmodules/CrossVideo/Detail_PostComment.aspx?VideoId="+VideoId.ToString()+"&SerialId="+objVideoToPlay.Id.ToString()+"&UserId="+UserId.ToString()
                    %>'>
                                    <asp:Image runat="server" ImageUrl="~/desktopmodules/CrossVideo/images/Comment.jpg" />
                                    <asp:Label ID="lblPostComment" runat="server" resourcekey="lblPostComment" />
                                </asp:HyperLink>
                                <asp:Label ID="lblCommentNeedLoggedIn" CssClass="Normal" resourcekey="lblCommentNeedLoggedIn"
                                    Visible="false" runat="server" ForeColor="red" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <hr style="border: 1px dotted #999999; size: 1" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:DataList ID="dlComments" runat="Server" Width="100%" CssClass="Normal" BackColor="White"
                                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <%# "By  " + Convert.ToString(DataBinder.Eval(Container.DataItem,"CreatedUser")) %>
                                                    <%# "    on  "+Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"CreatedDate")).ToShortDateString() +"<br/>" %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <%if (Settings_Detail.General.ShowCommentAvatar)
                                                      {%>
                                                    <asp:Image runat="server" Width="48" ID="imgUserGravatar" ImageUrl='<%#GetGravatarUrl(Eval("Mail").ToString(),"48") %>'
                                                        ImageAlign="AbsMiddle"></asp:Image>
                                                    <%} %>
                                                    <%# Eval("Comment").ToString().Replace(Microsoft.VisualBasic.Constants.vbCrLf, "<br/>")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <AlternatingItemStyle BackColor="#F7F7F7" />
                                    <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                </asp:DataList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <hr style="border: 1px dotted #999999; size: 1" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <Cross:PagingControl ID="ctlPagingControl" runat="server" OnPageChanged="ctlPagingControl_PageChanged"
                                    Mode="PostBack"></Cross:PagingControl>
                            </td>
                        </tr>
                    </table>
                </div>
                <% } %>
                <!--    comment information end  -->
                <!--   rating information  table -->
                <%if (Settings_Portal.Rating.AllowRating && Settings_Detail.General.ShowRating && objVideo.AllowRating)
                  {%>
                <div id="divRating" style="height: 100%">
                    <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                        <tr align="left">
                            <td colspan="2">
                                <asp:Label ID="lblRatingVotes" resourcekey="lblRatingVotes" runat="server" />
                                <asp:Label ID="lblVotes" runat="server" />&nbsp;&nbsp;
                                <asp:Label ID="lblAverage" resourcekey="lblAverage" runat="server" />&nbsp;&nbsp;
                                <asp:Image ID="imgAverage" runat="server" />&nbsp;&nbsp;
                                <asp:HyperLink ID="hlPostRating" runat="server" class="thickbox" NavigateUrl='<%#FullDomainName+"/desktopmodules/CrossVideo/Detail_PostRating.aspx?VideoId="+VideoId.ToString()+"&SerialId="+objVideoToPlay.Id.ToString()+"&UserId="+UserId.ToString()
                    %>'>
                                    <asp:Image ID="Image7" runat="server" ImageUrl="~/desktopmodules/CrossVideo/images/accept.png" />
                                    <asp:Label ID="lblPostRating" runat="server" resourcekey="lblPostRating" />
                                </asp:HyperLink>
                                <asp:Label ID="lblRatingNeedLoggedIn" resourcekey="lblRatingNeedLoggedIn" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <hr style="border: 1px dotted #999999; size: 1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:DataList ID="dlRating" runat="Server" Width="100%" BackColor="White" BorderColor="#E7E7FF"
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="lblClientName" runat="server" Text='<%#Eval("ClientName")%>' />
                                                </td>
                                                <td align="right">
                                                    <asp:Image runat="server" ImageUrl='<%#GetSingleRatingImage(Convert.ToInt32(Eval("Rating")))%>'
                                                        BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="lblUpdatedDate" runat="server" Text='<%#Convert.ToDateTime(Eval("UpdatedDate")).ToShortDateString()%>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="left" colspan="2">
                                                    &nbsp;&nbsp; &nbsp;&nbsp;<%#Eval("Info").ToString().Replace(Microsoft.VisualBasic.Constants.vbCrLf, "<br/>")%>
                                                </td>
                                            </tr>
                                            <blockquote>
                                                <tr>
                                                    <td valign="top" align="left" colspan="2">
                                                        <br />
                                                        <asp:Label ID="lblAuthorReply" runat="server" resourcekey="lblAuthorReply" />
                                                        <br />
                                                        &nbsp;&nbsp; &nbsp;&nbsp;<%#Eval("Reply").ToString().Replace(Microsoft.VisualBasic.Constants.vbCrLf, "<br/>")%>
                                                    </td>
                                                </tr>
                                            </blockquote>
                                        </table>
                                    </ItemTemplate>
                                    <AlternatingItemStyle BackColor="#F7F7F7" Wrap="true" />
                                    <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Wrap="true" />
                                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" Wrap="true" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                </asp:DataList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <hr style="border: 1px dotted #999999; size: 1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <Cross:PagingControl ID="ctlRating" runat="server" OnPageChanged="ctlRating_PageChanged"
                                    Mode="PostBack"></Cross:PagingControl>
                            </td>
                        </tr>
                    </table>
                </div>
                <% } %>
                <!--    rating information  end -->
                <!--     related videos -->
                <%if (ShowRelatedVideo)
                  {%>
                <div id="divRelatedVideo" style="height: 100%">
                    <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                        <tr>
                            <td>
                                <asp:DataList ID="dlRelatedVideo" runat="server" Width="100%" ItemStyle-HorizontalAlign="Left"
                                    RepeatColumns='<%#Settings_Detail.RelatedVideo.RelatedVideoColumn%>'>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td valign="top" align="left">
                                                    <asp:HyperLink ID="hlImage" runat="server" Title='<%#Convert.ToString(Eval("Title")) %>'
                                                        Visible='<%#Settings_Detail.RelatedVideo.ShowRelatedVideoImage%>' NavigateUrl='<%#GetVideoUrl(Convert.ToString(Eval("Id")),Convert.ToString(Eval("Title"))) %>'>
                                                        <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                                            Width='80' BorderColor="DarkGray" Height="60" ID='Image3' ImageAlign="Left" />
                                                    </asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="center">
                                                    <asp:HyperLink ID="hlTitle" runat="server" Text='<%# Convert.ToString(Eval("Title")) %>'
                                                        Title='<%# Convert.ToString(Eval("Title")) %>' NavigateUrl='<%#GetVideoUrl(Convert.ToString(Eval("Id")),Convert.ToString(Eval("Title"))) %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                </div>
                <%} %>
                <!--   about author -->
                <%if (Settings_Detail.General.ShowAuthorBiography && !string.IsNullOrEmpty(objAuthor.Biography.Trim()))
                  {%>
                <div id="divAboutAuthor" style="height: 100%">
                    <table cellspacing="2" cellpadding="2" width="100%" class="Normal">
                        <tr>
                            <td>
                                <%#Server.HtmlDecode(objAuthor.Biography)%>
                            </td>
                        </tr>
                    </table>
                </div>
                <%} %>
                <!--    about author  end -->
            </div>
        </td>
    </tr>
</table>
