#region Usings

using System;
using System.IO;
using System.Web.UI.WebControls;
using System.Xml;
using System.Linq;

using DotNetNuke.Common;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Instrumentation;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DotNetNuke.UI.Skins;
using System.Text;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Drawing;
using System.Web.Services;
using System.Web;
using System.Web.UI;
using DotNetNuke.Entities.Tabs;
using System.Globalization;

#endregion

namespace MICROS.Modules.MyCentralSiteConfiguration
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
    partial class ModuleStyleEditor : PortalModuleBase
    {
        /// <summary>
        /// 
        /// </summary>
        public string[] FontNames
        {
            get
            {
                return new string[] { "Arial", "Arial Black", "Century Gothic", "Geneva", "Lucida", "Tahoma", "Trebuchet MS", "Verdana", 
                    "Courier", "Courier New", "MS Serif", "Georgia", "Palatino", "Times", "Times New Roman", "Helvetica"};
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public bool GlobalSetting = false;

        /// <summary>
        /// Initialization
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            DotNetNuke.Framework.jQuery.RequestDnnPluginsRegistration();
        }

        /// <summary>
        /// Set up for loading
        /// </summary>
        /// <param name="e"></param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            try
            {
                if (!Page.IsPostBack)
                {
                    SychOriginalCustomXML();
                    SetupUI();
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }

        }

        private void SetupUI()
        {
            string fontNames = JsonConvert.SerializeObject(FontNames);
            string currentnode = JsonConvert.SerializeXmlNode(GetCurrentModuleXmlNode());

            if (currentnode != null)
            {
                string script = String.Format("SetupGlobalVariables({0}, {1});", fontNames, currentnode);
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "SetupGlobalVariables", script, true);
            }
        }

        private string GetOriginalXMLHelperFile()
        {
            var objPortalController = new PortalController();
            PortalInfo objPortal = objPortalController.GetPortal(PortalId);
            string OriginalXML = string.Format("{0}\\Portals\\_default\\Skins\\{1}\\DefaultES.xml", Globals.ApplicationMapPath, objPortal.PortalName);

            return OriginalXML;
        }

        private string GetCustomXMLHelperFile()
        {
            var objPortalController = new PortalController();
            PortalInfo objPortal = objPortalController.GetPortal(PortalId);
            string CustomXML = string.Format("{0}\\Portals\\_default\\Skins\\{1}\\DefaultESCustom.xml", Globals.ApplicationMapPath, objPortal.PortalName);

            return CustomXML;
        }

        private void SychOriginalCustomXML()
        {
            string OriginalXML = GetOriginalXMLHelperFile();

            // The file saves all custom settings. We create this file in case DefaultES.xml is replaced by system upgrade.
            string CustomValueXML = GetCustomXMLHelperFile();

            if (File.Exists(CustomValueXML))
            {
                // Populate custom values
                UpdateOriginalXML(OriginalXML, CustomValueXML);
            }

            // Copy OriginalXML to CustomValueXML, update CustomValueXML to latest version
            CopyXMLFile(OriginalXML, CustomValueXML);
        }

        private void CopyXMLFile(string src, string des)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(src);

            XmlTextWriter xmlTextWriter = new XmlTextWriter(des, null);
            xmlTextWriter.Formatting = System.Xml.Formatting.Indented;
            xmlDoc.Save(xmlTextWriter);
            xmlTextWriter.Close();
        }

        private XmlDocument UpdateOriginalXML(string OriginalXML, string CustomXML)
        {
            XmlDocument xmlOriginal = new XmlDocument();
            xmlOriginal.Load(OriginalXML);

            XmlDocument xmlCustom = new XmlDocument();
            xmlCustom.Load(CustomXML);

            XmlNodeList siteStylesCustom = xmlCustom.SelectNodes("//SiteStyle");
            XmlNodeList siteStylesOriginal = xmlOriginal.SelectNodes("//SiteStyle");

            foreach (XmlNode xc in siteStylesCustom)
            {
                foreach (XmlNode xo in siteStylesOriginal)
                {
                    if (xc.Attributes["ID"].Value == xo.Attributes["ID"].Value)
                    {
                        xo.Attributes["CustomValue"].Value = xc.Attributes["CustomValue"].Value;
                        break;
                    }
                }
            }

            xmlOriginal.Save(OriginalXML);

            return xmlOriginal;
        }

        private XmlNode GetCurrentModuleXmlNode()
        {
            XmlNode result = null;
            // Get current module name
            ModuleController controller = new ModuleController();
            string ModuleName = controller.GetTabModule(this.TabModuleId).DesktopModule.ModuleName;

            TabController tcontroller = new TabController();
            string PageName = tcontroller.GetTab(this.TabId, PortalId, true).TabName;

            if (GlobalSetting)
            {
                ModuleName = "GlobalSettings";
            }
            string OriginalXML = GetOriginalXMLHelperFile();

            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(OriginalXML);
            foreach (XmlNode xNode in xmlDoc.ChildNodes)
            {
                result = FindModuleXmlNode(xNode, ModuleName, PageName);

                if (result != null)
                {
                    return result;
                }
            }

            return result;
        }

        private XmlNode FindModuleXmlNode(XmlNode xNode, string ModuleName, string PageName)
        {
            if (xNode.Attributes != null)
            {
                if (GlobalSetting)
                {
                    if (xNode.Attributes["Name"] != null)
                    {
                        if (xNode.Attributes["Name"].Value.ToLower() == ModuleName.ToLower())
                        {
                            return xNode;
                        }
                    }
                }
                else
                {
                    if (xNode.Attributes["Type"] != null && xNode.Attributes["Name"] != null)
                    {
                        if (xNode.Attributes["Type"].Value.ToLower() == "Module".ToLower() && xNode.Attributes["Name"].Value.ToLower() == ModuleName.ToLower())
                        {
                            if (xNode.ParentNode.Attributes["Type"] != null && xNode.ParentNode.Attributes["Type"].Value.ToLower() == "Page".ToLower())
                            {
                                if (xNode.ParentNode.Attributes["Name"].Value.ToLower() == PageName.ToLower())
                                {
                                    return xNode;
                                }
                            }
                            else
                            {
                                return xNode;
                            }
                        }
                    }
                }
            }

            if (xNode.ChildNodes.Count > 0)
            {
                for (int i = xNode.ChildNodes.Count - 1; i >= 0; i--)
                {
                    XmlNode node = FindModuleXmlNode(xNode.ChildNodes[i], ModuleName, PageName);

                    if (node != null)
                    {
                        return node;
                    }
                }
            }

            return null;
        }

        /// <summary>
        /// Save XMl Helper file and update Custom.css file
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void SaveSettings(object sender, EventArgs e)
        {
            XmlDocument xmlDoc = UpdateHelperFile();
            string css = GetCssByXMLDocument(xmlDoc);
            System.IO.File.WriteAllText(GetCssFile(), css);
            SetupUI();
        }

        private XmlDocument UpdateHelperFile()
        {
            SaveUploadedImages();
            string value = tbHiddenCurrentEditNode.Value;
            XmlNode CurrentEditNode = JsonConvert.DeserializeXmlNode(value);

            string OriginalXML = GetOriginalXMLHelperFile();
            string CustomValueXML = GetCustomXMLHelperFile();

            UpdateOriginalXML(CurrentEditNode, CustomValueXML);

            return UpdateOriginalXML(CurrentEditNode, OriginalXML);
        }

        private HttpPostedFile GetImageLoaderPostedFile(int index)
        {
            switch (index)
            {
                case 1: return MyCentralModuleStyleSetting_FileLoader1.PostedFile;
                case 2: return MyCentralModuleStyleSetting_FileLoader2.PostedFile;
                case 3: return MyCentralModuleStyleSetting_FileLoader3.PostedFile;
                case 4: return MyCentralModuleStyleSetting_FileLoader4.PostedFile;
                case 5: return MyCentralModuleStyleSetting_FileLoader5.PostedFile;
                case 6: return MyCentralModuleStyleSetting_FileLoader6.PostedFile;
                case 7: return MyCentralModuleStyleSetting_FileLoader7.PostedFile;
                case 8: return MyCentralModuleStyleSetting_FileLoader8.PostedFile;
                case 9: return MyCentralModuleStyleSetting_FileLoader9.PostedFile;
                case 10: return MyCentralModuleStyleSetting_FileLoader10.PostedFile;
                case 11: return MyCentralModuleStyleSetting_FileLoader11.PostedFile;
                case 12: return MyCentralModuleStyleSetting_FileLoader12.PostedFile;
                case 13: return MyCentralModuleStyleSetting_FileLoader13.PostedFile;
                case 14: return MyCentralModuleStyleSetting_FileLoader14.PostedFile;
                case 15: return MyCentralModuleStyleSetting_FileLoader15.PostedFile;
                case 16: return MyCentralModuleStyleSetting_FileLoader16.PostedFile;
                case 17: return MyCentralModuleStyleSetting_FileLoader17.PostedFile;
                case 18: return MyCentralModuleStyleSetting_FileLoader18.PostedFile;
                case 19: return MyCentralModuleStyleSetting_FileLoader19.PostedFile;
                case 20: return MyCentralModuleStyleSetting_FileLoader20.PostedFile;
                default: return null;
            }
        }

        private XmlNode GetSiteStyleByID(int ID)
        {
            string OriginalXML = GetOriginalXMLHelperFile();
            XmlDocument xmlOriginal = new XmlDocument();
            xmlOriginal.Load(OriginalXML);

            XmlNodeList siteStylesOriginal = xmlOriginal.SelectNodes("//SiteStyle");

            foreach (XmlNode xo in siteStylesOriginal)
            {
                if (xo.Attributes["ID"].Value == ID.ToString())
                {
                    return xo;
                }
            }

            return null;

        }

        private void SaveUploadedImages()
        {
            string value = HiddenImageControlArray.Value;
            string[] ImageControlArray = JsonConvert.DeserializeObject<string[]>(value);
            int numImages = ImageControlArray.Length;

            if (numImages > 20)
            {
                // We currently only have 20 file loader controls
                numImages = 20;
            }

            for (int i = 1; i <= numImages; i++)
            {
                HttpPostedFile postedFile = GetImageLoaderPostedFile(i);
                if (postedFile != null && postedFile.InputStream.Length > 0)
                {
                    int XmlID = Int32.Parse(ImageControlArray[i - 1]);
                    XmlNode ImageSiteStyle = GetSiteStyleByID(XmlID);

                    var objPortalController = new PortalController();
                    PortalInfo objPortal = objPortalController.GetPortal(PortalId);
                    string filePath = string.Format("{0}\\Portals\\_default\\Skins\\{1}\\{2}", Globals.ApplicationMapPath, objPortal.PortalName, ImageSiteStyle.Attributes["Url"].Value.Replace("/", "\\"));

                    //int contentLength = postedFile.ContentLength;
                    //string contentType = postedFile.ContentType;
                    //string fileName = postedFile.FileName;
                    //Stream stream = postedFile.InputStream;

                    postedFile.SaveAs(filePath);
                }
            }
        }

        private XmlDocument UpdateOriginalXML(XmlNode CurrentEditNode, string XMLFileName)
        {
            XmlDocument xmlOriginal = new XmlDocument();
            xmlOriginal.Load(XMLFileName);

            XmlNodeList siteStylesVisible = CurrentEditNode.SelectNodes("//SiteStyle");
            XmlNodeList siteStylesOriginal = xmlOriginal.SelectNodes("//SiteStyle");

            foreach (XmlNode xv in siteStylesVisible)
            {
                foreach (XmlNode xo in siteStylesOriginal)
                {
                    if (xv.Attributes["ID"].Value == xo.Attributes["ID"].Value)
                    {
                        xo.Attributes["CustomValue"].Value = xv.Attributes["CustomValue"].Value;
                        break;
                    }
                }
            }

            xmlOriginal.Save(XMLFileName);

            return xmlOriginal;
        }

        private string GetCssByXMLDocument(XmlDocument xml)
        {
            StringBuilder css = new StringBuilder();
            StringBuilder opacityCss = new StringBuilder();

            mOpacityCustomisation = new List<string>();
            mOpacitySelectors = new List<string>();
            mOpacitySelectorsUsed = new List<string>();
            mOpacityElementsRetain = new List<string>();
            mOpacityElements = new List<string>();
            mOpacityARGB = string.Empty;
            mOpacityHEX = string.Empty;
            mOpacityValue = 1;

            foreach (XmlNode node in xml.ChildNodes)
            {
                GetCssFromXmlNode(node, css);
            }

            return css.Append(GetRemainderCssForOpacity()).ToString();
        }

        private void GetCssFromXmlNode(XmlNode node, StringBuilder sbCss)
        {
            #region mOpacityCustomisation
            if (node.Name == "SiteStyleOpacitySelectors")
            {
                string cssOpacitySelectors = node.Attributes["CSSSelector"].InnerXml;
                foreach (string oSelector in cssOpacitySelectors.Split(','))
                    if (!mOpacitySelectors.Contains(oSelector.Trim()))
                        mOpacitySelectors.Add(oSelector.Trim());
            }
            else if (node.Name == "SiteStyleOpacityElementsInclude")
            {
                string cssOpacityElement = node.Attributes["CSSElement"].InnerXml;
                foreach (string oElement in cssOpacityElement.Split(','))
                {
                    if (!mOpacityElements.Contains(oElement.Trim()))
                        mOpacityElements.Add(oElement);
                    if (!mOpacityElementsRetain.Contains(oElement.Trim()))
                        mOpacityElementsRetain.Add(oElement.Trim());
                }
            }
            else if (node.Name == "SiteStyleOpacityElementsExclude")
            {
                string cssOpacityElement = node.Attributes["CSSElement"].InnerXml;
                foreach (string oElement in cssOpacityElement.Split(','))
                    if (!mOpacityElements.Contains(oElement.Trim()))
                        mOpacityElements.Add(oElement.Trim());
            }
            else if (node.Name == "SiteStyleOpacityCustomisation")
            {
                string cssOpacitySelectors = node.Attributes["CSSSelector"].InnerXml;
                string cssOpacityElement = node.Attributes["CSSElement"].InnerXml;
                string cssSingleValue = node.Attributes["SingleValue"].InnerXml;

                foreach (string oSelector in cssOpacitySelectors.Split(','))
                {
                    foreach (string oElement in cssOpacityElement.Split(','))
                    {
                        string key = oSelector.Trim() + "," + oElement.Trim() + "," + cssSingleValue.Trim();
                        if (!mOpacityCustomisation.Contains(key))
                            mOpacityCustomisation.Add(key);
                    }
                }
            }
            #endregion
            else
            {
                string cssSelector = string.Empty;

                if (node.Name == "SiteStyleGroup")
                {
                    sbCss.Append("/* " + node.Attributes["Name"].InnerXml + " */" + Environment.NewLine);
                }

                if (node.Name == "SiteStyleSubGroup")
                {
                    cssSelector = node.Attributes["CSSSelector"].InnerXml;

                    if (!string.IsNullOrEmpty(cssSelector))
                    {
                        sbCss.Append(cssSelector + "{ ");
                    }
                }

                if (node.ChildNodes.Count > 0)
                {
                    foreach (XmlNode n in node.ChildNodes)
                    {
                        GetCssFromXmlNode(n, sbCss);
                    }
                }
                else
                {
                    if (node.Name == "SiteStyle")
                    {
                        string cssElement = node.Attributes["CSSElement"].InnerXml;
                        string cssValue = node.Attributes["CustomValue"].InnerXml;
                        if (string.IsNullOrEmpty(cssValue))
                        {
                            cssValue = node.Attributes["DefaultValue"].InnerXml;
                        }

                        if (!string.IsNullOrEmpty(cssElement) && !string.IsNullOrEmpty(cssValue))
                        {
                            if (cssValue.IndexOf(';') > 0)
                            {
                                cssValue = cssValue.Substring(0, cssValue.IndexOf(';'));
                            }

                            if (node.ParentNode.Name == "SiteStyleSubGroup")
                            {
                                cssSelector = node.ParentNode.Attributes["CSSSelector"].InnerXml;
                                if (!string.IsNullOrEmpty(cssSelector))
                                {
                                    string[] arrCssSelector = cssSelector.Split(new Char[] { ' ', ',' });
                                    if (arrCssSelector.Select(a => a.Trim()).Any(b => mOpacitySelectors.Contains(b)) && mOpacityValue < 1)
                                    {
                                        string[] arrCssElement = cssElement.Split(new Char[] { ' ', ',' });
                                        if (arrCssElement.Select(a => a.Trim()).Any(b => mOpacityElementsRetain.Contains(b)))
                                            sbCss.Append(GetCssForOpacity(cssElement, arrCssSelector));
                                        else
                                            sbCss.Append(cssElement + ":" + cssValue + ";");
                                    }
                                    else
                                        sbCss.Append(cssElement + ":" + cssValue + ";");
                                }
                            }
                            else
                            {
                                cssSelector = node.Attributes["CSSSelector"].InnerXml;
                                if (!string.IsNullOrEmpty(cssSelector))
                                {
                                    if (cssSelector.Trim().ToLower().Contains("opacity"))
                                    {
                                        if (cssSelector.Trim().ToLower().Equals("opacityvalue"))
                                        {
                                            var opacityValue = node.Attributes["CustomValue"].InnerXml;

                                            if (string.IsNullOrEmpty(opacityValue))
                                                opacityValue = node.Attributes["DefaultValue"].InnerXml;

                                            if (string.IsNullOrEmpty(opacityValue))
                                                opacityValue = "1";

                                            mOpacityValue = Convert.ToDecimal(opacityValue);

                                            if (mOpacityValue > 1)
                                                mOpacityValue = 1;
                                        }
                                        else if (cssSelector.Trim().ToLower().Equals("opacitycolor"))
                                        {
                                            mOpacityColor = node.Attributes["CustomValue"].InnerXml;

                                            if (string.IsNullOrEmpty(mOpacityColor))
                                                mOpacityColor = node.Attributes["DefaultValue"].InnerXml;

                                            if (string.IsNullOrEmpty(mOpacityColor))
                                                mOpacityColor = "#000000";
                                        }
                                    }
                                    else
                                    {
                                        string[] arrCssSelector = cssSelector.Split(new Char[] { ' ', ',' });
                                        string[] arrCssElement = cssElement.Split(new Char[] { ' ', ',' });
                                        if (arrCssSelector.Select(a => a.Trim()).Any(b => mOpacitySelectors.Contains(b)) && arrCssElement.Select(a => a.Trim()).Any(b => mOpacityElementsRetain.Contains(b)) && mOpacityValue < 1)
                                            sbCss.Append(GetCssForOpacity(cssElement, arrCssSelector) + Environment.NewLine);
                                        else
                                            sbCss.Append(cssSelector + "{ " + cssElement + ":" + cssValue + ";} " + Environment.NewLine);
                                    }
                                }
                            }
                        }
                    }
                }

                if (node.Name == "SiteStyleSubGroup")
                {
                    cssSelector = node.Attributes["CSSSelector"].InnerXml;

                    if (!string.IsNullOrEmpty(cssSelector))
                    {
                        string[] arrCssSelector = cssSelector.Split(new Char[] { ' ', ',' });
                        if (arrCssSelector.Select(a => a.Trim()).Any(b => mOpacitySelectors.Contains(b)) && mOpacityValue < 1)
                        {
                            sbCss.AppendLine(" } ");
                            sbCss.AppendLine(mIE9Filter);
                        }
                        else
                            sbCss.AppendLine(" } ");

                        sbCss.Append(Environment.NewLine);
                    }
                }
            }
        }

        private string GetCssFile()
        {
            var objPortalController = new PortalController();
            PortalInfo objPortal = objPortalController.GetPortal(PortalId);
            return string.Format("{0}\\Portals\\_default\\Skins\\{1}\\Custom.css", Globals.ApplicationMapPath, objPortal.PortalName);
        }

        private string GetCssForOpacity(string cssElement, string[] arrCssSelector)
        {
            StringBuilder opacityStr = new StringBuilder();

            if (mOpacityValue < 1)
            {
                if (string.IsNullOrWhiteSpace(mOpacityARGB))
                    mOpacityARGB = GetARGBForOpacity();
                if (string.IsNullOrWhiteSpace(mOpacityHEX))
                    mOpacityHEX = GetHexForOpacity();

                opacityStr.AppendLine("/* Chrome, Firefox, IE9 : rgba, IE8 : ms-filter, IE7 : filter */");
                opacityStr.Append(GetOpacityCss(cssElement));

                // IE9 Filter
                mIE9Filter = GetOpacityFilterForIE9(null, arrCssSelector);
            }

            return opacityStr.ToString();
        }

        private string GetRemainderCssForOpacity()
        {
            StringBuilder opacityStr = new StringBuilder();

            if (mOpacityValue < 1)
            {
                if (string.IsNullOrWhiteSpace(mOpacityARGB))
                    mOpacityARGB = GetARGBForOpacity();
                if (string.IsNullOrWhiteSpace(mOpacityHEX))
                    mOpacityHEX = GetHexForOpacity();

                List<string> opacitySelectorRemainder = mOpacitySelectors.Except(mOpacitySelectorsUsed).ToList();

                int arrCssSelectorlength = opacitySelectorRemainder.Count;
                for (int i = 0; i < arrCssSelectorlength; i++)
                {
                    opacityStr.AppendLine("/* Chrome, Firefox, IE9 : rgba, IE8 : ms-filter, IE7 : filter */");
                    opacityStr.Append(opacitySelectorRemainder[i] + " { ");

                    foreach (string cssElement in mOpacityElementsRetain)
                    {
                        opacityStr.Append(GetOpacityCss(cssElement));
                    }
                    opacityStr.AppendLine(" } ");

                    // IE9 Filter
                    opacityStr.Append(GetOpacityFilterForIE9(opacitySelectorRemainder[i], null));
                }

                opacityStr.AppendLine("/* Customization needed for Opacity */");
                foreach (string opacityCustomisation in mOpacityCustomisation)
                {
                    string[] opacityCustomisationArr = opacityCustomisation.Split(',');

                    opacityStr.AppendLine(string.Format("{0}{1}{2} : {3}{4}", opacityCustomisationArr[0], " { ", opacityCustomisationArr[1], opacityCustomisationArr[2], " } "));
                }
            }
            return opacityStr.ToString();
        }

        private string GetOpacityCss(string cssElement)
        {
            StringBuilder opacityStr = new StringBuilder();

            // Chrome, Firefox, IE9
            opacityStr.Append(string.Format("{0}: none; {1}: rgba({2});", cssElement, cssElement, mOpacityARGB));

            // IE8
            opacityStr.Append(string.Format(" *-ms-filter:progid:DXImageTransform.Microsoft.gradient(startColorstr = {0}, endColorstr = {1}); *filter:progid:DXImageTransform.Microsoft.gradient(startColorstr = {2}, endColorstr = {3});", mOpacityHEX, mOpacityHEX, mOpacityHEX, mOpacityHEX));

            // IE7
            opacityStr.Append(string.Format(" filter:progid:DXImageTransform.Microsoft.gradient(startColorstr = {0}, endColorstr = {1}); zoom:1;", mOpacityHEX, mOpacityHEX));

            opacityStr.Append(Environment.NewLine);

            return opacityStr.ToString();
        }

        private string GetOpacityFilterForIE9(string cssSelector, string[] arrCssSelector)
        {
            StringBuilder opacityIE9Filter = new StringBuilder();
            opacityIE9Filter.AppendLine("/* IE9 - remove filter */");

            if (string.IsNullOrWhiteSpace(cssSelector))
            {
                int arrCssSelectorlength = arrCssSelector.Length;
                for (int i = 0; i < arrCssSelectorlength; i++)
                {
                    if (i == arrCssSelectorlength - 1)
                        opacityIE9Filter.Append(string.Format("{0}:nth-child(n) ", arrCssSelector[i]));
                    else
                        opacityIE9Filter.Append(string.Format("{0}:nth-child(n), ", arrCssSelector[i]));

                    if (!mOpacitySelectorsUsed.Contains(arrCssSelector[i]))
                        mOpacitySelectorsUsed.Add(arrCssSelector[i]);
                }
                opacityIE9Filter.Append("{ filter: none; }");
                opacityIE9Filter.Append(Environment.NewLine);

                return opacityIE9Filter.ToString();
            }
            else
                return (opacityIE9Filter.AppendLine(cssSelector + ":nth-child(n) { filter: none; }")).ToString();
        }

        private string GetARGBForOpacity()
        {
            var color = mOpacityColor.Replace("#", string.Empty);
            var r = int.Parse(color.Substring(0, 2), NumberStyles.HexNumber);
            var g = int.Parse(color.Substring(2, 2), NumberStyles.HexNumber);
            var b = int.Parse(color.Substring(4, 2), NumberStyles.HexNumber);
            return string.Format("{0}, {1}, {2}, {3}", r, g, b, mOpacityValue);
        }

        private string GetHexForOpacity()
        {
            var color = mOpacityColor.Replace("#", string.Empty);
            var gradientFilter = Convert.ToInt32(Math.Floor(mOpacityValue * 255)).ToString("X");
            return string.Format("#{0}{1}", gradientFilter, color);
        }

        /// <summary>
        /// 
        /// </summary>
        public List<string> mOpacityCustomisation { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public List<string> mOpacitySelectors { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public List<string> mOpacitySelectorsUsed { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public List<string> mOpacityElementsRetain { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public List<string> mOpacityElements { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public Decimal mOpacityValue { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string mOpacityColor { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string mOpacityARGB { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string mOpacityHEX { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string mIE9Filter { get; set; }
    }

}