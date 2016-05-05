<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp"%>
<script type="text/javascript">
var menuJson = [
{
	id : 1,
	title : "항공",
	pid : 0,
	fcsImg : "${ctxRoot}/images/menu/m_fcs01.png",
	selImg : "${ctxRoot}/images/menu/m_sel01.png",
	icon : "",
	link : ""
},
{
	id : 2,
	title : "날씨",
	pid : 0,
	fcsImg : "${ctxRoot}/images/menu/m_fcs02.png",
	selImg : "${ctxRoot}/images/menu/m_sel02.png",
	icon : "",
	link : ""
},
{
	id : 3,
	title : "경조사",
	pid : 0,
	fcsImg : "${ctxRoot}/images/menu/m_fcs03.png",
	selImg : "${ctxRoot}/images/menu/m_sel03.png",
	icon : "",
	link : ""
},
{
	id : 4,
	title : "채용",
	pid : 0,
	fcsImg : "${ctxRoot}/images/menu/m_fcs04.png",
	selImg : "${ctxRoot}/images/menu/m_sel04.png",
	icon : "",
	link : "${ctxRoot}/job.do"
},
{
	id : 5,
	title : "정보N",
	pid : 0,
	fcsImg : "${ctxRoot}/images/menu/m_fcs05.png",
	selImg : "${ctxRoot}/images/menu/m_sel05.png",
	icon : "",
	link : ""
},
{
	id : 11,
	title : "국내선 출발",
	pid : 1,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "${ctxRoot}/images/menu/sm_icon_start.png",
	link : "${ctxRoot}/airline.do?line=C&io=O"
},
{
	id : 12,
	title : "국내선 도착",
	pid : 1,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "${ctxRoot}/images/menu/sm_icon_arrival.png",
	link : "${ctxRoot}/airline.do?line=C&io=I"
},
{
	id : 13,
	title : "국제선 출발",
	pid : 1,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "${ctxRoot}/images/menu/sm_icon_start.png",
	link : "${ctxRoot}/airline.do?line=I&io=O"
},
{
	id : 14,
	title : "국제선 도착",
	pid : 1,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "${ctxRoot}/images/menu/sm_icon_arrival.png",
	link : "${ctxRoot}/airline.do?line=I&io=I"
},
{
	id : 15,
	title : "현재 공항날씨",
	pid : 1,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "${ctxRoot}/images/menu/sm_icon_weather.png",
	link : "${ctxRoot}/airlineweather.do"
},
{
	id : 21,
	title : "기상특보",
	pid : 2,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/special.do"
},
{
	id : 22,
	title : "육상",
	pid : 2,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/land.do"
},
{
	id : 23,
	title : "해상",
	pid : 2,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/sea.do"
},
{
	id : 24,
	title : "도서",
	pid : 2,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/city.do"
},
{
	id : 25,
	title : "올레길날씨",
	pid : 2,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/olle.do"
},
{
	id : 26,
	title : "주간날씨",
	pid : 2,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/weekly.do"
},
{
	id : 27,
	title : "현재전국날씨",
	pid : 2,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/national.do"
},
{
	id : 28,
	title : "전국해상",
	pid : 2,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/nationalsea.do"
},
{
	id : 31,
	title : "결혼",
	pid : 3,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/marry.do"
},
{
	id : 32,
	title : "부고",
	pid : 3,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/death.do"
},
/* {
	id : 51,
	title : "모임소식",
	pid : 5,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/club.do"
}, */
/*{
	id : 52,
	title : "제주알림마당",
	pid : 5,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/town.do"
},*/
{
	id : 53,
	title : "문화&행사",
	pid : 5,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/event.do"
},
{
	id : 54,
	title : "추천 KCTV VOD",
	pid : 5,
	fcsImg : "${ctxRoot}/images/menu/sm_fcs.png",
	selImg : "",
	icon : "",
	link : "${ctxRoot}/vod.do"
}
];

$D.create("img").setPath("${ctxRoot}/images/menu/m_bg.png");
$D.create("img").setPath("${ctxRoot}/images/menu/sm_bg.png");
for(var i=0; i<menuJson.length; i++){
	if(menuJson[i].fcsImg != ""){
		$D.create("img").setPath(menuJson[i].fcsImg);
	}
	if(menuJson[i].selImg != ""){
		$D.create("img").setPath(menuJson[i].selImg);
	}
	if(menuJson[i].icon != ""){
		$D.create("img").setPath(menuJson[i].icon);
	}
}

var mainMenu = null;
var subMenu = null;
var mainMenuList = null;
var subMenuList = null;
function init() {
	if ("${rCode}" == "100") {
		mainMenuList = getMenuList(menuJson, 0);
		drawMainMenu();
		closeAppEvent();
	}
	return "${rCode}";
}
function save() {}
function load(param) {
	closeAppEvent();
	if(param == "home"){
		celarSubMenu();
		mainMenu.changeFocus(mainMenuList[mainMenu.getIndex()].fcsImg);
	}
}
function closeAppEvent() {
	try {
		stbRequest.NotifyStatus(48);
	} catch(e) {
	}	
}

function drawMainMenu() {	
	$D.create("img").setPath("${ctxRoot}/images/menu/m_bg.png").setPos(0, 0).draw();
	mainMenu = new NaviEvent();
	for ( var i = 0; i < mainMenuList.length; i++) {
		var on = $D.create("img").setPath(mainMenuList[i].fcsImg).setPos(0, 52 + (i * 72));
		var off = $D.create("div").setPos(0, 52 + (i * 72));
		mainMenu.addItem(new NaviItem(on, null), new NaviItem(off, null));
	}
	mainMenu.setRolling(true);
	mainMenu.start();
}

function drawSubMenu() {
	$D.create("img").setId("subBg").setPath("${ctxRoot}/images/menu/sm_bg.png").setPos(143, 66).draw();
	subMenuList = getMenuList(menuJson, mainMenuList[mainMenu.getIndex()].id);
	if(subMenuList.length == 0) return;
	subMenu = new NaviEvent();
	for ( var i = 0; i < subMenuList.length; i++) {
		var on = $D.create("div").setPos(136, 64 + (i * 43)).setSize(178, 75).setDepth(2);
		$D.create("img").setPath(subMenuList[i].fcsImg).setPos(0, 0).draw(on);
		if(subMenuList[i].icon != "") {
			$D.create("img").setPath(subMenuList[i].icon).setPos(21, 26).draw(on);
			$D.create("font").setText(subMenuList[i].title).setPos(48, 31).setFontSize(17).setColor("#f0f0f0").setSize(110,75).setAlign("center").draw(on);
		}else{
			$D.create("font").setText(subMenuList[i].title).setPos(-1, 31).setFontSize(17).setColor("#f0f0f0").setSize(178,75).setAlign("center").draw(on);
		}
		
		var off = $D.create("div").setPos(136, 64 + (i * 43)).setSize(178, 75).setDepth(1);
		if(subMenuList[i].icon != "") {
			$D.create("img").setPath(subMenuList[i].icon).setPos(21, 26).draw(off);
			$D.create("font").setText(subMenuList[i].title).setPos(48, 31).setFontSize(17).setColor("#8c8c8c").setSize(110,75).setAlign("center").draw(off);
		}else{
			$D.create("font").setText(subMenuList[i].title).setPos(-1, 31).setFontSize(17).setColor("#8c8c8c").setSize(178,75).setAlign("center").draw(off);
		}
		subMenu.addItem(new NaviItem(on, null), new NaviItem(off, null));
	}
	subMenu.setRolling(true);
	subMenu.start();
}

function celarSubMenu() {
	if(subMenu != null) {
		document.body.removeChild($D.get("subBg"));
		subMenu.clear();
		subMenu = null;
		subMenuList = null;
	}
}

function getMenuList(jsonList, id) {
	var result = [];
	for (var i = 0; i < jsonList.length; i++) {
		if(jsonList[i].pid == id) {
			result[result.length] = jsonList[i];
		}
	}
	return result;
}

$K.left(function() {
	celarSubMenu();
	mainMenu.changeFocus(mainMenuList[mainMenu.getIndex()].fcsImg);
	
});
$K.right(function() {
	if(subMenu != null) {
		var menuObj = subMenuList[subMenu.getIndex()];
		if(menuObj.link != "") $H.foward(menuObj.link, menuObj);
	} else {
		var menuObj = mainMenuList[mainMenu.getIndex()];
		if(menuObj.link != "") {
			$H.foward(menuObj.link, menuObj);
		} else {
			drawSubMenu();
			mainMenu.changeFocus(mainMenuList[mainMenu.getIndex()].selImg);
		}
	}
});
$K.enter(function() {
	$K.evtRight();
});
$K.back(function() {
	$K.evtLeft();
});
$K.up(function() {
	if(subMenu == null)
		mainMenu.selectPrevItem();
	else 
		subMenu.selectPrevItem();
});
$K.down(function() {
	if(subMenu == null)
		mainMenu.selectNextItem();
	else 
		subMenu.selectNextItem();
});
</script>
</head>
<body>
</body>
</html>
