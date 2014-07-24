using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetNuke.Entities.Modules;
using System.Collections;

namespace Samarpan.Modules.Videos
{
    public class VideosSettings
    {
        ModuleController controller;
        int tabModuleId;

        public VideosSettings(int tabModuleId)
        {
            controller = new ModuleController();
            this.tabModuleId = tabModuleId;
        }

        protected T ReadSetting<T>(string settingName, T defaultValue)
        {
            Hashtable settings = controller.GetTabModuleSettings(this.tabModuleId);

            T ret = default(T);

            if (settings.ContainsKey(settingName))
            {
                System.ComponentModel.TypeConverter tc = System.ComponentModel.TypeDescriptor.GetConverter(typeof(T));
                try
                {
                    ret = (T)tc.ConvertFrom(settings[settingName]);
                }
                catch
                {
                    ret = defaultValue;
                }
            }
            else
                ret = defaultValue;

            return ret;
        }

        protected void WriteSetting(string settingName, string value)
        {
            controller.UpdateTabModuleSetting(this.tabModuleId, settingName, value);
        }

        #region public properties


        /// <summary>
        /// get/set ShowCopyright 
        /// </summary>

        public string youTubeChannelURL
        {
            get { return ReadSetting<string>("youTubeChannelURL", null); }
            set { WriteSetting("youTubeChannelURL", value); }
        }

        /// <summary>
        /// get/set CopyrightText 
        /// </summary>

        public string youTubePlaylistURL
        {
            get { return ReadSetting<string>("youTubePlaylistURL", null); }
            set { WriteSetting("youTubePlaylistURL", value); }
        }


        /// <summary>
        /// get/set ShowPrivacy 
        /// </summary>

        public string youmaxDefaultTab
        {
            get { return ReadSetting<string>("youmaxDefaultTab", null); }
            set { WriteSetting("youmaxDefaultTab", value); }
        }

        /// <summary>
        /// get/set SecLinkToPrivacy 
        /// </summary>

        public string showFeaturedVideoOnLoad
        {
            get { return ReadSetting<string>("showFeaturedVideoOnLoad", null); }
            set { WriteSetting("showFeaturedVideoOnLoad", value); }
        }

        /// <summary>
        /// get/set ShowContactUs 
        /// </summary>

        public string showVideoInLightbox
        {
            get { return ReadSetting<string>("showVideoInLightbox", null); }
            set { WriteSetting("showVideoInLightbox", value); }
        }

       
        #endregion
    }
}