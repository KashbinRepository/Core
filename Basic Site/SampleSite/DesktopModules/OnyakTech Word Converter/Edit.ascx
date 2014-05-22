<%@ Control Language="c#" CodeBehind="Edit.ascx.cs" Inherits="OnyakTech.WordConverter.Edit"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery(".content").hide();
        jQuery(".heading").click(function () {
            jQuery(this).next(".content").slideToggle(500);
        });
    });
</script>
<asp:PlaceHolder ID="plhOnyakTech" runat="server"></asp:PlaceHolder>
<asp:Label ID="lblUploadWord" resourcekey="lblUploadWord" CssClass="Normal" runat="server" ></asp:Label>
<table cellspacing="0" cellpadding="2" border="0" summary="WordConverter edit design table">
    <tr>
        <td class="Normal" colspan="6">
            <input id="txtFilePath" type="file" name="txtFilePath" runat="server" />
            <asp:Button ID="btnAddfile" resourcekey="Upload" runat="server" CssClass="CommandButton"></asp:Button>
            <br />
            <asp:Label ID="lblUploadError" CssClass="Normal" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Literal ID="ltlWordContent" runat="server"></asp:Literal>
            <br />
            <asp:Label ID="lblWordEditor" CssClass="Normal" resourcekey="lblWordEditor" runat="server"></asp:Label>
            <br />
            <dnn:texteditor id="txtEmailTemplate" runat="server" height="400" width="100%" />
        </td>
    </tr>
    <tr>
        <td class="Normal" colspan="6">
            <asp:Image ID="imgUpdate" runat="server" />
            <asp:LinkButton ID="cmdUpdate" resourcekey="cmdUpdate" CssClass="CommandButton" BorderStyle="none"
                runat="server"></asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="imgCancel" runat="server" />
            <asp:LinkButton ID="cmdCancel" resourcekey="cmdCancel" CssClass="CommandButton" CausesValidation="False"
                BorderStyle="none" runat="server"></asp:LinkButton>
        </td>
    </tr>
</table>
