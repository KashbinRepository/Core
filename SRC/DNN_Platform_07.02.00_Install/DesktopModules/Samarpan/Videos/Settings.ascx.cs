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

namespace Samarpan.Modules.Videos
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
                    VideosSettings settingsData = new VideosSettings(this.TabModuleId);

                    if (!string.IsNullOrEmpty(settingsData.youTubeChannelURL))
                    {
                        this.txtyouTubeChannelURL.Text = settingsData.youTubeChannelURL;
                    }

                    if (!string.IsNullOrEmpty(settingsData.youTubePlaylistURL))
                    {
                        this.txtyouTubePlaylistURL.Text = settingsData.youTubePlaylistURL;
                    }

                    if (!string.IsNullOrEmpty(settingsData.youmaxDefaultTab))
                    {
                        this.txtyoumaxDefaultTab.Text = settingsData.youmaxDefaultTab;
                    }

                    if (!string.IsNullOrEmpty(settingsData.showFeaturedVideoOnLoad))
                    {
                        this.chkshowFeaturedVideoOnLoad.Checked = Convert.ToBoolean(settingsData.showFeaturedVideoOnLoad);
                    }

                    if (!string.IsNullOrEmpty(settingsData.showVideoInLightbox))
                    {
                        this.chkshowVideoInLightbox.Checked = Convert.ToBoolean(settingsData.showVideoInLightbox);
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
                VideosSettings settingsData = new VideosSettings(this.TabModuleId);

                settingsData.youTubeChannelURL = this.txtyouTubeChannelURL.Text;
                settingsData.youTubePlaylistURL = this.txtyouTubePlaylistURL.Text;
                settingsData.youmaxDefaultTab = this.txtyoumaxDefaultTab.Text;
                settingsData.showFeaturedVideoOnLoad = this.chkshowFeaturedVideoOnLoad.Checked.ToString();
                settingsData.showVideoInLightbox = this.chkshowVideoInLightbox.Checked.ToString();

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

