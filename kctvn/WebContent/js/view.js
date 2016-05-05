var $ = {
	topLayers : [],
	getJsonObj : function(jsonStr) {
		return eval(jsonStr);
	},	
	setParam : function(obj) {
		top.setParam(obj);
	},
	getParam : function() {
		return top.getParam();
	},
	clearParam : function() {
		top.clearParam();
	}
	
};
var $H = {
	foward : function(url, paramObj) {
		if(paramObj != null) {
			$.setParam(paramObj);
		}
		top.reqPage(url);
	},
	replace : function(url) {		
		top.reqReplace(url);
	},
	reload : function() {
		top.reqReload();
	},
	replaceHome : function(url) {
		top.reqReplaceHome(url);
	},
	home : function() {
		$.setParam("home");
		top.reqHome();
	},
	back : function(paramObj) {
		if(paramObj != null) {
			$.setParam(paramObj);
		}
		top.reqBack();
	}	
};
var $P = {
	show : function(url, paramObj) {
		if(paramObj != null) {
			$.setParam(paramObj);
		}
		top.setActiveKeyEvent(false);
		top.showPopup(url);
	},
	hide : function() {
		top.hidePopup();
	},
	sendMsg : function(obj) {
		top.sendPopupMsg(obj);
	}	 
};

{
	window.onload = function() {
		if(typeof init != "undefined") {
			var rCode = init($.getParam());
			$.clearParam();
			if(rCode != "100") {
				top.setActiveKeyEvent(false);
				if(rCode == "501"){
					$P.show("/jeju/syspopup.do", {title:"알림", msg:"현재 등록되어 있는<br>정보가 없습니다."});
				}else{
					$P.show("/jeju/syspopup.do", {title:"서비스오류("+rCode+")", msg:"서비스 오류입니다<br>잠시 후 다시 이용해 주세요."});
				}
				top.setActiveKeyEvent(true);
				if(top.reqView){
					top.removeView(top.reqView);
					top.reqView=null;
				}
			}else{			
				if(self != top){
					if(top.popup == null) {
						top.changePage();
					}else{
						top.hideLoading();
						top.setActiveKeyEvent(true);
					}
				}
			}
		}
	};	
}
document.onmousedown = function() {return false;};
var $K = {
	evtEnter : null,
	evtLeft : null,
	evtRight : null,
	evtUp : null,
	evtDown : null,
	evtBack : null,
	evtRed : null,
	evtGreen : null,
	evtYellow : null,
	evtBlue : null,
	enter : function(evt) {this.evtEnter = evt;},
	left : function(evt) {this.evtLeft = evt;},
	right : function(evt) {this.evtRight = evt;},
	up : function(evt) {this.evtUp = evt;},
	down : function(evt) {this.evtDown = evt;},
	back : function(evt) {this.evtBack = evt;},
	red : function(evt) {this.evtRed = evt;},
	green : function(evt) {this.evtGreen = evt;},
	yellow : function(evt) {this.evtYellow = evt;},
	blue : function(evt) {this.evtBlue = evt;}	
};
function action(keyCode) {
	switch (keyCode) {
		case 13 : if($K.evtEnter) $K.evtEnter(); break;
		case 37 : if($K.evtLeft) $K.evtLeft(); break;
		case 39 : if($K.evtRight) $K.evtRight(); break;
		case 38 : if($K.evtUp) $K.evtUp(); break;
		case 40 : if($K.evtDown) $K.evtDown(); break;
		case 607 : case 115 : case 16 : if($K.evtBack) $K.evtBack(); break;
		case 403 : case 113 : case 82 : if($K.evtRed) $K.evtRed(); break;
		//case 404 : case 120 : case 71 : if($K.evtGreen) $K.evtGreen(); break;
		//case 405 : case 119 : case 89 : if($K.evtYellow) $K.evtYellow(); break;
		case 405 : case 119 : case 89 : if($K.evtGreen) $K.evtGreen(); break;
		case 404 : case 120 : case 71 : if($K.evtYellow) $K.evtYellow(); break;
		case 406 : case 123 : case 66 : if($K.evtBlue) $K.evtBlue(); break;
		
	}
}