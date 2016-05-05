/**
 * Adobe Edge: symbol definitions
 */
(function($, Edge, compId){
//images folder
var im='../images/nodejs/v1/';

var fonts = {};


var resources = [
];
var symbols = {
"stage": {
   version: "1.5.0",
   minimumCompatibleVersion: "1.5.0",
   build: "1.5.0.217",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
         dom: [
         {
            id:'dotLine',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"dotLine.png",'0px','0px']
         },
         {
            id:'Layer1',
            type:'rect',
            rect:['0','0','auto','auto','auto','auto'],
            clip:['rect(0px 578pxpx 420pxpx 0px)']
         },
         {
            id:'Layer2',
            type:'rect',
            rect:['578','0','auto','auto','auto','auto']
         },
         {
            id:'Layer3',
            type:'rect',
            rect:['1015','0','auto','auto','auto','auto']
         },
         {
            id:'Layer4',
            type:'rect',
            rect:['1452','0','auto','auto','auto','auto']
         },
         {
            id:'Layer5',
            type:'rect',
            rect:['1888','0','auto','auto','auto','auto']
         },
         {
            id:'Layer6',
            type:'rect',
            rect:['2325','0','auto','auto','auto','auto']
         },
         {
            id:'Rectangle',
            type:'rect',
            rect:['0px','0px','2880px','794px','auto','auto'],
            fill:["rgba(192,192,192,0.00)",[270,[['rgba(255,255,255,1.00)',47],['rgba(255,255,255,0.00)',100]]]],
            stroke:[0,"rgba(0,0,0,1)","none"]
         },
         {
            id:'blackFade3',
            display:'none',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"blackFade.png",'0px','0px']
         },
         {
            id:'L1',
            display:'none',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"L1.png",'0px','0px']
         },
         {
            id:'blackFade3Copy',
            display:'none',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"blackFade.png",'0px','0px']
         },
         {
            id:'L2',
            display:'none',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"L2.png",'0px','0px']
         },
         {
            id:'blackFade3Copy3',
            display:'none',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"blackFade.png",'0px','0px']
         },
         {
            id:'L3',
            display:'none',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"L3.png",'0px','0px']
         },
         {
            id:'blackFade3Copy4',
            display:'none',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"blackFade.png",'0px','0px']
         },
         {
            id:'L4',
            display:'none',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"L4.png",'0px','0px']
         },
         {
            id:'blackFade3Copy5',
            display:'none',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"blackFade.png",'0px','0px']
         },
         {
            id:'L5',
            display:'none',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"L5.png",'0px','0px']
         },
         {
            id:'blackFade3Copy6',
            display:'none',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"blackFade.png",'0px','0px']
         },
         {
            id:'L6',
            display:'none',
            type:'image',
            rect:['0px','0px','2880px','420px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"L6.png",'0px','0px']
         }],
         symbolInstances: [
         {
            id:'Layer3',
            symbolName:'Layer3'
         },
         {
            id:'Layer4',
            symbolName:'Layer4'
         },
         {
            id:'Layer1',
            symbolName:'Layer1'
         },
         {
            id:'Layer5',
            symbolName:'Layer5'
         },
         {
            id:'Layer6',
            symbolName:'Layer6'
         },
         {
            id:'Layer2',
            symbolName:'Layer2'
         }
         ]
      },
   states: {
      "Base State": {
         "${_blackFade3Copy6}": [
            ["style", "top", '0px'],
            ["style", "opacity", '0'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_L2}": [
            ["style", "top", '-420px'],
            ["style", "opacity", '1'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_blackFade3Copy4}": [
            ["style", "top", '0px'],
            ["style", "opacity", '0'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_L3}": [
            ["style", "top", '-420px'],
            ["style", "opacity", '1'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_Rectangle}": [
            ["style", "top", '0px'],
            ["style", "display", 'block'],
            ["color", "background-color", 'rgba(192,192,192,0.00)'],
            ["style", "height", '794px'],
            ["gradient", "background-image", [270,[['rgba(255,255,255,1.00)',47],['rgba(255,255,255,0.00)',100]]]],
            ["style", "left", '0px'],
            ["style", "width", '2880px']
         ],
         "${_Layer1}": [
            ["style", "clip", [0,575,420,0], {valueTemplate:'rect(@@0@@px @@1@@px @@2@@px @@3@@px)'} ]
         ],
         "${_L6}": [
            ["style", "top", '-420px'],
            ["style", "opacity", '1'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_L4}": [
            ["style", "top", '-420px'],
            ["style", "opacity", '1'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_blackFade3}": [
            ["style", "top", '0px'],
            ["style", "opacity", '0'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_L1}": [
            ["style", "top", '-420px'],
            ["style", "opacity", '1'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_dotLine}": [
            ["style", "left", '0px'],
            ["style", "top", '0px']
         ],
         "${_L5}": [
            ["style", "top", '-420px'],
            ["style", "opacity", '1'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_Stage}": [
            ["color", "background-color", 'rgba(255,255,255,1.00)'],
            ["style", "overflow", 'hidden'],
            ["style", "height", '420px'],
            ["style", "width", '2880px']
         ],
         "${_blackFade3Copy5}": [
            ["style", "top", '0px'],
            ["style", "opacity", '0'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_blackFade3Copy3}": [
            ["style", "top", '0px'],
            ["style", "opacity", '0'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ],
         "${_blackFade3Copy}": [
            ["style", "top", '0px'],
            ["style", "opacity", '0'],
            ["style", "left", '0px'],
            ["style", "display", 'none']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 15900,
         autoPlay: true,
         labels: {
            "Start": 2000,
            "L1": 2100,
            "L2": 4400,
            "L3": 6700,
            "L4": 9000,
            "L5": 11300,
            "L6": 13600
         },
         timeline: [
            { id: "eid98", tween: [ "style", "${_blackFade3Copy5}", "opacity", '1', { fromValue: '0'}], position: 11300, duration: 1000 },
            { id: "eid99", tween: [ "style", "${_blackFade3Copy5}", "opacity", '0', { fromValue: '1'}], position: 13200, duration: 300 },
            { id: "eid67", tween: [ "style", "${_L2}", "display", 'block', { fromValue: 'none'}], position: 5100, duration: 0, easing: "easeOutBounce" },
            { id: "eid68", tween: [ "style", "${_L2}", "display", 'none', { fromValue: 'block'}], position: 6700, duration: 0, easing: "easeOutBounce" },
            { id: "eid79", tween: [ "style", "${_blackFade3Copy3}", "opacity", '1', { fromValue: '0'}], position: 6700, duration: 1000 },
            { id: "eid80", tween: [ "style", "${_blackFade3Copy3}", "opacity", '0', { fromValue: '1'}], position: 8600, duration: 300 },
            { id: "eid117", tween: [ "style", "${_L6}", "top", '0px', { fromValue: '-420px'}], position: 14300, duration: 1200, easing: "easeOutBounce" },
            { id: "eid65", tween: [ "style", "${_L2}", "top", '0px', { fromValue: '-420px'}], position: 5100, duration: 1200, easing: "easeOutBounce" },
            { id: "eid121", tween: [ "style", "${_L6}", "opacity", '0', { fromValue: '1'}], position: 15500, duration: 300 },
            { id: "eid84", tween: [ "style", "${_L3}", "display", 'block', { fromValue: 'none'}], position: 7400, duration: 0, easing: "easeOutBounce" },
            { id: "eid85", tween: [ "style", "${_L3}", "display", 'none', { fromValue: 'block'}], position: 9000, duration: 0, easing: "easeOutBounce" },
            { id: "eid63", tween: [ "style", "${_blackFade3Copy}", "opacity", '1', { fromValue: '0'}], position: 4400, duration: 1000 },
            { id: "eid72", tween: [ "style", "${_blackFade3Copy}", "opacity", '0', { fromValue: '1'}], position: 6300, duration: 300 },
            { id: "eid4", tween: [ "style", "${_Layer1}", "clip", [0,575,420,0], { valueTemplate: 'rect(@@0@@px @@1@@px @@2@@px @@3@@px)', fromValue: [0,575,420,0]}], position: 0, duration: 0 },
            { id: "eid57", tween: [ "style", "${_L1}", "top", '0px', { fromValue: '-420px'}], position: 2800, duration: 1200, easing: "easeOutBounce" },
            { id: "eid71", tween: [ "style", "${_L2}", "opacity", '0', { fromValue: '1'}], position: 6300, duration: 300 },
            { id: "eid52", tween: [ "style", "${_blackFade3}", "opacity", '1', { fromValue: '0'}], position: 2100, duration: 1000 },
            { id: "eid70", tween: [ "style", "${_blackFade3}", "opacity", '0', { fromValue: '1'}], position: 4000, duration: 300 },
            { id: "eid83", tween: [ "style", "${_L3}", "top", '0px', { fromValue: '-420px'}], position: 7400, duration: 1200, easing: "easeOutBounce" },
            { id: "eid112", tween: [ "style", "${_blackFade3Copy6}", "display", 'block', { fromValue: 'none'}], position: 13600, duration: 0, easing: "easeOutBounce" },
            { id: "eid113", tween: [ "style", "${_blackFade3Copy6}", "display", 'none', { fromValue: 'block'}], position: 15900, duration: 0, easing: "easeOutBounce" },
            { id: "eid69", tween: [ "style", "${_L1}", "opacity", '0', { fromValue: '1'}], position: 4000, duration: 300 },
            { id: "eid108", tween: [ "style", "${_L4}", "display", 'block', { fromValue: 'none'}], position: 9700, duration: 0 },
            { id: "eid109", tween: [ "style", "${_L4}", "display", 'none', { fromValue: 'block'}], position: 11300, duration: 0 },
            { id: "eid93", tween: [ "style", "${_L4}", "top", '0px', { fromValue: '-420px'}], position: 9700, duration: 1200, easing: "easeOutBounce" },
            { id: "eid110", tween: [ "style", "${_L5}", "display", 'block', { fromValue: 'none'}], position: 12000, duration: 0 },
            { id: "eid111", tween: [ "style", "${_L5}", "display", 'none', { fromValue: 'block'}], position: 13600, duration: 0 },
            { id: "eid26", tween: [ "style", "${_Rectangle}", "top", '-804px', { fromValue: '0px'}], position: 0, duration: 2000 },
            { id: "eid88", tween: [ "style", "${_blackFade3Copy4}", "display", 'block', { fromValue: 'none'}], position: 9000, duration: 0, easing: "easeOutBounce" },
            { id: "eid89", tween: [ "style", "${_blackFade3Copy4}", "display", 'none', { fromValue: 'block'}], position: 11300, duration: 0, easing: "easeOutBounce" },
            { id: "eid114", tween: [ "style", "${_blackFade3Copy6}", "opacity", '1', { fromValue: '0'}], position: 13600, duration: 1000 },
            { id: "eid115", tween: [ "style", "${_blackFade3Copy6}", "opacity", '0', { fromValue: '1'}], position: 15500, duration: 300 },
            { id: "eid61", tween: [ "style", "${_blackFade3Copy}", "display", 'block', { fromValue: 'none'}], position: 4400, duration: 0, easing: "easeOutBounce" },
            { id: "eid62", tween: [ "style", "${_blackFade3Copy}", "display", 'none', { fromValue: 'block'}], position: 6700, duration: 0, easing: "easeOutBounce" },
            { id: "eid90", tween: [ "style", "${_blackFade3Copy4}", "opacity", '1', { fromValue: '0'}], position: 9000, duration: 1000 },
            { id: "eid91", tween: [ "style", "${_blackFade3Copy4}", "opacity", '0', { fromValue: '1'}], position: 10900, duration: 300 },
            { id: "eid118", tween: [ "style", "${_L6}", "display", 'block', { fromValue: 'none'}], position: 14300, duration: 0 },
            { id: "eid119", tween: [ "style", "${_L6}", "display", 'none', { fromValue: 'block'}], position: 15900, duration: 0 },
            { id: "eid58", tween: [ "style", "${_L1}", "display", 'block', { fromValue: 'none'}], position: 2800, duration: 0, easing: "easeOutBounce" },
            { id: "eid59", tween: [ "style", "${_L1}", "display", 'none', { fromValue: 'block'}], position: 4400, duration: 0, easing: "easeOutBounce" },
            { id: "eid87", tween: [ "style", "${_L3}", "opacity", '0', { fromValue: '1'}], position: 8600, duration: 300 },
            { id: "eid103", tween: [ "style", "${_L5}", "top", '0px', { fromValue: '-420px'}], position: 12000, duration: 1200, easing: "easeOutBounce" },
            { id: "eid96", tween: [ "style", "${_blackFade3Copy5}", "display", 'block', { fromValue: 'none'}], position: 11300, duration: 0, easing: "easeOutBounce" },
            { id: "eid97", tween: [ "style", "${_blackFade3Copy5}", "display", 'none', { fromValue: 'block'}], position: 13600, duration: 0, easing: "easeOutBounce" },
            { id: "eid105", tween: [ "style", "${_L5}", "opacity", '0', { fromValue: '1'}], position: 13200, duration: 300 },
            { id: "eid95", tween: [ "style", "${_L4}", "opacity", '0', { fromValue: '1'}], position: 10900, duration: 300 },
            { id: "eid81", tween: [ "style", "${_Rectangle}", "display", 'none', { fromValue: 'block'}], position: 2000, duration: 0 },
            { id: "eid77", tween: [ "style", "${_blackFade3Copy3}", "display", 'block', { fromValue: 'none'}], position: 6700, duration: 0, easing: "easeOutBounce" },
            { id: "eid78", tween: [ "style", "${_blackFade3Copy3}", "display", 'none', { fromValue: 'block'}], position: 9000, duration: 0, easing: "easeOutBounce" },
            { id: "eid53", tween: [ "style", "${_blackFade3}", "display", 'block', { fromValue: 'none'}], position: 2100, duration: 0, easing: "easeOutBounce" },
            { id: "eid60", tween: [ "style", "${_blackFade3}", "display", 'none', { fromValue: 'block'}], position: 4400, duration: 0, easing: "easeOutBounce" }         ]
      }
   }
},
"Layer1": {
   version: "1.5.0",
   minimumCompatibleVersion: "1.5.0",
   build: "1.5.0.217",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
   dom: [
   {
      id: 'LayerThumb_01',
      type: 'image',
      rect: ['0px','0px','578px','420px','auto','auto'],
      fill: ['rgba(0,0,0,0)',im+'LayerThumb_01.jpg','0px','0px']
   }],
   symbolInstances: [
   ]
   },
   states: {
      "Base State": {
         "${symbolSelector}": [
            ["style", "height", '420px'],
            ["style", "width", '578px']
         ],
         "${_LayerThumb_01}": [
            ["style", "left", '0px'],
            ["style", "top", '0px']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 500,
         autoPlay: true,
         labels: {
            "out": 0,
            "up": 500
         },
         timeline: [
            { id: "eid1", tween: [ "style", "${_LayerThumb_01}", "top", '-10px', { fromValue: '0px'}], position: 0, duration: 500 }         ]
      }
   }
},
"Layer2": {
   version: "1.5.0",
   minimumCompatibleVersion: "1.5.0",
   build: "1.5.0.217",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
   dom: [
   {
      rect: ['0px','0px','437px','420px','auto','auto'],
      id: 'LayerThumb_02',
      type: 'image',
      clip: ['rect(0px 434px 420px 4px)'],
      fill: ['rgba(0,0,0,0)',im+'LayerThumb_02.png','0px','0px']
   }],
   symbolInstances: [
   ]
   },
   states: {
      "Base State": {
         "${_LayerThumb_02}": [
            ["style", "top", '0px'],
            ["style", "left", '0px'],
            ["style", "clip", [0,434,420,4], {valueTemplate:'rect(@@0@@px @@1@@px @@2@@px @@3@@px)'} ]
         ],
         "${symbolSelector}": [
            ["style", "height", '420px'],
            ["style", "width", '437px']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 500,
         autoPlay: true,
         labels: {
            "out": 0,
            "up": 500
         },
         timeline: [
            { id: "eid25", tween: [ "style", "${_LayerThumb_02}", "top", '-10px', { fromValue: '0px'}], position: 0, duration: 500 }         ]
      }
   }
},
"Layer3": {
   version: "1.5.0",
   minimumCompatibleVersion: "1.5.0",
   build: "1.5.0.217",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
   dom: [
   {
      type: 'image',
      id: 'LayerThumb_03',
      rect: ['0px','0px','437px','420px','auto','auto'],
      clip: ['rect(0px 433px 420px 4px)'],
      fill: ['rgba(0,0,0,0)',im+'LayerThumb_03.png','0px','0px']
   }],
   symbolInstances: [
   ]
   },
   states: {
      "Base State": {
         "${symbolSelector}": [
            ["style", "height", '420px'],
            ["style", "width", '437px']
         ],
         "${_LayerThumb_03}": [
            ["style", "top", '0px'],
            ["style", "left", '0px'],
            ["style", "clip", [0,433,420,4], {valueTemplate:'rect(@@0@@px @@1@@px @@2@@px @@3@@px)'} ]
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 500,
         autoPlay: true,
         labels: {
            "out": 0,
            "up": 500
         },
         timeline: [
            { id: "eid24", tween: [ "style", "${_LayerThumb_03}", "top", '-10px', { fromValue: '0px'}], position: 0, duration: 500 }         ]
      }
   }
},
"Layer4": {
   version: "1.5.0",
   minimumCompatibleVersion: "1.5.0",
   build: "1.5.0.217",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
   dom: [
   {
      type: 'image',
      id: 'LayerThumb_04',
      rect: ['0px','0px','436px','420px','auto','auto'],
      clip: ['rect(0px 432px 420px 4px)'],
      fill: ['rgba(0,0,0,0)',im+'LayerThumb_04.png','0px','0px']
   }],
   symbolInstances: [
   ]
   },
   states: {
      "Base State": {
         "${symbolSelector}": [
            ["style", "height", '420px'],
            ["style", "width", '436px']
         ],
         "${_LayerThumb_04}": [
            ["style", "top", '0px'],
            ["style", "left", '0px'],
            ["style", "clip", [0,432,420,4], {valueTemplate:'rect(@@0@@px @@1@@px @@2@@px @@3@@px)'} ]
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 500,
         autoPlay: true,
         labels: {
            "out": 0,
            "up": 500
         },
         timeline: [
            { id: "eid15", tween: [ "style", "${_LayerThumb_04}", "top", '-10px', { fromValue: '0px'}], position: 0, duration: 500 }         ]
      }
   }
},
"Layer5": {
   version: "1.5.0",
   minimumCompatibleVersion: "1.5.0",
   build: "1.5.0.217",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
   dom: [
   {
      type: 'image',
      id: 'LayerThumb_05',
      rect: ['0px','0px','437px','420px','auto','auto'],
      clip: ['rect(0px 433px 420px 3px)'],
      fill: ['rgba(0,0,0,0)',im+'LayerThumb_05.png','0px','0px']
   }],
   symbolInstances: [
   ]
   },
   states: {
      "Base State": {
         "${_LayerThumb_05}": [
            ["style", "top", '0px'],
            ["style", "left", '0px'],
            ["style", "clip", [0,433,420,3], {valueTemplate:'rect(@@0@@px @@1@@px @@2@@px @@3@@px)'} ]
         ],
         "${symbolSelector}": [
            ["style", "height", '420px'],
            ["style", "width", '437px']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 500,
         autoPlay: true,
         labels: {
            "out": 0,
            "up": 500
         },
         timeline: [
            { id: "eid14", tween: [ "style", "${_LayerThumb_05}", "top", '-10px', { fromValue: '0px'}], position: 0, duration: 492 }         ]
      }
   }
},
"Layer6": {
   version: "1.5.0",
   minimumCompatibleVersion: "1.5.0",
   build: "1.5.0.217",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
   dom: [
   {
      type: 'image',
      id: 'LayerThumb_06',
      rect: ['0px','0px','555px','420px','auto','auto'],
      clip: ['rect(0px 555px 420px 3px)'],
      fill: ['rgba(0,0,0,0)',im+'LayerThumb_06.png','0px','0px']
   }],
   symbolInstances: [
   ]
   },
   states: {
      "Base State": {
         "${symbolSelector}": [
            ["style", "height", '420px'],
            ["style", "width", '555px']
         ],
         "${_LayerThumb_06}": [
            ["style", "top", '0px'],
            ["style", "left", '0px'],
            ["style", "clip", [0,555,420,3], {valueTemplate:'rect(@@0@@px @@1@@px @@2@@px @@3@@px)'} ]
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 500,
         autoPlay: true,
         labels: {
            "out": 0,
            "up": 500
         },
         timeline: [
            { id: "eid13", tween: [ "style", "${_LayerThumb_06}", "top", '-10px', { fromValue: '0px'}], position: 0, duration: 500 }         ]
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
})(jQuery, AdobeEdge, "EDGE-30039142");
