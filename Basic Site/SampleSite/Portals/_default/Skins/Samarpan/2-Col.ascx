<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKTOMOBILE" Src="~/Admin/Skins/LinkToMobileSite.ascx" %>
<%@ Register TagPrefix="dnn" TagName="JQUERY" Src="~/Admin/Skins/jQuery.ascx" %>
<%@ Register TagPrefix="dnn" TagName="META" Src="~/Admin/Skins/Meta.ascx" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<%@ Register TagPrefix="uc" TagName="LoadScripts" Src="~/Admin/Skins/LoadScripts.ascx" %>

<dnn:META ID="META1" runat="server" Name="viewport" Content="width=device-width,initial-scale=1" />

<dnn:JQUERY ID="dnnjQuery" runat="server" jQueryHoverIntent="true" />

<dnn:DnnJsInclude ID="bootstrapJS" runat="server" FilePath="bootstrap/js/bootstrap.min.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude ID="customJS" runat="server" FilePath="js/scripts.js" PathNameAlias="SkinPath" />

<uc:LoadScripts ID="ucScripts" runat="server" />

<div id="siteWrapper">
    <div id="userControls" class="container">
        <div class="row-fluid">
            <div class="span2 language pull-left">
                <dnn:LANGUAGE runat="server" id="LANGUAGE1"  showMenu="False" showLinks="True" />
            </div>
            <div id="search" class="span3 pull-right">
                <dnn:SEARCH ID="dnnSearch" runat="server" ShowSite="false" ShowWeb="false" EnableTheming="true" Submit="Search" CssClass="SearchButton" />
            </div><!---/search-->
            <div id="login" class="span5 pull-right">
                <dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />
                <dnn:USER ID="dnnUser" runat="server" LegacyMode="false" /> 
            </div><!--/login-->
        </div>
    </div><!--/userControls-->
    <div id="siteHeadouter">
        <div id="siteHeadinner" class="container">
        	<div class="navbar">
            	<div class="navbar-inner">
                    <span class="brand visible-desktop">
                        <dnn:LOGO runat="server" id="dnnLOGO" />
                    </span><!--/Logo-->
                    <span class="brand hidden-desktop">
                        <dnn:LOGO runat="server" id="dnnLOGOmobi" />
                    </span><!--/Logo-->
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">Menu</a>
                    <div class="nav-collapse collapse pull-right">
                        <dnn:MENU ID="bootstrapNav" MenuStyle="bootstrapNav" runat="server"></dnn:MENU>
                    </div><!-- END nav-collapse -->
                </div><!-- END navbar-inner -->
			</div><!-- END navbar -->
        </div><!--/siteHeadinner-->    
    </div><!--/siteHeadouter-->
    <div id="contentWrapper">
        <div class="container">
            <div class="row-fluid">
    	        <div id="Breadcrumb" class="span12"><dnn:BREADCRUMB ID="dnnBreadcrumb" runat="server" CssClass="breadcrumbLink" RootLevel="0" Separator="&lt;img src=&quot;images/breadcrumb.png&quot;&gt;" /></div>
            </div>
            <div class="row-fluid">
		        <div id="ContentPane" class="contentPane" runat="server"></div>
            </div>
            <div class="row-fluid">
                <div class="span8">
                    <div class="row-fluid">
			            <div id="leftPane" class="leftPane span12" runat="server"></div>
                    </div>
                    <div class="row-fluid">
				        <div id="leftPaneLowerLeft" class="span6 leftPaneLowerLeft" runat="server"></div>
				        <div id="leftPaneLowerRight" class="span6 leftPaneLowerRight" runat="server"></div>
                    </div>
                    <div class="row-fluid">
			            <div id="leftPaneBottom" class="span12" runat="server"></div>
                    </div>
                </div>
                <div class="span4">
                    <div id="rightPane" class="twoColRightPane" runat="server"></div>
                </div>
            </div>
             <div class="row-fluid">
		        <div id="FooterPane" class="contentPane" runat="server"></div>
            </div>
        </div>
	</div><!--/contentWrapper-->
</div><!--/siteWrapper-->

    	
	
	



