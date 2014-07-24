var CurrentEditNode;
var RootNode;
var FontNames;
var timer; // Timer to refresh the demo page

$(document).ready(function () {
    $('.MyCentralSiteConfiguration_colorInput').focus(function () {
        var id = "ColorPicker_" + $(this).attr('id');
        $('#' + id).show();
    });

    $('.MyCentralSiteConfiguration_colorInput').blur(function () {
        var id = "ColorPicker_" + $(this).attr('id');
        $('#' + id).hide();
    });

    $('.MyCentralSiteConfiguration_ImageFileInput').blur(function () {
        var id = "ImageView_" + $(this).attr('id');
        $('#' + id).hide();
    });

    changeIframe();    
})

function SetupGlobalVariables(rootNode, fontNames, currentNode) {
    if (rootNode) {
        RootNode = rootNode; 
    }

    if (fontNames) {
        FontNames = fontNames;
    }

    if (currentNode) {
        if (CurrentEditNode) {
        }
        else {
            CurrentEditNode = currentNode;
        }
    }

    if (CurrentEditNode) {
        setupPropertyEditor(CurrentEditNode)
    }

    refreshIFrame();
}

function refreshIFrame() {
    var url = $('input[id$=tbHiddenIframeSrc]').val();
    $("#MyCentralSiteConfiguration_DemoFrame").attr('src', "about:blank");

    if (timer) {
        clearInterval(timer);
    }
    timer = setTimeout(changeIframe, 10000);  // every 10 seconds

    if (url) {
        var pageName = $("#MyCentralSiteConfiguration_DemoPageSelect").val();
        if (pageName == null) {
            pageName = "StoreLocatorCollection.htm";
        }

        url = url + pageName;
        $("#MyCentralSiteConfiguration_DemoFrame").attr('src', url);
    }
}

function changeIframe() {
    var demoPages = document.getElementById('MyCentralSiteConfiguration_DemoPageSelect').options;
    var currentPage = $("#MyCentralSiteConfiguration_DemoPageSelect option:selected")[0].index;
    var randomnumber = Math.floor(Math.random() * demoPages.length);
    var count = 0;
    while ((randomnumber == currentPage) && (count++ < 10)) {
        randomnumber = Math.floor(Math.random() * demoPages.length);
    }
    
    demoPages[randomnumber].selected = true;
    refreshIFrame();
}

function FindCurrentNode(xmlNodeJsonString) {
    if (xmlNodeJsonString && RootNode) {
        if (xmlNodeJsonString.MyCentralSiteStyles) {
            return RootNode;
        }
        else if (xmlNodeJsonString.SiteStyleGroup) {
            return FindSiteStyleGroupFromGroups(RootNode.MyCentralSiteStyles.SiteStyleGroup, xmlNodeJsonString.SiteStyleGroup);
        }
        else if (xmlNodeJsonString.SiteStyleSubGroup) {
            return FindSiteStyleSubGroupFromGroups(RootNode.MyCentralSiteStyles.SiteStyleGroup, xmlNodeJsonString.SiteStyleSubGroup);
        }
        else if (xmlNodeJsonString.SiteStyle) {
            return FindSiteStyleFromGroups(RootNode.MyCentralSiteStyles.SiteStyleGroup, xmlNodeJsonString.SiteStyle);
        }
    }
    else if (xmlNodeJsonString == null) {
        alert("Invalid Node selected.");
        return null;
    }
    else if (RootNode == null) {
        alert("RootNode is not set yet!");
        return null;
    }
}

function FindSiteStyleGroupFromGroups(LookFromGroups, LookForGroup) {
    if (LookFromGroups.length > 0) {
        for(var i = 0; i<LookFromGroups.length; i++){
            var item = FindSiteStyleGroupFromGroup(LookFromGroups[i], LookForGroup)
            if (item) { return item; }
        }
    }
    else {
        // LookFromGroups only contains one item, it is not a group
        var item = FindSiteStyleGroupFromGroup(LookFromGroups, LookForGroup);
        if (item) { return item; }
    }

    return null;
}

function FindSiteStyleGroupFromGroup(LookFromGroup, LookForGroup) {
    if ((LookFromGroup["@Name"] == LookForGroup["@Name"])
    && (LookFromGroup["@ID"] == LookForGroup["@ID"])) {
        return LookFromGroup;
    }
    else if (LookFromGroup.SiteStyleGroup) {
        var item = FindSiteStyleGroupFromGroups(LookFromGroup.SiteStyleGroup, LookForGroup);
        if (item) { return item; }
    }
}

function FindSiteStyleSubGroupFromGroups(LookFromGroups, LookForSubGroup) {
    if (LookFromGroups.length > 0) {
        for (var i = 0; i < LookFromGroups.length; i++) {
            var item = FindSiteStyleSubGroupFromGroup(LookFromGroups[i], LookForSubGroup);
            if (item) { return item; }           
        }
    }
    else {
        var item = FindSiteStyleSubGroupFromGroup(LookFromGroups, LookForSubGroup);
        if (item) { return item; }
    }

    return null;
}

function FindSiteStyleSubGroupFromGroup(LookFromGroup, LookForSubGroup) {
    if (LookFromGroup.SiteStyleSubGroup) {
        if (LookFromGroup.SiteStyleSubGroup.length > 0) {
            for (var j = 0; j < LookFromGroup.SiteStyleSubGroup.length; j++) {
                if ((LookFromGroup.SiteStyleSubGroup[j]["@Name"] == LookForSubGroup["@Name"]) 
                && (LookFromGroup.SiteStyleSubGroup[j]["@ID"] == LookForSubGroup["@ID"])) {
                    return LookFromGroup.SiteStyleSubGroup[j];
                }
            }
        }
        else {
            if ((LookFromGroup.SiteStyleSubGroup["@Name"] == LookForSubGroup["@Name"]) 
            && (LookFromGroup.SiteStyleSubGroup["@ID"] == LookForSubGroup["@ID"])) {
                return LookFromGroup.SiteStyleSubGroup;
            }
        }
    }

    if (LookFromGroup.SiteStyleGroup) {
        var item = FindSiteStyleSubGroupFromGroups(LookFromGroup.SiteStyleGroup, LookForSubGroup);
        if (item) { return item; }
    }

    return null;
}

function FindSiteStyleFromGroups(LookFromGroups, LookForSiteStyle) {
    if (LookFromGroups.length > 0) {
        for (var i = 0; i < LookFromGroups.length; i++) {
            var item = FindSiteStyleFromGroup(LookFromGroups[i], LookForSiteStyle);
            if (item) { return item; }
        }
    }
    else {
        var item = FindSiteStyleFromGroup(LookFromGroups, LookForSiteStyle);
        if (item) { return item; }
    }

    return null;
}

function FindSiteStyleFromGroup(LookFromGroup, LookForSiteStyle) {
    if (LookFromGroup.SiteStyle) {
        if (LookFromGroup.SiteStyle.length > 0) {
            for (var j = 0; j < LookFromGroup.SiteStyle.length; j++) {
                if ((LookFromGroup.SiteStyle[j]["@Name"] == LookForSiteStyle["@Name"])
                && (LookFromGroup.SiteStyle[j]["@ID"] == LookForSiteStyle["@ID"])
                && (LookFromGroup.SiteStyle[j]["@Type"] == LookForSiteStyle["@Type"])) {
                    return LookFromGroup.SiteStyle[j];
                }
            }
        }
        else {
            if ((LookFromGroup.SiteStyle["@Name"] == LookForSiteStyle["@Name"])
            && (LookFromGroup.SiteStyle["@ID"] == LookForSiteStyle["@ID"])
            && (LookFromGroup.SiteStyle["@Type"] == LookForSiteStyle["@Type"])) {
                return LookFromGroup.SiteStyle;
            }
        }
    }

    if (LookFromGroup.SiteStyleGroup) {
        var item = FindSiteStyleFromGroups(LookFromGroup.SiteStyleGroup, LookForSiteStyle);
        if (item) { return item; }
    }

    if (LookFromGroup.SiteStyleSubGroup) {
        var item = FindSiteStyleFromGroups(LookFromGroup.SiteStyleSubGroup, LookForSiteStyle);
        if (item) { return item; }
    }

    return null;
}



function setupPropertyEditor(xmlNodeJsonString) {
    $("#MyCentralSiteConfiguration_FileLoaderDiv").hide();

    if (xmlNodeJsonString) {
        var node = FindCurrentNode(xmlNodeJsonString);
        if (node) {
            CurrentEditNode = node;
        }

        if (CurrentEditNode.SiteStyle) {
            if (CurrentEditNode.SiteStyle.length > 0) {
                for (var i = 0; i < CurrentEditNode.SiteStyle.length; i++) {
                    setupPropertyForSiteStyle(CurrentEditNode.SiteStyle[i]);
                }
            }
            else {
                // if the group only has one SiteStyle, SiteStyle.length property is undefined
                setupPropertyForSiteStyle(CurrentEditNode.SiteStyle);
            }
        }
        else {
            setupPropertyForSiteStyle(CurrentEditNode);
        }

        AddActionButtons();
        $("select.MyCentralSiteConfiguration_FontFamilySelector").multiselect({
            header: false
        });
    }
}


function AddActionButtons() {
    //    var $ctrl = $('<input/>').attr({ type: 'button', id: 'ButtonReset', value: 'Reset To Default' }).addClass("MyCentralSiteConfiguration_ActionButtons");
    //    $("#MyCentralSiteConfiguration_ActionButtonesDiv").append($ctrl);

    //    $ctrl = $('<input/>').attr({ type: 'button', id: 'ButtonTest', value: 'Test' }).addClass("MyCentralSiteConfiguration_ActionButtons");
    //    $("#MyCentralSiteConfiguration_ActionButtonesDiv").append($ctrl);

    //    $ctrl = $('<input/>').attr({ type: 'button', id: 'ButtonSave', value: 'Apply' }).addClass("MyCentralSiteConfiguration_ActionButtons");
    //    $("#MyCentralSiteConfiguration_ActionButtonesDiv").append($ctrl);
}

//$(".MyCentralSiteConfiguration_ActionButtons").live("click", function () {
//    var buttonId = $(this).attr("id");
//    if (buttonId == "ButtonReset") {
//        var r = confirm("Reset to default value?");
//        if (r == true) {
//            setCurrentNodeToDefault();
//            clearPropertyEditor();
//            setupPropertyEditor(CurrentEditNode);
//            alert("Reset Done.");
//        }
//    }
//    else if (buttonId == "ButtonTest") {
//        alert("Test action here");
//    }
//    else if (buttonId == "ButtonSave") {
//        var r = confirm("Apply the changes?");
//        if (r == true) {
//            updateCurrentNodeFromPropertyEditor();
//            alert("Apply Done. If you are done with all your editing, you need to click Uploading To Server button.");
//        }
//    }
//});

function ButtonResetClick() {
    var r = confirm("Reset to default value?");
    if (r == true) {
        setCurrentNodeToDefault();
        clearPropertyEditor();
        setupPropertyEditor(CurrentEditNode);
        //alert("Reset Done.");
    }
}

function ButtonTestClick() {
    updateCurrentNodeFromPropertyEditor();
    SetHiddenRootNode();
}

function ButtonApplyClick() {
    var r = confirm("Apply the changes?");
    if (r == true) {
        ButtonTestClick();
        return true;
        //alert("Apply Done. If you are done with all your editing, you need to click Uploading To Server button.");
    }

    return false;
}

function clearPropertyEditor() {
    $("#MyCentralSiteConfiguration_PropertyEditorTable tr").remove();
    //$('#MyCentralSiteConfiguration_ActionButtonesDiv').empty();    
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
            divBody += '<div class="MyCentralSiteConfiguration_ImageFileInput"></div>';
            divBody += "</td>";
            divBody += "</tr>";
            $('#MyCentralSiteConfiguration_PropertyEditorTable').find('tbody:last').append(divBody);

            $("#MyCentralSiteConfiguration_FileLoaderDiv").insertBefore('.MyCentralSiteConfiguration_ImageFileInput');
            $("#MyCentralSiteConfiguration_FileLoaderDiv").show();
        }
        else if (siteStyle["@Type"] == "Color") {
            divBody += '<input class="MyCentralSiteConfiguration_colorInput" id="' + GetControlID(siteStyle) + '"></input>';
//            divBody += "</td>";
//            divBody += '<td class="MyCentralSiteConfiguration_PropertyEditorTableValue2Column">';
            divBody += '<div id="ColorPicker_' + GetControlID(siteStyle) + '"></div>';
            divBody += '</td>';
            divBody += '</tr>';
            $('#MyCentralSiteConfiguration_PropertyEditorTable').find('tbody:last').append(divBody);
            $("#" + GetControlID(siteStyle)).val(currentValue);
            $('#ColorPicker_' + GetControlID(siteStyle)).farbtastic('#' + GetControlID(siteStyle));
            $('#ColorPicker_' + GetControlID(siteStyle)).hide();
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
    }
}

function readImageURL(input) {
//    if (input.files && input.files[0]) {
//        var reader = new FileReader();
//        var id = "ImageViewer_" + input.attributes["id"].nodeValue; //input.attr('id');

//        reader.onload = function (e) {
//            $('#' + id)
//                        .attr('src', e.target.result)
//                        .width(width)
//                        .height(height);
//        };

//        reader.readAsDataURL(input.files[0]);
//    }
}

function updateCurrentNodeFromPropertyEditor() {
    if (CurrentEditNode) {
        if (CurrentEditNode.SiteStyle) {
            if (CurrentEditNode.SiteStyle.length > 0) {
                for (var i = 0; i < CurrentEditNode.SiteStyle.length; i++) {
                    updateSiteStyle(CurrentEditNode.SiteStyle[i]);
                }
            }
            else {
                // if the group only has one SiteStyle, SiteStyle.length property is undefined
                updateSiteStyle(CurrentEditNode.SiteStyle);
            }
        }
        else {
            updateSiteStyle(CurrentEditNode);
        }
    }
}

function setCurrentNodeToDefault() {
    if (CurrentEditNode) {
        if (CurrentEditNode.SiteStyle) {
            if (CurrentEditNode.SiteStyle.length > 0) {
                for (var i = 0; i < CurrentEditNode.SiteStyle.length; i++) {
                    revertSiteStyleToDefault(CurrentEditNode.SiteStyle[i]);
                }
            }
            else {
                // if the group only has one SiteStyle, SiteStyle.length property is undefined
                revertSiteStyleToDefault(CurrentEditNode.SiteStyle);
            }
        }
        else {
            revertSiteStyleToDefault(CurrentEditNode);
        }
    }
}

function revertSiteStyleToDefault(siteStyle) {
    if (siteStyle) {
        if (siteStyle["@Type"] == "Font") {
            siteStyle["@CustomValue"] = siteStyle["@DefaultValue"];
        }
        else if (siteStyle["@Type"] == "Number") {
            siteStyle["@CustomValue"] = siteStyle["@DefaultValue"];
        }
        else if (siteStyle["@Type"] == "Text") {
            siteStyle["@CustomValue"] = siteStyle["@DefaultValue"];
        }
        else if (siteStyle["@Type"] == "Image") {
        }
        else if (siteStyle["@Type"] == "Color") {
            siteStyle["@CustomValue"] = siteStyle["@DefaultValue"];
        }
        else if (siteStyle["@Type"] == "Font-Family") {
            siteStyle["@CustomValue"] = siteStyle["@DefaultValue"];
        }
        else if (siteStyle["@Type"] == "Size") {
            siteStyle["@CustomValue"] = siteStyle["@DefaultValue"];
        }
    }
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

function updateServerFiles(CurrentEditNode) {
    $.ajax({
        type: "POST",
        async: true,
        dataType: "json",
        url: "/SaveSettings",
        cache: true,
        data: { jsonCurrentXmlNode: CurrentEditNode },
        success: function (data) {
            if (data == "Success") {
                alert("Success");
            }
            else {
                alert("Failure");
            }
        },

        error: function () {
            alert("Exception Calling Server function.");
        }
    });
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

function SetHiddenRootNode() {
    //$('#<%= tbHiddenRootNode.ClientID %>').val('Test');
    var stringRootNode = JSON.stringify(RootNode);
    $('input[id$=tbHiddenRootNode]').val(stringRootNode);
}

function OnDemoPageSelectChange() {
    refreshIFrame();
}

