<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Author, App_Web_author_standard.ascx.2987f3ef" %>
<asp:DataList ID="dlAuthor" runat="server"  CssClass="Normal" RepeatColumns="<%#Settings_Author.General.ColCount %>" >
    <ItemTemplate>
        <table width="100%" border="0" cellpadding="0" cellspacing="1">
            <tr align="left" valign="top">
                <td align="left" valign="top"  style="white-space:nowrap">
                 <%if (Settings_Author.General.DisplayAvatar)
                      { %>
                    <asp:Image ID="imgAvatar" runat="server"  ImageUrl='<%#GetGravatarUrl(Eval("AvatarEmail").ToString(),"32") %>' ImageAlign="AbsMiddle"></asp:Image>
                    <%}%>   
                        
                    <%if (Settings_Author.General.DisplayVideoCounts)
                      { %>
                    <asp:HyperLink  ID="lnkName" runat="server" Text='<%# Convert.ToString(Eval("DisplayName")) +"(" +Convert.ToString(Eval("VideoCounts"))+")" %>'
                        Target="<%# Settings_Author.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("UserId"))) %>' />
                    <%}
                      else
                      { %>
                    <asp:HyperLink  ID="HyperLink1" runat="server" Text='<%# Convert.ToString(Eval("DisplayName")) %>'
                        Target="<%# Settings_Author.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("UserId"))) %>' />
                    <%} %>               
                    <asp:HyperLink  ID="lnkRss"  ImageUrl="~/desktopmodules/CrossVideo/Images/feed-icon-12x12.gif" runat="server" Visible="<%#Settings_Author.General.DisplayRss %>"
                        Target="_blank" NavigateUrl='<%#GetRssUrl(Convert.ToString(Eval("UserId"))) %>' />
                  
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>