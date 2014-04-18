/*

Samarpan widget for Navigation.

*/

(function (mycentral, $) {

    $.widget('mycentral.navigation', {
        options: {
            getSessionData: mycentral.dataManager.getSessionData,
            saveSessionData: mycentral.dataManager.saveSessionData,
            abandonSessionData: mycentral.dataManager.abandonSessionData,
            eventPublisher: mycentral.pubsub.publish,
            subscribe: mycentral.pubsub.subscribe,
            data: null,
            LoadByItSelf: true,
            templateId: '#mycentral-navigation-template',
            activeClass: 'currentnavLink',
            normalClass: 'navLink',
            signOutText: 'SignOut',
            signOutLink: 'StoreLocator.aspx',
            loginText: 'Login',
            loginLink: 'MyCentralLogin.aspx',
            isAnonymousUser: false
        },
        _create: function () {
            mycentral.navigation = this;
            this._addClasses();
            this._subscribeToGlobalEvents();
            if (this.options.LoadByItSelf) {
                if (this.options.eventPublisher && $.isFunction(this.options.eventPublisher)) {
                    this.options.eventPublisher(mycentral.events.NavBarReload, false);
                }
            }
        },
        _addClasses: function () {
            this.element.find('div > div > h1').addClass('data-header-text');
        },
        _subscribeToGlobalEvents: function () {
            var that = this;

            if (this.options.subscribe && $.isFunction(this.options.subscribe)) {
                this.options.subscribe(mycentral.events.NavBarReload, function (fromConfirmation) {
                    that._applyTemplate(fromConfirmation);
                }, this);
            }
        },
        _bindNavigation: function () {
            var that = this;
            this.element.find('a').removeClass(that.options.activeClass);
            var URL = window.location.pathname;
            var pageName = URL.substring(URL.lastIndexOf('/') + 1);
            this.element.find('a').each(function (index) {
                var currentId = $(this)[0].id;
                var linkattr = $('#' + currentId).attr('data-link') + '.aspx';
                if (pageName.toLowerCase() == linkattr.toLowerCase()) {
                    $(this).removeClass(that.options.normalClass).addClass(that.options.activeClass);
                }
            });

            this.element.delegate('[data-link-action]', 'click', function (evt) {
                //var $this = $(this),
                var action = "", dataLink = "", isSignout = false, isLogin = false;
                action = evt.target.getAttribute("data-link-action");
                dataLink = evt.target.getAttribute("data-link");
                isSignout = evt.target.getAttribute("data-is-signout");
                isLogin = evt.target.getAttribute("data-is-login");
                switch (action) {
                    case 'nav-link-selected':
                        if (isSignout) {
                            that._abandonSessionAndRedirect(dataLink);
                        }
                        else if (isLogin) {
                            that._saveSessionDataAndRedirect(mycentral.SessionKey.FromWhichPage, mycentral.CurrentPage.navigation, dataLink);
                        }
                        else {
                            that._redirect('navigation', dataLink);
                        }
                        evt.preventDefault();
                        evt.stopPropagation();
                        return false;
                        break;
                }
            });
        },
        _applyTemplate: function (fromConfirmation) {
            var that = this;
            if ((this.options.templateId !== undefined)
                                            && ($(this.options.templateId).length > 0)
                                            && (this.options.data)) {
                this.element.html($(this.options.templateId).tmpl(this.options.data));

                var loginText = that.options.loginText.replace(/\s/g, '-');
                var loginLink = that.options.loginLink.replace(/\s/g, '');
                var signOutText = that.options.signOutText.replace(/\s/g, '-');
                var signOutLink = that.options.signOutLink.replace(/\s/g, '');

                if (fromConfirmation != null && fromConfirmation == true) {
                    var loginHtml = '';
         //           loginHtml = '<input type="button" id="' + loginText + '-link" data-is-login="true" class="navLink" data-link-id="' + loginText + '-link"  data-link="' + loginLink + '" data-link-action="nav-link-selected"  value="' + that.options.loginText + '"/>'
                    that.element.append(loginHtml);
                }
                else {
                    that.options.getSessionData({
                        isSecure: isSecureNavigation,
                        type: 'POST',
                        data: "{sessionKey:'" + mycentral.SessionKey.UserId + "'}",
                        success: function (data) {
                            if (data.d != null && data.d != '') {
                                if (!that.options.isAnonymousUser) {
                                    var signoutHtml = '';
                                    signoutHtml = '<input type="button" id="' + signOutText + '-link" data-is-signout="true" class="navLink" data-link-id="' + signOutText + '-link"  data-link="' + signOutLink + '" data-link-action="nav-link-selected" value="' + that.options.signOutText + '"/>';
                                    that.element.append(signoutHtml);
                                }
                            }
                            else {
                                var loginHtml = '';
                              loginHtml = '<input type="button" id="' + loginText + '-link" data-is-login="true" class="navLink" data-link-id="' + loginText + '-link"  data-link="' + loginLink + '" data-link-action="nav-link-selected"  value="' + that.options.loginText + '"/>'
                               that.element.append(loginHtml);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //mycentral.notify(mycentral.messages.contactAdministrator);
                        }
                    });
                }
                this.element.undelegate('[data-link-action]');
                this._bindNavigation();
            }
        },
        _saveSessionDataAndRedirect: function (key, value, dataLink) {
            var that = this;
            that.options.saveSessionData({
                isSecure: isSecureNavigation,
                type: 'POST',
                data: "{sessionKey:'" + key + "', sessionValue:'" + value + "'}",
                success: function (data) {
                    that._redirect('navigation', dataLink);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    //mycentral.notify(mycentral.messages.contactAdministrator);
                }
            });
        },
        _abandonSessionAndRedirect: function (redirectPage) {
            var that = this;
            that.options.abandonSessionData({
                isSecure: isSecureNavigation,
                type: 'POST',
                data: "{redirectDefault: false}",
                success: function (data) {
                    that._redirect('navigation', redirectPage);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    //mycentral.notify(mycentral.messages.contactAdministrator);
                }
            });
        },
        _redirect: function (currentPage, redirectPage) {
            mycentral.landingPageManager.redirect({
                source: currentPage,
                redirectPage: redirectPage
            });
        }
    });
} (this.mycentral = this.mycentral || {}, jQuery));