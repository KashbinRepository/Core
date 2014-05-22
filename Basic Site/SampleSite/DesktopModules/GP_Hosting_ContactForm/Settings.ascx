<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="GP_Hosting_ContactForm.Settings" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>


<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/labelcontrol.ascx" %>

<h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded">SMTP Settings</a></h2>
<fieldset>
    <div class="dnnFormMessage dnnFormSuccess hidemelater" id="yesitdid" runat="server">Test Email Sent</div>
    <div class="dnnFormMessage dnnFormValidationSummary hidemelater" id="noitdidnt" runat="server">Error Sending test email</div>

    <div class="dnnFormItem">
        <dnn:Label ID="usednnsmtp" runat="server" />
        <asp:CheckBox runat="server" ID="chkusednn" />
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="SMTPServer" runat="server" />
        <asp:TextBox ID="txtSmtpServer" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="smtpport" runat="server" />
        <asp:TextBox ID="txtsmtpport" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label ID="smtpuser" runat="server" />
        <asp:TextBox ID="txtsmtpusername" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label ID="smtppassword" runat="server" />
        <asp:TextBox ID="txtsmtppassword" runat="server" />
    </div>
    
     <div class="dnnFormItem">
        <dnn:label ID="lblSentEmail" runat="server" />
        <asp:TextBox ID="txtemailsent" runat="server" />
    </div>
    
     <div class="dnnFormItem">
        <dnn:label ID="lblErrorEmailsend" runat="server" />
        <asp:TextBox ID="txtemailerror" runat="server" />
    </div>

    <div class="dnnFormItem">
        <dnn:label ID="testemail" runat="server" />
        <asp:TextBox ID="txttestemail" runat="server" />
        <ul class="dnnActions dnnClear">
            <li>
                <asp:LinkButton ID="TestSMTPSettings" runat="server" CssClass="dnnPrimaryAction" ResourceKey="TestSettings" OnClick="TestSMTPSettings_Click" /></li>
        </ul>
    </div>


</fieldset>


<h2 id="H1" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded">Email Settings</a></h2>
<fieldset>
    <div class="dnnFormItem">
        <dnn:Label ID="toaddress" runat="server" />
        <asp:TextBox ID="txttoaddress" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="fromaddress" runat="server" />
        <asp:TextBox ID="txtfromaddress" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="replyfrom" runat="server" />
        <asp:TextBox ID="txtreplyfrom" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label ID="bccaddress" runat="server" />
        <asp:TextBox ID="txtbccaddress" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:label ID="EmailSubject" runat="server" />
        <asp:TextBox ID="txtEmailSubject" runat="server" />
    </div>
    
     <div class="dnnFormItem">
        <dnn:label ID="lblAutoReplySubject" runat="server" />
        <asp:TextBox ID="txtautoreplysubject" runat="server" />
    </div>

</fieldset>

<h2 id="H4" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded">Validation</a></h2>
<fieldset>
    
    <div class="dnnFormItem">
        <dnn:Label ID="NameFieldRequired" runat="server" />
        <asp:CheckBox runat="server" ID="NameField"/>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="NameFieldmsg" runat="server" />
        <asp:TextBox runat="server" ID="namemsg"></asp:TextBox>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="SurnameFieldRequired" runat="server" />
        <asp:CheckBox runat="server" ID="SurnameField"/>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="SurnameFieldMsg" runat="server" />
       <asp:TextBox runat="server" ID="surnamemsg"></asp:TextBox>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="ContactNumberRequired" runat="server" />
        <asp:CheckBox runat="server" ID="chkContactNumberField"/>
    </div>
   <div class="dnnFormItem">
        <dnn:Label ID="contactnumbermsg" runat="server" />
       <asp:TextBox runat="server" ID="contmsg"></asp:TextBox>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="MessageFieldRequired" runat="server" />
        <asp:CheckBox runat="server" ID="chkMessageField"/>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="messagefield" runat="server" />
        <asp:TextBox runat="server" ID="messagemsg"></asp:TextBox>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="profanitycheck" runat="server" />
        <asp:CheckBox runat="server" ID="chkprofanity"/>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="profanitymsg" runat="server" />
        <asp:TextBox runat="server" ID="txtprofanitymsg"></asp:TextBox>
    </div>
     <div class="dnnFormItem">
        <dnn:Label ID="EmailValidation" runat="server" />
        <asp:TextBox ID="txtemailvalidationregex" runat="server" /> <br/>
        
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="emailmessage" runat="server" />
        <asp:TextBox runat="server" ID="EmailError"></asp:TextBox>
    </div>
     <asp:LinkButton runat="server" ID="defaultregex" Text="Restore default regex" OnClick="defaultregex_Click"></asp:LinkButton>
   

</fieldset>

<h2 id="H3" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded">Google reCaptcha</a></h2>
<fieldset>
    <div class="dnnFormItem">
        <dnn:Label ID="EnableRecaptcha" runat="server" />
        <asp:CheckBox runat="server" ID="ChkEnableRecaptcha" />
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="PublicKey" runat="server" />
        <asp:TextBox ID="txtpublickey" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="PrivateKey" runat="server" />
        <asp:TextBox ID="txtprivateKey" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="RecaptchaTheme" runat="server" />
        <asp:DropDownList runat="server" ID="RecaptchaThemeDDL">
            <asp:ListItem>Blackglass</asp:ListItem>
            <asp:ListItem>Clean</asp:ListItem>
            <asp:ListItem>Red</asp:ListItem>
            <asp:ListItem>White</asp:ListItem>
        </asp:DropDownList>
    </div>
     <div class="dnnFormItem">
        <dnn:Label ID="blankrecaptcha" runat="server" />
        <asp:TextBox runat="server" ID="txtblankcaptcha"></asp:TextBox>
    </div>
     <div class="dnnFormItem">
        <dnn:Label ID="incorrectcaptcha" runat="server" />
        <asp:TextBox runat="server" ID="txtincorectcaptcha"></asp:TextBox>
    </div>
</fieldset>

<h2 id="H2" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded">Reply Email</a></h2>
<fieldset>
    <div class="dnnFormItem">
        <dnn:Label ID="usereply" runat="server" />
        <asp:CheckBox runat="server" ID="chkusereply" />
       
    </div>
    
    <div class="dnnFormMessage dnnFormInfo"> <dnn:Label ID="lbltokens" runat="server" /></div>
   
  
        
    <div class="dnnFormItem">
        <dnn:TextEditor id="txtReplyEmail" runat="server" Width="100%"></dnn:TextEditor>
    </div>

</fieldset>


