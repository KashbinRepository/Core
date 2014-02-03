<%@ Control Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.Modules.abContactForm.Settings" Codebehind="Settings.ascx.cs" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/labelcontrol.ascx" %>

	<h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("BasicSettings")%></a></h2>
	<fieldset>
        <div class="dnnFormItem">
            <dnn:Label ID="lblEmailAddress" runat="server" Text="Destination Email: " /> 
            <asp:TextBox ID="txtEmailAddress" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblSentMessage" runat="server" Text="Sent Message: " /> 
            <asp:TextBox ID="txtSentMessage" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:label ID="lblCaptcha" runat="server" Text="Require Captcha? " />
            <asp:CheckBox ID="cbCaptcha" runat="server" />
        </div>
    </fieldset>
