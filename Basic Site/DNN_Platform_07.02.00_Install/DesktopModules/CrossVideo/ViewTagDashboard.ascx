<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.ViewTagDashboard, App_Web_viewtagdashboard.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<dnn:SectionHead ID="secHowtostart" CssClass="SubHead" runat="server" Section="tblHowtostart"
    align="left" ResourceKey="secHowtostart" IncludeRule="True" IsExpanded="False" Visible="false">
</dnn:SectionHead>
<table class="Normal" id="tblHowtostart" cellspacing="2" cellpadding="2" width="100%"
    align="center" visible="false" runat="server">
    <tr>
        <td colspan="2" class="dnnFormMessage dnnFormInfo">
            <%=LocalizeString("Help_HowToStart")%>
             <br />
            <%=string.Format(LocalizeString("Help_ReadUserGuide"), FullDomainName + "/DesktopModules/CrossVideo/Help/Cross_Video_Gallery_User_Guide.pdf")%>
        </td>
    </tr>
</table>
<asp:Image ImageUrl="~/images/edit.gif"  runat="server" ID="imgEdit" Visible="false"/>
<asp:HyperLink runat="server" ID="hlEdit" Visible="false"/>
<asp:PlaceHolder ID="plhView" runat="server"></asp:PlaceHolder>