<%@ Control Language="C#" Inherits="Kashbin.Modules.Banner.ViewBanner"
    AutoEventWireup="true" CodeBehind="ViewBanner.ascx.cs" %>
<%@ Import Namespace="ModuleLibrary" %>
<script src="<%= ResolveUrl("~/js/jquery.cycle.all.js") %>" type="text/javascript"></script>
<input type="hidden" runat="server" id="hdnSkinPath" name="hdnSkinPath" />
<input type="hidden" runat="server" id="hdnShowLogo" name="hdnShowLogo" />
<input type="hidden" runat="server" id="hdnBannerOption" name="hdnBannerOption" />
<div id="BannerContainer" class="BannerContainer">
    <div id="AnimationContainer" style="display: none;">
    </div>
    <div id="FixedContainer" style="display: none;">
    </div>
    <div id="Logo_Pad" class="Logo_Pad" style="display: none;">
        <div id="LogoImage">
        </div>
    </div>
</div>
<script type="text/javascript" language="javascript">
    var AnimationContainerDiv = '#AnimationContainer';
    var FixedContainerDiv = '#FixedContainer';
    var LogoDiv = '#Logo_Pad';

    $(document).ready(function () {
        var hdnShowLogo = $("#<%= hdnShowLogo.ClientID %>").val();
        if (hdnShowLogo != null && hdnShowLogo != '' && hdnShowLogo.toLowerCase() == 'true') {
            $(LogoDiv).show();
        }
        var hdnBannerOption = $("#<%= hdnBannerOption.ClientID %>").val();
        if (hdnBannerOption != null) {
            switch (hdnBannerOption) {
                case 'Fixed':
                    prepareStaticImage('Fixed');
                    break;
                case 'NoAnimation':
                    prepareStaticImage('NoAnimation');
                    break;
                case 'Fade':
                    prepareAnimationImage();
                    fade();
                    break;
                case 'FadeZoom':
                    prepareAnimationImage();
                    fadeZoom();
                    break;
                case 'Cover':
                    prepareAnimationImage();
                    cover();
                    break;
                case 'UnCover':
                    prepareAnimationImage();
                    uncover();
                    break;
                case 'Scroll':
                    prepareAnimationImage();
                    scrollHorz();
                    break;
                case 'Slide':
                    prepareAnimationImage();
                    slideX();
                    break;
                case 'Wipe':
                    prepareAnimationImage();
                    wipe();
                    break;
                default:
                    prepareStaticImage('Fixed');
                    break;
            }
        }
    });

    function prepareStaticImage(typeOfImage) {

        if (typeOfImage == 'Fixed') {
            $(AnimationContainerDiv).hide();
            $(FixedContainerDiv).show();
        }
        else {
            $(AnimationContainerDiv).show();
            $(FixedContainerDiv).hide();
        }

        var hdnSkinPath = $("#<%= hdnSkinPath.ClientID %>").val();
        if (hdnSkinPath != null && hdnSkinPath != '') {
            var imageHtml = '';
            switch (typeOfImage) {
                case 'Fixed':
                    imageHtml = '<img src="' + hdnSkinPath + 'Images/BannerFixed.png" alt="" title="" />';
                    break;
                case 'NoAnimation':
                    imageHtml = '<img src="' + hdnSkinPath + 'Images/BannerNoAnimation.png" alt="" title="" />';
                    break;
                default:
                    imageHtml = '<img src="' + hdnSkinPath + 'Images/Banner.png" alt="" title="" />';
                    break;
            }

            if (typeOfImage == 'Fixed') {
                $(FixedContainerDiv).empty();
                $(FixedContainerDiv).append(imageHtml);
            }
            else {
                $(AnimationContainerDiv).empty();
                $(AnimationContainerDiv).append(imageHtml);
            }
        }
    }

    function prepareAnimationImage() {
        $(AnimationContainerDiv).show();
        $(FixedContainerDiv).hide();

        var hdnSkinPath = $("#<%= hdnSkinPath.ClientID %>").val();
        if (hdnSkinPath != null && hdnSkinPath != '') {
            $(AnimationContainerDiv).empty();
            $(AnimationContainerDiv).append('<img src="' + hdnSkinPath + 'Images/AnimationImage1.png" alt="" title="" />');
            $(AnimationContainerDiv).append('<img src="' + hdnSkinPath + 'Images/AnimationImage2.png" alt="" title=""/>');
            $(AnimationContainerDiv).append('<img src="' + hdnSkinPath + 'Images/AnimationImage3.png" alt="" title="" />');
        }
    }

    /*Animations*/

    /*Fade effect*/
    function fade() {
        $(AnimationContainerDiv).cycle({
            fx: 'fade',
            speed: 1500
        });
    }
    function fadeZoom() {
        $(AnimationContainerDiv).cycle({
            fx: 'fadeZoom',
            speed: 1500
        });
    }
    /*Cover effect*/
    function cover() {
        $(AnimationContainerDiv).cycle({
            fx: 'cover',
            speed: 1500
        });
    }
    function uncover() {
        $(AnimationContainerDiv).cycle({
            fx: 'uncover',
            speed: 1500
        });
    }
    /*Scroll effect*/
    function scrollLeft() {
        $(AnimationContainerDiv).cycle({
            fx: 'scrollLeft',
            speed: 1500
        });
    }
    function scrollRight() {
        $(AnimationContainerDiv).cycle({
            fx: 'scrollRight',
            speed: 1500
        });
    }
    function scrollHorz() {
        $(AnimationContainerDiv).cycle({
            fx: 'scrollHorz',
            speed: 1500
        });
    }
    function scrollVert() {
        $(AnimationContainerDiv).cycle({
            fx: 'scrollVert',
            speed: 1500
        });
    }
    /*Slide effect*/
    function shuffle() {
        $(AnimationContainerDiv).cycle({
            fx: 'shuffle',
            speed: 1500
        });
    }
    /*Slide effect*/
    function slideX() {
        $(AnimationContainerDiv).cycle({
            fx: 'slideX',
            speed: 1500
        });
    }
    function slideY() {
        $(AnimationContainerDiv).cycle({
            fx: 'slideY',
            speed: 1500
        });
    }
    /*Slide effect*/
    function wipe() {
        $(AnimationContainerDiv).cycle({
            fx: 'wipe',
            speed: 1500
        });
    }

    /* Effects Available 
    blindX
    blindY
    blindZ
    cover
    curtainX
    curtainY
    fade
    fadeZoom
    growX
    growY
    scrollUp
    scrollDown
    scrollLeft
    scrollRight
    scrollHorz
    scrollVert
    shuffle
    slideX
    slideY
    toss
    turnUp
    turnDown
    turnLeft
    turnRight
    uncover
    wipe
    zoom
    */
     
</script>
