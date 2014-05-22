<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="GP_Hosting_ContactForm.View" %>
<%@ Register TagPrefix="cc1" Namespace="Recaptcha.Web.UI.Controls" Assembly="GP_Hosting_ContactForm" %>


<table class="contact_table" >
        <tr>
            <td class="contact_label labelName">Name:</td>
            <td class="contact_field"><asp:TextBox CssClass="required contact_asp_field_name" ID="txtname" runat="server" ></asp:TextBox><asp:Label runat="server" ID="lblname" CssClass="errorlabel"></asp:Label></td>
        </tr>
        <tr>
            <td class="contact_label labelSurname">Surname:</td>
            <td class="contact_field"><asp:TextBox CssClass="required contact_asp_field_surname" ID="txtsurname" runat="server" ></asp:TextBox><asp:Label runat="server" ID="lblsurname" CssClass="errorlabel"></asp:Label></td>
        </tr>
        <tr>
            <td class="contact_label labelContact">Contact No.:</td>
            <td class="contact_field"><asp:TextBox CssClass="required contact_asp_field_Contactnumber" ID="txtcontactno" runat="server" ></asp:TextBox><asp:Label runat="server" ID="lblcontact" CssClass="errorlabel"></asp:Label></td>
        </tr>
        <tr>
            <td class="contact_label labelEmail">Email:</td>
            <td class="contact_field"><asp:TextBox   CssClass="required email contact_asp_field_email" ID="txtemail" runat="server" ></asp:TextBox><asp:Label runat="server" ID="lblemail" CssClass="errorlabel"></asp:Label></td>
        </tr>
        <tr>
            <td class="contact_label labelMessage">Message:</td>
            <td class="contact_field"><asp:TextBox TextMode="MultiLine"  CssClass="required contact_asp_field_message"  ID="txtmessage" runat="server"></asp:TextBox>
                <asp:Label runat="server" ID="lblmessage" CssClass="errorlabel"></asp:Label>
           
            </td>
        </tr>
    <tr>
        <td></td>
        <td><cc1:Recaptcha ID="Recaptcha1"  runat="server" /><asp:Label runat="server" ID="lblcapture" CssClass="errorlabel"></asp:Label></td>
    </tr>
     <tr>
        <td></td>
        <td><asp:Label runat="server" ID="emailsent" CssClass="emailsent"></asp:Label></td>
    </tr>
        <tr>
            <td class="contact_label"></td>
            <td class="contact_field_btn"><asp:Button  Text="Send"   CssClass="contact_asp_field_btn" 
                    ID="btnsubmit" runat="server"  onclick="btnsubmit_Click"></asp:Button></td>
        </tr>
          <tr>
            
            <td class="contact_field_msg" colspan="2"><asp:Label CssClass="contact_form_msg" ID="lblmsg" runat="server"  ></asp:Label></td>
        </tr>
    </table>



