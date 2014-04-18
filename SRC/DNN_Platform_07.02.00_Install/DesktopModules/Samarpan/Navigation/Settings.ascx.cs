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
using System.Web.UI;

using DotNetNuke;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;

namespace Samarpan.Modules.Navigation
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
                    NavigationSettings settingsData = new NavigationSettings(this.TabModuleId);
                    if (!string.IsNullOrEmpty(settingsData.LoadByItSelf))
                    {
                        chkLoadByItSelf.Checked = Convert.ToBoolean(settingsData.LoadByItSelf);
                    }

                    if (!string.IsNullOrEmpty(settingsData.SecLoginLink))
                    {
                        txtLoginLink.Text = settingsData.SecLoginLink;
                    }
                    if (!string.IsNullOrEmpty(settingsData.SecSignOutRedirectLink))
                    {
                        txtSignOutRedirectLink.Text = settingsData.SecSignOutRedirectLink;
                    }

                    if (!string.IsNullOrEmpty(settingsData.SecNavLink1))
                    {
                        txtNavLink1.Text = settingsData.SecNavLink1;
                    }
                    if (!string.IsNullOrEmpty(settingsData.SecNavLink2))
                    {
                        txtNavLink2.Text = settingsData.SecNavLink2;
                    }
                    if (!string.IsNullOrEmpty(settingsData.SecNavLink3))
                    {
                        txtNavLink3.Text = settingsData.SecNavLink3;
                    }
                    if (!string.IsNullOrEmpty(settingsData.SecNavLink4))
                    {
                        txtNavLink4.Text = settingsData.SecNavLink4;
                    } 
                    if (!string.IsNullOrEmpty(settingsData.SecNavLink5))
                    {
                        txtNavLink5.Text = settingsData.SecNavLink5;
                    } 
                    if (!string.IsNullOrEmpty(settingsData.SecNavLink6))
                    {
                        txtNavLink6.Text = settingsData.SecNavLink6;
                    } 
                    if (!string.IsNullOrEmpty(settingsData.SecNavLink7))
                    {
                        txtNavLink7.Text = settingsData.SecNavLink7;
                    } 
                    if (!string.IsNullOrEmpty(settingsData.SecNavLink8))
                    {
                        txtNavLink8.Text = settingsData.SecNavLink8;
                    } 
                    if (!string.IsNullOrEmpty(settingsData.SecNavLink9))
                    {
                        txtNavLink9.Text = settingsData.SecNavLink9;
                    } 
                    if (!string.IsNullOrEmpty(settingsData.SecNavLink10))
                    {
                        txtNavLink10.Text = settingsData.SecNavLink10;
                    }
                    if (!string.IsNullOrEmpty(settingsData.NavText1))
                    {
                        txtNavText1.Text = settingsData.NavText1;
                    }
                    if (!string.IsNullOrEmpty(settingsData.NavText2))
                    {
                        txtNavText2.Text = settingsData.NavText2;
                    }
                    if (!string.IsNullOrEmpty(settingsData.NavText3))
                    {
                        txtNavText3.Text = settingsData.NavText3;
                    }
                    if (!string.IsNullOrEmpty(settingsData.NavText4))
                    {
                        txtNavText4.Text = settingsData.NavText4;
                    }
                    if (!string.IsNullOrEmpty(settingsData.NavText5))
                    {
                        txtNavText5.Text = settingsData.NavText5;
                    }
                    if (!string.IsNullOrEmpty(settingsData.NavText6))
                    {
                        txtNavText6.Text = settingsData.NavText6;
                    }
                    if (!string.IsNullOrEmpty(settingsData.NavText7))
                    {
                        txtNavText7.Text = settingsData.NavText7;
                    }
                    if (!string.IsNullOrEmpty(settingsData.NavText8))
                    {
                        txtNavText8.Text = settingsData.NavText8;
                    }
                    if (!string.IsNullOrEmpty(settingsData.NavText9))
                    {
                        txtNavText9.Text = settingsData.NavText9;
                    }
                    if (!string.IsNullOrEmpty(settingsData.NavText10))
                    {
                        txtNavText10.Text = settingsData.NavText10;
                    }

                    if (!string.IsNullOrEmpty(settingsData.HideAnonymousLink1))
                    {
                        chkAnonymousLink1.Checked = Convert.ToBoolean(settingsData.HideAnonymousLink1);
                    }

                    if (!string.IsNullOrEmpty(settingsData.HideAnonymousLink2))
                    {
                        chkAnonymousLink2.Checked = Convert.ToBoolean(settingsData.HideAnonymousLink2);
                    }

                    if (!string.IsNullOrEmpty(settingsData.HideAnonymousLink3))
                    {
                        chkAnonymousLink3.Checked = Convert.ToBoolean(settingsData.HideAnonymousLink3);
                    }

                    if (!string.IsNullOrEmpty(settingsData.HideAnonymousLink4))
                    {
                        chkAnonymousLink4.Checked = Convert.ToBoolean(settingsData.HideAnonymousLink4);
                    }

                    if (!string.IsNullOrEmpty(settingsData.HideAnonymousLink5))
                    {
                        chkAnonymousLink5.Checked = Convert.ToBoolean(settingsData.HideAnonymousLink5);
                    }

                    if (!string.IsNullOrEmpty(settingsData.HideAnonymousLink6))
                    {
                        chkAnonymousLink6.Checked = Convert.ToBoolean(settingsData.HideAnonymousLink6);
                    }

                    if (!string.IsNullOrEmpty(settingsData.HideAnonymousLink7))
                    {
                        chkAnonymousLink7.Checked = Convert.ToBoolean(settingsData.HideAnonymousLink7);
                    }

                    if (!string.IsNullOrEmpty(settingsData.HideAnonymousLink8))
                    {
                        chkAnonymousLink8.Checked = Convert.ToBoolean(settingsData.HideAnonymousLink8);
                    }

                    if (!string.IsNullOrEmpty(settingsData.HideAnonymousLink9))
                    {
                        chkAnonymousLink9.Checked = Convert.ToBoolean(settingsData.HideAnonymousLink9);
                    }

                    if (!string.IsNullOrEmpty(settingsData.HideAnonymousLink10))
                    {
                        chkAnonymousLink10.Checked = Convert.ToBoolean(settingsData.HideAnonymousLink10);
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
                NavigationSettings settingsData = new NavigationSettings(this.TabModuleId);
                settingsData.LoadByItSelf = chkLoadByItSelf.Checked.ToString();

                settingsData.SecLoginLink = txtLoginLink.Text;
                settingsData.SecSignOutRedirectLink = txtSignOutRedirectLink.Text;

                settingsData.SecNavLink1 = txtNavLink1.Text;
                settingsData.SecNavLink2 = txtNavLink2.Text;
                settingsData.SecNavLink3 = txtNavLink3.Text;
                settingsData.SecNavLink4 = txtNavLink4.Text;
                settingsData.SecNavLink5 = txtNavLink5.Text;
                settingsData.SecNavLink6 = txtNavLink6.Text;
                settingsData.SecNavLink7 = txtNavLink7.Text;
                settingsData.SecNavLink8 = txtNavLink8.Text;
                settingsData.SecNavLink9 = txtNavLink9.Text;
                settingsData.SecNavLink10 = txtNavLink10.Text;

                settingsData.NavText1 = txtNavText1.Text;
                settingsData.NavText2 = txtNavText2.Text;
                settingsData.NavText3 = txtNavText3.Text;
                settingsData.NavText4 = txtNavText4.Text;
                settingsData.NavText5 = txtNavText5.Text;
                settingsData.NavText6 = txtNavText6.Text;
                settingsData.NavText7 = txtNavText7.Text;
                settingsData.NavText8 = txtNavText8.Text;
                settingsData.NavText9 = txtNavText9.Text;
                settingsData.NavText10 = txtNavText10.Text;

                settingsData.HideAnonymousLink1 = chkAnonymousLink1.Checked.ToString();
                settingsData.HideAnonymousLink2 = chkAnonymousLink2.Checked.ToString();
                settingsData.HideAnonymousLink3 = chkAnonymousLink3.Checked.ToString();
                settingsData.HideAnonymousLink4 = chkAnonymousLink4.Checked.ToString();
                settingsData.HideAnonymousLink5 = chkAnonymousLink5.Checked.ToString();
                settingsData.HideAnonymousLink6 = chkAnonymousLink6.Checked.ToString();
                settingsData.HideAnonymousLink7 = chkAnonymousLink7.Checked.ToString();
                settingsData.HideAnonymousLink8 = chkAnonymousLink8.Checked.ToString();
                settingsData.HideAnonymousLink9 = chkAnonymousLink9.Checked.ToString();
                settingsData.HideAnonymousLink10 = chkAnonymousLink10.Checked.ToString();
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

