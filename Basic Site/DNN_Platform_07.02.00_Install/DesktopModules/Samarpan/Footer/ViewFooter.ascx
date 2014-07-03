<%@ Control Language="C#" Inherits="Samarpan.Modules.Footer.ViewFooter"
    AutoEventWireup="true" CodeBehind="ViewFooter.ascx.cs" %>
<input type="hidden" runat="server" id="hdnFooterCopyrightText" name="hdnFooterCopyrightText" />
<input type="hidden" runat="server" id="hdnFooterCopyright" name="hdnFooterCopyright" />
<input type="hidden" runat="server" id="hdnFooterPrivacyLink" name="hdnFooterPrivacyLink" />
<input type="hidden" runat="server" id="hdnFooterPrivacy" name="hdnFooterPrivacy" />
<input type="hidden" runat="server" id="hdnFooterContactUsLink" name="hdnFooterContactUsLink" />
<input type="hidden" runat="server" id="Hidden1" name="hdnFooterContactUs" />
<input type="hidden" runat="server" id="hdnFooterContactUs" name="hdnFooterContactUs" />
<input type="hidden" runat="server" id="hdnFooterLogo" name="hdnFooterLogo" />
<input type="hidden" runat="server" id="hdnSkinPath" name="hdnSkinPath" />

<input type="hidden" runat="server" id="hdnFacebook" name="hdnFacebook" />
<input type="hidden" runat="server" id="hdnYoutube" name="hdnYoutube" />


<div class="Footer_Pad">
    <div id="FooterCopyright" class="FooterCopyright">
    </div>
    <div id="FooterPrivacy" class="FooterPrivacy">
    </div>
    <div id="FooterContactUs" class="FooterContactUs">
    </div>
    <div id="FooterLogo" class="FooterLogo">
    </div>
    
     <div id="Footerfacebook" class="Footerfacebook">
    </div>
    
     <div id="FooterYouTube" class="FooterYouTube">
    </div>

</div>
<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        var hdnFooterCopyright = $("#<%= hdnFooterCopyright.ClientID %>").val();
        if (hdnFooterCopyright != null && hdnFooterCopyright != '' && hdnFooterCopyright == 'True') {
            var hdnFooterCopyrightText = $("#<%= hdnFooterCopyrightText.ClientID %>").val();
            if (hdnFooterCopyrightText != null && hdnFooterCopyrightText != '') {
                $('#FooterCopyright').empty();
                $('#FooterCopyright').append('<span id="spanFooterCopyrightText" >' + hdnFooterCopyrightText + '</span>');
            }
        }

        var hdnFooterPrivacy = $("#<%= hdnFooterPrivacy.ClientID %>").val();
        if (hdnFooterPrivacy != null && hdnFooterPrivacy != '' && hdnFooterPrivacy == 'True') {
            var hdnFooterPrivacyLink = $("#<%= hdnFooterPrivacyLink.ClientID %>").val();
            if (hdnFooterPrivacyLink != null && hdnFooterPrivacyLink != '') {
                $('#FooterPrivacy').empty();
                $('#FooterPrivacy').append('<a target="_blank" href="' + hdnFooterPrivacyLink + '"> Privacy </a>');
            }
        }

        var hdnFooterContactUs = $("#<%= hdnFooterContactUs.ClientID %>").val();
        if (hdnFooterContactUs != null && hdnFooterContactUs != '' && hdnFooterContactUs == 'True') {
            var hdnFooterContactUsLink = $("#<%= hdnFooterContactUsLink.ClientID %>").val();
            if (hdnFooterContactUsLink != null && hdnFooterContactUsLink != '') {
                $('#FooterContactUs').empty();
                $('#FooterContactUs').append('<a target="_blank" href="' + hdnFooterContactUsLink + '"> Contact Us </a>');
            }
        }

        var hdnSkinPath = $("#<%= hdnSkinPath.ClientID %>").val();
        if (hdnSkinPath != null && hdnSkinPath != '') {
            var hdnFooterLogo = $("#<%= hdnFooterLogo.ClientID %>").val();
            if (hdnFooterLogo != null && hdnFooterLogo != '' && hdnFooterLogo == 'True') {
                $('#FooterLogo').empty();
                $('#FooterLogo').append('<img src="' + hdnSkinPath + 'Images/FooterLogo.png" alt="" title="">');
            }
        }


        if (hdnSkinPath != null && hdnSkinPath != '') {
            var hdnFacebook = $("#<%= hdnFacebook.ClientID %>").val();
            if (hdnFacebook != null && hdnFacebook != '') {
                $('#Footerfacebook').empty();
                $('#Footerfacebook').append('<a target="_blank" href="' + hdnFacebook + '"> <img src="' + hdnSkinPath + 'Images/facebook.jpg" width="42" height="42"/></a>');
            }
        }

        if (hdnSkinPath != null && hdnSkinPath != '') {
            var hdnYoutube = $("#<%= hdnYoutube.ClientID %>").val();
            if (hdnYoutube != null && hdnYoutube != '') {
                $('#FooterYouTube').empty();
                $('#FooterYouTube').append('<a target="_blank" href="' + hdnYoutube + '"> <img src="' + hdnSkinPath + 'Images/youtube.jpg" width="42" height="42"/></a>');
            }
        }

    });
</script>
