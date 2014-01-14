<%@ control language="C#" inherits="Cross.Modules.FlashNavigate.UI.ViewTemplate, App_Web_viewtemplate_standard.ascx.5b5c530d" autoeventwireup="true" %>
 <div id="flash" runat="server" align="<%#FNSettings.General.FlashAlign%>" style="margin:0px">
   <p runat="server" id="pGetFlash">
        <a href="http://get.adobe.com/flashplayer" target="_blank">Get Flash</a> to see
        this player.</p>
      <asp:literal id="litFlash" runat="server"></asp:literal>
  </div>

