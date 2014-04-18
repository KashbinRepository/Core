// 
// DotNetNuke® - http://www.dotnetnuke.com 
// Copyright (c) 2002-2011 
// by DotNetNuke Corporation 
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
// to permit persons to whom the Software is furnished to do so, subject to the following conditions: 
// 
// The above copyright notice and this permission notice shall be included in all copies or substantial portions 
// of the Software. 
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE. 
// 

using System;
using System.Web.UI.MobileControls;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Entities.Tabs;
using DotNetNuke.Services.Exceptions;
using System.Web;

namespace Samarpan.Modules.Navigation
{

    /// ----------------------------------------------------------------------------- 
    /// <summary> 
    /// The ViewMyCentralNavigation class displays the content 
    /// </summary> 
    /// <remarks> 
    /// </remarks> 
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 
    partial class ViewNavigation : PortalModuleBase, IActionable
    {

        #region "Event Handlers"

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// Page_Load runs when the control is loaded 
        /// </summary> 
        /// ----------------------------------------------------------------------------- 
        protected void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                TabController tabController = new TabController();
                TabInfo tabinfo = tabController.GetTab(this.TabId, this.PortalId, true);
                //this.hdnIsSecurePage.Value = tabinfo.IsSecure.ToString();
               // SessionServiceFactory.InitializeModule(Request.ApplicationPath, Request.RawUrl);
                DotNetNuke.Framework.jQuery.RequestRegistration();

                NavigationSettings settingsData = new NavigationSettings(this.TabModuleId);

                //var userId = (HttpContext.Current.Session[SessionItemKey.UserId] != null) ? HttpContext.Current.Session[SessionItemKey.UserId].ToString() : string.Empty;
                //hdnIsAnonymousUser.Value = (userId == Constants.AnonymousUser) ? "true" : "false";
                var isAnonymous = bool.Parse(hdnIsAnonymousUser.Value);

                if (!string.IsNullOrEmpty(settingsData.LoadByItSelf))
                {
                    this.hdnLoadByItSelf.Value = settingsData.LoadByItSelf;
                }

                if (!string.IsNullOrEmpty(settingsData.SecLoginLink))
                {
                    hdnLoginLink.Value = settingsData.SecLoginLink;
                }
                if (!string.IsNullOrEmpty(settingsData.SecSignOutRedirectLink))
                {
                    hdnSignOutRedirectLink.Value = settingsData.SecSignOutRedirectLink;
                }
                if (!string.IsNullOrEmpty(settingsData.SecNavLink1))
                {
                    bool hideIfAnonymous = false;
                    bool.TryParse(settingsData.HideAnonymousLink1, out hideIfAnonymous);
                    if ((isAnonymous && !hideIfAnonymous) || !isAnonymous)
                        hdnNavLink1.Value = settingsData.SecNavLink1;
                }
                if (!string.IsNullOrEmpty(settingsData.SecNavLink2))
                {
                    bool hideIfAnonymous = false;
                    bool.TryParse(settingsData.HideAnonymousLink2, out hideIfAnonymous);
                    if ((isAnonymous && !hideIfAnonymous) || !isAnonymous)
                        hdnNavLink2.Value = settingsData.SecNavLink2;
                }
                if (!string.IsNullOrEmpty(settingsData.SecNavLink3))
                {
                    bool hideIfAnonymous = false;
                    bool.TryParse(settingsData.HideAnonymousLink3, out hideIfAnonymous);
                    if ((isAnonymous && !hideIfAnonymous) || !isAnonymous)
                        hdnNavLink3.Value = settingsData.SecNavLink3;
                }
                if (!string.IsNullOrEmpty(settingsData.SecNavLink4))
                {
                    bool hideIfAnonymous = false;
                    bool.TryParse(settingsData.HideAnonymousLink4, out hideIfAnonymous);
                    if ((isAnonymous && !hideIfAnonymous) || !isAnonymous)
                        hdnNavLink4.Value = settingsData.SecNavLink4;
                }
                if (!string.IsNullOrEmpty(settingsData.SecNavLink5))
                {
                    bool hideIfAnonymous = false;
                    bool.TryParse(settingsData.HideAnonymousLink5, out hideIfAnonymous);
                    if ((isAnonymous && !hideIfAnonymous) || !isAnonymous)
                        hdnNavLink5.Value = settingsData.SecNavLink5;
                }
                if (!string.IsNullOrEmpty(settingsData.SecNavLink6))
                {
                    bool hideIfAnonymous = false;
                    bool.TryParse(settingsData.HideAnonymousLink6, out hideIfAnonymous);
                    if ((isAnonymous && !hideIfAnonymous) || !isAnonymous)
                        hdnNavLink6.Value = settingsData.SecNavLink6;
                }
                if (!string.IsNullOrEmpty(settingsData.SecNavLink7))
                {
                    bool hideIfAnonymous = false;
                    bool.TryParse(settingsData.HideAnonymousLink7, out hideIfAnonymous);
                    if ((isAnonymous && !hideIfAnonymous) || !isAnonymous)
                        hdnNavLink7.Value = settingsData.SecNavLink7;
                }
                if (!string.IsNullOrEmpty(settingsData.SecNavLink8))
                {
                    bool hideIfAnonymous = false;
                    bool.TryParse(settingsData.HideAnonymousLink8, out hideIfAnonymous);
                    if ((isAnonymous && !hideIfAnonymous) || !isAnonymous)
                        hdnNavLink8.Value = settingsData.SecNavLink8;
                }
                if (!string.IsNullOrEmpty(settingsData.SecNavLink9))
                {
                    bool hideIfAnonymous = false;
                    bool.TryParse(settingsData.HideAnonymousLink9, out hideIfAnonymous);
                    if ((isAnonymous && !hideIfAnonymous) || !isAnonymous)
                        hdnNavLink9.Value = settingsData.SecNavLink9;
                }
                if (!string.IsNullOrEmpty(settingsData.SecNavLink10))
                {
                    bool hideIfAnonymous = false;
                    bool.TryParse(settingsData.HideAnonymousLink10, out hideIfAnonymous);
                    if ((isAnonymous && !hideIfAnonymous) || !isAnonymous)
                        hdnNavLink10.Value = settingsData.SecNavLink10;
                }


                if (!string.IsNullOrEmpty(settingsData.NavText1))
                {
                    hdnNavText1.Value = settingsData.NavText1;
                }
                if (!string.IsNullOrEmpty(settingsData.NavText2))
                {
                    hdnNavText2.Value = settingsData.NavText2;
                }
                if (!string.IsNullOrEmpty(settingsData.NavText3))
                {
                    hdnNavText3.Value = settingsData.NavText3;
                }
                if (!string.IsNullOrEmpty(settingsData.NavText4))
                {
                    hdnNavText4.Value = settingsData.NavText4;
                }
                if (!string.IsNullOrEmpty(settingsData.NavText5))
                {
                    hdnNavText5.Value = settingsData.NavText5;
                }
                if (!string.IsNullOrEmpty(settingsData.NavText6))
                {
                    hdnNavText6.Value = settingsData.NavText6;
                }
                if (!string.IsNullOrEmpty(settingsData.NavText7))
                {
                    hdnNavText7.Value = settingsData.NavText7;
                }
                if (!string.IsNullOrEmpty(settingsData.NavText8))
                {
                    hdnNavText8.Value = settingsData.NavText8;
                }
                if (!string.IsNullOrEmpty(settingsData.NavText9))
                {
                    hdnNavText9.Value = settingsData.NavText9;
                }
                if (!string.IsNullOrEmpty(settingsData.NavText10))
                {
                    hdnNavText10.Value = settingsData.NavText10;
                } 

                
            }
            catch (Exception exc)
            {
                //Module failed to load 
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        #endregion

        #region "Optional Interfaces"

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// Registers the module actions required for interfacing with the portal framework 
        /// </summary> 
        /// <value></value> 
        /// <returns></returns> 
        /// <remarks></remarks> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(GetNextActionID(), "Module Style Editor", //Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile),
                   ModuleActionType.AddContent, "", "edit.gif", EditUrl("ModuleStyleEditor"), false, DotNetNuke.Security.SecurityAccessLevel.Edit,
                    true, false);

                Actions.Add(GetNextActionID(), "Global Style Editor", //Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile),
                   ModuleActionType.AddContent, "", "edit.gif", EditUrl("GlobalStyleEditor"), false, DotNetNuke.Security.SecurityAccessLevel.Edit,
                    true, false);

                return Actions;
            }
        }

        #endregion

    }

}