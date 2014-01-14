<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.AdminVideo_Abuse, App_Web_adminvideo_abuse.ascx.24b431c5" %>
<%@ Register TagPrefix="cross" Namespace="Cross.DNN.Common.WebControls" Assembly="Cross.Dnn.Modules.Framework" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<table width="100%" class="dnnFormItem" cellpadding="0" cellspacing="0" border="0" runat="server"
    id="tblButton">
    <tr>
        <td id="td_Button_Search" runat="server">
            <asp:Label ID="lblStart" runat="server" resourcekey="lblStart" />
            <asp:TextBox ID="txtStart" MaxLength="10" Columns="10" runat="server" Width="100px"/>
            <asp:HyperLink ID="hlStart" Text="Calendar" resourcekey="Calendar" CssClass="CommandButton"
                runat="server" />
            <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="NormalRed"
                ControlToValidate="txtStart" resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                Display="Dynamic" Type="Date" Operator="DataTypeCheck" />&nbsp;&nbsp;
            <asp:Label ID="lblEnd" runat="server" resourcekey="lblEnd" />
            <asp:TextBox ID="txtEnd" MaxLength="10" Columns="10" runat="server" Width="100px"/>
            <asp:HyperLink ID="hlEnd" Text="Calendar" resourcekey="Calendar" CssClass="CommandButton"
                runat="server" />
            <asp:CompareValidator ID="CompareValidator2" runat="server" CssClass="NormalRed"
                ControlToValidate="txtEnd" resourcekey="Date.ErrorMessage" ErrorMessage="<br>You have entered an invalid date!"
                Display="Dynamic" Type="Date" Operator="DataTypeCheck" /><br />
            <asp:Label ID="lblTitle" runat="server" resourcekey="lblTitle" />
            <asp:TextBox ID="txtTitle" Columns="40" runat="server" Width="200px"/><br />
            <asp:Label ID="lblAbuseId" runat="server" resourcekey="lblAbuseId" />
            <asp:TextBox ID="txtAbuseNo" Columns="40" runat="server" Width="200px"/><br />
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
            &nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnSearch" runat="server" CausesValidation="false" ImageUrl="~/images/icon_search_16px.gif"
                ResourceKey="btnSearch" OnCommand="btnSearch_Click" />
        </td>
        <td align="right">
            <asp:Label ID="lblAbuseDetail" runat="server" Visible="false" CssClass="SubHead" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnClose" runat="server" ResourceKey="btnClose" ImageUrl="~/images/lock.gif"
                OnCommand="btnClose_Click" Visible="false" CausesValidation="false" />
            <dnn:CommandButton ID="btnOpen" runat="server" ResourceKey="btnOpen" ImageUrl="~/images/login.gif"
                OnCommand="btnOpen_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDeleteReport" runat="server" ResourceKey="btnDeleteReport"
                ImageUrl="~/images/delete.gif" OnCommand="btnDeleteReport_Click"  Visible="false"
                CausesValidation="false" OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteReport",LocalResourceFile)) %>' />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDeleteVideo" runat="server" ResourceKey="btnDeleteVideo"
                ImageUrl="~/images/delete.gif" OnCommand="btnDeleteVideo_Click" Visible="false"
                CausesValidation="false" OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteVideo",LocalResourceFile)) %>' />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnMyAccount" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
    <tr>
        <td colspan="2" >
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
</table>
<table align="center" width="100%" class="dnnFormItem" id="tblAbuseList" runat="server">
    <tr>
        <td align="right">
            <asp:GridView ID="gvAbuse" runat="server" AutoGenerateColumns="False" 
                Width="100%" CellPadding="1"  CellSpacing="1"  GridLines="None" BackColor="Gray"
                 ForeColor="#333333" DataKeyNames="Id" OnRowCommand="gvAbuse_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecords" Text='<%# Localization.GetString("NoRecords",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblAbuseNo" runat="server" resourcekey="lblAbuseNo"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAbuseNoData" runat="server" Text='<%#Eval("AbuseNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblTitle" runat="server" resourcekey="lblTitle1"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTitleData" runat="server" Text='<%#Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblVideoTitle" runat="server" resourcekey="lblVideoTitle"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlVideoTitleData" runat="server" Text='<%# Convert.ToString(Eval("VideoTitle")) + (string.IsNullOrEmpty(Convert.ToString(Eval("SubVideoTitle")))?string.Empty:" - "+Convert.ToString(Eval("SubVideoTitle"))) %>'
                                Target="_blank" NavigateUrl='<%#GetVideoUrl(Convert.ToString(Eval("VideoId")),Convert.ToString(Eval("SubVideoId"))) %>' />
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
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblClienteEmail" runat="server" resourcekey="lblClienteEmail"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblClientEmailData" runat="server" Text='<%#Eval("ClientEmail") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="right">
                        <HeaderTemplate>
                            <asp:Label ID="lblUpdatedDate" runat="server" resourcekey="lblUpdatedDate"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUpdatedDateData" runat="server" Text='<%#Eval("UpdatedDate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblClosed" runat="server" resourcekey="lblClosed"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkClosedData" runat="server" Checked='<%#Eval("Closed") %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblVideoDeleted" runat="server" resourcekey="lblVideoDeleted"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkVideoDeleted" runat="server" Checked='<%#IsVideoDeleted(Convert.ToString(Eval("VideoId")),Convert.ToString(Eval("SubVideoId"))) %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction"/>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>' />
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel", Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItem",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" Wrap="true" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                    Wrap="true" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Wrap="true" HorizontalAlign="left"/>
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
<table align="center" width="100%"  id="tblAbuseDetail_List" runat="server" class="dnnFormItem"
    visible="false">
    <tr>
        <td>
            <hr style="border: 1px dotted #999999; size: 1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:DataList ID="dlDetail" runat="Server" Width="100%" BackColor="White" BorderColor="#E7E7FF"
                BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <%# "By  " + Convert.ToString(DataBinder.Eval(Container.DataItem, "UserName"))%>
                                <%# "    on  "+DataBinder.Eval(Container.DataItem,"CreatedDate") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%# Eval("Description").ToString().Replace(Microsoft.VisualBasic.Constants.vbCrLf, "<br/>")%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <AlternatingItemStyle BackColor="#F7F7F7" Wrap="true" />
                <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Wrap="true" />
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" Wrap="true" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            </asp:DataList>
        </td>
    </tr>
</table>
<table id="tblAbuseDetail_Add" cellspacing="0" cellpadding="2" border="0" align="left"
    width="100%" class="dnnFormItem" visible="false" runat="server">
    <tr>
        <td valign="middle" style="width: 150px">
            <dnn:Label ID="plAbuseDescription" runat="server"  ControlName="txtDescription" />
        </td>
        <td>
            <asp:TextBox ID="txtAbuseDescription" runat="server" Columns="60" TextMode="Multiline"
                Rows="8" />
            <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg" ToolTip="Reuired"
                AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAbuseDescription"
                Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <dnn:CommandButton ID="btnCreateAbuse" runat="server" ResourceKey="btnCreateAbuse"
                ImageUrl="~/images/add.gif" OnCommand="btnCreateAbuse_Click" />
        </td>
    </tr>
</table>
