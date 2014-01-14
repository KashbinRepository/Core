<%@ control language="C#" inherits="Cross.Modules.FlashNavigate.UI.EditFlash, App_Web_editflash.ascx.b9700937" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="sectionhead" Src="~/controls/SectionHeadControl.ascx" %>

<script type="text/javascript">
    function CheckAll() {
        if ($(":checkbox[id*='chkAll']").attr("checked") == true) {
            $(":checkbox[id*='chkItem']").attr("checked", true);
        }
        else {
            $(":checkbox[id*='chkItem']").attr("checked", false);
        }
    }
</script>

<asp:Wizard ID="wizFlash" runat="server" CssClass="Normal" ActiveStepIndex="0" Font-Names="Verdana"
    SideBarButtonStyle-Width="110px" CellPadding="5" CellSpacing="5" FinishCompleteButtonType="Link"
    FinishPreviousButtonType="Link" StartNextButtonType="Link" StepNextButtonType="Link"
    StepPreviousButtonType="Link" Width="98%" BackColor="#F7F6F3" BorderColor="#CCCCCC"
    BorderStyle="Solid" BorderWidth="1px" Font-Size="0.8em" OnFinishButtonClick="wizFlash_FinishButtonClick">
    <StepStyle VerticalAlign="Top" Width="100%" BorderWidth="0px" ForeColor="#5D7B9D"
        CssClass="Normal" />
    <NavigationButtonStyle CssClass="Normal" BackColor="#FFFBFF" BorderColor="#CCCCCC"
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em"
        ForeColor="#284775" />
    <StepNavigationTemplate>
        <table border="0" cellpadding="5" cellspacing="5">
            <tr>
                <td align="right">
                    <asp:LinkButton ID="StepPreviousButton" runat="server" CommandName="MovePrevious"
                        Text='<%#Localization.GetString("StepPreviousButton", LocalResourceFile)%>' CssClass="CommandButton" />
                </td>
                <td align="right">
                    <asp:LinkButton ID="StepNextButton" runat="server" CommandName="MoveNext" Text='<%#Localization.GetString("StepNextButton", LocalResourceFile)%>'
                        CssClass="CommandButton" />
                </td>
                <td align="right">
                    <asp:HyperLink ID="hlCancel" runat="server" Text="Cancel" CssClass="CommandButton"
                        resourcekey="cmdCancel" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(this.TabId)%>" />
                </td>
            </tr>
        </table>
    </StepNavigationTemplate>
    <WizardSteps>
        <asp:WizardStep ID="wsGeneral" runat="server" Title='<%# Localization.GetString("wsGeneral", LocalResourceFile) %>'
            StepType="Start">
            <h2>
                <asp:Label ID="lblGeneral" runat="server" resourcekey="lblGeneral" />
            </h2>
            <hr />
            <table cellspacing="2" cellpadding="2" class="Normal">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plPlayMode" runat="server" Suffix=":" ControlName="ddlPlayMode">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbPlayModeList" runat="server" AutoPostBack="True" CssClass="Normal"
                            OnSelectedIndexChanged="rbPlayModeList_SelectedIndexChanged">
                            <asp:ListItem Value="ImageNavigate" resourcekey="liPlayModeList_ImageNavigate" />
                            <asp:ListItem Value="ImageNavigateIntegrative" resourcekey="liPlayModeList_ImageNavigateIntegrative" />
                            <asp:ListItem Value="ImageNavigateBlack" resourcekey="liPlayModeList_ImageNavigateBlack" />
                            <asp:ListItem Value="ImageNavigateEx" resourcekey="liPlayModeList_ImageNavigateEx" />
                            <asp:ListItem Value="ImageNavigateButtonFree" resourcekey="liPlayModeList_ImageNavigateButtonFree" />
                        </asp:RadioButtonList>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plViewTemplate" runat="server" Suffix=":" ControlName="ddlViewTemplate">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlViewTemplate" CssClass="Normal" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFlashWidth" runat="server" Text="Flash Width" ResourceKey="plFlashWidth"
                            ControlName="txtFlashWidth">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlashWidth" runat="server" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regWidth" resourcekey="MustBeInteger" runat="server"
                            ValidationExpression="\d*" ControlToValidate="txtFlashWidth"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFlashHeight" runat="server" ResourceKey="plFlashHeight" ControlName="txtFlashHeight"
                            Text="Flash Height">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlashHeight" runat="server" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regHeight" resourcekey="MustBeInteger" runat="server"
                            ValidationExpression="\d*" ControlToValidate="txtFlashHeight"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFlashBgColor" runat="server" ControlName="txtFlashBgColor" Text="Background Color">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFlashBgColor" runat="server" Columns="16"></asp:TextBox>
                        <a id="pickFlashBgColor" name="pickFlashBgColor" href="javascript:void(PickFlashBgColor())"
                            target="_self">
                            <asp:Image ID="Image13" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/FlashNavigate/images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtFlashBgColor"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator28" runat="server"
                            ControlToValidate="txtFlashBgColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFlashAlign" runat="server" Suffix=":" ControlName="ddlFlashAlign"
                            Text="Flash Align">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFlashAlign" runat="server">
                            <asp:ListItem Value="left" ResourceKey="liFlashAlign_left" />
                            <asp:ListItem Value="center" ResourceKey="liFlashAlign_center" />
                            <asp:ListItem Value="right" ResourceKey="liFlashAlign_right" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFlashWmode" runat="server" Suffix=":" ControlName="ddlFlashWmode"
                            Text="Flash Wmode Option">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFlashWmode" runat="server">
                            <asp:ListItem Value="window" resourcekey="liFlashWmode_window" />
                            <asp:ListItem Value="opaque" resourcekey="liFlashWmode_opaque" />
                            <asp:ListItem Value="transparent" resourcekey="liFlashWmode_transparent" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plLinkTarget" ControlName="ddlLinkTarget" Suffix=":" runat="server">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLinkTarget" runat="server">
                            <asp:ListItem Value="_self" resourcekey="liLinkTarget_Self">_Self</asp:ListItem>
                            <asp:ListItem Value="_blank" resourcekey="liLinkTarget_Blank">_Blank</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <dnn:sectionhead ID="secPlayModeTips" runat="server" Section="tblPlayModeTips" ResourceKey="secPlayModeTips"
                IncludeRule="True" IsExpanded="False" CssClass="SubHead">
            </dnn:sectionhead>
            <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblPlayModeTips">
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgImageNavigate_Classical" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/FlashNavigate/images/ImageNavigate_Classical.jpg" />
                        <br />
                        <asp:Label ID="lblImageNavigate_Classical" resourcekey="lblImageNavigate_Classical"
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Image ID="imgImageNavigate_Integrative" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/FlashNavigate/images/ImageNavigate_Integrative.jpg" />
                        <br />
                        <asp:Label ID="lblImageNavigate_Integrative" resourcekey="lblImageNavigate_Integrative"
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Image ID="imgImageNavigate_Black" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/FlashNavigate/images/ImageNavigate_Black.jpg" />
                        <br />
                        <asp:Label ID="lblImageNavigate_Black" resourcekey="lblImageNavigate_Black" runat="server"></asp:Label><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imbImageNavigate_Extension" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/FlashNavigate/images/ImageNavigate_Extension.jpg" />
                        <br />
                        <asp:Label ID="lblImageNavigate_Extension" resourcekey="lblImageNavigate_Extension"
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Image ID="imgNavigate_ButtonFree" runat="server" ImageAlign="Top" ImageUrl="~/DesktopModules/FlashNavigate/images/ImageNavigate_ButtonFree.jpg" />
                        <br />
                        <asp:Label ID="lblImageNavigate_ButtonFree" resourcekey="lblImageNavigate_ButtonFree"
                            runat="server"></asp:Label><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="lblPlayModeTips" resourcekey="lblPlayModeTips" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsFlashSettings" runat="server" Title='<%# Localization.GetString("wsFlashSettings",LocalResourceFile) %>'>
            <h2>
                <asp:Label ID="lblFlashNavigateSettings" runat="server" resourcekey="lblFlashNavigateSettings"
                    Visible="False" />
                <asp:Label ID="lblFlashNavigateIntegrativeSettings" runat="server" resourcekey="lblFlashNavigateIntegrativeSettings"
                    Visible="False" />
                <asp:Label ID="lblFlashNavigateBlackSettings" runat="server" resourcekey="lblFlashNavigateBlackSettings"
                    Visible="False" />
                <asp:Label ID="lblFlashNavigateExSettings" runat="server" resourcekey="lblFlashNavigateExSettings"
                    Visible="False" />
                <asp:Label ID="lblFlashNavigateButtonFreeSettings" runat="server" resourcekey="lblFlashNavigateButtonFreeSettings"
                    Visible="False" />
            </h2>
            <hr />
            <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblNavigateSettings"
                visible="false">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plIntervalTime" runat="server" ControlName="txtIntervalTime" Text="Rotator Internal(sec)">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtIntervalTime" runat="server" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtIntervalTime"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plTextHeight" runat="server" ResourceKey="plTextHeight" ControlName="txtTextHeight"
                            Text="Image Title Height">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTextHeight" runat="server" Width="100px"></asp:TextBox>
                        <asp:Label ID="lblTextHeightTips" runat="server" resourcekey="lblTextHeightTips"
                            Text="Set it to zero if you don't want to show image title"></asp:Label>
                        <asp:RegularExpressionValidator ID="regTextHeight" resourcekey="MustBeInteger" runat="server"
                            ValidationExpression="\d*" ControlToValidate="txtTextHeight"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plTextAlign" runat="server" Suffix=":" ControlName="ddlTextAlign"
                            Text="Text Align">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTextAlign" runat="server">
                            <asp:ListItem Value="left" ResourceKey="liTextAlign_left" />
                            <asp:ListItem Value="center" ResourceKey="liTextAlign_center" />
                            <asp:ListItem Value="right" ResourceKey="liTextAlign_right" />
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblNavigateIntegrativeSettings"
                visible="false">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plNavigateIntegrative_TextSize" runat="server" ControlName="txtNavigateIntegrative_TextSize">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateIntegrative_TextSize" runat="server" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator14" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNavigateIntegrative_TextSize"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plNavigateIntegrative_TxtColor" runat="server" ControlName="txtNavigateIntegrative_TxtColor">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateIntegrative_TxtColor" runat="server" Columns="16"></asp:TextBox>
                        <a id="pickNavigateIntegrative_TxtColor" name="pickNavigateIntegrative_TxtColor"
                            href="javascript:void(PickNavigateIntegrative_TxtColor())" target="_self">
                            <asp:Image ID="Image9" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/FlashNavigate/images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtNavigateIntegrative_TxtColor"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server"
                            ControlToValidate="txtNavigateIntegrative_TxtColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plNavigateIntegrative_Speed" runat="server" ControlName="txtNavigateIntegrative_Speed">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateIntegrative_Speed" runat="server" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator15" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNavigateIntegrative_Speed"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plNavigateIntegrative_BtnBg" runat="server" ControlName="txtNavigateIntegrative_BtnBg">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateIntegrative_BtnBg" runat="server" Columns="16"></asp:TextBox>
                        <a id="pickNavigateIntegrative_BtnBg" name="pickNavigateIntegrative_BtnBg" href="javascript:void(PickNavigateIntegrative_BtnBg())"
                            target="_self">
                            <asp:Image ID="Image8" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/FlashNavigate/images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtNavigateIntegrative_BtnBg"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server"
                            ControlToValidate="txtNavigateIntegrative_BtnBg" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
            </table>
            <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblNavigateBlackSettings"
                visible="false">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plNavigateBlack_Speed" runat="server" ControlName="txtNavigateBlack_Speed">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateBlack_Speed" runat="server" Width="60px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNavigateBlack_Speed"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblNavigateExSettings"
                visible="false">
                <tr>
                    <td>
                        <dnn:sectionhead ID="secNavigateExGeneral" runat="server" Section="tblNavigateExGeneral"
                            ResourceKey="secNavigateExGeneral" IncludeRule="True" IsExpanded="True" CssClass="SubHead">
                        </dnn:sectionhead>
                        <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblNavigateExGeneral">
                            <tr>
                                <td>
                                    <dnn:Label ID="plCheckXhtml" runat="server" ControlName="chkCheckXhtml">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkCheckXhtml" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plRoundCorner" runat="server" ControlName="txtRoundCorner">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtRoundCorner" runat="server" Width="100px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" resourcekey="MustBeInteger"
                                        runat="server" ValidationExpression="\d*" ControlToValidate="txtRoundCorner"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plAutoPlayTime" runat="server" ControlName="txtAutoPlayTime">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAutoPlayTime" runat="server" Width="100px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" resourcekey="MustBeInteger"
                                        runat="server" ValidationExpression="\d*" ControlToValidate="txtAutoPlayTime"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plIsHeightQuality" runat="server" ControlName="chkIsHeightQuality">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkIsHeightQuality" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plTransDuration" runat="server" ControlName="txtTransDuration">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTransDuration" runat="server" Width="100px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" resourcekey="MustBeInteger"
                                        runat="server" ValidationExpression="\d*" ControlToValidate="txtTransDuration"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plChangImageMode" ControlName="ddlChangImageMode" Suffix=":" runat="server">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlChangImageMode" runat="server">
                                        <asp:ListItem Value="click" resourcekey="liChangImageMode_click"></asp:ListItem>
                                        <asp:ListItem Value="hover" resourcekey="liChangImageMode_hover"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plScaleMode" ControlName="ddlScaleMode" Suffix=":" runat="server">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlScaleMode" runat="server">
                                        <asp:ListItem Value="showAll" resourcekey="liScaleMode_showAll"></asp:ListItem>
                                        <asp:ListItem Value="exactFil" resourcekey="liScaleMode_exactFil"></asp:ListItem>
                                        <asp:ListItem Value="noScale" resourcekey="liScaleMode_noScale"></asp:ListItem>
                                        <asp:ListItem Value="noBorder" resourcekey="liScaleMode_noBorder"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plTransform" ControlName="ddlTransform" Suffix=":" runat="server">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlTransform" runat="server">
                                        <asp:ListItem Value="alpha" resourcekey="liTransform_alpha"></asp:ListItem>
                                        <asp:ListItem Value="blur" resourcekey="liTransform_blur"></asp:ListItem>
                                        <asp:ListItem Value="left" resourcekey="liTransform_left"></asp:ListItem>
                                        <asp:ListItem Value="right" resourcekey="liTransform_right"></asp:ListItem>
                                        <asp:ListItem Value="top" resourcekey="liTransform_top"></asp:ListItem>
                                        <asp:ListItem Value="bottom" resourcekey="liTransform_bottom"></asp:ListItem>
                                        <asp:ListItem Value="breathe" resourcekey="liTransform_breathe"></asp:ListItem>
                                        <asp:ListItem Value="breatheBlur" resourcekey="liTransform_breatheBlur"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:sectionhead ID="secNavigateExBotton" runat="server" Section="tblNavigateExBotton"
                            ResourceKey="secNavigateExBotton" IncludeRule="True" IsExpanded="True" CssClass="SubHead">
                        </dnn:sectionhead>
                        <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblNavigateExBotton">
                            <tr>
                                <td style="width: 200px">
                                    <dnn:Label ID="plIsShowBtn" runat="server" ControlName="chkIsShowBtn">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkIsShowBtn" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plBtnSetMargin" runat="server" ControlName="txtBtnSetMargin">
                                    </dnn:Label>
                                </td>
                                <td align="left" class="Normal">
                                    <asp:TextBox ID="txtBtnSetMargin" runat="server" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plBtnDistance" runat="server" ControlName="txtBtnDistance">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBtnDistance" runat="server" Width="100px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" resourcekey="MustBeInteger"
                                        runat="server" ValidationExpression="\d*" ControlToValidate="txtBtnDistance"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plBtnAlpha" runat="server" ControlName="txtBtnAlpha">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBtnAlpha" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plBtnTextColor" runat="server" ControlName="txtBtnTextColor">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBtnTextColor" runat="server" Columns="16"></asp:TextBox>
                                    <a id="pickBtnTextColor" name="pickBtnTextColor" href="javascript:void(PickBtnTextColor())"
                                        target="_self">
                                        <asp:Image ID="Image3" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/FlashNavigate/images/ColorPick.jpg" /></a>&nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtBtnTextColor"
                                        CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtBtnTextColor"
                                        CssClass="NormalRed" ResourceKey="InvalidHex" SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plBtnDefaultColor" runat="server" ControlName="txtBtnDefaultColor">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBtnDefaultColor" runat="server" Columns="16"></asp:TextBox>
                                    <a id="pickBtnDefaultColor" name="pickBtnDefaultColor" href="javascript:void(PickBtnDefaultColor())"
                                        target="_self">
                                        <asp:Image ID="Image4" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/FlashNavigate/images/ColorPick.jpg" /></a>&nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBtnDefaultColor"
                                        CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtBtnDefaultColor"
                                        CssClass="NormalRed" ResourceKey="InvalidHex" SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plBtnHoverColor" runat="server" ControlName="txtBtnHoverColor">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBtnHoverColor" runat="server" Columns="16"></asp:TextBox>
                                    <a id="pickBtnHoverColor" name="pickBtnHoverColor" href="javascript:void(PickBtnHoverColor())"
                                        target="_self">
                                        <asp:Image ID="Image5" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/FlashNavigate/images/ColorPick.jpg" /></a>&nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtBtnHoverColor"
                                        CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                        ControlToValidate="txtBtnHoverColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                                        SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plBtnFocusColor" runat="server" ControlName="txtBtnFocusColor">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBtnFocusColor" runat="server" Columns="16"></asp:TextBox>
                                    <a id="pickBtnFocusColor" name="pickBtnFocusColor" href="javascript:void(PickBtnFocusColor())"
                                        target="_self">
                                        <asp:Image ID="Image6" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/FlashNavigate/images/ColorPick.jpg" /></a>&nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtBtnFocusColor"
                                        CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                                        ControlToValidate="txtBtnFocusColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                                        SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:sectionhead ID="secNavigateExTitle" runat="server" Section="tblNavigateExTitle"
                            ResourceKey="secNavigateExTitle" IncludeRule="True" IsExpanded="True" CssClass="SubHead">
                        </dnn:sectionhead>
                        <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblNavigateExTitle">
                            <tr>
                                <td style="width: 200px">
                                    <dnn:Label ID="plIsShowTitle" runat="server" ControlName="chkIsShowTitle">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkIsShowTitle" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plTitleBgColor" runat="server" ControlName="txtTitleBgColor">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTitleBgColor" runat="server" Columns="16"></asp:TextBox>
                                    <a id="pickTitleBgColor" name="pickTitleBgColor" href="javascript:void(PickTitleBgColor())"
                                        target="_self">
                                        <asp:Image ID="Image1" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/FlashNavigate/images/ColorPick.jpg" /></a>&nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitleBgColor"
                                        CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtTitleBgColor"
                                        CssClass="NormalRed" ResourceKey="InvalidHex" SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plTitleTextColor" runat="server" ControlName="txtTitleTextColor">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTitleTextColor" runat="server" Columns="16"></asp:TextBox>
                                    <a id="pickTitleTextColor" name="pickTitleTextColor" href="javascript:void(PickTitleTextColor())"
                                        target="_self">
                                        <asp:Image ID="Image2" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/FlashNavigate/images/ColorPick.jpg" /></a>&nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTitleTextColor"
                                        CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtTitleTextColor"
                                        CssClass="NormalRed" ResourceKey="InvalidHex" SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plTitleBgAlpha" runat="server" ControlName="txtTitleBgAlpha">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTitleBgAlpha" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plTitleFont" runat="server" ControlName="txtTitleFont">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTitleFont" runat="server" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plTitleMoveDuration" runat="server" ControlName="txtTitleMoveDuration">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTitleMoveDuration" runat="server" Width="100px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" resourcekey="MustBeInteger"
                                        runat="server" ValidationExpression="\d*" ControlToValidate="txtTitleMoveDuration"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblNavigateButtonFreeSettings"
                visible="false">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plNavigateButtonFree_Button_Pos" runat="server" ControlName="ddlNavigateButtonFree_Button_Pos">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlNavigateButtonFree_Button_Pos" runat="server">
                            <asp:ListItem Value="1" resourcekey="li_NavigateButtonFree_Button_Pos_Left"></asp:ListItem>
                            <asp:ListItem Value="2" resourcekey="li_NavigateButtonFree_Button_Pos_Right"></asp:ListItem>
                            <asp:ListItem Value="3" resourcekey="li_NavigateButtonFree_Button_Pos_Top"></asp:ListItem>
                            <asp:ListItem Value="4" resourcekey="li_NavigateButtonFree_Button_Pos_Buttom"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plNavigateButtonFree_Stop_Time" runat="server" ControlName="txtNavigateButtonFree_Stop_Time">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateButtonFree_Stop_Time" runat="server" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator20" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtNavigateButtonFree_Stop_Time"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plNavigateButtonFree_Show_Text" runat="server" ControlName="chkNavigateButtonFree_Show_Text">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkNavigateButtonFree_Show_Text" runat="server" CssClass="Normal" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plNavigateButtonFree_TxtColor" runat="server" ControlName="txtNavigateButtonFree_TxtColor">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateButtonFree_TxtColor" runat="server" Columns="16"></asp:TextBox>
                        <a id="pickNavigateButtonFree_TxtColor" name="pickNavigateButtonFree_TxtColor" href="javascript:void(PickNavigateButtonFree_TxtColor())"
                            target="_self">
                            <asp:Image ID="Image7" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/FlashNavigate/images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtNavigateButtonFree_TxtColor"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator19" runat="server"
                            ControlToValidate="txtNavigateButtonFree_TxtColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plNavigateButtonFree_BgColor" runat="server" ControlName="txtNavigateButtonFree_BgColor">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNavigateButtonFree_BgColor" runat="server" Columns="16"></asp:TextBox>
                        <a id="pickNavigateButtonFree_BgColor" name="pickNavigateButtonFree_BgColor" href="javascript:void(PickNavigateButtonFree_BgColor())"
                            target="_self">
                            <asp:Image ID="Image10" runat="server" ImageAlign="Top" ResourceKey="PickColor" ImageUrl="~/DesktopModules/FlashNavigate/images/ColorPick.jpg" /></a>&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtNavigateButtonFree_BgColor"
                            CssClass="NormalRed" ResourceKey="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator21" runat="server"
                            ControlToValidate="txtNavigateButtonFree_BgColor" CssClass="NormalRed" ResourceKey="InvalidHex"
                            SetFocusOnError="True" ValidationExpression="0[x/X][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F][0-9/a-f/A-F]" />
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsPlayLists" runat="server" Title='<%# Localization.GetString("wsPlayLists", LocalResourceFile) %>'>
            <h2>
                <asp:Label ID="lblPlayLists" runat="server" Text="Play File Lists" resourcekey="lblPlayLists" />
            </h2>
            <hr />
            <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblPlayListType">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plPlayListType" runat="server" Suffix=":" ControlName="rbPlayListType"
                            Text="Play List Type">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbPlayListType" runat="server" AutoPostBack="True" CssClass="Normal"
                            OnSelectedIndexChanged="rbPlayListType_SelectedIndexChanged">
                            <asp:ListItem Value="Customize" ResourceKey="liPlayListType_Customize" />
                            <asp:ListItem Value="UsingExistXml" ResourceKey="liPlayListType_UsingExistXml" />
                            <asp:ListItem Value="DynamicGenerate" ResourceKey="liPlayListType_DynamicGenerate" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <table id="tblCustomize" class="Normal" border="0" cellpadding="2" cellspacing="2"
                visible="false" runat="server">
                <tr>
                    <td valign="top" colspan="2">
                        <asp:Button ID="btnDeleteSelected" runat="server" CssClass="CommandButton" ResourceKey="btnDeleteSelected"
                            CausesValidation="False" OnClick="btnDeleteSelected_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnLinkToOriginalFile" runat="server" CssClass="CommandButton" ResourceKey="btnLinkToOriginalFile"
                            CausesValidation="False" OnClick="btnLinkToOriginalFile_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:sectionhead CssClass="SubHead" ID="secPlayList" IsExpanded="true" IncludeRule="true"
                            ResourceKey="secPlayList" Section="tblPlayList" runat="server" />
                        &nbsp;&nbsp
                        <table class="Normal" border="0" cellpadding="2" cellspacing="2" runat="server" id="tblPlayList">
                            <tr>
                                <td>
                                    <asp:GridView ID="gvPlayList" runat="server" CellPadding="2" CellSpacing="2" DataKeyNames="Id"
                                        GridLines="Both" BorderColor="#ffcccc" Width="100%" AutoGenerateColumns="False"
                                        OnRowCommand="gvPlayList_RowCommand">
                                        <RowStyle CssClass="DataGrid_Item" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <EmptyDataTemplate>
                                            <asp:Label ID="Label1" Text='<%# Localization.GetString("NoRecords", LocalResourceFile) %>'
                                                runat="server" CssClass="Normal"></asp:Label>
                                        </EmptyDataTemplate>
                                        <HeaderStyle CssClass="DataGrid_Header" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <input type="checkbox" id="chkAll" runat="server" onclick="CheckAll()" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkItem" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Pic")%>' Width='30' BorderStyle="Solid"
                                                        BorderWidth="1" BorderColor="DarkGray" ImageAlign="Left" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblId" runat="server" resourcekey="lblId">Id</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Id" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="editId" runat="server" Text='<%#Bind("Id") %>' ReadOnly="true" Width="20px"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle Width="20px" />
                                                <HeaderStyle Width="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblText" runat="server" resourcekey="lblText">Text</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Text" runat="server" Text='<%# Bind("Text") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="editText" runat="server" Text='<%#Bind("Text") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblPic" runat="server" resourcekey="lblPic">Picture</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Pic" runat="server" Text='<%# Bind("Pic") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="editPic" runat="server" Text='<%#Bind("Pic") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblLink" runat="server" resourcekey="lblLink">Link Url</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Link" runat="server" Text='<%# Bind("Link") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="editLink" runat="server" Text='<%#Bind("Link") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:ImageButton ID="imgSave" runat="server" CausesValidation="True" CommandName="UpdateItem"
                                                        ImageUrl="~/images/save.gif" ResourceKey="imgSave" CommandArgument='<%#Eval("Id") %>'>
                                                    </asp:ImageButton>
                                                    <asp:ImageButton ID="imgCancel" runat="server" CausesValidation="False" CommandName="CancelUpdate"
                                                        ImageUrl="~/images/cancel.gif" ResourceKey="imgCancel" CommandArgument='<%#Eval("Id") %>'>
                                                    </asp:ImageButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="EditItem"
                                                        ResourceKey="imgEdit" ImageUrl="~/images/edit.gif" CommandArgument='<%#Eval("Id") %>'>
                                                    </asp:ImageButton>
                                                    <asp:ImageButton ID="imgDelete" runat="server" ResourceKey="imgDelete" ImageUrl="~/images/delete.gif"
                                                        CommandName="DeleteItem" CommandArgument='<%#Eval("Id") %>' />
                                                    <asp:ImageButton ID="imgUp" runat="server" ResourceKey="imgUp" ImageUrl="~/images/up.gif"
                                                        Visible='<%#IsUpEnable(Convert.ToInt32(Eval("Id"))) %>' CommandName="Up" CommandArgument='<%#Eval("Id") %>' />
                                                    <asp:ImageButton ID="imgDown" runat="server" ResourceKey="imgDown" ImageUrl="~/images/dn.gif"
                                                        CommandName="Down" CommandArgument='<%#Eval("Id") %>' Visible='<%#IsDownEnable(Convert.ToInt32(Eval("Id"))) %>' />
                                                </ItemTemplate>
                                                <ItemStyle Width="100px" />
                                                <HeaderStyle Width="100px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <dnn:sectionhead CssClass="SubHead" ID="secAddFile" IsExpanded="true" IncludeRule="true"
                            ResourceKey="secAddFile" Section="tblAddFile" runat="server" />
                        <table class="Normal" border="0" cellpadding="2" cellspacing="2" runat="server" id="tblAddFile">
                            <tr>
                                <td style="width: 200px">
                                    <dnn:Label ID="plFile" runat="server" ControlName="ctlFile" Suffix=":">
                                    </dnn:Label>
                                </td>
                                <td valign="middle">
                                    <Portal:URL runat="server" ID="ctlFile" ShowDatabase="false" ShowLog="false" ShowNewWindow="false"
                                        ShowSecure="false" ShowTabs="false" Width="450" ShowTrack="false" ShowUrls="false"
                                        FileFilter="jpg,jpeg,gif,png,jpe,swf" ShowUsers="false" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plText" runat="server" ControlName="txtText" Suffix=":">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtText" runat="server" Width="450px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plLink" runat="server" ControlName="ctlLink" Suffix=":" Text="Link Url">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <Portal:URL ID="ctlLink" runat="server" Width="450" ShowLog="False" ShowNone="True"
                                        ShowTrack="False">
                                    </Portal:URL>
                                </td>
                            </tr>
                            <tr>
                                <td />
                                <td>
                                    <asp:Button ID="btnAddFile" runat="server" CssClass="CommandButton" ResourceKey="btnAddFile"
                                        Text="Add File" CausesValidation="False" OnClick="btnAddFile_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <dnn:sectionhead CssClass="SubHead" ID="secAddFolder" IsExpanded="true" IncludeRule="true"
                            ResourceKey="secAddFolder" Section="tblAddFolder" runat="server" />
                        <table class="Normal" border="0" cellpadding="2" cellspacing="2" runat="server" id="tblAddFolder">
                            <tr>
                                <td valign="top" class="Normal">
                                    <dnn:Label ID="plFolder" runat="server" ControlName="ddlFolder" Suffix=":">
                                    </dnn:Label>
                                </td>
                                <td valign="middle">
                                    <asp:DropDownList ID="ddlFolder" DataTextField="FolderPath" DataValueField="FolderId"
                                        Width="450" runat="server">
                                    </asp:DropDownList>
                                    &nbsp;&nbsp;
                                    <asp:Button ID="btnAddFolder" runat="server" CssClass="CommandButton" ResourceKey="btnAddFolder"
                                        Text="Add Folder" CausesValidation="False" OnClick="btnAddFolder_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblUsingExistXml"
                visible="False">
                <tr>
                    <td>
                        <dnn:Label ID="plExistXml" runat="server" ControlName="ctlExistXml" Suffix=":">
                        </dnn:Label>
                    </td>
                    <td>
                        <Portal:URL runat="server" ID="ctlExistXml" ShowDatabase="false" ShowLog="false"
                            ShowNewWindow="false" FileFilter="xml" ShowSecure="false" ShowTabs="false" ShowTrack="false"
                            ShowUrls="false" ShowUsers="false" />
                    </td>
                </tr>
            </table>
            <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblPortalFolder"
                visible="false">
                <tr>
                    <td>
                        <dnn:sectionhead ID="secPortalFolder" runat="server" Section="tblGalleryFolder" ResourceKey="secPortalFolder"
                            IncludeRule="True" IsExpanded="True" CssClass="SubHead">
                        </dnn:sectionhead>
                        <table cellspacing="2" cellpadding="2" class="Normal" runat="server" id="tblGalleryFolder">
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblPortalFolderTips" resourcekey="lblPortalFolderTips" runat="server"></asp:Label><br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 200px">
                                    <dnn:Label ID="plGalleryFolder" runat="server" ControlName="ddlGalleryFolder" Suffix=":">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlGalleryFolder" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plFileCompareMode" ControlName="ddlFileCompareMode" Suffix=":" runat="server">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlFileCompareMode" runat="server">
                                        <asp:ListItem Value="FileNameAsc" resourcekey="li_FileCompareMode_FileNameAsc"></asp:ListItem>
                                        <asp:ListItem Value="FileNameDesc" resourcekey="li_FileCompareMode_FileNameDesc"></asp:ListItem>
                                        <asp:ListItem Value="ModifyDateAsc" resourcekey="li_FileCompareMode_ModifyDateAsc"></asp:ListItem>
                                        <asp:ListItem Value="ModifyDateDesc" resourcekey="li_FileCompareMode_ModifyDateDesc"></asp:ListItem>
                                        <asp:ListItem Value="FileLengthAsc" resourcekey="li_FileCompareMode_FileLengthAsc"></asp:ListItem>
                                        <asp:ListItem Value="FileLengthDesc" resourcekey="li_FileCompareMode_FileLengthDesc"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plLinkToImage" runat="server" Suffix=":" ControlName="chkLinkToImage">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkLinkToImage" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plRecursiveFolder" runat="server" Suffix=":" ControlName="chkRecursiveFolder">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRecursiveFolder" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dnn:Label ID="plExcludeFolder" runat="server" Suffix=":" ControlName="txtExcludeFolder">
                                    </dnn:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtExcludeFolder" runat="server" Width="450"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="wsFinish" runat="server" Title='<%# Localization.GetString("wsFinish", LocalResourceFile) %>'
            StepType="Finish">
            <h2>
                <asp:Label ID="lblFinish" runat="server" Text="Finish" resourcekey="lblFinish" Width="600" /></h2>
            <hr />
            <asp:Label ID="lblFailure" runat="server" Visible="False" CssClass="Normalred" Text="Submit Failure" />
        </asp:WizardStep>
    </WizardSteps>
    <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top"
        CssClass="Normal" />
    <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
        ForeColor="White" HorizontalAlign="Left" />
</asp:Wizard>
