<%@ page language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.Detail_AddTicket, App_Web_detail_addticket.aspx.24b431c5" viewStateEncryptionMode="Always" %>

<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add help ticket</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="lblLoginTip" runat="server" resourcekey="lblLoginTip" ForeColor="Red"  />
    <table cellspacing="0" cellpadding="2" border="0" align="left" width="100%" class="Normal"
        runat="server" id="tblTicket">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblTicket" runat="server" ResourceKey="lblTicket" /><br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTicketTitle" runat="server" ResourceKey="lblTicketTitle" />
            </td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" Columns="60" />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                    ToolTip="Reuired" AlternateText="Required" />
                <asp:RequiredFieldValidator ID="valNameRequired" runat="server" ControlToValidate="txtTitle"
                    Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td valign="middle">
                <asp:Label ID="lblTicketDescription" runat="server" ResourceKey="lblTicketDescription" />
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" Columns="60" TextMode="Multiline"
                    Rows="10" />
                <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                    ToolTip="Reuired" AlternateText="Required" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescription"
                    Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <dnn:CommandButton ID="btnCreateTicket" runat="server" ResourceKey="btnCreateTicket"
                    ImageUrl="~/images/add.gif" OnCommand="btnCreateTicket_Click" />
                &nbsp;&nbsp;
                <asp:HyperLink runat="server" Target="_blank" ID="hlViewTicket" resourcekey="hlViewTicket" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" >
                <asp:Label ID="lblAdded" runat="server" resourcekey="lblAdded"  ForeColor="Green" 
                    Visible="false" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
