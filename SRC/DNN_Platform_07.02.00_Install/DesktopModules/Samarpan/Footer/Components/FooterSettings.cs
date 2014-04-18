using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetNuke.Entities.Modules;
using System.Collections;

namespace Samarpan.Modules.Footer
{
    public class FooterSettings
    {
        ModuleController controller;
        int tabModuleId;

        public FooterSettings(int tabModuleId)
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

        public string ShowCopyright
        {
            get { return ReadSetting<string>("ShowCopyright", null); }
            set { WriteSetting("ShowCopyright", value); }
        }

        /// <summary>
        /// get/set CopyrightText 
        /// </summary>

        public string CopyrightText
        {
            get { return ReadSetting<string>("CopyrightText", null); }
            set { WriteSetting("CopyrightText", value); }
        }


        /// <summary>
        /// get/set ShowPrivacy 
        /// </summary>

        public string ShowPrivacy
        {
            get { return ReadSetting<string>("ShowPrivacy", null); }
            set { WriteSetting("ShowPrivacy", value); }
        }

        /// <summary>
        /// get/set SecLinkToPrivacy 
        /// </summary>

        public string SecLinkToPrivacy
        {
            get { return ReadSetting<string>("SecLinkToPrivacy", null); }
            set { WriteSetting("SecLinkToPrivacy", value); }
        }

        /// <summary>
        /// get/set ShowContactUs 
        /// </summary>

        public string ShowContactUs
        {
            get { return ReadSetting<string>("ShowContactUs", null); }
            set { WriteSetting("ShowContactUs", value); }
        }

        /// <summary>
        /// get/set SecLinkToContactUs 
        /// </summary>

        public string SecLinkToContactUs
        {
            get { return ReadSetting<string>("SecLinkToContactUs", null); }
            set { WriteSetting("SecLinkToContactUs", value); }
        }

        /// <summary>
        /// get/set ShowLogo 
        /// </summary>

        public string ShowLogo
        {
            get { return ReadSetting<string>("ShowLogo", null); }
            set { WriteSetting("ShowLogo", value); }
        }


        /// <summary>
        /// get/set SecLinkToPrivacy 
        /// </summary>

        public string LinkToFacebook
        {
            get { return ReadSetting<string>("LinkToFacebook", null); }
            set { WriteSetting("LinkToFacebook", value); }
        }



        /// <summary>
        /// get/set SecLinkToPrivacy 
        /// </summary>

        public string LinkToYoutube
        {
            get { return ReadSetting<string>("LinkToYoutube", null); }
            set { WriteSetting("LinkToYoutube", value); }
        }

        #endregion
    }
}