<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.VideoList, App_Web_videolist_standard.ascx.6c1cb099" %>
<%@ Register TagPrefix="Cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<table width="100%" cellpadding="0" cellspacing="0"  runat="server" class="dnnFormItem"
    visible='<%# Settings_List.Content.ShowSearch %>'>
    <tr>
        <td>
            &nbsp; &nbsp;
            <asp:Label ID="lblSearchPrefix" runat="server" resourcekey="lblSearchPrefix" CssClass="Normal" />
            <asp:TextBox ID="txtSearch" runat="server"  MaxLength="30" Width="200px"
                Columns="30"></asp:TextBox>&nbsp;
            <asp:Label ID="lblSortBy" runat="server" resourcekey="lblSortBy" CssClass="Normal"
                Visible='<%# Settings_List.Content.ShowSortInSearch %>' />
            <asp:DropDownList ID="ddlSortField" runat="server" Visible='<%# Settings_List.Content.ShowSortInSearch %>' Width="150px">
                <asp:ListItem Value="Recent" resourcekey="li_SortField_Recent" />
                <asp:ListItem Value="Views" resourcekey="li_SortField_Views" />
                <asp:ListItem Value="Popular" resourcekey="li_SortField_Popular" />
                <asp:ListItem Value="Comment" resourcekey="li_SortField_Comment" />
                <asp:ListItem Value="RecommendUp" resourcekey="li_SortField_RecommendUp" />
                <asp:ListItem Value="Rating" resourcekey="li_SortField_Rating" />
            </asp:DropDownList>
            <asp:Button ID="btnSearch" runat="server" resourcekey="btnSearch" CssClass="CommandButton"  
                OnClick="btnSearch_Click"></asp:Button>&nbsp; &nbsp;
            <asp:Button ID="btnClear" runat="server" resourcekey="btnClear" CssClass="CommandButton"
                CausesValidation="False" OnClick="btnClear_Click"></asp:Button>
        </td>
    </tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <td valign="top" align="left" height="<%=GetHeight()%>">
            <% =GetMarqueeBegin()%>
            <asp:DataList ID="dlVideo" runat="server" CssClass="Normal" RepeatColumns="<%#Settings_List.Paging.ColCount %>"
                RepeatDirection="Horizontal" RepeatLayout="table" Width="100%" Visible="false"
                OnItemDataBound="dlVideo_ItemDataBound">
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                    <table width="100%" border="0" cellpadding="0" cellspacing="1">
                        <tr align="left">
                            <td width="1%" align="left">
                                <%if (Settings_List.Image.ShowImage && CurrentType.FieldEnable_Image)
                                  { %>
                                <asp:HyperLink ID="hlImage" runat="server" NavigateUrl='<%# GetNavigate(Convert.ToString(Eval("Id")),Convert.ToString(Eval("Title")))%>'
                                    Target="<%#Settings_List.General.LinkTarget%>" Title='<%#Convert.ToString(Eval("Title")) %>'>
                                    <%if (Settings_List.Image.ForceImageWidth && Settings_List.Image.ForceImageHeight)
                                      { %>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_List.Image.ImageWidth)%>'
                                        Height='<%#Convert.ToInt32(Settings_List.Image.ImageHeight)%>' BorderStyle="Solid"
                                        BorderWidth="1" BorderColor="DarkGray" ID='imgVideo' ImageAlign="Left" />
                                    <%}
                                      else if (Settings_List.Image.ForceImageWidth)
                                      {%>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_List.Image.ImageWidth)%>'
                                        BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                    <%}
                                      else if (Settings_List.Image.ForceImageHeight)
                                      {%>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_List.Image.ImageHeight)%>'
                                        BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                    <% }
                                      else
                                      {%>
                                    <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' BorderStyle="Solid" BorderWidth="1"
                                        BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
                                    <%} %>
                                </asp:HyperLink>
                                <%} %>
                            </td>
                       <%-- </tr>
                        <tr>--%>
                            <td align="left" valign="top">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Normal" align="left">
                                    <tr>
                                        <td>
                                            <%if (Settings_List.Content.ShowTitle)
                                              { %>
                                            <asp:Image ID="imgProtected" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/Protected.jpg"
                                                Visible='<%#Convert.ToBoolean(Eval("Protected")) %>' />
                                            <asp:Image ID="imgSocial" runat="server" ImageUrl="~/images/icon_securityroles_16px.gif"
                                                Visible='<%#Convert.ToString(Eval("ShareType"))=="3" %>' />
                                            <asp:HyperLink CssClass="Normal" ID="hlTitle" runat="server" Text='<%# Server.HtmlDecode(GetShortenTitle(Convert.ToString(Eval("Title")))) %>'
                                                NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")),Convert.ToString(Eval("Title"))) %>'
                                                Target="<%#Settings_List.General.LinkTarget%>" />
                                            <%} %>
                                            <%if (Settings_List.Content.ShowCreatedDate)
                                              { %>
                                         
                                            <%} %>
                                            <%if (Settings_List.Content.ShowRecommend)
                                              { %>
                                            <asp:Image ID="imgUp" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/up.gif" />
                                            <asp:Label ID="lblRecommendUp" runat="server" Text='<%# Eval("RecommendUp") %>' />&nbsp;
                                            <asp:Image ID="imgDown" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/down.gif" />
                                            <asp:Label ID="lblRecommendDown" runat="server" Text='<%# Eval("RecommendDown") %>' />&nbsp;
                                            <%} %>
                                        </td>
                                    </tr>
                                    <%if (Settings_List.Content.ShowUserName)
                                      { %>
                                    <tr>
                                        <td>
                                              <asp:Image ID="imgUser" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/Author.jpg" />
                                            <asp:HyperLink ID="hlUserNameData" runat="server" Text='<%# Eval("UserName") %>'
                                                NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>' Target="<%#Settings_List.General.LinkTarget%>" />
                                        </td>
                                    </tr>
                                    <%} %>
                                     <%if (Settings_List.Content.ShowCreatedDate)
                                      { %>
                                    <tr>
                                        <td>
                                             <asp:Label ID="lblCreatedDate" runat="server" resourcekey="lblCreatedDate" />
                                              <asp:Label ID="lblCreatedDateData" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString()%>' />
                                        </td>
                                    </tr>
                                    <%} %>
                                     <%if (Settings_List.Content.ShowDuration)
                                      { %>
                                    <tr>
                                        <td>
                                             <asp:Label ID="lblDuration" runat="server" resourcekey="lblDuration" />
                                             <asp:Label ID="lblDurationData" runat="server" Text='<%# Eval("Duration") %>' />
                                        </td>
                                    </tr>
                                    <%} %>
                                    <tr>
                                        <td>
                                         
                                            <%if (Settings_List.Content.ShowViews)
                                              { %>
                                             <asp:Image ID="imgViews" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/Views.jpg" />
                                            <asp:Label ID="lblViewsData" runat="server" Text='<%# Eval("Views") %>' />
                                            <%} %>
                                            <%if (Settings_List.Content.ShowComments)
                                              { %>
                                             <asp:Image ID="imgComment" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/Comment.jpg" />
                                            <asp:Label ID="lblCommentData" runat="server" Text='<%# Eval("CommentCount") %>' />
                                            <%} %>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <%if (Settings_List.Content.ShowAuthor && CurrentType.FieldEnable_Author)
                                              { %>
                                            <asp:Label ID="lblAuthor" runat="server" resourcekey="lblAuthor" />
                                            <asp:Label ID="lblAuthorData" runat="server" Text='<%# Eval("Author") %>' />&nbsp;&nbsp;
                                            <%} %>
                                            <%if (Settings_List.Content.ShowSource && CurrentType.FieldEnable_Source)
                                              { %>
                                            <asp:Label ID="lblSource" runat="server" resourcekey="lblSource" />
                                            <asp:Label ID="lblSourceData" runat="server" Text='<%# Eval("Source") %>' />
                                            <%} %>
                                        </td>
                                    </tr>
                                    <%if (Settings_List.Content.ShowRating)
                                      { %>
                                    <tr>
                                        <td>
                                            <asp:Image ID="imgRating" runat="server" ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>' />
                                        </td>
                                    </tr>
                                    <%} %>
                                    <%if (Settings_List.Content.ShowSummary && CurrentType.FieldEnable_Summary)
                                      { %>
                                    <tr>
                                        <td>
                                            &nbsp;&nbsp;<asp:Label ID="SummaryLabel" runat="server" Text='<%# GetShortenSummary(Convert.ToString(Eval("Id")),Convert.ToString(Eval("Summary"))) %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <%} %>
                                    <tr>
                                        <td>
                                            <table runat="server" id="tblUserDefinedField" width="100%" border="0" cellspacing="0"
                                                cellpadding="0" class="Normal" align="left">
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:GridView ID="grVideo" runat="server" AutoGenerateColumns="False" Visible="False"
                CssClass="Normal" CellPadding="4" AllowSorting="True" ForeColor="#333333" GridLines="Both"
                OnDataBinding="grVideo_DataBinding">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlImage" runat="server" Visible='<%#Settings_List.Image.ShowImage %>'
                                NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")),Convert.ToString(Eval("Title"))) %>'
                                Target="<%#Settings_List.General.LinkTarget%>"  Title='<%#Convert.ToString(Eval("Title")) %>'>
                                <%if (Settings_List.Image.ForceImageWidth && Settings_List.Image.ForceImageHeight)
                                  { %>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_List.Image.ImageWidth)%>'
                                    Height='<%#Convert.ToInt32(Settings_List.Image.ImageHeight)%>' Visible='<%#Settings_List.Image.ShowImage %>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='imgVideo' ImageAlign="Left" />
                                <%}
                                  else if (Settings_List.Image.ForceImageWidth)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_List.Image.ImageWidth)%>'
                                    Visible='<%#Settings_List.Image.ShowImage %>' BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image1' ImageAlign="Left" />
                                <%}
                                  else if (Settings_List.Image.ForceImageHeight)
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Height='<%#Convert.ToInt32(Settings_List.Image.ImageHeight)%>'
                                    Visible='<%#Settings_List.Image.ShowImage %>' BorderStyle="Solid" BorderWidth="1"
                                    BorderColor="DarkGray" ID='Image2' ImageAlign="Left" />
                                <% }
                                  else
                                  {%>
                                <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Visible='<%#Settings_List.Image.ShowImage %>'
                                    BorderStyle="Solid" BorderWidth="1" BorderColor="DarkGray" ID='Image3' ImageAlign="Left" />
                                <%} %>
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Recommend" >
                        <ItemTemplate>
                            <asp:Image ID="Image6" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/up.gif" />
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("RecommendUp") %>' />&nbsp;
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/down.gif" />
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("RecommendDown") %>' />&nbsp;
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Title" >
                        <HeaderTemplate>
                            <asp:Label ID="lblTitleHead" resourcekey="lblTitleHead" runat="server"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlTitle" runat="server" Text='<%# Server.HtmlDecode(GetShortenTitle(Convert.ToString(Eval("Title")))) %>'
                                NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id")),Convert.ToString(Eval("Title"))) %>'
                               Target="<%#Settings_List.General.LinkTarget%>"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UserName" >
                        <HeaderTemplate>
                            <asp:Label ID="lblUserNameHead" resourcekey="lblUserNameHead" runat="server"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlUserName" runat="server" Text='<%#Eval("UserName")%>' NavigateUrl='<%#GetUserNavigate(Convert.ToString(Eval("UserId"))) %>'
                                Target="<%#Settings_List.General.LinkTarget%>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Author" >
                        <HeaderTemplate>
                            <asp:Label ID="lblAuthorHead" resourcekey="lblAuthorHead" runat="server">Author</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="AuthorLabel" runat="server" Text='<%#Eval("Author")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Source" >
                        <HeaderTemplate>
                            <asp:Label ID="lblSourceHead" resourcekey="lblSourceHead" runat="server">Source</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="SourceLabel" runat="server" Text='<%#Eval("Source")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rating"  >
                        <HeaderTemplate>
                            <asp:Label ID="lblRatingHead" resourcekey="lblRatingHead" runat="server"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Image ID="imgRating" runat="server" Visible="<%#Settings_List.Content.ShowRating %>"
                                ImageUrl='<%#GetRatingImage(Convert.ToString(Eval("Id"))) %>'></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Featured"  >
                        <HeaderTemplate>
                            <asp:Label ID="lblFeaturedHead" resourcekey="lblFeaturedHead" runat="server">Featured</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkFeatured" runat="server" Checked='<%#Convert.ToBoolean(Eval("Featured")) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Summary"  >
                        <HeaderTemplate>
                            <asp:Label ID="lblSummaryHead" resourcekey="lblSummaryHead" runat="server">Summary</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            &nbsp;&nbsp;<asp:Label ID="SummaryLabel" runat="server" Text='<%# GetShortenSummary(Convert.ToString(Eval("Id")),Convert.ToString(Eval("Summary")))%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CreatedDate"  >
                        <HeaderTemplate>
                            <asp:Label ID="lblCreatedDateHead" resourcekey="lblCreatedDateHead" runat="server">Created Date</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CreatedDateLabel" runat="server" Text='<%# Convert.ToDateTime( Eval("CreatedDate")).ToShortDateString() %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Duration" >
                        <HeaderTemplate>
                            <asp:Label ID="lblDurationHead" resourcekey="lblDurationHead" runat="server">Duration</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="DurationLabel" runat="server" Text='<%#Eval("Duration")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Views" >
                        <HeaderTemplate>
                            <asp:Label ID="lblViewsHead" resourcekey="lblViewsHead" runat="server">Views</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="ViewsLabel" runat="server" Text='<%# Eval("Views") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Comments" >
                        <HeaderTemplate>
                            <asp:Label ID="lblCommentsHead" resourcekey="lblCommentsHead" runat="server">Comments</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CommentsLabel" runat="server" Text='<%#Eval("CommentCount")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"   />
                <EditRowStyle BackColor="#999999" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"   HorizontalAlign="Center"/>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <%=GetMarqueeEnd()%>
        </td>
    </tr>
    <tr>
        <td align="right" colspan="2">
            <asp:HyperLink ID="hlRss" Visible="<%#Settings_List.Rss.DisplayRss %>" runat="server"
                ImageUrl="~/DesktopModules/CrossVideo/Images/feed-icon-12x12.gif" CssClass="NormalBold"
                Target="_blank"></asp:HyperLink>
            <asp:HyperLink ID="hlMoreVideos" Visible="<%#Settings_List.MoreVideo.ShowMoreVideos %>"
                runat="server" resourcekey="MoreVideos" Text="More Videos..." CssClass="NormalBold"></asp:HyperLink>
        </td>
    </tr>
</table>
<table width="100%" cellpadding="1" cellspacing="1" runat="server" id="tblPaging"
    visible="false">
    <tr valign="top">
        <td width="100%">
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr valign="top">
        <td>
            <Cross:PagingControl ID="ctlPagingControl" runat="server" OnPageChanged="ctlPagingControl_PageChanged"
                Mode="PostBack"></Cross:PagingControl>
        </td>
    </tr>
</table>
