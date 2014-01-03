var CurrentEditNode;
var FontNames;
var SelectedSiteStyle;
var ImageControlArray;


$(document).ready(function () {
})

function SetupGlobalVariables(fontNames, currentNode) {
    $("#MyCentralSiteConfiguration_ActionButtonesDiv").hide();

    ImageControlArray = new Array();

    if (fontNames) {
        FontNames = fontNames;
    }

    if (currentNode) {
        CurrentEditNode = currentNode;
    }

    if (CurrentEditNode) {
        if (CurrentEditNode.SiteStyleGroup) {
            SetupMenuForSiteStyleGroup(CurrentEditNode.SiteStyleGroup, 0);
        }
    }

    $("#MyCentralModuleStyleSetting_FileLoaderDiv").hide();
}

function SetupMenuForSiteStyleGroup(siteGroup, parentId) {
    var groupName = siteGroup["@Name"];
    var groupId = siteGroup["@ID"];
    var liElement = '<li class="liSiteStyleGroup">' + groupName + '</li>';
    var ulElement = '<ul class="ulSiteStyleGroup" xmlId="' + groupId + '"></ul>'; 
    var list = $("#MyCentralModuleStyleSetting_MenuDiv ul").last();

    if (parentId > 0) {
        var selector = "#MyCentralModuleStyleSetting_MenuDiv ul[xmlId='" + parentId + "']";
        list = $(selector).last();
    }
    else {
        list = $("#MyCentralModuleStyleSetting_MenuDiv");
    }

    if (list) {
        list.append(liElement);
        list.append(ulElement);

        if (siteGroup.SiteStyleGroup) {
            if (siteGroup.SiteStyleGroup.length > 0) {
                // There are multiple SiteStyleGroups
                for (var i = 0; i < siteGroup.SiteStyleGroup.length; i++) {
                    SetupMenuForSiteStyleGroup(siteGroup.SiteStyleGroup[i], groupId);
                }
            }
            else {
                // There is only one SuteStyleGroup
                SetupMenuForSiteStyleGroup(siteGroup.SiteStyleGroup, groupId);
            }
        }

        if (siteGroup.SiteStyleSubGroup) {
            if (siteGroup.SiteStyleSubGroup.length > 0) {
                // There are multiple SubGroups
                for (var i = 0; i < siteGroup.SiteStyleSubGroup.length; i++) {
                    SetupMenuSiteStyleSubGroup(siteGroup.SiteStyleSubGroup[i], groupId);
                }
            }
            else {
                // There is only one sub group
                SetupMenuSiteStyleSubGroup(siteGroup.SiteStyleSubGroup, groupId);
            }
        }

        if (siteGroup.SiteStyle) {
            if (siteGroup.SiteStyle.length > 0) {
                // There are multiple SiteStyles
                for (var i = 0; i < siteGroup.SiteStyle.length; i++) {
                    SetupSiteStyle(siteGroup.SiteStyle[i], groupId);
                }
            }
            else {
                SetupSiteStyle(siteGroup.SiteStyle, groupId);
            }
        }
    }

    
}

function SetupMenuSiteStyleSubGroup(siteStyleSubGroup, parentId){
    var subgroupName = siteStyleSubGroup["@Name"];
    var subgroupId = siteStyleSubGroup["@ID"];
    var liElement = '<li class="liSiteStyleSubGroup">' + subgroupName + '</li>';
    var ulElement = '<ul class="ulSiteStyleSubGroup" xmlId="' + subgroupId + '"></ul>';
    var list = $("#MyCentralModuleStyleSetting_MenuDiv ul").last();
    
    if (parentId > 0) {
        var selector = "#MyCentralModuleStyleSetting_MenuDiv ul[xmlId='" + parentId + "']";
        list = $(selector).last();
    }
    else {
        list = $("#MyCentralModuleStyleSetting_MenuDiv");
    }

    if (list) {
        list.append(liElement);
        list.append(ulElement);

        if (siteStyleSubGroup.SiteStyle) {
            if (siteStyleSubGroup.SiteStyle.length > 0) {
                // There are multiple SiteStyles
                for (var i = 0; i < siteStyleSubGroup.SiteStyle.length; i++) {
                    SetupSiteStyle(siteStyleSubGroup.SiteStyle[i], subgroupId);
                }
            }
            else {
                SetupSiteStyle(siteStyleSubGroup.SiteStyle, subgroupId);
            }
        }
    }
}

function SetupSiteStyle(siteStyle, parentId){
    var siteStyleName = siteStyle["@Name"];
    var siteStyleId = siteStyle["@ID"];
    var liElement = '<li class="liSiteStyle" xmlId="' + siteStyleId + '">' + siteStyleName + '</li>';
    var list = $("#MyCentralModuleStyleSetting_MenuDiv ul").last();

    if (parentId > 0) {
        var selector = "#MyCentralModuleStyleSetting_MenuDiv ul[xmlId='" + parentId + "']";
        list = $(selector).last();
    }
    else {
        list = $("#MyCentralModuleStyleSetting_MenuDiv");
    }

    if (list) {
        list.append(liElement);
    }

    if (siteStyle["@Type"] == "Image") {
        ImageControlArray.push(siteStyleId);
    }
}

$("#MyCentralModuleStyleSetting_MenuDiv li").live('click', function (e) {
    e.preventDefault;
    this.blur();
    // Get selected siteStyle's ID
    var id = $(this).attr('xmlId');

    // Before clears UI, we need to save the current selected siteStyle settings
    if (SelectedSiteStyle) {
        updateSiteStyle(SelectedSiteStyle);
    }

    // Clears the UI
    clearPropertyEditor();

    //Setup the new selected sitstyle
    if (id != undefined && id) {
        SelectedSiteStyle = GetSelectedSiteStyle(CurrentEditNode, id);
        if (SelectedSiteStyle) {
            setupPropertyForSiteStyle(SelectedSiteStyle);            
        }
    }
});

function GetSelectedSiteStyle(Node, xmlId) {
    if (Node.SiteStyle) {
        if (Node.SiteStyle.length > 0) {
            for (var i = 0; i < Node.SiteStyle.length; i++) {
                if (Node.SiteStyle[i]["@ID"] == xmlId) {
                    return Node.SiteStyle[i];
                }
            }
        }
        else {
            if (Node.SiteStyle["@ID"] == xmlId) {
                return Node.SiteStyle;
            }
        }
    }

    var result = null;

    if (Node.SiteStyleGroup) {
        if (Node.SiteStyleGroup.length > 0) {
            // There are multiple SiteStyleGroups
            for (var i = 0; i < Node.SiteStyleGroup.length; i++) {
                result = GetSelectedSiteStyle(Node.SiteStyleGroup[i], xmlId);
                if (result) {
                    return result;
                }
            }
        }
        else {
            result = GetSelectedSiteStyle(Node.SiteStyleGroup, xmlId);
            if (result) {
                return result;
            }
        }
    }

    if (Node.SiteStyleSubGroup) {
        if (Node.SiteStyleSubGroup.length > 0) {
            // There are multiple SubGroups
            for (var i = 0; i < Node.SiteStyleSubGroup.length; i++) {
                result = GetSelectedSiteStyle(Node.SiteStyleSubGroup[i], xmlId);
                if (result) {
                    return result;
                }
            }
        }
        else {
            // There is only one sub group
            result = GetSelectedSiteStyle(Node.SiteStyleSubGroup, xmlId);
            if (result) {
                return result;
            }
        }
    }

    return null;
}

function setupPropertyForSiteStyle(siteStyle) {
    if (siteStyle) {

        var divBody = "<tr>";
        divBody += '<td class="MyCentralSiteConfiguration_PropertyEditorTableNameColumn">';
        divBody += siteStyle["@Name"];
        divBody += "</td>";

        divBody += '<td class="MyCentralSiteConfiguration_PropertyEditorTableValueColumn">';

        var currentValue = siteStyle["@CustomValue"];
        if (currentValue == null || currentValue == "") {
            currentValue = siteStyle["@DefaultValue"];
        }

        if (currentValue) {
            currentValue = currentValue.replace(";", "");
        }

        if (siteStyle["@Type"] == "Font") {
            divBody += '<select class="MyCentralSiteConfiguration_FontSelector" id="' + GetControlID(siteStyle) + '"></select>';
            divBody += "</td>";
            divBody += "</tr>";
            $('#MyCentralSiteConfiguration_PropertyEditorTable').find('tbody:last').append(divBody);
            PopulateFontComboBox(GetControlID(siteStyle));
            //currentValue = currentValue.replace(";", "");
            $("#" + GetControlID(siteStyle)).val(currentValue);
        }
        else if (siteStyle["@Type"] == "Number") {
            divBody += '<input class="MyCentralSiteConfiguration_valueInput" id="' + GetControlID(siteStyle) + '"></input>';
            divBody += "</td>";
            divBody += "</tr>";
            $('#MyCentralSiteConfiguration_PropertyEditorTable').find('tbody:last').append(divBody);
            $("#" + GetControlID(siteStyle)).val(currentValue);
        }
        else if (siteStyle["@Type"] == "Text") {
            divBody += '<input class="MyCentralSiteConfiguration_textInput" id="' + GetControlID(siteStyle) + '"></input>';
            divBody += "</td>";
            divBody += "</tr>";
            $('#MyCentralSiteConfiguration_PropertyEditorTable').find('tbody:last').append(divBody);
            $("#" + GetControlID(siteStyle)).val(currentValue);
        }
        else if (siteStyle["@Type"] == "Image") {
            var imageWidth = "160";
            if (siteStyle["@ImageSizeX"]) {
                imageWidth = siteStyle["@ImageSizeX"];
            }
            var imageHeight = "90";
            if (siteStyle["@ImageSizeY"]) {
                imageHeight = siteStyle["@ImageSizeY"];
            }
            //            divBody += '<input type="file" size="62" onchange="readImageURL(this, ' + imageWidth + ', ' + imageHeight + ');" class="MyCentralSiteConfiguration_ImageFileInput" id="' + GetControlID(siteStyle) + '" name="' + GetControlID(siteStyle) + '"></input>';
            //            divBody += "</td>";
            //            divBody += '<td class="MyCentralSiteConfiguration_PropertyEditorTableValue2Column">';
            //            divBody += '<img src="#" alt="" class="MyCentralSiteConfiguration_ImageViewer" id="ImageViewer_' + GetControlID(siteStyle) + '"></img>';
            divBody += '<div class="MyCentralSiteConfiguration_ImageFileInput" id="' + GetControlID(siteStyle) + '"></div>';
            divBody += "</td>";
            divBody += "</tr>";
            $('#MyCentralSiteConfiguration_PropertyEditorTable').find('tbody:last').append(divBody);

            var imageControlIndex = ImageControlArray.indexOf(siteStyle["@ID"]) + 1;
            $("#MyCentralModuleStyleSetting_FileLoaderDiv" + imageControlIndex).insertBefore('#' + GetControlID(siteStyle));
        }
        else if (siteStyle["@Type"] == "Color") {
            divBody += '<input class="MyCentralSiteConfiguration_colorInput" id="' + GetControlID(siteStyle) + '"></input>';
            divBody += "</td>";
            divBody += '<td class="MyCentralSiteConfiguration_PropertyEditorTableValue2Column">';
            divBody += '<div id="ColorPicker_' + GetControlID(siteStyle) + '"></div>';
            divBody += '</td>';
            divBody += '</tr>';
            $('#MyCentralSiteConfiguration_PropertyEditorTable').find('tbody:last').append(divBody);
            $("#" + GetControlID(siteStyle)).val(currentValue);
            $('#ColorPicker_' + GetControlID(siteStyle)).farbtastic('#' + GetControlID(siteStyle));
            //$('#ColorPicker_' + GetControlID(siteStyle)).hide();
        }
        else if (siteStyle["@Type"] == "Font-Family") {
            divBody += '<select multiple="multiple" class="MyCentralSiteConfiguration_FontFamilySelector" id="' + GetControlID(siteStyle) + '"></select>';
            divBody += "</td>";
            divBody += "</tr>";
            $('#MyCentralSiteConfiguration_PropertyEditorTable').find('tbody:last').append(divBody);
            PopulateFontComboBox(GetControlID(siteStyle));

            //currentValue = currentValue.replace(";", "");
            var selectedfontList = currentValue.split(", ");
            $("#" + GetControlID(siteStyle)).val(selectedfontList);
        }
        else if (siteStyle["@Type"] == "Size") {
            divBody += '<input class="MyCentralSiteConfiguration_SizeInput" id="' + GetControlID(siteStyle) + '"></input>';
            divBody += "</td>";
            divBody += "</tr>";
            $('#MyCentralSiteConfiguration_PropertyEditorTable').find('tbody:last').append(divBody);
            $("#" + GetControlID(siteStyle)).val(currentValue);
        }

        $("#MyCentralSiteConfiguration_ActionButtonesDiv").show();
    }
}

function GetControlID(siteStyle) {
    if (siteStyle) {
        if (siteStyle["@Type"] == "Font") {
            return "FontSelector_" + siteStyle["@Name"] + siteStyle["@ID"];
        }
        else if (siteStyle["@Type"] == "Number") {
            return "valueInput_" + siteStyle["@Name"] + siteStyle["@ID"];
        }
        else if (siteStyle["@Type"] == "Text") {
            return "textInput_" + siteStyle["@Name"] + siteStyle["@ID"];
        }
        else if (siteStyle["@Type"] == "Image") {
            return "imageInput_" + siteStyle["@Name"] + siteStyle["@ID"];
        }
        else if (siteStyle["@Type"] == "Color") {
            return "colorInput_" + siteStyle["@Name"] + siteStyle["@ID"];
        }
        else if (siteStyle["@Type"] == "Font-Family") {
            return "FontFamilySelector_" + siteStyle["@Name"] + siteStyle["@ID"];
        }
        else if (siteStyle["@Type"] == "Size") {
            return "sizeInput_" + siteStyle["@Name"] + siteStyle["@ID"];
        }

        divBody += "</td>";
        divBody += "</tr>";

        $('#MyCentralSiteConfiguration_PropertyEditorTable').find('tbody:last').append(divBody);
    }
}

function PopulateFontComboBox(cbID) {
    var cBoxes = $("#" + cbID);
    if (FontNames) {
        var fontNameList = FontNames; // FontNames.split(",");

        for (var i = 0; i < fontNameList.length; i++) {
            var option = document.createElement("option");
            option.value = fontNameList[i];
            option.innerHTML = fontNameList[i];
            cBoxes.each(function () {
                this.appendChild(option);
            });
        }
    }
}

function PopulateFontComboBoxes() {
    var cBoxes = $("select.MyCentralSiteConfiguration_FontSelector");
    if (FontNames) {
        var fontNameList = FontNames;  //FontNames.split(",");

        for (var i = 0; i < fontNameList.length; i++) {
            var option = document.createElement("option");
            option.value = fontNameList[i];
            option.innerHTML = fontNameList[i];
            cBoxes.each(function () {
                this.appendChild(option);
            });
        }
    }
}

function clearPropertyEditor() {
    $("#MyCentralModuleStyleSetting_FileLoaderDiv1").insertBefore('#MyCentralModuleStyleSetting_FileLoaderAnchor');
    $("#MyCentralModuleStyleSetting_FileLoaderDiv2").insertBefore('#MyCentralModuleStyleSetting_FileLoaderAnchor');
    $("#MyCentralModuleStyleSetting_FileLoaderDiv3").insertBefore('#MyCentralModuleStyleSetting_FileLoaderAnchor');
    $("#MyCentralModuleStyleSetting_FileLoaderDiv4").insertBefore('#MyCentralModuleStyleSetting_FileLoaderAnchor');
    $("#MyCentralModuleStyleSetting_FileLoaderDiv5").insertBefore('#MyCentralModuleStyleSetting_FileLoaderAnchor');
    $("#MyCentralModuleStyleSetting_FileLoaderDiv6").insertBefore('#MyCentralModuleStyleSetting_FileLoaderAnchor');
    $("#MyCentralModuleStyleSetting_FileLoaderDiv7").insertBefore('#MyCentralModuleStyleSetting_FileLoaderAnchor');
    $("#MyCentralModuleStyleSetting_FileLoaderDiv8").insertBefore('#MyCentralModuleStyleSetting_FileLoaderAnchor');
    $("#MyCentralModuleStyleSetting_FileLoaderDiv9").insertBefore('#MyCentralModuleStyleSetting_FileLoaderAnchor');
    $("#MyCentralModuleStyleSetting_FileLoaderDiv10").insertBefore('#MyCentralModuleStyleSetting_FileLoaderAnchor');
    $("#MyCentralModuleStyleSetting_FileLoaderDiv11").insertBefore('#MyCentralModuleStyleSetting_FileLoaderAnchor');
    $("#MyCentralModuleStyleSetting_FileLoaderDiv12").insertBefore('#MyCentralModuleStyleSetting_FileLoaderAnchor');

    $("#MyCentralSiteConfiguration_PropertyEditorTable tr").remove();
    $("#MyCentralSiteConfiguration_ActionButtonesDiv").hide();
}

function updateSiteStyle(siteStyle) {
    if (siteStyle) {
        if (siteStyle["@Type"] == "Font") {
            siteStyle["@CustomValue"] = $("#" + GetControlID(siteStyle)).val();
            //siteStyle["@DefaultValue"] = $("#" + GetControlID(siteStyle)).val();
        }
        else if (siteStyle["@Type"] == "Number") {
            siteStyle["@CustomValue"] = $("#" + GetControlID(siteStyle)).val();
            //siteStyle["@DefaultValue"] = $("#" + GetControlID(siteStyle)).val();
        }
        else if (siteStyle["@Type"] == "Text") {
            siteStyle["@CustomValue"] = $("#" + GetControlID(siteStyle)).val();
            //siteStyle["@DefaultValue"] = $("#" + GetControlID(siteStyle)).val();
        }
        else if (siteStyle["@Type"] == "Image") {
            var imageControlIndex = ImageControlArray.indexOf(siteStyle["@ID"]) + 1;
            var imageControlId = 'MyCentralModuleStyleSetting_FileLoader' + imageControlIndex;

            var file = $('input[id$=' + imageControlId + ']').val();

            if (file && file.length) {
                siteStyle["@CustomValue"] = "url('" + siteStyle["@Url"] + "')";
            }
        }
        else if (siteStyle["@Type"] == "Color") {
            siteStyle["@CustomValue"] = $("#" + GetControlID(siteStyle)).val();
            //siteStyle["@DefaultValue"] = $("#" + GetControlID(siteStyle)).val();
        }
        else if (siteStyle["@Type"] == "Font-Family") {
            var selectedFonts = $("#" + GetControlID(siteStyle)).val();
            var selectedValue = "";
            for (var index = 0; index < selectedFonts.length; index++) {
                if (selectedFonts[index]) {
                    selectedValue = selectedValue + selectedFonts[index] + ", ";
                }
            }
            siteStyle["@CustomValue"] = selectedValue;
            //siteStyle["@DefaultValue"] = $("#" + GetControlID(siteStyle)).val();
        }
        else if (siteStyle["@Type"] == "Size") {
            siteStyle["@CustomValue"] = $("#" + GetControlID(siteStyle)).val();
            //siteStyle["@DefaultValue"] = $("#" + GetControlID(siteStyle)).val();
        }
    }
}

function ButtonResetClick() {
    var r = confirm("Reset to default value?");
    if (r == true) {
        revertSiteStyleToDefault(SelectedSiteStyle);
        clearPropertyEditor();
        setupPropertyForSiteStyle(SelectedSiteStyle);
    }
}

function ButtonTestClick() {
    updateCurrentNodeFromPropertyEditor();
    SetHiddenRootNode();
}

function ButtonApplyClick() {
    var r = confirm("Apply the changes?");
    if (r == true) {
        updateSiteStyle(SelectedSiteStyle);
        SetHiddenCurrentEditNode();
    }
}

function revertSiteStyleToDefault(siteStyle) {
    if (siteStyle) {
        if (siteStyle["@Type"] == "Image") {
            var imageControlIndex = ImageControlArray.indexOf(siteStyle["@ID"]) + 1;
            var imageControlId = 'MyCentralModuleStyleSetting_FileLoader' + imageControlIndex;
            siteStyle["@CustomValue"] = siteStyle["@DefaultValue"];
            $('input[id$=' + imageControlId + ']').val('');
        }
        else {
            siteStyle["@CustomValue"] = siteStyle["@DefaultValue"];
        }
    }
}

function SetHiddenCurrentEditNode() {
    var stringCurrentEditNode = JSON.stringify(CurrentEditNode);
    $('input[id$=tbHiddenCurrentEditNode]').val(stringCurrentEditNode);

    var stringImageControlArray = JSON.stringify(ImageControlArray);
    $('input[id$=HiddenImageControlArray]').val(stringImageControlArray);
}