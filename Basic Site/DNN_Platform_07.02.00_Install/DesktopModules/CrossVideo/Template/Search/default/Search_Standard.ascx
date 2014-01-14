<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Search, App_Web_search_standard.ascx.f4282089" %>
<asp:DropDownList ID="ddlCategory" runat="server" Width='<%#Convert.ToInt32(Settings_Search.General.CategoryWidth)%>'
    Visible='<%#Settings_Search.General.ShowCategory%>' CssClass="NormalTextBox"
    DataTextField="Name" DataValueField="Id">
</asp:DropDownList>
<%#GetCategoryBreakString() %>
<asp:DropDownList ID="ddlAuthorList" runat="server" Width='<%#Convert.ToInt32(Settings_Search.General.AuthorListWidth)%>'
    Visible='<%#Settings_Search.General.ShowAuthorList%>' CssClass="NormalTextBox"
    DataTextField="UserName" DataValueField="UserId">
</asp:DropDownList>
<%#GetAuthorListBreakString() %>
<asp:TextBox ID="txtSearch" runat="server" CssClass="NormalTextBox" Width="<%#Convert.ToInt32(Settings_Search.General.InputWidth)%>"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" CssClass="Normal" Width="60px" CausesValidation="false"
    ResourceKey="Search" OnClick="btnSearch_Click"></asp:Button>
