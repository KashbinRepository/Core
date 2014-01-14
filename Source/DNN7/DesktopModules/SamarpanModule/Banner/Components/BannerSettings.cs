using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetNuke.Entities.Modules;
using System.Collections;

namespace Kashbin.Modules.Banner
{
    public class BannerSettings
    {
        ModuleController controller;
        int tabModuleId;

        public BannerSettings(int tabModuleId)
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
        /// get/set BannerOption 
        /// </summary>

        public string BannerOption
        {
            get { return ReadSetting<string>("BannerOption", null); }
            set { WriteSetting("BannerOption", value); }
        }

        /// <summary>
        /// get/set BannerOption 
        /// </summary>

        public string ShowLogo
        {
            get { return ReadSetting<string>("ShowLogo", null); }
            set { WriteSetting("ShowLogo", value); }
        }

        #endregion
    }
}