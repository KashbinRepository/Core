<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.AdminVideo_TypeDetailWizard, App_Web_adminvideo_typedetailwizard.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="Portal" Namespace="DotNetNuke.Security.Permissions.Controls"
    Assembly="DotNetNuke" %>
<asp:Wizard ID="wizVideo" runat="server" CssClass="Normal" ActiveStepIndex="0" SideBarStyle-Width="100px"
    Font-Names="Verdana" CellPadding="5" CellSpacing="5" FinishCompleteButtonType="Link"
    FinishPreviousButtonType="Link" StartNextButtonType="Link" StepNextButtonType="Link"
    StepPreviousButtonType="Link" Width="98%" BackColor="#F7F6F3" BorderColor="#CCCCCC"
    BorderStyle="Solid" BorderWidth="1px" Font-Size="0.8em" OnFinishButtonClick="wizVideo_FinishButtonClick">
    <StepStyle VerticalAlign="Top" Width="100%" BorderWidth="0px" ForeColor="#5D7B9D"
        CssClass="Normal" />
    <NavigationButtonStyle CssClass="Normal" BackColor="#FFFBFF" BorderColor="#CCCCCC"
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
        ForeColor="#284775" />
    <StartNavigationTemplate>
        <table border="0" cellpadding="5" cellspacing="5">
            <tr>
                <td align="right">
                    <asp:LinkButton ID="StartNextButton" runat="server" CommandName="MoveNext" CssClass="dnnPrimaryAction"
                        Text='<%#Localization.GetString("StepNextButton",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>' />
                </td>
            </tr>
        </table>
    </StartNavigationTemplate>
    <StepNavigationTemplate>
        <table border="0" cellpadding="5" cellspacing="5">
            <tr>
                <td align="right">
                    <asp:LinkButton ID="StepPreviousButton" runat="server" CommandName="MovePrevious"
                        Text='<%#Localization.GetString("StepPreviousButton",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                        CssClass="dnnSecondaryAction" />
                </td>
                <td align="right">
                    <asp:LinkButton ID="StepNextButton" runat="server" CommandName="MoveNext" Text='<%#Localization.GetString("StepNextButton",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                        CssClass="dnnPrimaryAction" />
                </td>
            </tr>
        </table>
    </StepNavigationTemplate>
    <FinishNavigationTemplate>
        <table border="0" cellpadding="5" cellspacing="5">
            <tr>
                <td align="right">
                    <asp:LinkButton ID="FinishPreviousButton" runat="server" CommandName="MovePrevious"
                        Text='<%#Localization.GetString("StepPreviousButton",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                        CssClass="dnnSecondaryAction" />
                </td>
                <td align="right">
                    <asp:LinkButton ID="FinishButton" runat="server" CommandName="MoveComplete" Text='<%#Localization.GetString("StepFinishButton",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                        CssClass="dnnPrimaryAction" />
                </td>
            </tr>
        </table>
    </FinishNavigationTemplate>
    <WizardSteps>
        <asp:WizardStep ID="wsGeneral" runat="server" Title='<%# Localization.GetString("wsGeneral", LocalResourceFile) %>'
            StepType="Start">
            <h2>
                <asp:Label ID="lblGeneral" runat="server" />
            </h2>
            <hr />
            <table cellspacing="2" cellpadding="2" class="dnnFormItem">
                <tr>
                    <td>
                        <asp:Label ID="lblGeneralTips" runat="server" resourcekey="lblGeneralTips" /><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButtonList ID="rblCreateType" runat="server" AutoPostBack="True" CssClass="Normal"
                            OnSelectedIndexChanged="rblCreateType_SelectedIndexChanged">
                            <asp:ListItem Value="CreateNew" ResourceKey="li_CreateType_CreateNew" />
                            <asp:ListItem Value="UseExisting" ResourceKey="li_CreateType_UseExisting" />
                            <asp:ListItem Value="Later" ResourceKey="li_CreateType_Later" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsPage" runat="server" Title='<%# Localization.GetString("wsPage", LocalResourceFile) %>'>
            <h2>
                <asp:Label ID="lblPage" runat="server" resourcekey="lblPage" />
            </h2>
            <hr />
            <table cellspacing="2" cellpadding="2" runat="server" id="tblPageCreateNew" class="dnnFormItem">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plTabName" runat="server" ControlName="txtTabName" />
                    </td>
                    <td style="width: 525px">
                        <asp:TextBox ID="txtTabName" runat="server" MaxLength="50" Text="Video Detail" Width="300px" />
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="valTabName" CssClass="NormalRed" runat="server" resourcekey="valTabName.ErrorMessage"
                            Display="Dynamic" ControlToValidate="txtTabName" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plTabTitle" runat="server" ControlName="txtTabTitle" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtTabTitle" runat="server" MaxLength="200" Width="300px" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plTabDescription" runat="server" ControlName="txtTabDescription" />
                    </td>
                    <td width="525px">
                        <asp:TextBox ID="txtTabDescription" runat="server" MaxLength="500" Width="300px" TextMode="MultiLine"
                            Rows="3" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plTabKeywords" runat="server" ControlName="txtTabKeyWords" />
                    </td>
                    <td width="525px">
                        <asp:TextBox ID="txtTabKeyWords" runat="server" MaxLength="500" Width="300px" TextMode="MultiLine"
                            Rows="3" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plParentTab" runat="server" ControlName="ddlParentTab" />
                    </td>
                    <td style="width: 400px">
                        <asp:DropDownList ID="ddlParentTab" runat="server" DataTextField="IndentedTabName"
                            DataValueField="TabId" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dnn:Label ID="plPermissions" runat="server" CssClass="SubHead" ControlName="dgPermissions" />
                        <div style="text-align: left">
                            <Portal:TabPermissionsGrid ID="dgPermissions" runat="server" />
                        </div>
                        <br />
                    </td>
                </tr>
            </table>
            <table cellspacing="2" cellpadding="2"  runat="server" id="tblExistingTab"
                class="dnnFormItem">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plExistingTab" runat="server" ControlName="ddlExistingTab" />
                    </td>
                    <td style="width: 400px">
                        <asp:DropDownList ID="ddlExistingTab" runat="server" DataTextField="IndentedTabName"
                            DataValueField="TabId" />
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsFinish" runat="server" Title='<%# Localization.GetString("Finish",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared) %>'
            StepType="Finish">
            <h2>
                <asp:Label ID="lblFinish" runat="server" Text="Finish" resourcekey="lblFinish" Width="600px" /></h2>
            <hr />
            <asp:Label ID="lblFailure" runat="server" Visible="False" CssClass="NormalRed" />
        </asp:WizardStep>
    </WizardSteps>
    <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top"
        CssClass="Normal" />
    <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" CssClass="CommandButton" />
    <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
        ForeColor="White" HorizontalAlign="Left" />
</asp:Wizard>
