<%@ Control Language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BANNER" Src="~/Admin/Skins/Banner.ascx" %>
<%@ Register TagPrefix="uc" TagName="LoadScripts" Src="~/Admin/Skins/LoadScripts.ascx" %>
<dnn:STYLES runat="server" ID="DefaultESCSS" Name="DefaultESCSS" StyleSheet="DefaultES.css" Condition="" UseSkinPath="true" />
<dnn:STYLES runat="server" ID="CustomCSS" Name="CustomCSS" StyleSheet="Custom.css" Condition="" UseSkinPath="true" />



<script type="text/javascript">
    var baseUrl = '<%= ResolveUrl("~/") %>';
    var baseServiceUrl = '<%= ConfigurationManager.AppSettings("BaseServiceUrl").ToString() %>';
</script>
<uc:LoadScripts ID="ucScripts" runat="server" />
<div id="Notification">
</div>
<div id="ES_Table">
    <div id="ES_Row">
        <div class="ES_Cell">
            <div class="ES_Main">
                <div class="ES_Left_BG">
                    <div class="ES_Right_BG">
                        <div class="Content_Pad">
                            <div class="ES_Main_Content_Width">
                                <div runat="server" id="NavBar" class="NavBar">
                                </div>
                                <div runat="server" id="TopBar" class="TopBar">
                                    <div>
                                    </div>
                                    <%--Do not remove this line. If Pane is empty DNNEmptyPane is added to the class by dnn which we do not want in this case.--%>
                                </div>
                                <div id="BannerPane" class="BannerPane" runat="server">
                                </div>
                                <% If DotNetNuke.Security.PortalSecurity.IsInRole("Registered Users") Then%>
                                <div class="LoginBar">
                                    <div id="Login">
                                        <dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" />|<dnn:USER ID="dnnUser"
                                            runat="server" />
                                    </div>
                                </div>
                                <% End If%>
                                <div id="top_gradient" class="top_gradient">
                                </div>
                                <div id="PanelBodyCenter">
                                    <div id="panelBackground">
                                        <div id="ContentBackground">
                                            <div id="LeftPane" class="LeftPane" runat="server">
                                            </div>
                                            <div id="ContentPane" class="ContentPane" runat="server">
                                            </div>
                                            <div id="RightPane" class="RightPane" runat="server">
                                            </div>
                                            <div id="BottomPane" class="BottomPane" runat="server">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="bottom_gradient" class="bottom_gradient">
                                </div>
                            </div>
                        </div>
                        <div id="Footer">
                            <div id="FooterPane" runat="server">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<dnn:STYLES runat="server" ID="StylesIE6" Name="IE6Minus" StyleSheet="../CSS/ie6skin.css"
    Condition="LT IE 7" UseSkinPath="true" />
<dnn:STYLES runat="server" ID="StylesIE7" Name="IE7Minus" StyleSheet="../CSS/ie7skin.css"
    Condition="LT IE 8" UseSkinPath="true" />
<dnn:STYLES runat="server" ID="StylesIE7Template" Name="IE7MinusTemplate" StyleSheet="IE7Skin.css"
    Condition="LT IE 8" UseSkinPath="true" />

<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#Notification').status();
    });
</script>


