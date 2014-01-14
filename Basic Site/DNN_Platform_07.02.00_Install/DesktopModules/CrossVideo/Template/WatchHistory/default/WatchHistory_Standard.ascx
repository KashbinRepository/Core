<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.WatchHistory, App_Web_watchhistory_standard.ascx.222ed5f4" %>
<asp:Label ID="lblTip" runat="server" CssClass="SubHead" />
<asp:DataList ID="dlHistory" runat="server" CssClass="Normal" RepeatColumns="<%#Settings_History.General.ColCount %>"
    RepeatDirection="Horizontal" RepeatLayout="table">
    <ItemTemplate>
        <asp:HyperLink CssClass="Normal" ID="hlTitle" runat="server" Text='<%# Convert.ToString(Eval("VideoTitle")) %>'
            NavigateUrl='<%#GetVideoUrl(Convert.ToString(Eval("VideoId")),Convert.ToString(Eval("VideoTitle"))) %>' />
    </ItemTemplate>
</asp:DataList>
