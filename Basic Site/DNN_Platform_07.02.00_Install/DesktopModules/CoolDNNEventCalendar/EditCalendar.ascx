<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditCalendar.ascx.cs" Inherits="CoolDNN.Module.EventsCalendar.EditCalendar" %>


<%@ Register Src="~/controls/labelcontrol.ascx" TagPrefix="dnn" TagName="label" %>
<%@ Register TagPrefix="dnn" TagName="texteditor" Src="~/controls/texteditor.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement"
    Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Import Namespace="CoolDNN.Module.EventsCalendar" %>



<div class="dnnForm">
    <fieldset>
        <div class="dnnFormItem">
            <div style="float: left; width: 200px; margin-left: 30px;">
                <dnn:label runat="server" ID="plEventDate" Suffix="Event Date:" HelpText="Event Date" />
            </div>
            <div style="float: left; margin-bottom: 7px; padding-bottom: 8px;">
                <dnn:DnnDatePicker runat="server" CssClass="dnnFormInput" ID="dpCreatedDate" />
                <dnn:label runat="server" ID="plEventDateMessage"  />
           
            </div>
        </div>


        <div class="dnnFormItem">
            <div style="float: left; width: 200px; margin-left: 30px;">
                <dnn:label runat="server" ID="plEvent" ControlName="txtEvent" Suffix=":" />
            </div>
            <div >
                <asp:TextBox runat="server" ID="txtEvent" Width="700px"  CssClass="dnnFormRequired" />
               <dnn:label runat="server" ID="plEventMessage" />
               <asp:HiddenField ID="hidID" runat="server" />
            </div>
        </div>

        <div class="dnnFormItem">
            <div style="float: left; width: 200px; margin-left: 30px;">
                <dnn:label runat="server" ID="plIsActive" ControlName="chkIsActive" Suffix=":" />
            </div>
            <div >
                <asp:CheckBox runat="server" ID="chkIsActive" Checked="true" />
            </div>
        </div>
    
    <div class="dnnFormItem">
        
        <div class="dnnLeft" style="float:left; margin-left:230px">
            <asp:LinkButton ID="btnSave" OnClick="btnSave_Click" runat="server" resourcekey="btnSave" CssClass="dnnPrimaryAction" ></asp:LinkButton>
            <asp:LinkButton CssClass="dnnSecondaryAction" ID="btnExit" runat="server" resourcekey="btnExit" CausesValidation="false" OnClick="btnExit_Click"></asp:LinkButton>
        </div>
    </div>
    </fieldset>
    <hr />
</div>
<div class="dnnForm dnnSecurityRoles">
    <dnn:DnnGrid ID="grdCalendar" runat="server" AutoGenerateColumns="false" Width="99%"
        AllowPaging="true" CssClass="dnnGrid" AllowMultiRowSelection="true" AllowCustomPaging="true" GridLines="None"
        ClientSettings-Selecting-AllowRowSelect="true" AllowSorting="true">
        <HeaderStyle CssClass="dnnGridHeader" VerticalAlign="Top" />
        <ItemStyle CssClass="dnnGridItem" HorizontalAlign="Left" />
        <AlternatingItemStyle CssClass="dnnGridAltItem" />
        <EditItemStyle CssClass="dnnFormInput" />
        <FooterStyle CssClass="dnnGridFooter" />
        <PagerStyle CssClass="dnnGridPager" />
        <MasterTableView DataKeyNames="CalendarID">
            <Columns>
                <dnn:DnnGridClientSelectColumn HeaderStyle-Width="40"  />
                <dnn:DnnGridTemplateColumn  HeaderText="No" ReadOnly="true" HeaderStyle-Font-Bold="true"
                    HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="30">
                    <HeaderTemplate>
                        No.
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# Container.ItemIndex + 1%>
                    </ItemTemplate>
                </dnn:DnnGridTemplateColumn>

                <dnn:DnnGridTemplateColumn HeaderText="Name" ReadOnly="true" HeaderStyle-Font-Bold="true"
                    HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="100">
                    <HeaderTemplate>
                        Event date
                    </HeaderTemplate>
                    <ItemTemplate>
                      <i>  <%# Eval("EventDate")%> </i>
                    </ItemTemplate>
                </dnn:DnnGridTemplateColumn>


                <dnn:DnnGridTemplateColumn HeaderText="Name" ReadOnly="true" HeaderStyle-Font-Bold="true"
                    HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="250">
                    <HeaderTemplate>
                        Event
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# Eval("Event") %>
                    </ItemTemplate>
                </dnn:DnnGridTemplateColumn>
                
                <dnn:DnnGridTemplateColumn HeaderText="Status" ReadOnly="true" HeaderStyle-Font-Bold="true"
                    HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="50">
                    <HeaderTemplate>
                        Is Active
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# Eval("IsActive")%>
                    </ItemTemplate>
                </dnn:DnnGridTemplateColumn>

                <dnn:DnnGridTemplateColumn UniqueName="OrderAction" ReadOnly="true" HeaderStyle-Font-Bold="true"
                    HeaderText="Order" HeaderStyle-Width="60">
                    <HeaderTemplate>
                        Order Action
                    </HeaderTemplate>
                    <ItemTemplate>
                        <dnn:DnnImageButton runat="server" ID="btnUp" ToolTip="Up" CommandArgument='<%# Eval("CalendarID") %>'
                            CausesValidation="false" CommandName="Up" IconKey="Up" />
                        <dnn:DnnImageButton runat="server" ID="btnDown" ToolTip="Down" CommandArgument='<%# Eval("CalendarID") %>'
                            CausesValidation="false" CommandName="Down" IconKey="Dn" />
                    </ItemTemplate>
                </dnn:DnnGridTemplateColumn>
                <dnn:DnnGridTemplateColumn UniqueName="Action" ReadOnly="true" HeaderStyle-Font-Bold="true"
                    HeaderText="Action" HeaderStyle-Width="60">
                    <HeaderTemplate>
                        Action
                    </HeaderTemplate>
                    <ItemTemplate>
                        <dnn:DnnImageButton runat="server" ID="btnEdit" ToolTip="Edit" CommandArgument='<%# Eval("CalendarID") %>'
                            CausesValidation="false" CommandName="Edit" IconKey="Edit" />
                        <dnn:DnnImageButton runat="server" ID="btnDelete" ToolTip="Delete" CommandArgument='<%# Eval("CalendarID") %>'
                            CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete this Item?');"
                            CommandName="Delete" IconKey="Delete" />
                    </ItemTemplate>
                </dnn:DnnGridTemplateColumn>
            </Columns>
        </MasterTableView>
    </dnn:DnnGrid>
    <ul class="dnnActions dnnClear" >   
        <li><asp:LinkButton ID="cmdDelete" runat="server" Text="Delete Selected Items" CssClass="dnnSecondaryAction" OnClientClick="javascript: return confirm('Are You Sure You Wish To Delete Selected Items?');" OnClick="cmdDelete_Click" /></li>
    </ul>
</div>



