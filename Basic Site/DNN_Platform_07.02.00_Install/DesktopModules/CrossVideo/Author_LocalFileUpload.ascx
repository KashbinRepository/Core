<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Author_LocalFileUpload, App_Web_author_localfileupload.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register Assembly="System.Web.Silverlight" Namespace="System.Web.UI.SilverlightControls"
    TagPrefix="asp" %>
 <%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<table width="100%" cellpadding="1" cellspacing="1"  align="center" class="dnnFormItem">
    <tr valign="top">
        <td style="width: 200px">
            <asp:Label ID="lblFileSpace" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;<dnn:CommandButton ID="btnReturn" runat="server"  ResourceKey="btnReturn"
                CausesValidation="false" ImageUrl="~/images/cancel.gif" OnCommand="btnReturn_Click" />
        </td>
    </tr>
     <tr id="trHelp_UploadControl" runat="server" visible="false">
        <td valign="top" align="left" style="width: 100%" colspan="2">
            <dnn:SectionHead ID="secHelp_UploadControl" CssClass="SubHead" runat="server"
                Section="tblHelp_UploadControl" align="left" ResourceKey="secHelp_UploadControl"
                IncludeRule="True" IsExpanded="false" ></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="5" cellspacing="1"  
                runat="server" id="tblHelp_UploadControl" >
                <tr align="left">
                    <td colspan="2">
                        <asp:Label ID="lblHelp_UploadControl" runat="server" resourcekey="Help_SilverlightUploadControl" CssClass="dnnFormMessage dnnFormInfo"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
     <tr id="trHelp_UploadFileExtension" runat="server" visible="false">
        <td valign="top" align="left" style="width: 100%" colspan="2">
            <dnn:SectionHead ID="secHelp_UploadFileExtension" CssClass="SubHead" runat="server"
                Section="tblHelp_UploadFileExtension" align="left" ResourceKey="secHelp_UploadFileExtension"
                IncludeRule="True" IsExpanded="false" ></dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="5" cellspacing="1"  
                runat="server" id="tblHelp_UploadFileExtension" >
                <tr align="left">
                    <td colspan="2">
                        <asp:Label ID="lblHelp_UploadFileExtension" runat="server" resourcekey="lblHelp_UploadFileExtension" CssClass="dnnFormMessage dnnFormInfo"></asp:Label><br />
                        <asp:Image runat="server" ID="imgHelp_UploadFileExtension" ImageUrl="~/DesktopModules/CrossVideo/images/Help/UploadFileExtension.jpg" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
      <tr  valign="top">
        <td colspan="2" >
         <asp:Label ID="lblFileExtension" runat="server" style="word-break:break-all" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
     </tr>
      <tr  valign="top">
        <td colspan="2" >
         <asp:Label ID="lblUploadTip" runat="server" resourcekey="lblUploadTip"  CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
     </tr>
    <tr  valign="top">
        <td colspan="2">
            <br />
            <br />
            <asp:Label ID="lblStepChooseTarget" runat="server" resourcekey="lblStepChooseTarget"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblFolder" runat="server" resourcekey="lblFolder"></asp:Label>
            <asp:DropDownList ID="ddlFolder" runat="server" Width="400px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblStepUpload" runat="server" resourcekey="lblStepUpload"></asp:Label><br />
            <asp:Silverlight ID="ctlUpload" runat="server" Height="350px" Source="~/DesktopModules/CrossVideo/Controls/FileUpload.xap"
                MinimumVersion="2.0.31005.0" Width="600px">
            </asp:Silverlight>
            <br />
            <br />
            <asp:Label ID="lblStepSynchronize" runat="server" resourcekey="lblStepSynchronize"
                ></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="chkUnzip" runat="server" resourcekey="chkUnzip" TextAlign="Right" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="btnSynchronize" runat="server" ResourceKey="btnSynchronize"
                CausesValidation="false" ImageUrl="~/images/synchronize.gif" OnCommand="btnSynchronize_Click" />
           
        </td>
    </tr>
</table>
