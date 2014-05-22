(function($, Edge, compId){
//images folder
    var im = '/kbtest/DesktopModules/OnyakTech%20Word%20Converter/images/';

var fonts = {};


var resources = [
];
var symbols = {
"stage": {
   version: "1.0.0",
   minimumCompatibleVersion: "0.1.7",
   build: "1.0.0.185",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
         dom: [
         {
            id:'OnyakTech68',
            type:'image',
            rect: ['6px', '6px', '68px', '68px', 'auto', 'auto'],
            cursor: ['pointer'],
            fill:["rgba(0,0,0,0)",im+"OnyakTech68.png",'0px','0px']
         },
         {
            id:'wwwOnyakTechcom',
            type:'text',
            rect: ['18px', '32px', 'auto', 'auto', 'auto', 'auto'],
            cursor: ['pointer'],
            opacity:1,
            text:"www.OnyakTech.com",
            align:"center",
            font:['Verdana, Geneva, sans-serif',14,"rgba(23,39,95,1.00)","normal","none","normal"]
         },
         {
            id:'Ellipse',
            type:'ellipse',
            rect:['7px','60px','4px','4px','auto','auto'],
            borderRadius:["50%","50%","50%","50%"],
            fill:["rgba(192,192,192,1)"],
            stroke:[0,"rgba(0,0,0,1)","none"]
         },
         {
            id:'EllipseCopy',
            type:'ellipse',
            rect:['7px','60px','4px','4px','auto','auto'],
            borderRadius:["50%","50%","50%","50%"],
            fill:["rgba(192,192,192,1)"],
            stroke:[0,"rgba(0,0,0,1)","none"]
         },
         {
            id:'EllipseCopy2',
            type:'ellipse',
            rect:['7px','60px','4px','4px','auto','auto'],
            borderRadius:["50%","50%","50%","50%"],
            fill:["rgba(192,192,192,1)"],
            stroke:[0,"rgba(0,0,0,1)","none"]
         },
         {
            id:'EllipseCopy3',
            type:'ellipse',
            rect:['7px','60px','4px','4px','auto','auto'],
            borderRadius:["50%","50%","50%","50%"],
            fill:["rgba(192,192,192,1)"],
            stroke:[0,"rgba(0,0,0,1)","none"]
         },
         {
            id:'DotNetNuke_Solutions',
            type:'text',
            rect:['24px','32px','192px','26px','auto','auto'],
            text:"DotNetNuke Solutions",
            align: "center",
            cursor: ['pointer'],
            font:['Verdana, Geneva, sans-serif',17,"rgba(71,73,80,1.00)","normal","none",""]
         },
         {
            id:'Your_Tools_for_the_Modern_WEb',
            type:'text',
            rect:['41px','20px','157px','auto','auto','auto'],
            opacity:1,
            text:"Your Tools for the Modern Web",
            align:"center",
            font:['Verdana, Geneva, sans-serif',17,"rgba(71,73,80,1)","normal","none","normal"]
         }],
         symbolInstances: [

         ]
      },
   states: {
      "Base State": {
         "${_Your_Tools_for_the_Modern_WEb}": [
            ["style", "top", '20px'],
            ["style", "opacity", '0'],
            ["style", "left", '41px'],
            ["style", "cursor", 'pointer'],
            ["style", "width", '157px']
         ],
         "${_DotNetNuke_Solutions}": [
            ["color", "color", 'rgba(71,73,80,1.00)'],
            ["style", "opacity", '0'],
            ["style", "left", '24px'],
            ["style", "width", '192px'],
            ["style", "top", '32px'],
            ["style", "text-align", 'center'],
            ["style", "height", '26px'],
            ["style", "font-family", 'Verdana, Geneva, sans-serif'],
            ["style", "cursor", 'pointer'],
            ["style", "font-size", '17px']
         ],
         "${_OnyakTech68}": [
            ["style", "top", '6px'],
            ["style", "opacity", '1'],
            ["style", "left", '0px'],
            ["style", "cursor", 'pointer']
         ],
         "${_EllipseCopy3}": [
            ["style", "left", '6.8px'],
            ["style", "opacity", '0.000000']
         ],
         "${_Ellipse}": [
            ["style", "left", '6.8px'],
            ["style", "opacity", '0']
         ],
         "${_Stage}": [
            ["color", "background-color", 'rgba(255,255,255,0.00)'],
            ["style", "overflow", 'hidden'],
            ["style", "height", '80px'],
            ["style", "width", '300%']
         ],
         "${_EllipseCopy}": [
            ["style", "left", '6.8px'],
            ["style", "opacity", '0.000000']
         ],
         "${_EllipseCopy2}": [
            ["style", "left", '6.8px'],
            ["style", "opacity", '0.000000']
         ],
         "${_wwwOnyakTechcom}": [
            ["style", "top", '32px'],
            ["style", "cursor", 'pointer'],
            ["style", "opacity", '0'],
            ["color", "color", 'rgba(23,39,95,1.00)'],
            ["style", "font-family", 'Verdana, Geneva, sans-serif'],
            ["style", "left", '18px'],
            ["style", "font-size", '14px']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 7000,
         autoPlay: true,
         timeline: [
            { id: "eid39", tween: [ "style", "${_EllipseCopy}", "left", '175px', { fromValue: '6.8px'}], position: 4649, duration: 701 },
            { id: "eid40", tween: [ "style", "${_EllipseCopy}", "left", '73px', { fromValue: '175px'}], position: 5350, duration: 990 },
            { id: "eid53", tween: [ "style", "${_EllipseCopy}", "left", '-12px', { fromValue: '73px'}], position: 6340, duration: 660 },
            { id: "eid42", tween: [ "style", "${_EllipseCopy2}", "left", '175px', { fromValue: '6.8px'}], position: 4759, duration: 701 },
            { id: "eid43", tween: [ "style", "${_EllipseCopy2}", "left", '73px', { fromValue: '175px'}], position: 5460, duration: 1095 },
            { id: "eid51", tween: [ "style", "${_EllipseCopy2}", "left", '-14px', { fromValue: '73px'}], position: 6555, duration: 445 },
            { id: "eid36", tween: [ "style", "${_Ellipse}", "left", '175px', { fromValue: '6.8px'}], position: 4549, duration: 701 },
            { id: "eid38", tween: [ "style", "${_Ellipse}", "left", '73px', { fromValue: '175px'}], position: 5250, duration: 750 },
            { id: "eid55", tween: [ "style", "${_Ellipse}", "left", '-10px', { fromValue: '73px'}], position: 6000, duration: 1000 },
            { id: "eid2", tween: [ "style", "${_OnyakTech68}", "opacity", '0', { fromValue: '1'}], position: 0, duration: 1000 },
            { id: "eid3", tween: [ "style", "${_OnyakTech68}", "opacity", '1', { fromValue: '0'}], position: 3000, duration: 1500 },
            { id: "eid45", tween: [ "style", "${_EllipseCopy3}", "left", '175px', { fromValue: '6.8px'}], position: 4884, duration: 701 },
            { id: "eid46", tween: [ "style", "${_EllipseCopy3}", "left", '73px', { fromValue: '175px'}], position: 5585, duration: 1220 },
            { id: "eid49", tween: [ "style", "${_EllipseCopy3}", "left", '-8px', { fromValue: '73px'}], position: 6805, duration: 195 },
            { id: "eid41", tween: [ "style", "${_EllipseCopy}", "opacity", '1', { fromValue: '0.000000'}], position: 4600, duration: 49 },
            { id: "eid44", tween: [ "style", "${_EllipseCopy2}", "opacity", '1', { fromValue: '0.000000'}], position: 4710, duration: 49 },
            { id: "eid18", tween: [ "style", "${_Your_Tools_for_the_Modern_WEb}", "opacity", '0', { fromValue: '0.000000'}], position: 0, duration: 1570 },
            { id: "eid20", tween: [ "style", "${_Your_Tools_for_the_Modern_WEb}", "opacity", '1', { fromValue: '0'}], position: 1795, duration: 705 },
            { id: "eid21", tween: [ "style", "${_Your_Tools_for_the_Modern_WEb}", "opacity", '0', { fromValue: '1'}], position: 2855, duration: 1055 },
            { id: "eid9", tween: [ "style", "${_OnyakTech68}", "left", '172px', { fromValue: '0px'}], position: 0, duration: 4500 },
            { id: "eid32", tween: [ "style", "${_Ellipse}", "opacity", '1', { fromValue: '0.000000'}], position: 4500, duration: 49 },
            { id: "eid47", tween: [ "style", "${_EllipseCopy3}", "opacity", '1', { fromValue: '0.000000'}], position: 4835, duration: 49 },
            { id: "eid11", tween: [ "style", "${_DotNetNuke_Solutions}", "opacity", '1', { fromValue: '0'}], position: 0, duration: 750 },
            { id: "eid12", tween: [ "style", "${_DotNetNuke_Solutions}", "opacity", '0', { fromValue: '1'}], position: 1195, duration: 480 },
            { id: "eid26", tween: [ "style", "${_wwwOnyakTechcom}", "opacity", '1', { fromValue: '0.000000'}], position: 3910, duration: 267 }         ]
      }
   }
}
};


Edge.registerCompositionDefn(compId, symbols, fonts, resources);

/**
 * Adobe Edge DOM Ready Event Handler
 */
$(window).ready(function() {
     Edge.launchComposition(compId);
});
})(jQuery, AdobeEdge, "EDGE-25603986");
