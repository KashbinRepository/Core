<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="ModuleStyleEditor.ascx.cs" Inherits="MICROS.Modules.MyCentralSiteConfiguration.ModuleStyleEditor" %>

<script src="<%= ResolveUrl("~/DesktopModules/MyCentral/MyCentralSiteConfiguration/Assets/farbtastic.js") %>"
    type="text/javascript"></script>
<script src="<%= ResolveUrl("~/DesktopModules/MyCentral/MyCentralSiteConfiguration/Assets/jquery.multiselect.js") %>"
    type="text/javascript"></script>
<script src="<%= ResolveUrl("~/DesktopModules/MyCentral/MyCentralSiteConfiguration/Assets/ModuleStyleEditorUI.js") %>"
    type="text/javascript"></script>


<link rel="stylesheet" href="<%= ResolveUrl("~/DesktopModules/MyCentral/MyCentralSiteConfiguration/Assets/farbtastic.css") %>" type="text/css" />
<link rel="stylesheet" href="<%= ResolveUrl("~/DesktopModules/MyCentral/MyCentralSiteConfiguration/Assets/jquery.multiselect.css") %>" type="text/css" />
<link rel="stylesheet" href="<%= ResolveUrl("~/DesktopModules/MyCentral/MyCentralSiteConfiguration/MyCentralModuleStyleEditor.css") %>" type="text/css" />

<input type="hidden" runat="server" id="tbHiddenCurrentEditNode" name="tbHiddenCurrentEditNode" />
<input type="hidden" runat="server" id="HiddenImageControlArray" name="HiddenImageControlArray" />

<div id="MyCentralModuleStyleSetting">
    <div id="MyCentralModuleStyleSetting_MenuDiv"></div>
    <div id="MyCentralModuleStyleSetting_SettingDiv">
        <table id="MyCentralSiteConfiguration_PropertyEditorTable">
            <tbody>                              
            </tbody>
        </table>
        <div id="MyCentralSiteConfiguration_ActionButtonesDiv">
            <input type="button" id="ButtonReset" class="MyCentralSiteConfiguration_ActionButtons" value="Reset To Default" onclick="ButtonResetClick()"/>
            <asp:Button ID="ButtonApply" class="MyCentralSiteConfiguration_ActionButtons" Text="Apply Settings To Portal" OnClientClick="return ButtonApplyClick();" runat="server" OnClick="SaveSettings"/>
        </div>
    </div>
</div>

<div id="MyCentralModuleStyleSetting_FileLoaderDiv">
<div id="MyCentralModuleStyleSetting_FileLoaderDiv1">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader1" name="MyCentralModuleStyleSetting_FileLoader1" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv2">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader2" name="MyCentralModuleStyleSetting_FileLoader2" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv3">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader3" name="MyCentralModuleStyleSetting_FileLoader3" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv4">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader4" name="MyCentralModuleStyleSetting_FileLoader4" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv5">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader5" name="MyCentralModuleStyleSetting_FileLoader5" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv6">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader6" name="MyCentralModuleStyleSetting_FileLoader6" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv7">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader7" name="MyCentralModuleStyleSetting_FileLoader7" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv8">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader8" name="MyCentralModuleStyleSetting_FileLoader8" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv9">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader9" name="MyCentralModuleStyleSetting_FileLoader9" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv10">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader10" name="MyCentralModuleStyleSetting_FileLoader10" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv11">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader11" name="MyCentralModuleStyleSetting_FileLoader11" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv12">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader12" name="MyCentralModuleStyleSetting_FileLoader12" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv13">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader13" name="MyCentralModuleStyleSetting_FileLoader13" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv14">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader14" name="MyCentralModuleStyleSetting_FileLoader14" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv15">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader15" name="MyCentralModuleStyleSetting_FileLoader15" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv16">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader16" name="MyCentralModuleStyleSetting_FileLoader16" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv17">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader17" name="MyCentralModuleStyleSetting_FileLoader17" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv18">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader18" name="MyCentralModuleStyleSetting_FileLoader18" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv19">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader19" name="MyCentralModuleStyleSetting_FileLoader19" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderDiv20">
    <input type="file" runat="server" class="MyCentralModuleStyleSetting_FileLoader" id="MyCentralModuleStyleSetting_FileLoader20" name="MyCentralModuleStyleSetting_FileLoader20" size="40" onchange="readImageURL(this);"/>
</div>
<div id="MyCentralModuleStyleSetting_FileLoaderAnchor"></div>
</div>