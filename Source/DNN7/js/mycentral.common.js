/* IE check */
var IEVersionChecked = false;
function checkIEVersion(displayMessge) {
//    if (IEVersionChecked == false && navigator.appName == 'Microsoft Internet Explorer') {
//        IEVersionChecked = true;
//        var _browserModeVersion = -1;
//        var _documentModeVersion = document.documentMode;
//        var userAgent = navigator.userAgent;
//   

////        var regExp = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
////        if (regExp.exec(userAgent) != null) {
////            _browserModeVersion = parseFloat(RegExp.$1);
////        }

//     // if (userAgent.indexOf("Trident/5.0") > -1) {
//     //       if (userAgent.indexOf("MSIE 7.0") > -1)
//     //           browserModeVersion += " Compatibility View";
//     //       //_browserModeVersion = 9.0;
//     //   }
//     //   else if (userAgent.indexOf("Trident/4.0") > -1) {
//     //       if (userAgent.indexOf("MSIE 7.0") > -1)
//     //           browserModeVersion += " Compatibility View";
//            //_browserModeVersion = 8.0;
//      //  } 

//        browserModeVersion = browserModeVersion.replace('$$VERSION$$', _browserModeVersion);
//        var htmlstr = '';
//        if (displayMessge == undefined || displayMessge == null || displayMessge == '')
//            htmlstr = "We've detected that you are currently using an outdated version of Internet Explorer. <br> Please note that this site may not display correctly on this version";
//        else
//            htmlstr = displayMessge;
//        htmlstr = htmlstr.replace('$$VERSION$$', browserModeVersion);

//        if (_browserModeVersion > -1) {
//            if (_browserModeVersion <= 7.0 || _documentModeVersion <= 7.0) {
//                mycentral.notifyAndIdle(htmlstr);
//            }
//        }
    //    }

    // Popup if IE browser is 7 or less version
    var htmlstr = '';
            if (displayMessge == undefined || displayMessge == null || displayMessge == '')
                htmlstr = "We've detected that you are currently using an outdated version of Internet Explorer. <br> Please note that this site may not display correctly on this version";
            else
                htmlstr = displayMessge;

    if (msieversion() <=7)
        mycentral.notifyAndIdle(htmlstr);
}

function msieversion() {
    //Trident is available in header of IE 8 and higher
    // not in IE7

    if (IEVersionChecked == false && navigator.appName == 'Microsoft Internet Explorer') {
        var IEVersion = 8;
        var userAgent = navigator.userAgent;
        if (userAgent.indexOf("Trident/") > -1) {
            return IEVersion;
        }
        else {
            return 7;
        }
    }
}



/* IE check end */