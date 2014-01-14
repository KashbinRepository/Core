<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Author_Review, App_Web_author_review.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<table width="100%" class="dnnFormItem" align="center">
    <tr>
        <td align="left" runat="server" id="td_Search">
            <asp:Label ID="lblVideo" runat="server" resourcekey="lblVideo" />
            <asp:DropDownList ID="ddlVideo" runat="server" DataTextField="Text" DataValueField="Value" Width="400px"/>
            
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
            &nbsp;&nbsp; &nbsp;&nbsp;
            <dnn:CommandButton ID="btnSearch" runat="server" CausesValidation="false" ImageUrl="~/images/icon_search_16px.gif"
                ResourceKey="btnSearch" OnCommand="btnSearch_Click" />
        </td>
        <td align="center">
            <dnn:CommandButton ID="btnUpdate" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                OnCommand="btnUpdate_Click" Visible="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<table align="center" width="100%" class="dnnFormItem" id="tbl_List" runat="server">
    <tr>
        <td>
            <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" 
                Width="100%" CellPadding="1"  CellSpacing="1"  GridLines="None" BackColor="Gray" 
                ForeColor="#333333" DataKeyNames="Id" OnRowCommand="gvList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("NoRecords",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblVideoTitle" runat="server" resourcekey="lblVideoTitle"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlVideoTitleData" runat="server" Text='<%# Eval("VideoTitle") %>'
                                Target="_blank" NavigateUrl='<%#GetVideoUrl(Convert.ToString(Eval("VideoId"))) %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblClientName" runat="server" resourcekey="lblClientName"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblClientNameData" runat="server" Text='<%#Eval("ClientName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="right">
                        <HeaderTemplate>
                            <asp:Label ID="lblRating" runat="server" resourcekey="lblRating"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRatingData" runat="server" Text='<%#Eval("Rating") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblInfo" runat="server" resourcekey="lblInfo"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblInfoData" runat="server" Text='<%#Eval("Info") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblReply" runat="server" resourcekey="lblReply"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblReplyData" runat="server" Text='<%#Eval("Reply") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="right">
                        <HeaderTemplate>
                            <asp:Label ID="lblUpdatedDate" runat="server" resourcekey="lblUpdatedDate"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUpdatedDateData" runat="server" Text='<%#Convert.ToDateTime(Convert.ToString(Eval("UpdatedDate"))).ToShortDateString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction"/>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit",LocalResourceFile)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit",LocalResourceFile)%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" Wrap="true" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                    Wrap="true" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"  Wrap="true" />
                <EditRowStyle BackColor="#999999" Wrap="true" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr align="left" valign="top">
        <td>
            <cross:PagingControl ID="ctlPagingControl" runat="server" Mode="PostBack" OnPageChanged="ctlPagingControl_PageChanged">
            </cross:PagingControl>
        </td>
    </tr>
</table>
<table align="center" width="100%" class="dnnFormItem" id="tblDetail" runat="server" visible="False">
 <tr>
        <td colspan="2">
            <asp:Label ID="lblRating" runat="server" CssClass="SubHead" /><br />
            <br />
        </td>
    </tr>
   
    <tr>
        <td style="width:150px">
            <dnn:Label ID="plRatingInfo" runat="server"  ControlName="txtRatingInfo" />
        </td>
        <td>
            <asp:TextBox ID="txtRatingInfo" runat="server" Columns="60" TextMode="Multiline"
                 ReadOnly="true" Rows="5" />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:Label ID="plRatingReply" runat="server"  ControlName="txtRatingReply" />
        </td>
        <td>
            <asp:TextBox ID="txtRatingReply" runat="server" Columns="60" TextMode="Multiline"
                Rows="5" />
        </td>
    </tr>
</table>
