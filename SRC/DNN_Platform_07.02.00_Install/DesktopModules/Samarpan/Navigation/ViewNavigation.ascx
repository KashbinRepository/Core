<%@ Control Language="C#" Inherits="Samarpan.Modules.Navigation.ViewNavigation"
    AutoEventWireup="true" CodeBehind="ViewNavigation.ascx.cs" %>
<script src="<%= ResolveUrl("~/DesktopModules/Samarpan/Navigation/Assets/mycentral.navigation.js") %>"
    type="text/javascript"></script>
<div class="NavigationContainer" id="NavigationContainer">
    <div class="NavigationMainContent" id="NavigationMainContent">
        <div class="header" id="header">
        </div>
    </div>
</div>
<input type="hidden" runat="server" id="hdnLoadByItSelf" name="hdnLoadByItSelf" />
<input type="hidden" runat="server" id="hdnLoginLink" name="hdnLoginLink" />
<input type="hidden" runat="server" id="hdnSignOutRedirectLink" name="hdnSignOutRedirectLink" />
<input type="hidden" runat="server" id="hdnNavLink1" name="hdnNavLink1" />
<input type="hidden" runat="server" id="hdnNavLink2" name="hdnNavLink2" />
<input type="hidden" runat="server" id="hdnNavLink3" name="hdnNavLink3" />
<input type="hidden" runat="server" id="hdnNavLink4" name="hdnNavLink4" />
<input type="hidden" runat="server" id="hdnNavLink5" name="hdnNavLink5" />
<input type="hidden" runat="server" id="hdnNavLink6" name="hdnNavLink6" />
<input type="hidden" runat="server" id="hdnNavLink7" name="hdnNavLink7" />
<input type="hidden" runat="server" id="hdnNavLink8" name="hdnNavLink8" />
<input type="hidden" runat="server" id="hdnNavLink9" name="hdnNavLink9" />
<input type="hidden" runat="server" id="hdnNavLink10" name="hdnNavLink10" />
<input type="hidden" runat="server" id="hdnNavText1" name="hdnNavText1" />
<input type="hidden" runat="server" id="hdnNavText2" name="hdnNavText2" />
<input type="hidden" runat="server" id="hdnNavText3" name="hdnNavText3" />
<input type="hidden" runat="server" id="hdnNavText4" name="hdnNavText4" />
<input type="hidden" runat="server" id="hdnNavText5" name="hdnNavText5" />
<input type="hidden" runat="server" id="hdnNavText6" name="hdnNavText6" />
<input type="hidden" runat="server" id="hdnNavText7" name="hdnNavText7" />
<input type="hidden" runat="server" id="hdnNavText8" name="hdnNavText8" />
<input type="hidden" runat="server" id="hdnNavText9" name="hdnNavText9" />
<input type="hidden" runat="server" id="hdnNavText10" name="hdnNavText10" />
<input type="hidden" runat="server" id="hdnIsSecurePage" name="hdnIsSecurePage" />
<input type="hidden" runat="server" id="hdnIsAnonymousUser" name="hdnIsAnonymousUser" />
<script language="javascript" type="text/javascript">
    var isSecureNavigation = false;
    $(document).ready(function () {
        var hdnLoginLink = '',
            hdnSignOutRedirectLink = '',
            hdnNavLink1 = '',
            hdnNavLink2 = '',
            hdnNavLink3 = '',
            hdnNavLink4 = '',
            hdnNavLink5 = '',
            hdnNavLink6 = '',
            hdnNavLink7 = '',
            hdnNavLink8 = '',
            hdnNavLink9 = '',
            hdnNavLink10 = '',
            hdnNavText1 = '',
            hdnNavText2 = '',
            hdnNavText3 = '',
            hdnNavText4 = '',
            hdnNavText5 = '',
            hdnNavText6 = '',
            hdnNavText7 = '',
            hdnNavText8 = '',
            hdnNavText9 = '',
            hdnNavText10 = '',
            arrLinkContainer = new Array();

        var hdnIsSecurePage = $("#<%= hdnIsSecurePage.ClientID %>").val();
        if (hdnIsSecurePage != null && hdnIsSecurePage == "True") {
            isSecureNavigation = true;
        }

        var LoadByItSelf = true;
        var hdnLoadByItSelf = $("#<%= hdnLoadByItSelf.ClientID %>").val();
        if (hdnLoadByItSelf != null && hdnLoadByItSelf == "False") {
            LoadByItSelf = false;
        }

        var IsAnonymousUser = false;
        var hdnIsAnonymousUser = $("#<%= hdnIsAnonymousUser.ClientID %>").val();
        if (hdnIsAnonymousUser != null && hdnIsAnonymousUser == "true") {
            IsAnonymousUser = true;
        }

        hdnLoginLink = $("#<%= hdnLoginLink.ClientID %>").val();
        hdnSignOutRedirectLink = $("#<%= hdnSignOutRedirectLink.ClientID %>").val();
        hdnNavLink1 = $("#<%= hdnNavLink1.ClientID %>").val();
        hdnNavLink2 = $("#<%= hdnNavLink2.ClientID %>").val();
        hdnNavLink3 = $("#<%= hdnNavLink3.ClientID %>").val();
        hdnNavLink4 = $("#<%= hdnNavLink4.ClientID %>").val();
        hdnNavLink5 = $("#<%= hdnNavLink5.ClientID %>").val();
        hdnNavLink6 = $("#<%= hdnNavLink6.ClientID %>").val();
        hdnNavLink7 = $("#<%= hdnNavLink7.ClientID %>").val();
        hdnNavLink8 = $("#<%= hdnNavLink8.ClientID %>").val();
        hdnNavLink9 = $("#<%= hdnNavLink9.ClientID %>").val();
        hdnNavLink10 = $("#<%= hdnNavLink10.ClientID %>").val();

        hdnNavText1 = $("#<%= hdnNavText1.ClientID %>").val();
        hdnNavText2 = $("#<%= hdnNavText2.ClientID %>").val();
        hdnNavText3 = $("#<%= hdnNavText3.ClientID %>").val();
        hdnNavText4 = $("#<%= hdnNavText4.ClientID %>").val();
        hdnNavText5 = $("#<%= hdnNavText5.ClientID %>").val();
        hdnNavText6 = $("#<%= hdnNavText6.ClientID %>").val();
        hdnNavText7 = $("#<%= hdnNavText7.ClientID %>").val();
        hdnNavText8 = $("#<%= hdnNavText8.ClientID %>").val();
        hdnNavText9 = $("#<%= hdnNavText9.ClientID %>").val();
        hdnNavText10 = $("#<%= hdnNavText10.ClientID %>").val();

        if (hdnNavLink1 != null && hdnNavLink1 != '' && hdnNavText1 != null && hdnNavText1 != '') {
            arrLinkContainer.push(new linkObject(hdnNavLink1, hdnNavText1));
        }
        if (hdnNavLink2 != null && hdnNavLink2 != '' && hdnNavText2 != null && hdnNavText2 != '') {
            arrLinkContainer.push(new linkObject(hdnNavLink2, hdnNavText2));
        }
        if (hdnNavLink3 != null && hdnNavLink3 != '' && hdnNavText3 != null && hdnNavText3 != '') {
            arrLinkContainer.push(new linkObject(hdnNavLink3, hdnNavText3));
        }
        if (hdnNavLink4 != null && hdnNavLink4 != '' && hdnNavText4 != null && hdnNavText4 != '') {
            arrLinkContainer.push(new linkObject(hdnNavLink4, hdnNavText4));
        }
        if (hdnNavLink5 != null && hdnNavLink5 != '' && hdnNavText5 != null && hdnNavText5 != '') {
            arrLinkContainer.push(new linkObject(hdnNavLink5, hdnNavText5));
        }
        if (hdnNavLink6 != null && hdnNavLink6 != '' && hdnNavText6 != null && hdnNavText6 != '') {
            arrLinkContainer.push(new linkObject(hdnNavLink6, hdnNavText6));
        }
        if (hdnNavLink7 != null && hdnNavLink7 != '' && hdnNavText7 != null && hdnNavText7 != '') {
            arrLinkContainer.push(new linkObject(hdnNavLink7, hdnNavText7));
        }
        if (hdnNavLink8 != null && hdnNavLink8 != '' && hdnNavText8 != null && hdnNavText8 != '') {
            arrLinkContainer.push(new linkObject(hdnNavLink8, hdnNavText8));
        }
        if (hdnNavLink9 != null && hdnNavLink9 != '' && hdnNavText9 != null && hdnNavText9 != '') {
            arrLinkContainer.push(new linkObject(hdnNavLink9, hdnNavText9));
        }
        if (hdnNavLink10 != null && hdnNavLink10 != '' && hdnNavText10 != null && hdnNavText10 != '') {
            arrLinkContainer.push(new linkObject(hdnNavLink10, hdnNavText10));
        }

        $('#header').navigation({
            data: arrLinkContainer,
            loginLink: hdnLoginLink.replace(/\s/g, ''),
            signOutLink: hdnSignOutRedirectLink.replace(/\s/g, ''),
            LoadByItSelf: LoadByItSelf,
            isAnonymousUser: IsAnonymousUser
        });
    });

    function linkObject(link, text) {
        this.link = link.replace(/\s/g, '');
        this.value = text;
        this.text = text.replace(/\s/g, '-');
    }
</script>
<script id="mycentral-navigation-template" type="text/x-jquery-tmpl">
 <input type="button" value="${value}" id="${text}-link" class="navLink" data-link-id="${text}-link" data-link="${link}" data-link-action="nav-link-selected" /> 
</script>
