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

using DotNetNuke;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;

namespace Samarpan.Modules.Footer
{

    /// ----------------------------------------------------------------------------- 
    /// <summary> 
    /// The Settings class manages Module Settings 
    /// </summary> 
    /// <remarks> 
    /// </remarks> 
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 
    partial class Settings : ModuleSettingsBase
    {

        #region "Base Method Implementations"

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// LoadSettings loads the settings from the Database and displays them 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public override void LoadSettings()
        {
            try
            {
                if (!IsPostBack)
                {
                    FooterSettings settingsData = new FooterSettings(this.TabModuleId);

                    if (!string.IsNullOrEmpty(settingsData.ShowCopyright))
                    {
                        this.chkCopyRight.Checked = Convert.ToBoolean(settingsData.ShowCopyright);
                    }
                    if (!string.IsNullOrEmpty(settingsData.CopyrightText))
                    {
                        this.txtCopyRightText.Text = settingsData.CopyrightText;
                    }
                    if (!string.IsNullOrEmpty(settingsData.ShowPrivacy))
                    {
                        this.chkPrivacy.Checked = Convert.ToBoolean(settingsData.ShowPrivacy);
                    }
                    if (!string.IsNullOrEmpty(settingsData.SecLinkToPrivacy))
                    {
                        this.txtPrivacyLink.Text = settingsData.SecLinkToPrivacy;
                    }
                    if (!string.IsNullOrEmpty(settingsData.ShowContactUs))
                    {
                        this.chkContactUs.Checked = Convert.ToBoolean(settingsData.ShowContactUs);
                    }
                    if (!string.IsNullOrEmpty(settingsData.SecLinkToContactUs))
                    {
                        this.txtContactUsLink.Text = settingsData.SecLinkToContactUs;
                    }
                    if (!string.IsNullOrEmpty(settingsData.ShowLogo))
                    {
                        this.chkLogo.Checked = Convert.ToBoolean(settingsData.ShowLogo);
                    }
                    if (!string.IsNullOrEmpty(settingsData.LinkToFacebook))
                    {
                        this.txtFacebookLink.Text = settingsData.LinkToFacebook;
                    }
                    if (!string.IsNullOrEmpty(settingsData.LinkToYoutube))
                    {
                        this.txtYoutubeLink.Text = settingsData.LinkToYoutube;
                    }

                }
            }
            catch (Exception exc)
            {
                //Module failed to load 
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// UpdateSettings saves the modified settings to the Database 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public override void UpdateSettings()
        {
            try
            {
                FooterSettings settingsData = new FooterSettings(this.TabModuleId);
                settingsData.ShowCopyright = this.chkCopyRight.Checked.ToString();
                settingsData.CopyrightText = this.txtCopyRightText.Text;
                settingsData.ShowPrivacy = this.chkPrivacy.Checked.ToString();
                settingsData.SecLinkToPrivacy = this.txtPrivacyLink.Text;
                settingsData.ShowContactUs = this.chkContactUs.Checked.ToString();
                settingsData.SecLinkToContactUs = this.txtContactUsLink.Text;
                settingsData.ShowLogo = this.chkLogo.Checked.ToString();
                settingsData.LinkToFacebook = this.txtFacebookLink.Text;
                settingsData.LinkToYoutube = this.txtYoutubeLink.Text;

            }
            catch (Exception exc)
            {
                //Module failed to load 
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        #endregion

    }

}

