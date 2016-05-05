/***********************
* Adobe Edge Animate Composition Actions
*
* Edit this file with caution, being careful to preserve 
* function signatures and comments starting with 'Edge' to maintain the 
* ability to interact with these actions from within Adobe Edge Animate
*
***********************/
(function($, Edge, compId){
var Composition = Edge.Composition, Symbol = Edge.Symbol; // aliases for commonly used Edge classes

   //Edge symbol: 'stage'
   (function(symbolName) {
      
      
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 2000, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_Layer1}", "click", function(sym, e) {
         // play the timeline from the given position (ms or label)
         sym.play("L1");

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 4000, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_Layer2}", "click", function(sym, e) {
         // play the timeline from the given position (ms or label)
         sym.play("L2");
         

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 6300, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 4300, function(sym, e) {
         // stop the timeline at the given position (ms or label)
         sym.stop("Start");

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_L1}", "click", function(sym, e) {
         sym.play();

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 6600, function(sym, e) {
         // stop the timeline at the given position (ms or label)
         sym.stop("Start");

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_L2}", "click", function(sym, e) {
         sym.play();
         

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 8900, function(sym, e) {
         // stop the timeline at the given position (ms or label)
         sym.stop("Start");

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_L3}", "click", function(sym, e) {
         // insert code for mouse click here
         sym.play();

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_Layer3}", "click", function(sym, e) {
         // play the timeline from the given position (ms or label)
         sym.play("L3");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_Layer4}", "click", function(sym, e) {
         // play the timeline from the given position (ms or label)
         sym.play("L4");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_Layer5}", "click", function(sym, e) {
         // play the timeline from the given position (ms or label)
         sym.play("L5");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_Layer6}", "click", function(sym, e) {
         // play the timeline from the given position (ms or label)
         sym.play("L6");
         

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 11200, function(sym, e) {
         // stop the timeline at the given position (ms or label)
         sym.stop("Start");

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 8600, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 10900, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 13200, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 13500, function(sym, e) {
         // stop the timeline at the given position (ms or label)
         sym.stop("Start");

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_L4}", "click", function(sym, e) {
         sym.play();
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_L5}", "click", function(sym, e) {
         sym.play();
         

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 15500, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 15800, function(sym, e) {
         // stop the timeline at the given position (ms or label)
         sym.stop("Start");

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_L6}", "click", function(sym, e) {
         sym.play();
         

      });
      //Edge binding end

   })("stage");
   //Edge symbol end:'stage'

   //=========================================================
   
   //Edge symbol: 'Layer1'
   (function(symbolName) {   
   
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 0, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 500, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_01}", "mouseover", function(sym, e) {
         sym.play();
         // play the timeline from the given position (ms or label)
         sym.play("up");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_01}", "mouseout", function(sym, e) {
         // stop the timeline at the given position (ms or label)
         sym.stop("out");

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_01}", "click", function(sym, e) {
         sym.play();

      });
      //Edge binding end

      

   })("Layer1");
   //Edge symbol end:'Layer1'

   //=========================================================
   
   //Edge symbol: 'Layer2'
   (function(symbolName) {   
   
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 0, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 500, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_02}", "mouseover", function(sym, e) {
         sym.play();
         // play the timeline from the given position (ms or label)
         sym.play("up");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_02}", "mouseout", function(sym, e) {
         // stop the timeline at the given position (ms or label)
         sym.stop("out");
         

      });
      //Edge binding end

   })("Layer2");
   //Edge symbol end:'Layer2'

   //=========================================================
   
   //Edge symbol: 'Layer'
   (function(symbolName) {   
   
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 0, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 500, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_03}", "mouseout", function(sym, e) {
         // stop the timeline at the given position (ms or label)
         sym.stop("out");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_03}", "mouseover", function(sym, e) {
         sym.play();
         // play the timeline from the given position (ms or label)
         sym.play("up");
         

      });
      //Edge binding end

   })("Layer3");
   //Edge symbol end:'Layer3'

   //=========================================================
   
   //Edge symbol: 'Layer4'
   (function(symbolName) {   
   
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 0, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 500, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_04}", "mouseover", function(sym, e) {
         sym.play();
         // play the timeline from the given position (ms or label)
         sym.play("up");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_04}", "mouseout", function(sym, e) {
         // stop the timeline at the given position (ms or label)
         sym.stop("out");
         

      });
      //Edge binding end

   })("Layer4");
   //Edge symbol end:'Layer4'

   //=========================================================
   
   //Edge symbol: 'Layer5'
   (function(symbolName) {   
   
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 0, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 500, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_05}", "mouseover", function(sym, e) {
         sym.play();
         // play the timeline from the given position (ms or label)
         sym.play("up");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_05}", "mouseout", function(sym, e) {
         // stop the timeline at the given position (ms or label)
         sym.stop("out");
         

      });
      //Edge binding end

   })("Layer5");
   //Edge symbol end:'Layer5'

   //=========================================================
   
   //Edge symbol: 'Layer6'
   (function(symbolName) {   
   
      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 0, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindTriggerAction(compId, symbolName, "Default Timeline", 500, function(sym, e) {
         sym.stop();

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_06}", "mouseover", function(sym, e) {
         sym.play();
         // play the timeline from the given position (ms or label)
         sym.play("up");
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_LayerThumb_06}", "mouseout", function(sym, e) {
         // stop the timeline at the given position (ms or label)
         sym.stop("out");
         

      });
      //Edge binding end

   })("Layer6");
   //Edge symbol end:'Layer6'

})(jQuery, AdobeEdge, "EDGE-30039142");