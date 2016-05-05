var viewer = [];
var popup = null;
var data = null;
var fWidth = 960;
var fHeight = 540;
var fLeft = 0;
var fTop = 0;
var activeKeyEvent = true;
var param = null;

var activeView = null; //현재 화면
var reqView = null; //요청 화면
var reqType = -1;	//요청 타입
var REQUEST_PAGE=0;
var REQUEST_HOME_REPLACE=1;
var REQUEST_RELOAD=2;
var REQUEST_REPLACE=3;
var REQUEST_BACK=4;
var REQUEST_HOME=5;

function setActiveKeyEvent(state) {
	activeKeyEvent = state;
}
function getActiveKeyEvent(state) {
	return activeKeyEvent;
}

function changePage() {	
	hideLoading();
	reqView.style.visibility = "visible";
	setTimeout(function(){
		if(activeView){
			activeView.style.visibility = "hidden";
		}

		switch(reqType){
		case REQUEST_PAGE:		
			activeView = reqView;
			break;
		case REQUEST_RELOAD:
		case REQUEST_REPLACE:
		case REQUEST_BACK:
			if(activeView){
				removeView(activeView);
			}
			activeView = reqView;
			break;
		case REQUEST_HOME_REPLACE:
			viewer.reverse(); //반전
			while(viewer.length > 1){
				document.body.removeChild(viewer.pop());
			}
			activeView = reqView;
			break;
		case REQUEST_HOME:
			while(viewer.length > 1){
				document.body.removeChild(viewer.pop());
			}
			activeView = reqView;
			break;
		}
		reqView=null;
		setActiveKeyEvent(true);
	}, 200);
}

function reqPage(url, paramObj) {
	setActiveKeyEvent(false);
	showLoading();
	if(activeView){
		getWindow(activeView).save();
	}

	reqType = REQUEST_PAGE;
	reqView = createView(url);
	
	if(reqView){
		loadView(reqView);
	}
}

function reqReplaceHome(url) {	
	setActiveKeyEvent(false);
	showLoading();
	if(activeView){
		getWindow(activeView).save();
	}

	reqType = REQUEST_HOME_REPLACE;
	reqView = createView(url);
	
	if(reqView){
		loadView(reqView);
	}
}
function reqReplace(url) {	
	setActiveKeyEvent(false);
	showLoading();
	if(activeView){
		getWindow(activeView).save();
	}

	reqType = REQUEST_REPLACE;
	reqView = createView(url);
	
	if(reqView){
		loadView(reqView);
	}
}
function reqReload() {
	setActiveKeyEvent(false);
	showLoading();
	if(activeView){
		getWindow(activeView).save();
	}
	
	reqType=REQUEST_RELOAD;
	reqView=activeView.cloneNode(false);
	reqView.style.display="none";
	
	if(reqView){
		loadView(reqView);
	}
}

function reqBack() {
	setActiveKeyEvent(false);
	showLoading();
	if(activeView){
		getWindow(activeView).save();
	}
	reqType=REQUEST_BACK;
	reqView = getPrevView();

	if(reqView){
		getWindow(reqView).load(getParam());
		changePage();
	}
	//setActiveKeyEvent(true);
}

function reqHome() {
	setActiveKeyEvent(false);
	if(activeView){
		getWindow(activeView).save();
	}
	
	reqType=REQUEST_HOME;
	reqView = viewer[0];
	
	if(reqView){
		getWindow(reqView).load(getParam());
		changePage();
	}
	//setActiveKeyEvent(true);
}

function loadView(view){
	if(view){
		viewer.push(view);
		document.body.appendChild(view);
	}
}

function removeView(view){
	if(view){
		for ( var i = 0; i < viewer.length; i++) {
			if(viewer[i] == view){
				viewer.splice(i, 1);
				break;
			}
		}
		document.body.removeChild(view);
	}
}

function showPopup(url) {
	hidePopup();
	popup = createPopup(url);
	document.body.appendChild(popup);
}

function hidePopup() {
	if(popup != null) {
		document.body.removeChild(popup);
		popup = null;
	}
}

function sendPopupMsg(obj) {
	parent.getWindow(parent.activeView).$rpm(obj);
}

function getLastView(){
	if(viewer.length > 0) {		
		return viewer[viewer.length - 1];
	} else {
		return null;
	}
}

function getPrevView(){
	if(viewer.length > 1) {
		return viewer[viewer.length - 2];
	} else {
		return null;
	}
}

function getWindow(iframe) {
	if(iframe){
		if(iframe.contentWindow) {
			return iframe.contentWindow;
		}else if(iframe.contentDocument) {
			return iframe.contentDocument.defaultView;
		} else {
			return null;
		}
	}else{
		return null;
	}
}

//메뉴 위치&크기, 페이지 위치&크기
var Rect = {'menu':{x:0,y:0,w:720,h:480},'page':{x:0,y:0,w:720,h:480}};

function createView(url) {
	if(viewer.length==0){
		return createView_menu(url);
	}else{
		return createView_page(url);
	}
}

function createView_menu(url){
	var view = document.createElement("iframe");
	view.src = url;
	view.scrolling = "no";
	view.style.border = "0px";
	view.style.position = "absolute";
	view.style.left = Rect.menu.x + "px";
	view.style.top = Rect.menu.y + "px";
	view.style.width = Rect.menu.w + "px";
	view.style.height = Rect.menu.h + "px";
	view.style.visibility = "hidden";
	return view;
}
function createView_page(url){
	var view = document.createElement("iframe");
	view.src = url;
	view.scrolling = "no";
	view.style.border = "0px";
	view.style.position = "absolute";
	view.style.left = Rect.page.x + "px";
	view.style.top = Rect.page.y + "px";
	view.style.width = Rect.page.w + "px";
	view.style.height = Rect.page.h + "px";
	view.style.visibility = "hidden";
	return view;
}

function createPopup(url) {
	var popup = document.createElement("iframe");
	popup.src = url;
	popup.scrolling = "no";
	popup.style.width = fWidth + "px";
	popup.style.height = fHeight + "px";
	popup.style.border = "0px";
	popup.style.position = "absolute";
	popup.style.left = fLeft + "px";
	popup.style.top = fTop + "px";
	return popup;
}

document.onkeydown = function(e) {
	if(!getActiveKeyEvent()){
		return;
	}
	var evtObj = window.event ? window.event : e;
	var keyCode = evtObj.keyCode;

	if(keyCode == 116 || keyCode == 8){ // F5, back
		if(evtObj.preventDefault) {
			evtObj.preventDefault();
		} else {
			evtObj.keyCode = 0;
			evtObj.cancelBubble = true;
			evtObj.returnValue = false;
		}
		return false;
	}
	
	if(popup == null) {
		if (getWindow(activeView)) {
			getWindow(activeView).action(keyCode);
		}
	} else {
		if(getWindow(popup)){
			getWindow(popup).action(keyCode);
		}
	}
};

function setMainPage(url) {
	reqType=REQUEST_PAGE;
	reqView = createView(url);
	loadView(reqView);
}

function setLoading(url) {
	var loading = document.createElement("img");
	loading.src = url;
	loading.id = "loading";
	loading.style.width = fWidth + "px";
	loading.style.height = fHeight + "px";
	loading.style.border = "0px";
	loading.style.position = "absolute";
	loading.style.zIndex = 100;
	loading.style.left = fLeft + "px";
	loading.style.top = fTop + "px";
	loading.style.display = "none";
	document.body.appendChild(loading);
}

function setFrame(left, top, width, height) {
	fLeft = left;
	fTop = top;
	fWidth = width;
	fHeight = height;
	if(document.getElementById("loading") != null) {
		document.getElementById("loading").style.left = fLeft + "px";
		document.getElementById("loading").style.top = fTop + "px";
		document.getElementById("loading").style.width = fWidth + "px";
		document.getElementById("loading").style.height = fHeight + "px";
	}
}

function showLoading() {
	if(document.getElementById("loading") != null){
		document.getElementById("loading").style.display = "block";
	}
}
function hideLoading() {
	if(document.getElementById("loading") != null){
		document.getElementById("loading").style.display = "none";
	}
}

function setParam(obj) {
	param = obj;
}

function getParam() {
	return param;
}

function clearParam() {
	param = null;
}
{
	window.onload = function() {
		init();
	};	
}
document.onmousedown = function() {return false;};