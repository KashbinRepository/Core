<%@ Control Language="C#" Inherits="Samarpan.Modules.Videos.ViewVideos"
    AutoEventWireup="true" CodeBehind="ViewVideos.ascx.cs" %>
<input type="hidden" runat="server" id="hdnyouTubeChannelURL" name="hdnyouTubeChannelURL" />
<input type="hidden" runat="server" id="hdnyouTubePlaylistURL" name="hdnyouTubePlaylistURL" />
<input type="hidden" runat="server" id="hdnyoumaxDefaultTab" name="hdnyoumaxDefaultTab" />
<input type="hidden" runat="server" id="hdnshowFeaturedVideoOnLoad" name="hdnshowFeaturedVideoOnLoad" />
<input type="hidden" runat="server" id="hdnshowVideoInLightbox" name="hdnshowVideoInLightbox" />
<input type="hidden" runat="server" id="hdnSkinPath" name="hdnSkinPath" />


<div id="youmax"></div>
  

<script src="http://code.jquery.com/jquery-1.7.min.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        var hdnyouTubeChannelURL = $("#<%= hdnyouTubeChannelURL.ClientID %>").val();

        //optional parameters-----------------------------------------------
        var hdnyouTubePlaylistURL = $("#<%= hdnyouTubePlaylistURL.ClientID %>").val();
        var hdnyoumaxDefaultTab = $("#<%= hdnyoumaxDefaultTab.ClientID %>").val();
        var hdnshowFeaturedVideoOnLoad = $("#<%= hdnshowFeaturedVideoOnLoad.ClientID %>").val();
        var hdnshowVideoInLightbox = $("#<%= hdnshowVideoInLightbox.ClientID %>").val();

        var hdnSkinPath = $("#<%= hdnSkinPath.ClientID %>").val();
        var youmaxColumns = 4;
        var youmaxWidgetWidth = 640;

        AssignVariableFromView(hdnyouTubeChannelURL, hdnyouTubePlaylistURL, hdnyoumaxDefaultTab, hdnshowFeaturedVideoOnLoad, hdnshowVideoInLightbox, youmaxColumns, youmaxWidgetWidth);
        youmaxFeaturedPlaylistId = null;
        prepareYoumax();
        $('#youmax-header>img').wrap('<a href="' + youTubeChannelURL + '" target="_blank" />');

    });



    
</script>
