<%@ control language="C#" autoeventwireup="true" inherits="Cross.Modules.Video.View.AdminVideo_Type, App_Web_adminvideo_type.ascx.24b431c5" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Url" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<script type="text/javascript">
    function checkAll_Type() {
        if ($(":checkbox[id*='chkAllType']").prop("checked") == false) {
            $(":checkbox[id*='chkItemType']").prop("checked", true);
        }
        else {
            $(":checkbox[id*='chkItemType']").prop("checked", false);
        }
    }
    $(function () {
        $("#tabs").tabs();
        var currTab = $("#<%= hidLastTab.ClientID %>").val();
        if (!isNaN(parseInt(currTab)))//如果当前存储的是数字,则转换其为整数
        {
            currTab = parseInt(currTab);
        }
        $("#tabs").tabs({ selected: currTab });
    });
    
</script>
<asp:HiddenField runat="server" ID="hidLastTab" Value="#divBasic" />
<table width="98%" class="Normal" align="center" runat="server" id="tblButton">
    <tr>
        <td align="center">
            <dnn:CommandButton ID="btnAdd" runat="server" ImageUrl="~/images/add.gif" OnCommand="btnAdd_Click"
                CausesValidation="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDeleteSelected" runat="server" ResourceKey="btnDeleteSelected"
                CausesValidation="false" ImageUrl="~/images/delete.gif" OnCommand="btnDeleteSelected_Click"
                OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteItems",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnUpdate" runat="server" ResourceKey="cmdUpdate" ImageUrl="~/images/save.gif"
                OnCommand="btnUpdate_Click" Visible="false" />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnDelete" runat="server" ResourceKey="cmdDelete" ImageUrl="~/images/delete.gif"
                OnCommand="btnDelete_Click" Visible="false" CausesValidation="false" OnClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteConfirm_Related",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
            &nbsp;&nbsp;
            <dnn:CommandButton ID="btnCancel" runat="server" ResourceKey="cmdCancel" ImageUrl="~/images/cancel.gif"
                OnCommand="btnCancel_Click" Visible="false" CausesValidation="false" />
            &nbsp;&nbsp;
            <asp:HyperLink runat="server" ID="hlAdminHome" ResourceKey="btnAdminHome" NavigateUrl="<%#DotNetNuke.Common.Globals.NavigateURL(TabId)%>" />
        </td>
    </tr>
</table>
<table width="100%" class="dnnFormItem" align="center" runat="server" id="tblTypeList">
    <tr>
        <td align="left">
            <asp:GridView ID="gvTypeList" runat="server" AutoGenerateColumns="False" Width="100%"
                CellPadding="1" CellSpacing="1" GridLines="None" BackColor="Gray" ForeColor="#333333"
                DataKeyNames="Id" OnRowCommand="gvTypeList_RowCommand">
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoRecores" Text='<%# Localization.GetString("NoRecords",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared) %>'
                        runat="server"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" id="chkAllType" runat="server" onclick="checkAll_Type()" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItemType" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblName" runat="server" resourcekey="lblName">Name</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNameData" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="lblOrder" runat="server" resourcekey="lblOrder">Order</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOrderData" runat="server" Text='<%# Eval("DisplayOrder") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <asp:Label ID="lblAction" runat="server" resourcekey="lblAction" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" runat="server" CausesValidation="False" CommandName="Select"
                                CommandArgument='<%# Eval("Id")%>' ToolTip='<%#Localization.GetString("imgEdit",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ImageUrl="~/images/edit.gif" AlternateText='<%#Localization.GetString("imgEdit",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>' />
                            <asp:ImageButton ID="imgDel" runat="server" CausesValidation="False" CommandName="Del"
                                CommandArgument='<%# Eval("Id")%>' ImageUrl="~/images/delete.gif" AlternateText='<%#Localization.GetString("imgDel",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                ToolTip='<%#Localization.GetString("imgDel",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)%>'
                                OnClientClick='<%# String.Format("return confirm(\"{0}\");", Localization.GetString("DeleteConfirm_Related",Cross.Modules.Video.Business.LocalUtils.ResourcesFile_Shared)) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" Wrap="true" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" Wrap="true" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Wrap="true" />
                <EditRowStyle BackColor="#999999" />
            </asp:GridView>
        </td>
    </tr>
</table>
<div id="divTypeDetail" runat="server">
    <div class="dnnFormItem dnnFormHelp dnnClear">
        <p align="right">
            <span>
                <asp:Image ID="Image7" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg" />
                <%=LocalizeString("RequiredFields")%>
            </span>
        </p>
    </div>
    <div id="tabs" style="width: 100%; overflow: auto">
        <ul>
            <li><a href="#divBasic"><span>
                <%#Localization.GetString("divBasic", LocalResourceFile)%></span></a> </li>
            <li><a href="#divFieldEnable"><span>
                <%#Localization.GetString("divFieldEnable", LocalResourceFile)%></span></a>
            </li>
            <li><a href="#divField1"><span>
                <%#Localization.GetString("divSpecification_1", LocalResourceFile)%></span></a>
            </li>
            <li><a href="#divField2"><span>
                <%#Localization.GetString("divSpecification_2", LocalResourceFile)%></span></a>
            </li>
            <li><a href="#divField3"><span>
                <%#Localization.GetString("divSpecification_3", LocalResourceFile)%></span></a>
            </li>
            <li><a href="#divField4"><span>
                <%#Localization.GetString("divSpecification_4", LocalResourceFile)%></span></a>
            </li>
            <li><a href="#divField5"><span>
                <%#Localization.GetString("divSpecification_5", LocalResourceFile)%></span></a>
            </li>
        </ul>
        <div id="divBasic" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem">
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plName" runat="server" ControlName="txtName"></dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Columns="40"></asp:TextBox>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                        <asp:RequiredFieldValidator ID="valNameRequired" runat="server" ControlToValidate="txtName"
                            Display="Dynamic" resourcekey="Required" CssClass="NormalRed"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td valign="middle">
                        <dnn:Label ID="plImage" runat="server" ControlName="ctlURL"></dnn:Label>
                    </td>
                    <td>
                        <dnn:Url ID="ctlImage" runat="server" FileFilter="jpg,jpeg,jpe,png" Required="False"
                            ShowLog="false" ShowNewWindow="false" ShowNone="false" ShowTabs="false" ShowTrack="false"
                            ShowUrls="false" ShowFiles="true" ShowUpLoad="true" Width="450"></dnn:Url>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" resourcekey="Tip_AllowGoogleMap" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plAllowGoogleMap" runat="server" ControlName="chkAllowGoogleMap">
                        </dnn:Label>
                    </td>
                    <td align="left">
                        <asp:CheckBox ID="chkAllowGoogleMap" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" resourcekey="Tip_MediaType" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plMediaType" runat="server" ControlName="ddlMediaType"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlMediaType" runat="server">
                            <asp:ListItem Value="0" resourcekey="li_MediaType_Video"></asp:ListItem>
                            <asp:ListItem Value="1" resourcekey="li_MediaType_Audio"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="trListPageTip" runat="server">
                    <td colspan="2">
                        <asp:Label ID="Label3" runat="server" resourcekey="Tip_ListPage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr id="trListPage" runat="server">
                    <td>
                        <dnn:Label ID="plListPage" runat="server" ControlName="ddlListPage"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlListPage" DataValueField="TabId" DataTextField="IndentedTabName"
                            runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="trDetailPageTip" runat="server">
                    <td colspan="2">
                        <asp:Label ID="Label4" runat="server" resourcekey="Tip_DetailPage" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr id="trDetailPage" runat="server">
                    <td>
                        <dnn:Label ID="plDetailPage" runat="server" ControlName="ddlDetailPage"></dnn:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDetailPage" DataValueField="TabId" DataTextField="IndentedTabName"
                            runat="server">
                        </asp:DropDownList>
                        <dnn:CommandButton ID="btnDetailWizard" runat="server" ResourceKey="btnDetailWizard"
                            CausesValidation="false" ImageUrl="~/images/icon_wizard_16px.gif" OnCommand="btnDetailWizard_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plOrder" runat="server" ControlName="txtOrder"></dnn:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtOrder" runat="server" Columns="10" Text="10"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularexpressionvalidator6" resourcekey="MustBeInteger"
                            runat="server" ValidationExpression="\d*" ControlToValidate="txtOrder"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </div>
        <div id="divFieldEnable" style="height: 100%">
            <table cellspacing="0" cellpadding="2" border="0" align="left" class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label11" runat="server" resourcekey="Tip_FieldEnable" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plFieldEnable_Quote" runat="server" ControlName="chkFieldEnable_Quote">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFieldEnable_Quote" runat="server" Checked="true" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFieldEnable_Author" runat="server" ControlName="chkFieldEnable_Author">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFieldEnable_Author" runat="server" Checked="true" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFieldEnable_Source" runat="server" ControlName="chkFieldEnable_Source">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFieldEnable_Source" runat="server" Checked="true" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFieldEnable_Image" runat="server" ControlName="chkFieldEnable_Image">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFieldEnable_Image" runat="server" Checked="true" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFieldEnable_Summary" runat="server" ControlName="chkFieldEnable_Summary">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFieldEnable_Summary" runat="server" Checked="true" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFieldEnable_LinkUrl" runat="server" ControlName="chkFieldEnable_LinkUrl">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFieldEnable_LinkUrl" runat="server" Checked="true" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plFieldEnable_Description" runat="server" ControlName="chkFieldEnable_Description">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFieldEnable_Description" runat="server" Checked="true" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="divField1" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label10" runat="server" resourcekey="Tip_ExtendField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plFieldEnable_Field1" runat="server" ControlName="chkFieldEnable_Field1"
                            ResourceKey="plEnableField"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFieldEnable_Field1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plField1Title" runat="server" ControlName="txtField1Title" ResourceKey="plFieldTitle">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtField1Title" runat="server" Columns="40" Text="Specification_1"></asp:TextBox>
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="lblField1Default" runat="server" ResourceKey="lblFieldDefault" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField1Default" Width="100%" Height="400" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="divField2" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label9" runat="server" resourcekey="Tip_ExtendField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plFieldEnable_Field2" runat="server" ControlName="chkFieldEnable_Field2"
                            ResourceKey="plEnableField"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFieldEnable_Field2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plField2Title" runat="server" ControlName="txtField2Title" ResourceKey="plFieldTitle">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtField2Title" runat="server" Columns="40" Text="Specification_2"></asp:TextBox>
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="lblField2Default" runat="server" ResourceKey="lblFieldDefault" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField2Default" Width="100%" Height="400" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="divField3" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label8" runat="server" resourcekey="Tip_ExtendField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plFieldEnable_Field3" runat="server" ControlName="chkFieldEnable_Field3"
                            ResourceKey="plEnableField"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFieldEnable_Field3" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plField3Title" runat="server" ControlName="txtField3Title" ResourceKey="plFieldTitle">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtField3Title" runat="server" Columns="40" Text="Specification_3"></asp:TextBox>
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="lblField3Default" runat="server" ResourceKey="lblFieldDefault" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField3Default" Width="100%" Height="400" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="divField4" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label7" runat="server" resourcekey="Tip_ExtendField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plFieldEnable_Field4" runat="server" ControlName="chkFieldEnable_Field4"
                            ResourceKey="plEnableField"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFieldEnable_Field4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plField4Title" runat="server" ControlName="txtField4Title" ResourceKey="plFieldTitle">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtField4Title" runat="server" Columns="40" Text="Specification_4"></asp:TextBox>
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="lblField4Default" runat="server" ResourceKey="lblFieldDefault" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField4Default" Width="100%" Height="400" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="divField5" style="height: 100%">
            <table cellspacing="0" cellpadding="2" width="100%" border="0" class="dnnFormItem">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label6" runat="server" resourcekey="Tip_ExtendField" CssClass="dnnFormMessage dnnFormInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <dnn:Label ID="plFieldEnable_Field5" runat="server" ControlName="chkFieldEnable_Field5"
                            ResourceKey="plEnableField"></dnn:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkFieldEnable_Field5" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="plField5Title" runat="server" ControlName="txtField5Title" ResourceKey="plFieldTitle">
                        </dnn:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtField5Title" runat="server" Columns="40" Text="Specification_5"></asp:TextBox>
                        <asp:Image ID="Image6" runat="server" ImageUrl="~/DesktopModules/CrossVideo/images/required.jpg"
                            ToolTip="Reuired" AlternateText="Required" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="lblField5Default" runat="server" ResourceKey="lblFieldDefault" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="border: 1px dotted #999999; size: 1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dnn:TextEditor ID="txtField5Default" Width="100%" Height="400" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
