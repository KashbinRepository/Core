#region Copyright

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

#endregion

#region Usings

using System;
using System.IO;
using System.Web.UI.WebControls;
using System.Xml;

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

#endregion

namespace MICROS.Modules.MyCentralSiteConfiguration
{
    /// <summary>
    /// 
    /// </summary>
    public sealed class StyleEditorXMLNodeName
    {
        /// <summary>
        /// 
        /// </summary>
        public static readonly string MyCentralSiteStyles = "MyCentralSiteStyles";

        /// <summary>
        /// 
        /// </summary>
        public static readonly string SiteStyleGroup = "SiteStyleGroup";

        /// <summary>
        /// 
        /// </summary>
        public static readonly string SiteStyle = "SiteStyle";
    }

    /// <summary>
    /// 
    /// </summary>
    public sealed class StyleAttributeName
    {
        /// <summary>
        /// 
        /// </summary>
        public static readonly string Name = "Name";

        /// <summary>
        /// 
        /// </summary>
        public static readonly string Type = "Type";

        /// <summary>
        /// 
        /// </summary>
        public static readonly string CssSelector = "CssSelector";

        /// <summary>
        /// 
        /// </summary>
        public static readonly string CssProperty = "CssProperty";
    }

    /// <summary>
    /// 
    /// </summary>
    public sealed class StyleEditorType
    {
        /// <summary>
        /// 
        /// </summary>
        public static readonly string Text = "Text";

        /// <summary>
        /// 
        /// </summary>
        public static readonly string Number = "Number";

        /// <summary>
        /// 
        /// </summary>
        public static readonly string Font = "Font";

        /// <summary>
        /// 
        /// </summary>
        public static readonly string Image = "Image";

        /// <summary>
        /// 
        /// </summary>
        public static readonly string Color = "Color";
    }

    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The SiteWizard Wizard is a user-friendly Wizard that leads the user through the
    ///	process of setting up a new site
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// 	[cnurse]	10/8/2004	created
    ///     [cnurse]    12/04/2006  converted to use ASP.NET 2 Wizard classes
    /// </history>
    /// -----------------------------------------------------------------------------
    public partial class ViewMyCentralSiteConfiguration : PortalModuleBase
    {
        /// <summary>
        /// The font names supported by this project
        /// </summary>
        public string[] FontNames
        {
            get
            {
                return new string[] { "Arial", "Arial Black", "Century Gothic", "Geneva", "Lucida", "Tahoma", "Trebuchet MS", "Verdana", 
                    "Courier", "Courier New", "MS Serif", "Georgia", "Palatino", "Times", "Times New Roman", "Helvetica"};
            }
        }

        //private XmlNode root = null;

        /// <summary>
        /// 
        /// </summary>
        public XmlNode RootNode
        {
            get
            {
                return GetSelectedNode("/MyCentralSiteStyles");
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public XmlNode CurrentNode
        {
            get
            {
                TreeNode tnode = wizSkinStyleTreeView.SelectedNode;

                if (tnode != null)
                {
                    //tnode.ExpandAll();
                    ExpandToRoot(tnode);
                    return GetSelectedNode(tnode.DataPath);
                }
                else
                {
                    return RootNode;
                }

            }
        }

        #region Event Handlers

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        /// 	[cnurse]	10/11/2004	created
        /// </history>
        /// -----------------------------------------------------------------------------
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            DotNetNuke.Framework.jQuery.RequestDnnPluginsRegistration();

            tbHiddenPortalName.Value = Globals.GetPortalSettings().PortalName;
            //tbHiddenIframeSrc.Value = GetIFrameScr("StoreLocatorCollection.htm");
            
            try
            {
                if (!Page.IsPostBack)
                {
                    //Settings for style editor
                    wizSkinStyleXmlDataSource.DataFile = GetSkinStyleTreeViewDataSourceFile();
                    tbHiddenRootNode.Value = "";

                    string json = JsonConvert.SerializeXmlNode(RootNode);
                    string fontNames = JsonConvert.SerializeObject(FontNames);
                    string currentnode = JsonConvert.SerializeXmlNode(CurrentNode);

                    string script = String.Format("SetupGlobalVariables({0}, {1}, {2});", json, fontNames, currentnode);
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "SetupGlobalVariables", script, true);
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        private string GetIFrameScr(string PageName)
        {
            string DemoURL = HttpContext.Current.Request.Url.AbsoluteUri;
            int index = DemoURL.ToLower().LastIndexOf('/');
            DemoURL = DemoURL.Substring(0, index);
            string PortalDemo = "/Portals/_default/Skins/" + Globals.GetPortalSettings().PortalName + "/" + PageName;

            DemoURL = DemoURL + PortalDemo;

            return DemoURL;
        }

        /// <summary>
        /// SkinStyleTreeView_SelectedNodeChanged runs when the style editor in the tree has been selected
        /// I allows the user to see detail about the style and make modification
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SkinStyleTreeView_SelectedNodeChanged(object sender, EventArgs e)
        {
            ChangeSelectedNode();
        }

        private void ChangeSelectedNode()
        {
            TreeNode tnode = wizSkinStyleTreeView.SelectedNode;

            if (tnode != null)
            {
                tnode.Selected = true;

                //tnode.ExpandAll();
                ExpandToRoot(tnode);
            }

            //tbHiddenIframeSrc.Value = GetIFrameScr("StoreLocatorCollection.htm");

            string json = JsonConvert.SerializeXmlNode(RootNode);
            string fontNames = JsonConvert.SerializeObject(FontNames);
            string currentnode = JsonConvert.SerializeXmlNode(CurrentNode);

            string script = String.Format("SetupGlobalVariables({0}, {1}, {2});", json, fontNames, currentnode);
            this.Page.ClientScript.RegisterStartupScript(this.GetType(),
            "SetupGlobalVariables", script, true);
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
            System.IO.File.WriteAllText(GetCssTestFile(), css);
            System.IO.File.WriteAllText(GetCssFile(), css);
            
            RefreshTreeView();
        }

        private void RefreshTreeView()
        {
            tbHiddenIframeSrc.Value = GetIFrameScr("");
            TreeNode tnode = wizSkinStyleTreeView.SelectedNode;
            if (tnode != null)
            {
                XmlNode xnode = GetSelectedNode(tnode.DataPath);

                wizSkinStyleXmlDataSource.DataFile = GetSkinStyleTreeViewDataSourceFile();
                wizSkinStyleTreeView.DataBind();

                foreach (TreeNode n in wizSkinStyleTreeView.Nodes)
                {
                    TreeNode selected = FindPreviousSelectedNode(n, xnode);

                    if (selected != null)
                    {
                        selected.Selected = true;
                        //selected.ExpandAll();
                        ExpandToRoot(selected);
                        break;
                    }
                }
            }

            ChangeSelectedNode();
        }

        private TreeNode FindPreviousSelectedNode(TreeNode srcTNode, XmlNode desXNode)
        {
            XmlNode srcXNode = GetSelectedNode(srcTNode.DataPath);

            if (srcXNode.Attributes["ID"] != null)
            {
                if (srcXNode.Attributes["ID"].Value == desXNode.Attributes["ID"].Value)
                {
                    return srcTNode;
                }
            }

            if (srcTNode.ChildNodes.Count > 0)
            {
                foreach (TreeNode n in srcTNode.ChildNodes)
                {
                    TreeNode found = FindPreviousSelectedNode(n, desXNode);
                    if (found != null)
                    {
                        return found;
                    }
                }
            }

            return null;
        }

        private void FilterOutInvisibleNodes(XmlNode xNode)
        {
            if (xNode.Attributes != null)
            {
                if (xNode.Attributes["Visible"] != null)
                {
                    if (xNode.Attributes["Visible"].Value == "false")
                    {
                        xNode.ParentNode.RemoveChild(xNode);
                        return;
                    }
                }
            }

            if (xNode.ChildNodes.Count > 0)
            {
                for (int i = xNode.ChildNodes.Count - 1; i >= 0; i--)
                {
                    FilterOutInvisibleNodes(xNode.ChildNodes[i]);
                }
            }

            return;
        }
        /// <summary>
        /// save the changes to CustomTest.css file 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void TestSettings(object sender, EventArgs e)
        {
            XmlDocument xmlDoc = UpdateHelperFile();
            string css = GetCssByXMLDocument(xmlDoc);
            System.IO.File.WriteAllText(GetCssTestFile(), css);

            RefreshTreeView();
        }

        private XmlDocument UpdateHelperFile()
        {
            SaveUploadedImages();
            string value = tbHiddenRootNode.Value;
            XmlDocument xmlDocument = JsonConvert.DeserializeXmlNode(value);
            string xmlFile = GetSkinStyleTreeViewDataSourceFile();
            XmlTextWriter xmlTextWriter = new XmlTextWriter(xmlFile, null);
            xmlTextWriter.Formatting = System.Xml.Formatting.Indented;
            xmlDocument.Save(xmlTextWriter);
            xmlTextWriter.Close();

            return UpdateOriginalXML(xmlDocument);
        }

        private void SaveUploadedImages()
        {
            var objPortalController = new PortalController();
            PortalInfo objPortal = objPortalController.GetPortal(PortalId);
            string filePath = string.Format("{0}\\Portals\\_default\\Skins\\{1}\\Images\\slidingImage1.png", Globals.ApplicationMapPath, objPortal.PortalName);

            int contentLength = MyCentralSiteConfiguration_FileLoader.PostedFile.ContentLength;
            string contentType = MyCentralSiteConfiguration_FileLoader.PostedFile.ContentType;
            string fileName = MyCentralSiteConfiguration_FileLoader.PostedFile.FileName;
            Stream stream = MyCentralSiteConfiguration_FileLoader.PostedFile.InputStream;

            MyCentralSiteConfiguration_FileLoader.PostedFile.SaveAs(filePath);
            
        }

        private XmlDocument UpdateOriginalXML(XmlDocument TreeViewVisible)
        {
            string OriginalXML = GetOriginalXMLHelperFile();
            XmlDocument xmlOriginal = new XmlDocument();
            xmlOriginal.Load(OriginalXML);

            XmlNodeList siteStylesVisible = TreeViewVisible.SelectNodes("//SiteStyle");
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

            xmlOriginal.Save(OriginalXML);

            return xmlOriginal;
        }

        private string GetCssByXMLDocument(XmlDocument xml)
        {
            StringBuilder sb = new StringBuilder();

            foreach (XmlNode node in xml.ChildNodes)
            {
                GetCssFromXmlNode(node, sb);
            }

            return sb.ToString();
        }

        private void GetCssFromXmlNode(XmlNode node, StringBuilder sb)
        {
            if (node.Name == "SiteStyleGroup")
            {
                sb.Append("/* " + node.Attributes["Name"].InnerXml + " */"  + Environment.NewLine);
            }

            if (node.Name == "SiteStyleSubGroup")
            {
                string cssSelector = node.Attributes["CSSSelector"].InnerXml;
                sb.Append(cssSelector + "{ ");
            }

            if (node.ChildNodes.Count > 0)
            {
                foreach (XmlNode n in node.ChildNodes)
                {
                    GetCssFromXmlNode(n, sb);
                }
            }
            else
            {
                if (node.Name == "SiteStyle")
                {
                    string cssSelector = string.Empty;
                    string cssElement = node.Attributes["CSSElement"].InnerXml;
                    string cssValue = node.Attributes["CustomValue"].InnerXml;
                    if (string.IsNullOrEmpty(cssValue))
                    {
                        cssValue = node.Attributes["DefaultValue"].InnerXml;
                    }

                    if (cssValue.IndexOf(';') > 0)
                    {
                        cssValue = cssValue.Substring(0, cssValue.IndexOf(';'));
                    }

                    if (node.ParentNode.Name == "SiteStyleSubGroup")
                    {
                        sb.Append(cssElement + ":" + cssValue + ";");
                        
                    }
                    else
                    {
                        cssSelector = node.Attributes["CSSSelector"].InnerXml;
                        sb.Append(cssSelector + "{ " + cssElement + ":" + cssValue + ";} " + Environment.NewLine);
                    }
                }
            }

            if (node.Name == "SiteStyleSubGroup")
            {
                sb.Append(" } " + Environment.NewLine);
            }
        }

        private string GetOriginalXMLHelperFile()
        {
            var objPortalController = new PortalController();
            PortalInfo objPortal = objPortalController.GetPortal(PortalId);
            return string.Format("{0}\\Portals\\_default\\Skins\\{1}\\DefaultES.xml", Globals.ApplicationMapPath, objPortal.PortalName);
        }

        private string GetSkinStyleTreeViewDataSourceFile()
        {
            string OriginalXML = GetOriginalXMLHelperFile(); 
            string TreeViewVisibleXML = OriginalXML.Replace("DefaultES.xml", "DefaultESVisible.xml"); 

            // Copy visible xml nodes from OriginalXML to TreeViewVisibleXML
            if (!File.Exists(TreeViewVisibleXML))
            {
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(OriginalXML);
                foreach (XmlNode xNode in xmlDoc.ChildNodes)
                {
                    FilterOutInvisibleNodes(xNode);
                }

                XmlTextWriter xmlTextWriter = new XmlTextWriter(TreeViewVisibleXML, null);
                xmlTextWriter.Formatting = System.Xml.Formatting.Indented;
                xmlDoc.Save(xmlTextWriter);
                xmlTextWriter.Close();
            }

            return TreeViewVisibleXML;
        }

        private string GetCssTestFile()
        {
            var objPortalController = new PortalController();
            PortalInfo objPortal = objPortalController.GetPortal(PortalId);
            return string.Format("{0}\\Portals\\_default\\Skins\\{1}\\CustomTest.css", Globals.ApplicationMapPath, objPortal.PortalName);
        }

        private string GetCssFile()
        {
            var objPortalController = new PortalController();
            PortalInfo objPortal = objPortalController.GetPortal(PortalId);
            return string.Format("{0}\\Portals\\_default\\Skins\\{1}\\Custom.css", Globals.ApplicationMapPath, objPortal.PortalName);
        }


        private XmlNode GetSelectedNode(string xPath)
        {
            XmlNode result;
            XmlDocument xmlDoc = new XmlDocument();
            string xmlFile = GetSkinStyleTreeViewDataSourceFile();
            xmlDoc.Load(xmlFile);
            result = xmlDoc.SelectSingleNode(xPath);
            return result;
        }

        private string GetXmlNodeAttributeValue(XmlNode node, string attributeName)
        {
            foreach (XmlAttribute a in node.Attributes)
            {
                if (string.Compare(attributeName, a.Name, true) == 0)
                {
                    return a.Value;
                }
            }

            return string.Empty;
        }

        private void ExpandToRoot(TreeNode node)
        {
            node.Expand();
            if (node.Parent != null)
            {
                ExpandToRoot(node.Parent);
            }
        }

        #endregion

    }
}