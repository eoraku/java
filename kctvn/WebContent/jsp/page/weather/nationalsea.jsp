<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
 <!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp" %>
<script type='text/javascript'>
var obj = $.getJsonObj('${result}');
if(obj.length != 0 && obj != ""){
	$D.create("img").setPath("${imgRoot}/weather/04-4_bg.png");
	$D.create("img").setPath("${imgRoot}/common/st_02.png");
	for (var i = 0; i < obj.length; i++) {
		$D.create("img").setPath("${imgRoot}/weather/04-2_map_fcs.png");		
		$D.create("img").setPath("${imgRoot}/common/w_icon_m/" + obj[i].WN_RAINF + obj[i].WN_FORECAST+".png");
		$D.create("img").setPath("${imgRoot}/weather/04-2_map_nrml.png");	
		$D.create("img").setPath("${imgRoot}/common/w_icon_m/" + obj[i].WN_RAINF + obj[i].WN_FORECAST+".png");
	}
}
var direction = {"S":"남","SSE":"남남동","SSW":"남남서","SE":"남동","SW":"남서","E":"동","ESE":"동남동","ENE":"동북동","N":"북","NE":"북동","NNE":"북북동","NNW":"북북서","NW":"북서","W":"서","WSW":"서남서","WNW":"서북서"};

var current = 0;
var total = obj.length;

function init(){
	if ("${rCode}" == "100") {
		if(obj.length == 0 || obj==""){
			return "501";
		}
		drawBg();
		setArea();	
		drawColorKey();
	}
	return "${rCode}";
}

function drawBg(){
	$D.create("img").setPos(0,0).setPath("${imgRoot}/weather/04-4_bg.png").draw();
	//$D.create("img").setPos(44,25).setPath("${imgRoot}/common/st_02.png").draw();
	//$D.create("font").setPos(78,30).setFontSize(18).setColor("#0e3c5d").setText("날씨 | 전국해상 예보").draw();	
	var area_name = $D.create("font").setPos(47, 69).setSize(626, 42).setId("area_name").setAlign("center").setFontSize(20).setColor("#f0f0f0").setText(obj[current].RC_NAME).draw(); //상단 도시이름 영영지정
}

function areaName(){
	$D.get("area_name").setText(obj[current].RC_NAME);
}

function setArea(){	
	menu = new NaviEvent();
	for (var i = 0; i < obj.length; i++) {
		var on = $D.create("div").setPos(obj[i].RC_X,obj[i].RC_Y).setSize(620, 280).setDepth(2);
		$D.create("img").setPos(0,0).setPath("${imgRoot}/weather/04-2_map_fcs.png").draw(on);		
		$D.create("img").setPos(13,7).setSize(39,34).setPath("${imgRoot}/common/w_icon_m/" + obj[i].WN_RAINF + obj[i].WN_FORECAST+".png").draw(on);
		$D.create("font").setId("areaname").setPos(57,15).setSize(130,22).setFontSize(16).setColor("#fff566").setText(obj[i].RC_NAME).draw(on);
		$D.create("font").setId("areainfo1").setAlign("left").setPos(57,41).setSize(120,22).setFontSize(15).setColor("#f0f0f0").setText(direction[obj[i].WN_WINDA] + "-" + direction[obj[i].WN_WINDB]).draw(on);
		$D.create("font").setId("areainfo2").setAlign("left").setPos(57,60).setSize(120,22).setFontSize(15).setColor("#f0f0f0").setText("풍속  " + obj[i].WN_WSPEED + "m").draw(on);
		$D.create("font").setId("areainfo3").setAlign("left").setPos(57,79).setSize(120,22).setFontSize(15).setColor("#f0f0f0").setText("파고 " + obj[i].WN_WHEIGHT + "m").draw(on);
		
		var off = $D.create("div").setPos(obj[i].RC_X,obj[i].RC_Y).setSize(720, 434).setDepth(1);		
		$D.create("img").setPos(0,0).setPath("${imgRoot}/weather/04-2_map_nrml.png").draw(off);	
		$D.create("img").setPos(13,7).setSize(39,34).setPath("${imgRoot}/common/w_icon_m/" + obj[i].WN_RAINF + obj[i].WN_FORECAST+".png").draw(off);
		$D.create("font").setId("areaname").setPos(57,15).setSize(120,22).setFontSize(16).setColor("#205879").setText(obj[i].RC_NAME).draw(off);
		$D.create("font").setId("areainfo1").setAlign("left").setPos(57,41).setSize(120,22).setFontSize(15).setColor("#464646").setText(direction[obj[i].WN_WINDA] + "-" + direction[obj[i].WN_WINDB]).draw(off);
		$D.create("font").setId("areainfo2").setAlign("left").setPos(57,60).setSize(120,22).setFontSize(15).setColor("#464646").setText("풍속  " + obj[i].WN_WSPEED + "m").draw(off);
		$D.create("font").setId("areainfo3").setAlign("left").setPos(57,79).setSize(120,22).setFontSize(15).setColor("#464646").setText("파고 " + obj[i].WN_WHEIGHT + "m").draw(off);
		menu.addItem(new NaviItem(on, null), new NaviItem(off, null));
	}
	menu.setRolling(true);
	menu.start();
}

function drawColorKey() {
	ColorKeyDrawer.draw([[ColorKeyDrawer.OK, "상세예보"],[ColorKeyDrawer.YELLOW, "이전지역"], [ColorKeyDrawer.GREEN, "다음지역"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
}

function save(){}
function load(pageIdx){
	current = pageIdx;
	$D.get("area_name").setText(obj[current].RC_NAME);
	menu.setFocus(current);
}

function prevPage(){
	current -= 1;
  	if(current < 0) current = total -1 ;
  	areaName();
}
function nextPage(){
	current += 1;
	if(current >= total) current = 0 ;
	areaName();
}

$K.enter(function(){
	var param={};
	param.title = obj[menu.getIndex()].RC_NAME;
	param.idx = menu.getIndex();
	param.list = obj;
	$H.foward("${ctxRoot}/nationalseadetail.do?wn_region=" + obj[menu.getIndex()].WN_REGION, param);
});

$K.left(function(){
	menu.selectPrevItem();	
	prevPage();	
});
$K.right(function(){
	menu.selectNextItem();
	nextPage();
});
$K.back(function(){
	$H.back();
});
$K.blue(function(){
	$H.home();
});
$K.yellow(function(){
	menu.selectPrevItem();
	prevPage();
});
$K.green(function(){
	menu.selectNextItem();
	nextPage();
});
</script>
</head>
<body>
<!-- ***** insert HTML ***** -->
</body>
</html>
