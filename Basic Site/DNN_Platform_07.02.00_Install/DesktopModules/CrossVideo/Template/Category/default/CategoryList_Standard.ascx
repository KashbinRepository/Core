<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.CategoryList, App_Web_categorylist_standard.ascx.58314bdb" %>
<asp:TreeView ID="tvCategory" runat="server" NodeIndent="10" PathSeparator="/" ExpandDepth="0"
    OnSelectedNodeChanged="tvCategory_SelectedNodeChanged">
    <ParentNodeStyle Font-Bold="False" />
    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
        VerticalPadding="0px" />
    <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
        NodeSpacing="0px" VerticalPadding="2px" />
</asp:TreeView>
<asp:DataList ID="dlCategory" runat="server" Visible="true" CssClass="Normal" RepeatColumns="<%#Settings_Category.General.CategoryColCount %>" 
    RepeatDirection="Horizontal" RepeatLayout="table">
    <ItemTemplate>
        <table width="100%" border="0" cellpadding="0" cellspacing="1">
            <tr align="left">
                <td width="1%" align="left">
                    <asp:HyperLink ID="hlImage" runat="server" Visible='<%# Settings_Category.General.ShowCategoryImage %>'
                        NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' Target="<%# Settings_Category.General.Target%>">
                        <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_Category.General.CategoryImageWidth)%>'
                            Visible='<%#Settings_Category.General.ShowCategoryImage%>' BorderStyle="Solid"
                            BorderWidth="1" BorderColor="DarkGray" ID='imgCategory' ImageAlign="Left" /></asp:HyperLink>
                </td>
            </tr>
            <tr align="left">
                <td align="left" valign="top">
                    <%if (Settings_Category.General.ShowVideoCount){ %>
                      
                    <asp:HyperLink CssClass="Normal" ID="lnkName" runat="server" Text='<%# Convert.ToString(Eval("Name")) +"(" +Convert.ToString(Eval("VideoCounts"))+")" %>'
                        Target="<%# Settings_Category.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>'  />
                    <%}
                      else
                      { %>
                    <asp:HyperLink CssClass="Normal" ID="HyperLink1" runat="server" Text='<%# Convert.ToString(Eval("Name")) %>'
                        Target="<%# Settings_Category.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' />
                    <%} %>
                    <asp:HyperLink CssClass="Normal" ID="lnkRss" ImageUrl="~/desktopmodules/CrossVideo/Images/feed-icon-12x12.gif"
                        runat="server" Visible="<%#Settings_Category.General.DisplayRss %>" Target="_blank"
                        NavigateUrl='<%#GetRssUrl(Convert.ToString(Eval("Id"))) %>' />
                </td>
            </tr>
            <%if (Settings_Category.General.ShowCategoryDescription)
              { %>
            <tr align="left">
                <td align="left" valign="top">
                    <asp:Label CssClass="Normal" runat="server" Text='<%#Convert.ToString(Eval("Description"))%>' />
                </td>
            </tr>
            <%}%>
        </table>
    </ItemTemplate>
</asp:DataList>
