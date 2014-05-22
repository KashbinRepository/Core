// 
// DotNetNuke® - http://www.dotnetnuke.com 
// Copyright (c) 2002-2012 
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
using System.Web.UI;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Exceptions;
using Samarpan.Providers.Messaging.Transport;
using Samarpan.Providers.Messaging.Transport.Email.SimpleMailTransferProtocol;

namespace Samarpan.Modules.Footer
{

    /// ----------------------------------------------------------------------------- 
    /// <summary> 
    /// The ViewFooter class displays the content 
    /// </summary> 
    /// <remarks> 
    /// </remarks> 
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 
    partial class ViewFooter : PortalModuleBase, IActionable
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
                //SessionServiceFactory.InitializeModule(Request.ApplicationPath, Request.RawUrl);
                DotNetNuke.Framework.jQuery.RequestRegistration();

                FooterSettings settingsData = new FooterSettings(this.TabModuleId);

                if (!string.IsNullOrEmpty(settingsData.ShowCopyright))
                {
                    this.hdnFooterCopyright.Value = settingsData.ShowCopyright;
                }
                if (!string.IsNullOrEmpty(settingsData.CopyrightText))
                {
                    this.hdnFooterCopyrightText.Value = settingsData.CopyrightText;
                }
                if (!string.IsNullOrEmpty(settingsData.ShowPrivacy))
                {
                    this.hdnFooterPrivacy.Value = settingsData.ShowPrivacy;
                }
                if (!string.IsNullOrEmpty(settingsData.SecLinkToPrivacy))
                {
                    this.hdnFooterPrivacyLink.Value = settingsData.SecLinkToPrivacy;
                }
                if (!string.IsNullOrEmpty(settingsData.ShowContactUs))
                {
                    this.hdnFooterContactUs.Value = settingsData.ShowContactUs;
                }
                if (!string.IsNullOrEmpty(settingsData.SecLinkToContactUs))
                {
                    this.hdnFooterContactUsLink.Value = settingsData.SecLinkToContactUs;
                }
                if (!string.IsNullOrEmpty(settingsData.ShowLogo))
                {
                    this.hdnFooterLogo.Value = settingsData.ShowLogo;
                }

                if (!string.IsNullOrEmpty(settingsData.LinkToFacebook))
                {
                    this.hdnFacebook.Value = settingsData.LinkToFacebook;
                }

                if (!string.IsNullOrEmpty(settingsData.LinkToYoutube))
                {
                    this.hdnYoutube.Value = settingsData.LinkToYoutube;
                }

                this.hdnSkinPath.Value = PortalSettings.ActiveTab.SkinPath;
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
                return Actions;
            }
        }




        public void ContactUs()
        {
            IMessageConfiguration config=new MessageConfiguration();

            Provider smtp = new Provider(config);
          // IMessageRequest request = new MessageRequest();
            //request.Attributes.Add("From", "test@micros.com");
           // smtp.SendMessage(request);

        }

        #endregion

    }

}