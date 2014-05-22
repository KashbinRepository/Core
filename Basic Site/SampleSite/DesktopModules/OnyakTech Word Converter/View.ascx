<%@ Control Language="c#" CodeBehind="View.ascx.cs" Inherits="OnyakTech.WordConverter.View"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<script language="javascript">
    $(document).ready(function () {
        if ($(".WelcomeImage").length > 0) {
            $(".WelcomeImage").fadeTo("slow", 0.2).fadeTo("slow", 1);
            $(".WelcomeImage").mouseenter(function () {
                $(".WelcomeImage").fadeTo("slow", 0.2).fadeTo("slow", 1);
            });
        }
    }); 
</script>
<center>
    <asp:ImageButton ID="imgbtnWelcomeImage" CssClass="WelcomeImage" runat="server" /></center>
