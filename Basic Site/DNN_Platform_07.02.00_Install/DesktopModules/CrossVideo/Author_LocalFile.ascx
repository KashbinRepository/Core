<%@ control inherits="Cross.Modules.Video.View.Author_LocalFile, App_Web_author_localfile.ascx.24b431c5" language="vb" autoeventwireup="false" explicit="True" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="DotNetNuke.UI.Utilities" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Security.Permissions.Controls"
    Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnntv" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke.WebControls" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>


<script language="javascript" type="text/javascript">
    //Localization Vars
    var m_sLocaleOk = '<%=ClientAPI.GetSafeJSString(Localization.GetString("Ok", LocalResourceFile))%>';
    var m_sLocaleCancel = '<%=ClientAPI.GetSafeJSString(Localization.GetString("Cancel", LocalResourceFile))%>';
    var m_sLocaleCopyFiles = '<%=ClientAPI.GetSafeJSString(Localization.GetString("CopyFiles", LocalResourceFile))%>';
    var m_sLocaleCancelCopy = '<%=ClientAPI.GetSafeJSString(Localization.GetString("CancelCopy", LocalResourceFile))%>';
    var m_sLocaleMoveFiles = '<%=ClientAPI.GetSafeJSString(Localization.GetString("MoveFiles", LocalResourceFile))%>';
    var m_sLocaleCancelMove = '<%=ClientAPI.GetSafeJSString(Localization.GetString("CancelMove", LocalResourceFile))%>';
    var m_sLocaleNoFilesChecked = '<%=ClientAPI.GetSafeJSString(Localization.GetString("NoFilesChecked", LocalResourceFile))%>';
    var m_sLocaleSpecifyFolder = '<%=ClientAPI.GetSafeJSString(Localization.GetString("PleaseSpecifyAFolderNameFirst", LocalResourceFile))%>';
    var m_sLocaleCopyCheckedFiles = '<%=ClientAPI.GetSafeJSString(Localization.GetString("CopyCheckedFiles", LocalResourceFile))%>';
    var m_sLocaleMoveCheckedFiles = '<%=ClientAPI.GetSafeJSString(Localization.GetString("MoveCheckedFiles", LocalResourceFile))%>';
    var m_sLocaleDeleteFolder = '<%=ClientAPI.GetSafeJSString(Localization.GetString("DeleteFolder", LocalResourceFile))%>';
    var m_sLocaleMoveSelectedFilesTo = '<%=ClientAPI.GetSafeJSString(Localization.GetString("MoveSelectedFilesTo", LocalResourceFile))%>';
    var m_sLocaleCopySelectedFilesTo = '<%=ClientAPI.GetSafeJSString(Localization.GetString("CopySelectedFilesTo", LocalResourceFile))%>';
    var m_sLocaleUnzipSelectedFilesTo = '<%=ClientAPI.GetSafeJSString(Localization.GetString("UnzipSelectedFilesTo", LocalResourceFile))%>';
    var m_sLocaleSelectAll = '<%=ClientAPI.GetSafeJSString(Localization.GetString("SelectAll", LocalResourceFile))%>';
    var m_sLocaleUnSelectAll = '<%=ClientAPI.GetSafeJSString(Localization.GetString("UnSelectAll", LocalResourceFile))%>';

    //Localization Vars


    var m_bAllFilesChecked;
    var previd;
    var blpb = true;
    var m_sDNNTreeID;
    var m_sUCPrefixID;
    var m_sUCPrefixName;
    var m_arReplaceTitle = new Array(1);
    m_arReplaceTitle[0] = '<%=ClientAPI.GetSafeJSString(RootFolderName) %>';

    function getLastPath() { return dnn.getVar('LastPath'); }
    function setLastPath(sValue) { dnn.setVar('LastPath', sValue); }
    function getDestPath() { return dnn.getVar('DestPath'); }
    function setDestPath(sValue) { dnn.setVar('DestPath', sValue); }
    function getSourcePath() { return dnn.getVar('SourcePath'); }
    function setSourcePath(sValue) { dnn.setVar('SourcePath', sValue); }

    function getMoveFiles() { return dnn.getVar('MoveFiles'); }
    function setMoveFiles(sValue) { dnn.setVar('MoveFiles', sValue); }
    function getMoveStatus() { return dnn.getVar('MoveStatus'); }
    function setMoveStatus(sValue) { dnn.setVar('MoveStatus', sValue); }

    function addFileToMoveList(strfile, sender, strSelClass, strOrigClass) {

        if (sender.tagName.toUpperCase() == "INPUT") {
            /* 1.0 Framework */
            var blvalue = sender.checked;
            var objRow = sender.parentNode.parentNode.parentNode;
        }
        else { /* 1.1 FrameWork */
            var blvalue = sender.children[0].checked;

            var objRow = sender.parentNode.parentNode;
        }

        if (!blvalue) {
            //unchecking
            setMoveFiles(getMoveFiles().replace(strfile + ";", ""));
            objRow.className = strOrigClass;
        }
        else {
            //checking
            setMoveFiles(getMoveFiles() + strfile + ";");
            objRow.className = strSelClass;
        }
    }

    function canAddFolder() {
        var txtNewFolder1 = dnn.dom.getById(m_sUCPrefixID + 'txtNewFolder');
        if (txtNewFolder1.value == '') {
            alert(m_sLocaleSpecifyFolder);
            return false;
        }
        else
            __doPostBack(m_sUCPrefixName + 'lnkAddFolder', '');
    }

    function cancelMove() {
        clearErrorMessage();
        setMoveStatus('');
        blCopying = false;
        CheckAllFiles(false);
        dnn.dom.getById(m_sUCPrefixID + 'lblCurFolder').innerHTML = getSourcePath().replace(m_arReplaceTitle[0], m_arReplaceTitle[1]) + '\\';
    }

    function clearErrorMessage() {
        disableButtons(false);
        var tdGrid = dnn.dom.getById('tdGrid');
        tdGrid.style.display = '';
        var FileOverlay = dnn.dom.getById('FileGridOverLay');
        FileOverlay.innerHTML = '';
        dnn.dom.getById('tdOverLay').style.display = 'none';
        dnn.setVar('ErrorMessage', '');
    }

    function confirmMoveFiles(strDestFolder) {
        hideDataGrid();

        if (getMoveStatus() == 'move')
            var strConfirmTitle = m_sLocaleMoveSelectedFilesTo;
        else if (getMoveStatus() == 'copy')
            var strConfirmTitle = m_sLocaleCopySelectedFilesTo;
        else if (getMoveStatus() == 'unzip')
            var strConfirmTitle = m_sLocaleUnzipSelectedFilesTo;

        var strConfirmMessage = '<table cellspacing=0 cellpadding=0><tr><td class=NormalBold>' + getProperPath(strDestFolder) + '</td></tr>';
        strConfirmMessage += '<tr><td height=15>&nbsp;</td><tr>'
        strConfirmMessage += '<tr><td align=center>';
        strConfirmMessage += '<INPUT id=btnMoveOK style="width:82px;" Class="NormalBold" onclick="__doPostBack(\'' + m_sUCPrefixName + 'lnkMoveFiles' + '\');" type=button value="' + m_sLocaleOk + '">&nbsp;&nbsp;&nbsp;&nbsp;';
        strConfirmMessage += '<INPUT id=btnNoConfirmMove style="width:82px;" Class="NormalBold" onclick=hideDataGrid(); type=button value="' + m_sLocaleCancel + '">';
        strConfirmMessage += '</td></tr></table>';
        showErrorMessage(strConfirmTitle, strConfirmMessage);
    }

    function copyCheckedFiles() {
        if (getMoveFiles() == '') {
            alert(m_sLocaleNoFilesChecked);
            return false;
        }
        //confirm the copy
        var blconfirm = confirm(m_sLocaleCopyCheckedFiles);
        if (blconfirm) {
            setSourcePath(getLastPath());
            setMoveStatus('copy');
            hideDataGrid();
            return false;
        }
    }

    function deleteAllChecked() {
        clearErrorMessage();
        __doPostBack(m_sUCPrefixName + 'lnkDeleteAllCheckedFiles', '');
    }

    function deleteCheckedFiles() {
        if (getMoveFiles() == '') {
            alert(m_sLocaleNoFilesChecked);
            return false;
        }

        var strTitle = '<%=ClientAPI.GetSafeJSString(Localization.GetString("DeleteFiles", LocalResourceFile))%>:';
        var strMessage = '<table cellspacing=0 cellpadding=0>';
        var strCurFiles = getMoveFiles();
        var arFiles = strCurFiles.split(';');
        for (var i = 0; i < arFiles.length - 1; i++)
            strMessage += '<tr><td class=NormalBold>' + arFiles[i] + '</td></tr>';

        strMessage += '<tr><td height=15>&nbsp;</td><tr>';
        strMessage += '<tr><td colspan=2 align=center>';
        strMessage += '<INPUT id=btnConfirmDel style="WIDTH: 81px;" Class="NormalBold" onclick=deleteAllChecked(); type=button value="' + m_sLocaleOk + '">&nbsp;&nbsp;&nbsp;&nbsp;';
        strMessage += '<INPUT id=btnClearError style="WIDTH: 81px;" Class="NormalBold" onclick=clearErrorMessage(); type=button value="' + m_sLocaleCancel + '">';
        strMessage += '</td></tr></table>';
        showErrorMessage(strTitle, strMessage);
        return false;
    }

    function deleteFolder() {
        var blValue = confirm(m_sLocaleDeleteFolder + ' ' + getProperPath(getLastPath()) + '?');
        if (blValue) { __doPostBack(m_sUCPrefixName + 'lnkDeleteFolder', ''); } else { return false; }
    }

    function disableButtons(blvalue) {

        var objNewFolderID = dnn.dom.getById(m_sUCPrefixID + 'txtNewFolder');
        if (objNewFolderID) {
            objNewFolderID.disabled = blvalue;
            enableDisableCtl('lnkAddFolderIMG', blvalue);
            enableDisableCtl('lnkDelFolderIMG', blvalue);
        }
        dnn.dom.getById(m_sUCPrefixID + 'txtFilter').disabled = blvalue;
        enableDisableCtl('lnkCopy', blvalue);
        enableDisableCtl('lnkDelete', blvalue);
        enableDisableCtl('lnkMove', blvalue);
        enableDisableCtl('lnkUploadIMG', blvalue);
        enableDisableCtl('lnkFilterIMG', blvalue);
        //enableDisableCtl('lnkRefreshIMG', blvalue);
        enableDisableCtl('lnkFolderPropertiesIMG', blvalue);

        obj = dnn.dom.getById(m_sUCPrefixID + 'tblMessagePager')
        if (obj) {
            if (blvalue)
                obj.style.display = 'none';
            else
                obj.style.display = '';
        }
        else {
        }
        obj = dnn.dom.getById(m_sUCPrefixID + 'selPageSize')
        if (obj)
            obj.disabled = blvalue;
    }

    function enableDisableCtl(sID, blvalue) {
        var obj = dnn.dom.getById(sID);
        var strCursor = 'hand';
        var strSearch = 'Disabled';
        var strReplace = 'Enabled';
        var strStyle = '';
        if (blvalue) {
            strCursor = 'default';
            strSearch = 'Enabled';
            strReplace = 'Disabled';
            strStyle = 'none';
        }

        if (obj) {
            obj.style.cursor = strCursor;
            obj.disabled = blvalue;
            obj.parentNode.disabled = blvalue;
            obj.src = obj.src.replace(strSearch, strReplace);
        }
    }

    function fldScroll() {
        setFolderScrollPos(dnn.dom.getById(m_sUCPrefixID + 'pnlFolders').scrollTop);
    }

    function getFolderID(fldname) {
        var arvalues = fldname.split('\\');
        return arvalues[0];
    }

    function getFolderScrollPos() {
        var i = dnn.getVar('folderScrollPos');
        if (i != null)
            return i;
        else
            return 0;
    }

    function getProperPath(s) {
        s = s.replace('\/', '\\');
        var sFldID = getFolderID(s);
        return s.replace(sFldID, m_arReplaceTitle[sFldID]);
    }

    function getSelectedTreeNode() {
        if (dnn.controls != null)
            return dnn.controls.controls[m_sDNNTreeID].selTreeNode;
        else {
            eval('var oNode = ' + dnn.getVar(m_sDNNTreeID + '_selNode'));
            return oNode;
        }
    }

    function hideDataGrid() {

        //used when moving/copying files...
        dnn.dom.getById('tdOverLay').style.display = '';
        var tdGrid = dnn.dom.getById('tdGrid');
        tdGrid.style.display = 'none';
        var FileOverlay = dnn.dom.getById('FileGridOverLay');
        FileOverlay.style.display = '';

        var strCurFiles = getMoveFiles();

        var arFiles = strCurFiles.split(';');
        var strMessage = '<table cellspacing=0 cellpadding=0>';
        for (var i = 0; i < arFiles.length - 1; i++)
            strMessage += '<tr><td class=NormalBold>' + arFiles[i] + '</td></tr>';

        strMessage = strMessage.replace(arFiles[arFiles.length - 2] + ',', arFiles[arFiles.length - 2]);
        strMessage += '<tr><td height=15>&nbsp;</td><tr>'
        strMessage += '<tr><td class=NormalRed><%=ClientAPI.GetSafeJSString(Localization.GetString("FromFolder", LocalResourceFile))%>' + getProperPath(getLastPath()); +'</td></tr>'
        strMessage += '<tr><td height=15>&nbsp;</td><tr>'
        strMessage += '<tr><td class=NormalRed><%=ClientAPI.GetSafeJSString(Localization.GetString("ToFolder", LocalResourceFile))%></td></tr>'
        strMessage += '<tr><td height=15>&nbsp;</td><tr>'

        if (getMoveStatus() == 'move') {
            var strTitle = '<%=ClientAPI.GetSafeJSString(Localization.GetString("MovingFiles", LocalResourceFile))%>';
        }
        else if (getMoveStatus() == 'copy') {
            var strTitle = '<%=ClientAPI.GetSafeJSString(Localization.GetString("CopyingFiles", LocalResourceFile))%>';
        }
        else if (getMoveStatus() == 'unzip') {
            var strTitle = '<%=ClientAPI.GetSafeJSString(Localization.GetString("UnzippingFile", LocalResourceFile))%>';
        }
        strMessage += '<tr><td align=center><INPUT id=btnCancelMove style="width:82px;" class="NormalBold" onclick=cancelMove(); type=button value="' + m_sLocaleCancel + '"></td></tr>';
        strMessage += '</table>'

        showErrorMessage(strTitle, strMessage);
    }

    function initFileManager() {
        if (dnn.getVar('IsRefresh') == '0')
            dnn.dom.getById(m_sUCPrefixID + 'pnlFolders').scrollTop = getFolderScrollPos();

        m_sUCPrefixID = dnn.getVar('UCPrefixID');
        m_sUCPrefixName = dnn.getVar('UCPrefixName');
        m_sDNNTreeID = m_sUCPrefixID + 'DNNTree';

        var oFileOverlay = dnn.dom.getById('FileGridOverLay');
        if (oFileOverlay.innerHTML.length == 0)
            dnn.dom.getById('tdOverLay').style.display = 'none';

        if (dnn.getVar('DisabledButtons') != '0')
            disableButtons(true);

        if (dnn.getVar('ErrorMessage') != null && dnn.getVar('ErrorMessage').length > 0)
            showErrorMessage('<%=ClientAPI.GetSafeJSString(Localization.GetString("ErrorOccurred", LocalResourceFile))%>', dnn.getVar('ErrorMessage'));

    }

    function moveFiles() {

        if (getMoveFiles() == '') {
            alert(m_sLocaleNoFilesChecked);
            return false;
        }
        var blconfirm = confirm(m_sLocaleMoveCheckedFiles);
        if (blconfirm) {
            setSourcePath(getLastPath());
            setMoveStatus('move');
            hideDataGrid();
            return false;
        }
    }

    function nodeSelected() {
        var oNode = getSelectedTreeNode();

        if (oNode != null) {
            var sKey = oNode.key;

            var sIsMoving = getMoveStatus();
            if ((sIsMoving == 'copy') || (sIsMoving == 'move') || (sIsMoving == 'unzip')) {
                setDestPath(sKey);
                confirmMoveFiles(sKey);
                return false; //cancel postback
            }
            else {
                setLastPath(sKey);
                setDestPath(sKey);
                return true; //do postback
            }
        }
    }

    function setFolderScrollPos(sValue) {
        dnn.setVar('folderScrollPos', sValue);
    }

    function showErrorMessage(strTitle, strMessage) {
        var strOutput = '<table width=80% cellpadding=0 cellspacing=0 style="border: 1px solid black">'
        strOutput += '<tr><td height=15></td></tr>'
        strOutput += '<tr><td class=Head align=center><u>' + strTitle + '</u></td></tr>'
        strOutput += '<tr><td height=15></td></tr>'
        strOutput += '<tr><td align=center valign=middle>' + strMessage + '</td></tr>'
        strOutput += '<tr><td height=15></td></tr></table>'

        disableButtons(true);
        dnn.dom.getById('tdOverLay').style.display = '';
        var tdGrid = dnn.dom.getById('tdGrid');
        tdGrid.style.display = 'none';
        var oFileOverlay = dnn.dom.getById('FileGridOverLay');
        oFileOverlay.innerHTML = strOutput;
    }

    function unzipFile(FileName) {
        setMoveFiles(FileName + ";");
        var blconfirm = confirm('UnZip File(s): ' + FileName + '?');
        if (blconfirm) {
            setSourcePath(getLastPath());
            setMoveStatus('unzip');
            hideDataGrid();
            return false;
        }
    }

    function gridCheckAll(sender) {
        m_bAllFilesChecked = !m_bAllFilesChecked;
        CheckAllFiles(m_bAllFilesChecked);
        if (!m_bAllFilesChecked) {
            sender.src = sender.src.replace('checked', 'unchecked');
            sender.alt = m_sLocaleSelectAll;
        }
        else {
            sender.src = sender.src.replace('unchecked', 'checked');
            sender.alt = m_sLocaleUnSelectAll;
        }

        return false;
    }


</script>

<asp:Panel ID="pnlMainScripts" runat="server" />
<div style="display: none">
    <asp:Literal ID="ctrlScripts1" runat="server" EnableViewState="true" />
    <asp:LinkButton ID="lnkSelectFolder" runat="server" EnableViewState="False" />
    <asp:TextBox ID="txtCurFolderID" runat="server" EnableViewState="true" />
    <asp:TextBox ID="txtFldScrollPos" EnableViewState="true" runat="server" />
</div>
<asp:Panel ID="pnlScripts" runat="server">
</asp:Panel>
<div class="dnnFormMessage dnnFormInfo" >
    <p >
        <%=LocalizeString("Tip_FileManager")%>
    </p>
</div>
<table class="FileManager" cellspacing="0" cellpadding="0" width="100%" align="center"
    border="0">
    <!-- ToolBar Row Begin -->
    <tr>
        <td valign="top" colspan="3">
            <table class="FileManager_ToolBar" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td style="width: 5px">
                    </td>
                    <td class="SubHead" style="vertical-align: middle; width: 60px">
                        <asp:Label ID="lblFolderBar" runat="server" resourcekey="FolderBar" />
                    </td>
                    <%--<td class="NormalTextBox" style="vertical-align:middle; width:160px"><asp:dropdownlist id="ddlStorageLocation" Runat="server" /></td>--%>
                    <td class="NormalTextBox" style="vertical-align: middle; width: 1px">
                        <asp:DropDownList ID="ddlStorageLocation" runat="server" Visible="false" />
                    </td>
                    <td class="Normal" style="vertical-align: middle; width: 140px">
                         <asp:Label ID="lblFolder" runat="server" resourcekey="lblFolder" Width="40px"/>
                        <asp:TextBox ID="txtNewFolder" runat="server" EnableViewState="False" Width="100px" BorderColor="Green" BorderWidth="1"/>
                    </td>
                    <td class="Normal" style="vertical-align: middle; width: 100px">
                        <span id="addFolder" runat="server">
                            <asp:LinkButton ID="lnkAddFolder" EnableViewState="False" runat="server" Visible="False" />
                            <asp:Image ID="lnkAddFolderIMG" runat="server" resourcekey="AddFolderImg.AlternateText"
                                name="lnkDelFolderIMG" Style="vertical-align: middle" />
                            <asp:Label ID="lblAddFolder" EnableViewState="False" runat="server" resourcekey="AddFolder" />
                        </span>
                    </td>
                    <td class="Normal" style="vertical-align: middle; width: 120px">
                        <span id="deleteFolder" runat="server">
                            <asp:LinkButton ID="lnkDeleteFolder" EnableViewState="False" runat="server" Visible="False" />
                            <asp:Image ID="lnkDelFolderIMG" runat="server" resourcekey="DeleteFolderImg.AlternateText"
                                name="lnkDelFolderIMG" Style="vertical-align: middle" />
                            <asp:Label ID="lblDelFolder" EnableViewState="False" runat="server" resourcekey="DeleteFolderLabel" />
                        </span>
                    </td>
                    <td class="Normal" style="vertical-align: middle; width: 210px">
                        <span id="syncFolder" runat="server">
                            <asp:LinkButton ID="lnkSyncFolder" EnableViewState="False" runat="server" Visible="False" />
                            <asp:Image ID="lnkSyncFolderIMG" runat="server" resourcekey="lnkSyncFolderIMG.AlternateText"
                                name="lnkSyncFolderIMG" Style="vertical-align: middle" />
                            <asp:Label ID="lblSynchronize" EnableViewState="False" runat="server" resourcekey="SynchronizeFolder" />
                        </span>
                        <asp:CheckBox ID="chkRecursive" runat="server" resourcekey="Recursive" CssClass="Normal" />
                    </td>
                    <td class="Normal" style="vertical-align: middle; width: 120px">
                        <span id="return" runat="server">
                            <asp:LinkButton ID="cmdReturn" OnClick="cmdReturn_Click" resourcekey="btnAdminHome"
                                runat="server" BorderStyle="none" Text="Return" CausesValidation="False"></asp:LinkButton>
                        </span>
                    </td>
                    <td style="width: 5px">
                    </td>
                </tr>
            </table>
            <table class="FileManager_ToolBar" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td style="width: 5px">
                    </td>
                    <td class="SubHead" style="vertical-align: middle; width: 60px">
                        <asp:Label ID="lblFileBar" runat="server" resourcekey="FileBar" />
                    </td>
                    <td class="Normal" style="vertical-align: middle">
                        <span id="refresh" runat="server">
                            <asp:LinkButton ID="lnkRefresh" EnableViewState="False" runat="server" Visible="False" />
                            <asp:Image ID="lnkRefreshIMG" runat="server" resourcekey="RefreshImg.AlternateText"
                                name="lnkRefreshIMG" Style="vertical-align: middle" />
                            <asp:Label ID="lblRefresh" EnableViewState="False" runat="server" resourcekey="Refresh" />
                        </span>
                    </td>
                     <!--�����ε�copy and move files ���ܣ���dnn 6.x  �»����event post error,�Ժ���������鵽��ʲôԭ�� -->
                    <td class="Normal" style="vertical-align: middle">
                        <span id="copy" runat="server" visible="false">
                            <asp:Image ID="lnkCopy" runat="server" resourcekey="CopyImg.AlternateText" name="lnkCopy"
                                Style="vertical-align: middle" />
                            <asp:Label ID="lblCopy" EnableViewState="False" runat="server" resourcekey="CopyFiles" />
                        </span>
                    </td>
                    <td class="Normal" style="vertical-align: middle">
                        <span id="move" runat="server" visible="false">
                            <asp:Image ID="lnkMove" runat="server" resourcekey="MoveImg.AlternateText" name="lnkMove"
                                Style="vertical-align: middle" />
                            <asp:Label ID="lblMove" EnableViewState="False" runat="server" resourcekey="MoveFiles" />
                        </span>
                    </td>
                    <td class="Normal" style="vertical-align:middle">
					    <span id="upload" runat="server">
    					    <asp:linkbutton id="lnkUpload" EnableViewState="False" runat="server" Visible="False"/>
				            <asp:image id="lnkUploadIMG" Runat="server" resourcekey="UploadImg.AlternateText" name="lnkUploadIMG" style="vertical-align:middle"/>
				            <asp:label id="lblUpload" EnableViewState="False" runat="server" resourcekey="Upload" />
    					</span>
					</td>
                    <td class="Normal" style="vertical-align: middle">
                        <span id="delete" runat="server">
                            <asp:Image ID="lnkDelete" runat="server" resourcekey="DeleteImg.AlternateText" name="lnkDelete"
                                Style="vertical-align: middle" />
                            <asp:Label ID="lblDelete" EnableViewState="False" runat="server" resourcekey="DeleteFiles" />
                        </span>
                    </td>
                    <td class="Normal" style="vertical-align: middle">
                     <asp:Label ID="lblFile" runat="server" resourcekey="lblFile" />
                        <asp:TextBox ID="txtFilter" EnableViewState="False" runat="server"  BorderColor="Green" BorderWidth="1"/>
                        <span id="filter" runat="server">
                            <asp:LinkButton ID="lnkFilter" EnableViewState="False" runat="server" Visible="False"
                                Style="vertical-align: middle" />
                            <asp:Image ID="lnkFilterIMG" runat="server" resourcekey="FilterImg.AlternateText"
                                name="lnkFilterIMG" />
                        </span>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <!-- ToolBar Row End -->
    <!-- Main Row Begin -->
    <tr>
        <td valign="top" width="205">
            <table class="FileManager_Explorer" cellspacing="0" cellpadding="0" width="100%"
                border="0">
                <tr>
                    <td class="FileManager_Header" style="vertical-align: middle">
                        <asp:ImageButton ID="lnkSyncFolders" runat="server" ImageUrl="~/images/FileManager/ToolBarSynchronizeEnabled.gif"
                            ToolTip="Synchronize Folders" />
                        <asp:Label ID="lblFolders" runat="server" EnableViewState="False" resourcekey="Folders"
                            Width="100%" CssClass="SubHead" />
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top">
                        <span id="pnlFolders" style="height: 300px; vertical-align: top; width: 200px;" onscroll="fldScroll();"
                            runat="server">
                            <asp:Panel ID="pnlTreeInitScripts" Style="height: 300px; overflow: auto; vertical-align: top;
                                width: 200px;" runat="server">
                                <dnntv:DnnTree ID="DNNTree" runat="server" DefaultNodeCssClassSelected="FileManagerTreeNodeSelected"
                                    DefaultNodeCssClass="FileManagerTreeNode" DefaultChildNodeCssClass="FileManagerTreeNode" />
                            </asp:Panel>
                        </span>
                    </td>
                </tr>
            </table>
        </td>
        <td width="5">
        </td>
        <td valign="top" width="100%">
            <table class="FileManager_FileList" cellspacing="0" cellpadding="0" width="100%"
                border="0">
                <tr>
                    <td class="FileManager_MessageBox" id="tdOverLay" style="display: none" valign="top"
                        width="100%">
                        <div id="FileGridOverLay">
                        </div>
                    </td>
                    <td id="tdGrid" valign="top" width="100%">
                        <asp:DataGrid ID="dgFileList" runat="server" Width="100%" GridLines="Horizontal"
                            AllowPaging="True" AutoGenerateColumns="False" PageSize="10" CellPadding="0"
                            AllowSorting="True" HeaderStyle-CssClass="FileManager_Header" ItemStyle-CssClass="FileManager_Item"
                            EditItemStyle-CssClass="Normal" AlternatingItemStyle-CssClass="FileManager_AltItem"
                            SelectedItemStyle-CssClass="FileManager_SelItem">
                            <Columns>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <asp:Image ID="imgFileICO" runat="server" Extention='<%# DataBinder.Eval(Container, "DataItem.Extension")%>'
                                            ImageUrl='<%# GetImageUrl(DataBinder.Eval(Container, "DataItem.Extension")) %>'
                                            Width="16" Height="16" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Image ID="imgFileEditICO" runat="server" Extention='<%# DataBinder.Eval(Container, "DataItem.Extension")%>'
                                            ImageUrl='<%# GetImageUrl(DataBinder.Eval(Container, "DataItem.Extension")) %>'
                                            Width="16" Height="16" />
                                    </EditItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderStyle-HorizontalAlign="Left" SortExpression="FileName"
                                    HeaderText="FileName">
                                    <ItemTemplate>
                                        <asp:LinkButton CssClass="Normal" runat="server" OnCommand="lnkDLFile_Command" ID="lnkDLFile"
                                            CommandArgument='<%# DataBinder.Eval(Container, "DataItem.FileId")%>'>
											<%# DataBinder.Eval(Container, "DataItem.FileName")%>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" CssClass="Normal" ID="txtEditFileName" Width="95%" Text='<%# DataBinder.Eval(Container, "DataItem.FileName")%>' />
                                    </EditItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderStyle-HorizontalAlign="Left" HeaderText="Date" SortExpression="DateModified">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container, "DataItem.DateModified")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CheckBox CssClass="Normal" ID="chkReadOnly" original='<%# DataBinder.Eval(Container, "DataItem.ReadOnly")%>'
                                            Checked='<%# DataBinder.Eval(Container, "DataItem.ReadOnly")%>' runat="server"
                                            Text="R:" Visible='<%# DataBinder.Eval(Container, "DataItem.StorageLocation") < 2 %>' />
                                        <asp:CheckBox CssClass="Normal" ID="chkHidden" original='<%# DataBinder.Eval(Container, "DataItem.Hidden")%>'
                                            Checked='<%# DataBinder.Eval(Container, "DataItem.Hidden")%>' runat="server"
                                            Text="H:" Visible='<%# DataBinder.Eval(Container, "DataItem.StorageLocation") < 2 %>' />
                                        <asp:CheckBox CssClass="Normal" ID="chkSystem" original='<%# DataBinder.Eval(Container, "DataItem.System")%>'
                                            Checked='<%# DataBinder.Eval(Container, "DataItem.System")%>' runat="server"
                                            Text="S:" Visible='<%# DataBinder.Eval(Container, "DataItem.StorageLocation") < 2 %>' />
                                        <asp:CheckBox CssClass="Normal" ID="chkArchive" original='<%# DataBinder.Eval(Container, "DataItem.Archive")%>'
                                            Checked='<%# DataBinder.Eval(Container, "DataItem.Archive")%>' runat="server"
                                            Text="A:" Visible='<%# DataBinder.Eval(Container, "DataItem.StorageLocation") < 2 %>' />
                                    </EditItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" SortExpression="DateModified">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container, "DataItem.AttributeString")%>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderStyle-HorizontalAlign="Right" SortExpression="intFileSize"
                                    HeaderText="Size">
                                    <ItemStyle HorizontalAlign="Right" CssClass="Normal"></ItemStyle>
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container, "DataItem.FileSize")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <%# DataBinder.Eval(Container, "DataItem.FileSize")%>
                                    </EditItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <ItemStyle HorizontalAlign="Right" Width="1%"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="lnkEditFile" Visible='<%# HasPermission("MANAGE") %>'
                                            OnCommand="lnkEditFile_Command" resourcekey="RenameFileImg.AlternateText" ImageUrl="~/images/FileManager/DNNExplorer_Edit.gif" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton runat="server" ID="lnkOkRename" OnCommand="lnkOkRename_Command"
                                            resourcekey="SaveChangesImg.AlternateText" ImageUrl="~/images/FileManager/DNNExplorer_OK.gif"
                                            CommandArgument='<%# DataBinder.Eval(Container, "DataItem.FileName")%>' />
                                    </EditItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <ItemStyle HorizontalAlign="Right" Width="1%"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="lnkDeleteFile" Visible='<%# HasPermission("DELETE") %>'
                                            OnCommand="lnkDeleteFile_Command" resourcekey="DeleteFileImg.AlternateText" ImageUrl="~/images/FileManager/DNNExplorer_trash.gif"
                                            CommandName='<%# DataBinder.Eval(Container, "DataItem.FileName")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton runat="server" ID="lnkCancelRename" OnCommand="lnkCancelRename_Command"
                                            resourcekey="CancelRenameImg.AlternateText" ImageUrl="~/images/FileManager/DNNExplorer_Cancel.gif"
                                            CommandArgument='<%# DataBinder.Eval(Container, "DataItem.FileName")%>' />
                                    </EditItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <ItemStyle HorizontalAlign="Right" Width="1%"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Image ID="lnkUnzip" Style="cursor: pointer" runat="server" Visible='<%# HasPermission("ADD,COPY") %>'
                                            name="lnkMove" ImageUrl="~/images/FileManager/DNNExplorer_Unzip.gif" resourcekey="UnzipFileImg.AlternateText"
                                            filename='<%# DataBinder.Eval(Container, "DataItem.FileName")%>' extension='<%# DataBinder.Eval(Container, "DataItem.Extension")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderStyle-HorizontalAlign="center">
                                    <ItemStyle HorizontalAlign="center" Width="30px"></ItemStyle>
                                    <HeaderTemplate>
                                        <asp:Panel ID="pnlCheckAll" runat="server" Visible="True">
                                            <input onclick='return gridCheckAll(this);' type="image" src='<%# Page.ResolveUrl("~/images/FileManager/unchecked.gif") %>'
                                                alt='<%=Localization.GetString("SelectAll", LocalResourceFile)%>'>
                                        </asp:Panel>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkFile" runat="server" Visible="True" filename='<%# DataBinder.Eval(Container, "DataItem.FileName")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chkFile" Enabled="False" runat="server" filename='<%# DataBinder.Eval(Container, "DataItem.FileName")%>' />
                                    </EditItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <PagerStyle Visible="False"></PagerStyle>
                        </asp:DataGrid>
                    </td>
                </tr>
                <tr valign="bottom">
                    <td colspan="2">
                        <table class="FileManager_Pager" id="tblMessagePager" cellspacing="0" cellpadding="0"
                            width="100%" border="0" runat="server">
                            <tr>
                                <td align="left">
                                    &nbsp;&nbsp;<asp:Label ID="lblCurPage" runat="server" CssClass="NormalBold"></asp:Label>
                                </td>
                                <td valign="bottom" align="right" style="padding-right: 5px">
                                    <table cellspacing="2" cellpadding="2" border="0">
                                        <tr valign="middle">
                                            <td width="19">
                                                <asp:LinkButton ID="lnkMoveFirst" runat="server"></asp:LinkButton>
                                            </td>
                                            <td width="19">
                                                <asp:LinkButton ID="lnkMovePrevious" runat="server"></asp:LinkButton>
                                            </td>
                                            <td width="19">
                                                <asp:LinkButton ID="lnkMoveNext" runat="server"></asp:LinkButton>
                                            </td>
                                            <td width="19">
                                                <asp:LinkButton ID="lnkMoveLast" runat="server"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <!-- Main Row End -->
    </tr>
    <!-- Status Bar Row Begin -->
    <tr>
        <td class="FileManager_StatusBar" colspan="3">
            <table cellspacing="0" cellpadding="0" width="100%" border="1">
                <tr>
                    <td align="left" width="50%">
                        <div style="overflow: visible; width: 100%">
                            &nbsp;<asp:Label ID="lblCurFolder" runat="server" CssClass="NormalBold"></asp:Label></div>
                    </td>
                    <td width="25%">
                        <asp:Label ID="lblFileSpace" runat="server" CssClass="NormalBold"></asp:Label>
                    </td>
                    <td class="NormalBold" align="right" width="25%">
                        &nbsp;
                        <asp:Label ID="lblItemsPerPage" runat="server" CssClass="NormalBold" resourcekey="ItemsPerPage">Items Per Page:</asp:Label>&nbsp;
                        <asp:DropDownList ID="selPageSize" runat="server" CssClass="Normal" AutoPostBack="True">
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="15">15</asp:ListItem>
                            <asp:ListItem Value="20">20</asp:ListItem>
                            <asp:ListItem Value="30" Selected="True">30</asp:ListItem>
                            <asp:ListItem Value="40">40</asp:ListItem>
                            <asp:ListItem Value="50">50</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <!-- Status Bar Row End -->
</table>
<br />
<div style="display: none">
    <asp:LinkButton ID="lnkMoveFiles" runat="server" EnableViewState="False" />
    <asp:LinkButton ID="lnkGetMoreNodes" runat="server" EnableViewState="False" />
    <asp:TextBox ID="txtMailData" runat="server" EnableViewState="False" />
    <asp:TextBox ID="txtMailText" runat="server" EnableViewState="False" />
    <asp:LinkButton ID="lnkDeleteAllCheckedFiles" runat="server" EnableViewState="False" />
    <asp:TextBox ID="txtLastPath" runat="server" EnableViewState="False" />
    <asp:LinkButton ID="lnkCancelMoveFiles" runat="server" EnableViewState="False" />
    <asp:HyperLink ID="lnkUploadRedir" runat="server" EnableViewState="False" Visible="False" />
</div>

<asp:Panel ID="pnlScripts2" runat="server" EnableViewState="False">
</asp:Panel>
