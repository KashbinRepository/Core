<%@ Control Language="C#" AutoEventWireup="false" Inherits="Samarpan.Modules.Videos.Settings"
    CodeBehind="Settings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="0" cellpadding="2" border="0" summary="Video Settings Design Table">
       

    
    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblyouTubeChannelURL" runat="server" controlname="lblyouTubeChannelURL"
                suffix="youTubeChannelURL Link:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtyouTubeChannelURL" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
    </tr>

 <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblyouTubePlaylistURL" runat="server" controlname="lblyouTubePlaylistURL"
                suffix="youTubePlaylistURL Link:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtyouTubePlaylistURL" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
    </tr>
    
    <tr>
           <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblyoumaxDefaultTab" runat="server" controlname="lblyoumaxDefaultTab"
                suffix="youmaxDefaultTab:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtyoumaxDefaultTab" CssClass="NormalTextBox" Width="390" MaxLength="2000"
                runat="server" />
        </td>
    </tr>
    
    

    <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblshowFeaturedVideoOnLoad" runat="server" controlname="chkshowFeaturedVideoOnLoad"
                suffix="showFeaturedVideoOnLoad:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkshowFeaturedVideoOnLoad" Text="" TextAlign="Right" runat="server" />
        </td>
    </tr>


     <tr>
        <td class="SubHead" width="150" valign="top">
            <dnn:label id="lblshowVideoInLightbox" runat="server" controlname="chkshowVideoInLightbox"
                suffix="showVideoInLightbox:">
            </dnn:label>
        </td>
        <td valign="bottom">
            <asp:CheckBox ID="chkshowVideoInLightbox" Text="" TextAlign="Right" runat="server" />
        </td>
    </tr>
   

</table>
