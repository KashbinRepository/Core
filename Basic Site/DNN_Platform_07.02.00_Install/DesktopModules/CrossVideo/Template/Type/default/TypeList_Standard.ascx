<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.TypeList, App_Web_typelist_standard.ascx.b6adf3e5" %>

<asp:DataList ID="dlType" runat="server"  CssClass="Normal" RepeatColumns="<%#Settings_Type.General.ColCount %>" 
    RepeatDirection="Horizontal" RepeatLayout="table">
    <ItemTemplate>
        <table width="100%" border="0" cellpadding="0" cellspacing="1">
            <tr align="left">
                <td width="1%" align="left">
                    <asp:HyperLink ID="hlImage" runat="server" Visible='<%# Settings_Type.General.ShowImage %>'
                        NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' Target="<%# Settings_Type.General.Target%>">
                        <asp:Image runat="server" ImageUrl='<%#Eval("Thumbnail")%>' Width='<%#Convert.ToInt32(Settings_Type.General.ImageWidth)%>'
                            Visible='<%#Settings_Type.General.ShowImage%>' BorderStyle="Solid"
                            BorderWidth="1" BorderColor="DarkGray" ID='imgType' ImageAlign="Left" /></asp:HyperLink>
                </td>
            </tr>
            <tr align="left">
                <td align="left" valign="top">
                    <%if (Settings_Type.General.ShowVideoCounts){ %>
                      
                    <asp:HyperLink CssClass="Normal" ID="lnkName" runat="server" Text='<%# Convert.ToString(Eval("Name")) +"(" +Convert.ToString(Eval("VideoCounts"))+")" %>'
                        Target="<%# Settings_Type.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>'  />
                    <%}
                      else
                      { %>
                    <asp:HyperLink CssClass="Normal" ID="HyperLink1" runat="server" Text='<%# Convert.ToString(Eval("Name")) %>'
                        Target="<%# Settings_Type.General.Target%>" NavigateUrl='<%#GetNavigate(Convert.ToString(Eval("Id"))) %>' />
                    <%} %>
                    <asp:HyperLink CssClass="Normal" ID="lnkRss" ImageUrl="~/desktopmodules/CrossVideo/Images/feed-icon-12x12.gif"
                        runat="server" Visible="<%#Settings_Type.General.DisplayRss %>" Target="_blank"
                        NavigateUrl='<%#GetRssUrl(Convert.ToString(Eval("Id"))) %>' />
                </td>
            </tr>
         
        </table>
    </ItemTemplate>
</asp:DataList>
