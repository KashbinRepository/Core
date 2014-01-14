<%@ control language="C#" inherits="Cross.Modules.Video.View.Admin, App_Web_admin.ascx.24b431c5" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<asp:Label ID="lblTrialTips" runat="server" Visible="false" resourcekey="lblTrialTips"
    CssClass="Normal"></asp:Label>
<asp:Label ID="lblNoPermission" runat="server" resourcekey="lblNoPermission" Visible="true"
    CssClass="Normal"></asp:Label>
<asp:Label ID="lblTrialExpired" runat="server" resourcekey="lblTrialExpired" Visible="false" CssClass="NormalRed"></asp:Label>
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
<dnn:SectionHead ID="secAdmin" CssClass="SubHead" runat="server" Section="tblAdmin"
    align="left" ResourceKey="secAdmin" IncludeRule="True" IsExpanded="true"></dnn:SectionHead>
<table class="normal" id="tblAdmin" cellspacing="2" cellpadding="2" width="90%" align="center"
    visible="false" runat="server">
    <tr id="trAdminGeneral" runat="server">
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secAdminGeneral" CssClass="SubHead" runat="server" Section="tblAdminGeneral"
                align="left" ResourceKey="secAdminGeneral" IncludeRule="True" IsExpanded="false">
            </dnn:SectionHead>
            <table style="width: 90%;" align="left" border="0" cellpadding="8" cellspacing="5"
                runat="server" id="tblAdminGeneral">
                <tr  runat="server" visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) %>">
                    <td colspan="2" >
                    <asp:Label ID="Label1" runat="server" resourcekey="Tip_ForAdministratorOnly"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                     
                    </td>
                </tr>
                <tr runat="server" id="trAdminGeneral_Settings" visible="false" align="left">
                    <td valign="middle" align="left">
                        <asp:ImageButton ID="ibtnAdminGeneral_Settings" runat="server" 
                            ImageUrl="~/DesktopModules/CrossVideo/images/GeneralSettings.gif" OnClick="lbtnAdminGeneral_Settings_Click">
                        </asp:ImageButton>
                    </td>
                    <td valign="top" align="left">
                        <asp:LinkButton ID="lbtnAdminGeneral_Settings" runat="server" resourcekey="lbtnAdminGeneral_Settings"
                            CssClass="NormalBold" OnClick="lbtnAdminGeneral_Settings_Click"></asp:LinkButton><br />
                        <asp:Label ID="lblAdminGeneral_Settings" runat="server" resourcekey="lblAdminGeneral_Settings"
                            CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr runat="server" id="trAdminGeneral_Role" visible="false">
                    <td valign="middle" align="left">
                        <asp:ImageButton ID="ibtnAdminGeneral_Role" runat="server" 
                            ImageUrl="~/DesktopModules/CrossVideo/images/icon_securityroles_32px.gif" OnClick="lbtnAdminGeneral_Role_Click">
                        </asp:ImageButton>
                    </td>
                    <td valign="top" align="left">
                        <asp:LinkButton ID="lbtnAdminGeneral_Role" runat="server" resourcekey="lbtnAdminGeneral_Role"
                            CssClass="NormalBold" OnClick="lbtnAdminGeneral_Role_Click"></asp:LinkButton>
                        <br />
                        <asp:Label ID="lblAdminGeneral_Role" runat="server" resourcekey="lblAdminGeneral_Role"
                            CssClass="Normal"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr id="trAdminVideo" runat="server">
        <td valign="top" align="left" width="100%">
            <dnn:SectionHead ID="secAdminVideo" CssClass="SubHead" runat="server" Section="tblAdminVideo"
                align="left" ResourceKey="secAdminVideo" IncludeRule="True" IsExpanded="false">
            </dnn:SectionHead>
            <table style="width: 90%;" align="center" border="0" cellpadding="8" cellspacing="5"
                runat="server" id="tblAdminVideo">
                <tbody>
                 <tr  runat="server" visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) %>">
                        <td colspan="2" >
                              <asp:Label ID="Label2" runat="server" resourcekey="Tip_ForAdministratorAndManageRole"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                          
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminVideo_Type" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminVideo_Type" runat="server" 
                                ImageUrl="~/DesktopModules/CrossVideo/images/Gallery.jpg" OnClick="lbtnAdminVideo_Type_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminVideo_Type" runat="server" resourcekey="lbtnAdminVideo_Type"
                                CssClass="NormalBold" OnClick="lbtnAdminVideo_Type_Click"></asp:LinkButton><br />
                            <asp:Label ID="lblAdminVideo_Type" runat="server" resourcekey="lblAdminVideo_Type"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminVideo_Category" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminVideo_Category" runat="server" 
                                ImageUrl="~/DesktopModules/CrossVideo/images/Category.jpg" OnClick="lbtnAdminVideo_Category_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminVideo_Category" runat="server" resourcekey="lbtnAdminVideo_Category"
                                CssClass="NormalBold" OnClick="lbtnAdminVideo_Category_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminVideo_Category" runat="server" resourcekey="lblAdminVideo_Category"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminVideo_UDT" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminVideo_UDT" runat="server" 
                                ImageUrl="~/DesktopModules/CrossVideo/images/attribute.jpg" OnClick="lbtnAdminVideo_UDT_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminVideo_UDT" runat="server" resourcekey="lbtnAdminVideo_UDT"
                                CssClass="NormalBold" OnClick="lbtnAdminVideo_UDT_Click"></asp:LinkButton><br />
                            <asp:Label ID="lblAdminVideo_UDT" runat="server" resourcekey="lblAdminVideo_UDT"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminVideo_Tag" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminVideo_Tag" runat="server" 
                                ImageUrl="~/DesktopModules/CrossVideo/images/Tag.gif" OnClick="lbtnAdminVideo_Tag_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminVideo_Tag" runat="server" resourcekey="lbtnAdminVideo_Tag"
                                CssClass="NormalBold" OnClick="lbtnAdminVideo_Tag_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminVideo_Tag" runat="server" resourcekey="lblAdminVideo_Tag"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminVideo_Video" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminVideo_Video" runat="server" 
                                ImageUrl="~/DesktopModules/CrossVideo/images/Video.png" OnClick="lbtnAdminVideo_Video_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminVideo_Video" runat="server" resourcekey="lbtnAdminVideo_Video"
                                CssClass="NormalBold" OnClick="lbtnAdminVideo_Video_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminVideo_Video" runat="server" resourcekey="lblAdminVideo_Video"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminVideo_Serial" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminVideo_Serial" runat="server" 
                                ImageUrl="~/DesktopModules/CrossVideo/images/Album.jpg" OnClick="lbtnAdminVideo_Serial_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminVideo_Serial" runat="server" resourcekey="lbtnAdminVideo_Serial"
                                CssClass="NormalBold" OnClick="lbtnAdminVideo_Serial_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminVideo_Serial" runat="server" resourcekey="lblAdminVideo_Serial"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminVideo_YouTubeRss" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminVideo_YouTubeRss" runat="server" 
                                ImageUrl="~/DesktopModules/CrossVideo/images/Youtube_32x32.png" OnClick="lbtnAdminVideo_YouTubeRss_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminVideo_YouTubeRss" runat="server" resourcekey="lbtnAdminVideo_YouTubeRss"
                                CssClass="NormalBold" OnClick="lbtnAdminVideo_YouTubeRss_Click"></asp:LinkButton><br />
                            <asp:Label ID="lblAdminVideo_YouTubeRss" runat="server" resourcekey="lblAdminVideo_YouTubeRss"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminVideo_Author" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminVideo_Author" runat="server" 
                                ImageUrl="~/DesktopModules/CrossVideo/images/AuthorList.gif" OnClick="lbtnAdminVideo_Author_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminVideo_Author" runat="server" resourcekey="lbtnAdminVideo_Author"
                                CssClass="NormalBold" OnClick="lbtnAdminVideo_Author_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminVideo_Author" runat="server" resourcekey="lblAdminVideo_Author"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trAdminVideo_Abuse" visible="false">
                        <td valign="middle" align="left">
                            <asp:ImageButton ID="ibtnAdminVideo_Abuse" runat="server" 
                                ImageUrl="~/DesktopModules/CrossVideo/images/Abuse.png" OnClick="lbtnAdminVideo_Abuse_Click">
                            </asp:ImageButton>
                        </td>
                        <td valign="top" align="left">
                            <asp:LinkButton ID="lbtnAdminVideo_Abuse" runat="server" resourcekey="lbtnAdminVideo_Abuse"
                                CssClass="NormalBold" OnClick="lbtnAdminVideo_Abuse_Click"></asp:LinkButton>
                            <br />
                            <asp:Label ID="lblAdminVideo_Abuse" runat="server" resourcekey="lblAdminVideo_Abuse"
                                CssClass="Normal"></asp:Label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>
</table>
<dnn:SectionHead ID="secAuthor" CssClass="SubHead" runat="server" Section="tblAuthor"
    align="left" ResourceKey="secAuthor" IncludeRule="True" IsExpanded="False"></dnn:SectionHead>
<table style="width: 100%;" align="center" border="0" cellpadding="8" cellspacing="5"
    runat="server" id="tblAuthor">
    <tbody>
    <tr runat="server" visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) %>">
            <td colspan="2" >
               <asp:Label ID="Label3" runat="server" resourcekey="Tip_ForAuthor"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
              
            </td>
        </tr>
        <tr runat="server" id="trAuthor_Profile" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnAuthor_Profile" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/Author.gif" OnClick="lbtnAuthor_Profile_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnAuthor_Profile" runat="server" resourcekey="lbtnAuthor_Profile"
                    CssClass="NormalBold" OnClick="lbtnAuthor_Profile_Click"></asp:LinkButton><br />
                <asp:Label ID="lblAuthor_Profile" runat="server" resourcekey="lblAuthor_Profile"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trAuthor_Folder" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnAuthor_Folder" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/Folder.gif" OnClick="lbtnAuthor_Folder_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnAuthor_Folder" runat="server" resourcekey="lbtnAuthor_Folder"
                    CssClass="NormalBold" OnClick="lbtnAuthor_Folder_Click"></asp:LinkButton><br />
                <asp:Label ID="lblAuthor_Folder" runat="server" resourcekey="lblAuthor_Folder" CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trAuthor_File" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnAuthor_File" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/File.gif" OnClick="lbtnAuthor_File_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnAuthor_File" runat="server" resourcekey="lbtnAuthor_File"
                    CssClass="NormalBold" OnClick="lbtnAuthor_File_Click"></asp:LinkButton><br />
                <asp:Label ID="lblAuthor_File" runat="server" resourcekey="lblAuthor_File" CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trAuthor_Video" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnAuthor_Video" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/Video.png" OnClick="lbtnAuthor_Video_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnAuthor_Video" runat="server" resourcekey="lbtnAuthor_Video"
                    CssClass="NormalBold" OnClick="lbtnAuthor_Video_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblAuthor_Video" runat="server" resourcekey="lblAuthor_Video" CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trAuthor_Serial" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnAuthor_Serial" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/Album.jpg" OnClick="lbtnAuthor_Serial_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnAuthor_Serial" runat="server" resourcekey="lbtnAuthor_Serial"
                    CssClass="NormalBold" OnClick="lbtnAuthor_Serial_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblAuthor_Serial" runat="server" resourcekey="lblAuthor_Serial" CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trAuthor_YouTubeRss" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnAuthor_YouTubeRss" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/Youtube_32x32.png" OnClick="lbtnAuthor_YouTubeRss_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnAuthor_YouTubeRss" runat="server" resourcekey="lbtnAuthor_YouTubeRss"
                    CssClass="NormalBold" OnClick="lbtnAuthor_YouTubeRss_Click"></asp:LinkButton><br />
                <asp:Label ID="lblAuthor_YouTubeRss" runat="server" resourcekey="lblAuthor_YouTubeRss"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trAuthor_Ticket" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnAuthor_Ticket" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/Help.gif" OnClick="lbtnAuthor_Ticket_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnAuthor_Ticket" runat="server" resourcekey="lbtnAuthor_Ticket"
                    CssClass="NormalBold" OnClick="lbtnAuthor_Ticket_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblAuthor_Ticket" runat="server" resourcekey="lblAuthor_Ticket" CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trAuthor_Review" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnAuthor_Review" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/Review.gif" OnClick="lbtnAuthor_Review_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnAuthor_Review" runat="server" resourcekey="lbtnAuthor_Review"
                    CssClass="NormalBold" OnClick="lbtnAuthor_Review_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblAuthor_Review" runat="server" resourcekey="lblAuthor_Review" CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trAuthor_Comment" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnAuthor_Comment" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/Comment.gif" OnClick="lbtnAuthor_Comment_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnAuthor_Comment" runat="server" resourcekey="lbtnAuthor_Comment"
                    CssClass="NormalBold" OnClick="lbtnAuthor_Comment_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblAuthor_Comment" runat="server" resourcekey="lblAuthor_Comment"
                    CssClass="Normal"></asp:Label>
            </td>
        </tr>
    </tbody>
</table>
<dnn:SectionHead ID="secReader" CssClass="SubHead" runat="server" Section="tblReader"
    align="left" ResourceKey="secReader" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
<table style="width: 100%;" align="left" border="0" cellpadding="8" cellspacing="5"
    runat="server" id="tblReader">
    <tbody>
         <tr  runat="server" visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) %>">
            <td colspan="2" >
               <asp:Label ID="Label4" runat="server" resourcekey="Tip_ForRegisterUser"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
               
            </td>
        </tr>
        <tr runat="server" id="trReader_Watch" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnReader_Watch" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/Watch.gif" OnClick="lbtnReader_Watch_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnReader_Watch" runat="server" resourcekey="lbtnReader_Watch"
                    CssClass="NormalBold" OnClick="lbtnReader_Watch_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblReader_Watch" runat="server" resourcekey="lblReader_Watch" CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trReader_Review" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnReader_Review" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/Review.gif" OnClick="lbtnReader_Review_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnReader_Review" runat="server" resourcekey="lbtnReader_Review"
                    CssClass="NormalBold" OnClick="lbtnReader_Review_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblReader_Review" runat="server" resourcekey="lblReader_Review" CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trReader_Ticket" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnReader_Ticket" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/Help.gif" OnClick="lbtnReader_Ticket_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnReader_Ticket" runat="server" resourcekey="lbtnReader_Ticket"
                    CssClass="NormalBold" OnClick="lbtnReader_Ticket_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblReader_Ticket" runat="server" resourcekey="lblReader_Ticket" CssClass="Normal"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trReader_Abuse" visible="false">
            <td valign="middle" align="left">
                <asp:ImageButton ID="ibtnReader_Abuse" runat="server" 
                    ImageUrl="~/DesktopModules/CrossVideo/images/Abuse.png" OnClick="lbtnReader_Abuse_Click">
                </asp:ImageButton>
            </td>
            <td valign="top" align="left">
                <asp:LinkButton ID="lbtnReader_Abuse" runat="server" resourcekey="lbtnReader_Abuse"
                    CssClass="NormalBold" OnClick="lbtnReader_Abuse_Click"></asp:LinkButton>
                <br />
                <asp:Label ID="lblReader_Abuse" runat="server" resourcekey="lblReader_Abuse" CssClass="Normal"></asp:Label>
            </td>
        </tr>
    </tbody>
</table>
<dnn:SectionHead ID="secHelp" CssClass="SubHead" runat="server" Section="tblHelp"
    align="left" ResourceKey="secHelp" IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
<table class="Normal" id="tblHelp" cellspacing="5" cellpadding="2" width="90%" align="center"
    visible="false" runat="server">
     <tr  runat="server" visible="<%#UserInfo.IsInRole(PortalSettings.AdministratorRoleName) %>">
        <td colspan="2">
          <asp:Label ID="Label5" runat="server" resourcekey="Tip_ForAdministratorOnly"
                            CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
           
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_HowToStart" CssClass="SubHead" runat="server" Section="tblHelp_HowToStart"
                align="left" ResourceKey="secHelp_HowToStart" IncludeRule="True" IsExpanded="false">
            </dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblHelp_HowToStart">
                <tr align="left">
                    <td colspan="2" >
                        <asp:Label ID="lblHelp_HowToStart" runat="server" resourcekey="Help_HowToStart" CssClass="dnnFormMessage dnnFormInfo"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_MediaFormat" CssClass="SubHead" runat="server" Section="tblHelp_MediaFormat"
                align="left" ResourceKey="secHelp_MediaFormat" IncludeRule="True" IsExpanded="false">
            </dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblHelp_MediaFormat">
                <tr align="left">
                    <td colspan="2" >
                        <asp:Label ID="lblHelp_MediaFormat" runat="server" resourcekey="Help_MediaFormat" CssClass="dnnFormMessage dnnFormInfo"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_VideoConvert_Online" CssClass="SubHead" runat="server"
                Section="tblHelp_VideoConvert_Online" align="left" ResourceKey="secHelp_VideoConvert_Online"
                IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblHelp_VideoConvert_Online">
                <tr align="left">
                    <td colspan="2" >
                        <asp:Label ID="lblHelp_VideoConvert_Online" runat="server" resourcekey="Help_VideoConvert_Online" CssClass="dnnFormMessage dnnFormInfo"></asp:Label><br />
                        <asp:Image runat="server" ID="imgHelp_VideoConvert" ImageUrl="~/DesktopModules/CrossVideo/images/Help/ExecuteSetting.jpg"
                            Width="60%" CssClass="dnnFormMessage dnnFormInfo" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_VideoConvert_Offline" CssClass="SubHead" runat="server"
                Section="tblHelp_VideoConvert_Offline" align="left" ResourceKey="secHelp_VideoConvert_Offline"
                IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblHelp_VideoConvert_Offline">
                <tr align="left">
                    <td colspan="2" >
                        <asp:Label ID="lblHelp_VideoConvert_Offline" runat="server" resourcekey="Help_VideoConvert_Offline" CssClass="dnnFormMessage dnnFormInfo"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_MimeType" CssClass="SubHead" runat="server" Section="tblHelp_MimeType"
                align="left" ResourceKey="secHelp_MimeType" IncludeRule="True" IsExpanded="false">
            </dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblHelp_MimeType">
                <tr align="left">
                    <td colspan="2" >
                        <asp:Label ID="lblHelp_MimeType" runat="server" resourcekey="lblHelp_MimeType" CssClass="dnnFormMessage dnnFormInfo"></asp:Label><br />
                        <asp:Image runat="server" ID="imgHelp_MimeType" ImageUrl="~/DesktopModules/CrossVideo/images/Help/MimeType.jpg"  CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_UploadFileExtension" CssClass="SubHead" runat="server"
                Section="tblHelp_UploadFileExtension" align="left" ResourceKey="secHelp_UploadFileExtension"
                IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblHelp_UploadFileExtension">
                <tr align="left">
                    <td colspan="2" >
                        <asp:Label ID="lblHelp_UploadFileExtension" runat="server" resourcekey="lblHelp_UploadFileExtension" CssClass="dnnFormMessage dnnFormInfo"></asp:Label><br />
                        <asp:Image runat="server" ID="imgHelp_UploadFileExtension" ImageUrl="~/DesktopModules/CrossVideo/images/Help/UploadFileExtension.jpg" CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_YouTubeIntegration" CssClass="SubHead" runat="server"
                Section="tblHelp_YouTubeIntegration" align="left" ResourceKey="secHelp_YouTubeIntegration"
                IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblHelp_YouTubeIntegration">
                <tr align="left">
                    <td colspan="2" >
                        <asp:Label ID="lblHelp_YouTubeIntegration" runat="server" resourcekey="Help_YouTubeIntegration" CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_VideoSiteMap" runat="server" Section="tblHelp_VideoSiteMap" ResourceKey="secHelp_VideoSiteMap"
                IncludeRule="True" IsExpanded="false" CssClass="SubHead"></dnn:SectionHead>
            <table id="tblHelp_VideoSiteMap" cellspacing="0" cellpadding="2" width="100%" border="0"
                runat="server">
                <tr>
                    <td colspan="2" >
                     <asp:Label ID="Label6" runat="server" resourcekey="Tip_VideoSiteMap" CssClass="dnnFormMessage dnnFormInfo"/>
                     
                    </td>
                </tr>
                <tr>
                    <td style="width: 300px">
                        <dnn:Label ID="plSiteMap" runat="server" ControlName="txtSiteMap"></dnn:Label>
                    </td>
                    <td>
                        <asp:HyperLink ID="hlSiteMap" runat="server" Target="_blank"></asp:HyperLink>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    
     <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_Charge" CssClass="SubHead" runat="server"
                Section="tblHelp_Charge" align="left" ResourceKey="secHelp_Charge"
                IncludeRule="True" IsExpanded="false"></dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblHelp_Charge">
                <tr align="left">
                    <td colspan="2" >
                      <asp:Label ID="Label7" runat="server" resourcekey="Help_Charge" CssClass="dnnFormMessage dnnFormInfo"/>
                   
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_SendReceiveMail" CssClass="SubHead" runat="server" Section="tblHelp_SendReceiveMail"
                align="left" ResourceKey="secHelp_SendReceiveMail" IncludeRule="True" IsExpanded="false">
            </dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="10" cellspacing="1"
                runat="server" id="tblHelp_SendReceiveMail">
                <tr align="left">
                    <td colspan="2" >
                        <asp:Label ID="lblHelp_SendReceiveMail" runat="server" resourcekey="Help_SendReceiveMail" CssClass="dnnFormMessage dnnFormInfo"></asp:Label><br />
                        <asp:Image runat="server" ID="imgHelp_SendReceiveMail" ImageUrl="~/DesktopModules/CrossVideo/images/Help/Smtp.jpg" CssClass="dnnFormMessage dnnFormInfo"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_Faqs" CssClass="SubHead" runat="server" Section="tblHelp_Faqs"
                align="left" ResourceKey="secHelp_Faqs" IncludeRule="True" IsExpanded="false">
            </dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblHelp_Faqs">
                <tr align="left">
                    <td colspan="2" >
                        <asp:Label ID="lblHelp_Faqs" runat="server" resourcekey="Help_Faqs" CssClass="dnnFormMessage dnnFormInfo"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" style="width: 100%">
            <dnn:SectionHead ID="secHelp_Online" CssClass="SubHead" runat="server" Section="tblHelp_Online"
                align="left" ResourceKey="secHelp_Online" IncludeRule="True" IsExpanded="false">
            </dnn:SectionHead>
            <table style="width: 100%;" align="left" border="0" cellpadding="5" cellspacing="1"
                runat="server" id="tblHelp_Online">
                <tr align="left">
                    <td colspan="2" >
                        <asp:Label ID="lblHelp_Online" runat="server" resourcekey="lblHelp_Online" CssClass="dnnFormMessage dnnFormInfo"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<dnn:SectionHead ID="secRegister" CssClass="SubHead" runat="server" Section="tblRegister"
    align="left" ResourceKey="secRegister" IncludeRule="True" IsExpanded="false"
    Visible="false"></dnn:SectionHead>
<table style="width: 100%;" align="center" border="0" cellpadding="5" cellspacing="1" class="dnnFormItem"
    runat="server" id="tblRegister" visible="false">
    <tr align="left">
        <td colspan="2" >
            <asp:Label ID="lblHelp_Register" runat="server" resourcekey="Help_Register" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plInvoiceId" runat="server" ControlName="txtInvoiceId"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtInvoiceId" runat="server" Width="300px"></asp:TextBox>
            <dnn:CommandButton ID="btnRegister" runat="server" ResourceKey="btnRegister" ImageUrl="~/images/add.gif"
                OnCommand="btnRegister_Click" CausesValidation="false" />
            <asp:Label ID="lblRegisterStatus" runat="server" resourcekey="lblRegisterStatus"></asp:Label>
        </td>
    </tr>
</table>
<dnn:SectionHead ID="secShowcase" CssClass="SubHead" runat="server" Section="tblShowcase" 
    align="left" ResourceKey="secShowcase" IncludeRule="True" IsExpanded="false"
    Visible="false"></dnn:SectionHead>
<table style="width: 100%;" align="center" border="0" cellpadding="5" cellspacing="1" class="dnnFormItem"
    runat="server" id="tblShowcase" visible="false">
    <tr align="left">
        <td colspan="2" >
            <asp:Label ID="lblHelp_Showcase" runat="server" resourcekey="Help_Showcase" CssClass="dnnFormMessage dnnFormInfo"></asp:Label><br />
        </td>
    </tr>
    <tr>
        <td style="width: 150px">
            <dnn:Label ID="plName" runat="server" ControlName="txtName"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtName" Columns="70" runat="server" /><asp:Image ID="Image1" runat="server"
                ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg" ToolTip="Reuired"
                AlternateText="Required" />
            <asp:RequiredFieldValidator ID="varName" runat="server" CssClass="NormalRed" resourcekey="Required"
                Display="Dynamic" ControlToValidate="txtName">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td >
            <dnn:Label ID="plUrl" runat="server" ControlName="txtUrl"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtUrl" Columns="70" runat="server" />
            <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                ToolTip="Reuired" AlternateText="Required" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="NormalRed"
                resourcekey="Required" Display="Dynamic" ControlToValidate="txtUrl">* Required</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr >
        <td >
            <dnn:Label ID="plLogo" runat="server" ControlName="txtLogo"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtLogo" Columns="70" runat="server" />
        </td>
    </tr>
    <tr>
        <td valign="middle">
            <dnn:Label ID="plDescription" runat="server" ControlName="txtDescription"></dnn:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDescription" Columns="70" runat="server" Height="200px" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <dnn:CommandButton ID="btnAddShowcase" runat="server" ImageUrl="~/images/add.gif"
                OnCommand="btnAddShowcase_Click" ResourceKey="btnAddShowcase" CausesValidation="true" />
            <asp:Label ID="lblSuccess" runat="server" Visible="false" resourcekey="lblSuccess" />
        </td>
    </tr>
</table>
