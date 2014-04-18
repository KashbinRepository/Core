using System;
using System.Collections.Generic;
using System.Web;
using DotNetNuke.Entities.Modules;
using System.Collections;

namespace Samarpan.Modules.Navigation
{
    /// <summary>
    /// Provides strong typed access to settings used by module
    /// </summary>
    public class NavigationSettings
    {
        ModuleController controller;
        int tabModuleId;

        /// <summary>
        /// 
        /// </summary>
        public NavigationSettings(int tabModuleId)
        {
            controller = new ModuleController();
            this.tabModuleId = tabModuleId;
        }

        /// <summary>
        /// 
        /// </summary>
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

        /// <summary>
        /// 
        /// </summary>
        protected void WriteSetting(string settingName, string value)
        {
            controller.UpdateTabModuleSetting(this.tabModuleId, settingName, value);
        }

        #region public properties

        /// <summary>
        /// Load itself
        /// </summary>
        public string LoadByItSelf
        {
            get { return ReadSetting<string>("LoadByItSelf", null); }
            set { WriteSetting("LoadByItSelf", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SecLoginLink
        {
            get { return ReadSetting<string>("SecLoginLink", null); }
            set { WriteSetting("SecLoginLink", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SecSignOutRedirectLink
        {
            get { return ReadSetting<string>("SecSignOutRedirectLink", null); }
            set { WriteSetting("SecSignOutRedirectLink", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SecNavLink1
        {
            get { return ReadSetting<string>("SecNavLink1", null); }
            set { WriteSetting("SecNavLink1", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SecNavLink2
        {
            get { return ReadSetting<string>("SecNavLink2", null); }
            set { WriteSetting("SecNavLink2", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SecNavLink3
        {
            get { return ReadSetting<string>("SecNavLink3", null); }
            set { WriteSetting("SecNavLink3", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SecNavLink4
        {
            get { return ReadSetting<string>("SecNavLink4", null); }
            set { WriteSetting("SecNavLink4", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SecNavLink5
        {
            get { return ReadSetting<string>("SecNavLink5", null); }
            set { WriteSetting("SecNavLink5", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SecNavLink6
        {
            get { return ReadSetting<string>("SecNavLink6", null); }
            set { WriteSetting("SecNavLink6", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SecNavLink7
        {
            get { return ReadSetting<string>("SecNavLink7", null); }
            set { WriteSetting("SecNavLink7", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SecNavLink8
        {
            get { return ReadSetting<string>("SecNavLink8", null); }
            set { WriteSetting("SecNavLink8", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SecNavLink9
        {
            get { return ReadSetting<string>("SecNavLink9", null); }
            set { WriteSetting("SecNavLink9", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SecNavLink10
        {
            get { return ReadSetting<string>("SecNavLink10", null); }
            set { WriteSetting("SecNavLink10", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string NavText1
        {
            get { return ReadSetting<string>("NavText1", null); }
            set { WriteSetting("NavText1", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string NavText2
        {
            get { return ReadSetting<string>("NavText2", null); }
            set { WriteSetting("NavText2", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string NavText3
        {
            get { return ReadSetting<string>("NavText3", null); }
            set { WriteSetting("NavText3", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string NavText4
        {
            get { return ReadSetting<string>("NavText4", null); }
            set { WriteSetting("NavText4", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string NavText5
        {
            get { return ReadSetting<string>("NavText5", null); }
            set { WriteSetting("NavText5", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string NavText6
        {
            get { return ReadSetting<string>("NavText6", null); }
            set { WriteSetting("NavText6", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string NavText7
        {
            get { return ReadSetting<string>("NavText7", null); }
            set { WriteSetting("NavText7", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string NavText8
        {
            get { return ReadSetting<string>("NavText8", null); }
            set { WriteSetting("NavText8", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string NavText9
        {
            get { return ReadSetting<string>("NavText9", null); }
            set { WriteSetting("NavText9", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string NavText10
        {
            get { return ReadSetting<string>("NavText10", null); }
            set { WriteSetting("NavText10", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string HideAnonymousLink1
        {
            get { return ReadSetting<string>("HideAnonymousLink1", null); }
            set { WriteSetting("HideAnonymousLink1", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string HideAnonymousLink2
        {
            get { return ReadSetting<string>("HideAnonymousLink2", null); }
            set { WriteSetting("HideAnonymousLink2", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string HideAnonymousLink3
        {
            get { return ReadSetting<string>("HideAnonymousLink3", null); }
            set { WriteSetting("HideAnonymousLink3", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string HideAnonymousLink4
        {
            get { return ReadSetting<string>("HideAnonymousLink4", null); }
            set { WriteSetting("HideAnonymousLink4", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string HideAnonymousLink5
        {
            get { return ReadSetting<string>("HideAnonymousLink5", null); }
            set { WriteSetting("HideAnonymousLink5", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string HideAnonymousLink6
        {
            get { return ReadSetting<string>("HideAnonymousLink6", null); }
            set { WriteSetting("HideAnonymousLink6", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string HideAnonymousLink7
        {
            get { return ReadSetting<string>("HideAnonymousLink7", null); }
            set { WriteSetting("HideAnonymousLink7", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string HideAnonymousLink8
        {
            get { return ReadSetting<string>("HideAnonymousLink8", null); }
            set { WriteSetting("HideAnonymousLink8", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string HideAnonymousLink9
        {
            get { return ReadSetting<string>("HideAnonymousLink9", null); }
            set { WriteSetting("HideAnonymousLink9", value); }
        }

        /// <summary>
        /// 
        /// </summary>
        public string HideAnonymousLink10
        {
            get { return ReadSetting<string>("HideAnonymousLink10", null); }
            set { WriteSetting("HideAnonymousLink10", value); }
        }

        #endregion
    }
}