<%@ Control Language="C#" AutoEventWireup="true" Inherits="MICROS.Modules.MyCentralSiteConfiguration.ViewMyCentralSiteConfiguration"
    CodeBehind="ViewMyCentralSiteConfiguration.ascx.cs" %>

<%@ Register TagPrefix="dnn" TagName="Skin" Src="~/controls/SkinThumbNailControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="url" Src="~/controls/UrlControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<script src="<%= ResolveUrl("~/DesktopModules/MyCentral/MyCentralSiteConfiguration/Assets/MyCentralSiteConfigurationUI.js") %>"
    type="text/javascript"></script>
<script src="<%= ResolveUrl("~/DesktopModules/MyCentral/MyCentralSiteConfiguration/Assets/farbtastic.js") %>"
    type="text/javascript"></script>
<script src="<%= ResolveUrl("~/DesktopModules/MyCentral/MyCentralSiteConfiguration/Assets/jquery.multiselect.js") %>"
    type="text/javascript"></script>
<link rel="stylesheet" href="<%= ResolveUrl("~/DesktopModules/MyCentral/MyCentralSiteConfiguration/Assets/farbtastic.css") %>" type="text/css" />
<link rel="stylesheet" href="<%= ResolveUrl("~/DesktopModules/MyCentral/MyCentralSiteConfiguration/Assets/jquery.multiselect.css") %>" type="text/css" />
<link rel="stylesheet" href="<%= ResolveUrl("~/DesktopModules/MyCentral/MyCentralSiteConfiguration/mycentralsiteconfiguration.css") %>" type="text/css" />

<%--<h2><% =Localization.GetString("TemplateEditor.Title", LocalResourceFile)%></h2>--%>
<input type="hidden" runat="server" id="tbHiddenRootNode" name="tbHiddenRootNode" />
<input type="hidden" runat="server" id="tbHiddenPortalName" name="tbHiddenPortalName" />
<input type="hidden" runat="server" id="tbHiddenIframeSrc" name="tbHiddenIframeSrc" />

<div id="MyCentralSiteConfiguration_FileLoaderDiv">
    <input type="file" runat="server" id="MyCentralSiteConfiguration_FileLoader" name="MyCentralSiteConfiguration_FileLoader" size="75" onchange="readImageURL(this);"/>
</div>



<div class="MyCentralSiteConfiguration_StyleEditorArea">    
    <div class="MyCentralSiteConfiguration_TreeViewArea">  
        <asp:XmlDataSource ID="wizSkinStyleXmlDataSource" runat="server" DataFile="~/Portals/_default/MyCentralTemplates/WebOrderingESTemplateStyle.xml">  
        </asp:XmlDataSource>  
        <asp:TreeView ID="wizSkinStyleTreeView" CssClass="MyCentralSiteConfiguration_dnnTreePages" ExpandDepth="1" runat="server" DataSourceID="wizSkinStyleXmlDataSource" ShowLines="True"
            OnSelectedNodeChanged="SkinStyleTreeView_SelectedNodeChanged" 
            ParentNodeStyle-ImageUrl="Images/tip.png" RootNodeStyle-ImageUrl="Images/ok.png" LeafNodeStyle-ImageUrl="Images/pencil.png">
            <HoverNodeStyle BackColor="#CCCCCC" BorderColor="#888888" BorderStyle="Solid" Font-Underline="True" />  
            <SelectedNodeStyle BackColor="#AAAAAA" BorderColor="#888888" BorderStyle="Solid" BorderWidth="0px" Font-Underline="False" HorizontalPadding="3px" VerticalPadding="1px" />  
            <DataBindings>  
                <asp:TreeNodeBinding DataMember="MyCentralSiteStyles" Text="MyCentralSiteStyles" />
                <asp:TreeNodeBinding DataMember="SiteStyleGroup" TextField="Name" />  
                <asp:TreeNodeBinding DataMember="SiteStyleSubGroup" TextField="Name" />
                <asp:TreeNodeBinding DataMember="SiteStyle" TextField="Name" />
            </DataBindings>  
        </asp:TreeView>
      
    </div>
    
    <div class="MyCentralSiteConfiguration_SettingArea">
        <div class="MyCentralSiteConfiguration_SettingInfo">
            <asp:Label ID="lblMessage" runat="server"/>
        </div>
        <div id="MyCentralSiteConfiguration_PropertySettingDiv" class="MyCentralSiteConfiguration_PropertyEditor">
            <table id="MyCentralSiteConfiguration_PropertyEditorTable">
                <tbody>                              
                </tbody>
            </table> 
            <div id="MyCentralSiteConfiguration_ActionButtonesDiv">
                <input type="button" id="ButtonReset" class="MyCentralSiteConfiguration_ActionButtons" value="Reset To Default" onclick="ButtonResetClick()"/>
                <asp:Button ID="ButtonTest" class="MyCentralSiteConfiguration_ActionButtons" Text="View Demo Page" OnClientClick="ButtonTestClick()" runat="server" OnClick="TestSettings"/>
                <asp:Button ID="ButtonApply" class="MyCentralSiteConfiguration_ActionButtons" Text="Apply Settings To Portal" OnClientClick="ButtonApplyClick()" runat="server" OnClick="SaveSettings"/>                
            </div>
            <div id="MyCentralSiteConfiguration_DemoPageSelectDiv">
                <label id="MyCentralSiteConfiguration_DemoPageSelectLable">Select Demo Page: </label>
                <select id="MyCentralSiteConfiguration_DemoPageSelect" onchange="OnDemoPageSelectChange();">
                   <option value="StoreLocatorCollection.htm">StoreLocator</option>
                   <option value="StoreLocatorDeliveryDefault.htm">StoreLocatorDeliver</option>
                </select>
            </div>           
        </div>                
        <div class="MyCentralSiteConfiguration_DemoPage">                          
            <iframe src="" id ="MyCentralSiteConfiguration_DemoFrame" name="MyCentralSiteConfiguration_DemoFrame"></iframe>
        </div>        
    </div>
</div>

