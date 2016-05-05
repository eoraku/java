<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
 <!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp" %>
<script type='text/javascript'>
var obj = $.getJsonObj('${result}');
var current = 0;
var total = obj.length;

if(obj.length != 0 && obj != ""){
	$D.create("img").setPath("${imgRoot}/weather/04-3_bg.png");
	$D.create("img").setPath("${imgRoot}/common/st_02.png");
	for ( var i = 0; i < obj.length; i++) {
		$D.create("img").setPath("${imgRoot}/weather/" + obj[i].W3_X + "_" + obj[i].W3_Y + "_fcs.png");
		$D.create("img").setPath("${imgRoot}/weather/04-3_map_fcs.png");		
		$D.create("img").setPath("${imgRoot}/common/w_icon_m/" + obj[i].W3_PTY + obj[i].W3_SKY+".png");
		$D.create("img").setPath("${imgRoot}/weather/04-3_map_nrml.png");	
		$D.create("img").setPath("${imgRoot}/common/w_icon_m/" + obj[i].W3_PTY + obj[i].W3_SKY+".png");
	}
}
function init(){
	if ("${rCode}" == "100") {
		//$D.create("img").setSize(720, 434).setPos(0, 0).setPath("${serverRoot}/nothing/island.png").draw();
		if(obj.length == 0 || obj==""){
			return "501";
		}
		drawBg();
		setArea();
		//areaName();
		drawColorKey();
	}
	return "${rCode}";
}
function drawBg(){
	$D.create("img").setPos(0,0).setPath("${imgRoot}/weather/04-3_bg.png").draw();
	//$D.create("img").setPos(44,25).setPath("${imgRoot}/common/st_02.png").draw();
	//$D.create("font").setPos(78,30).setFontSize(18).setColor("#0e3c5d").setText("날씨 | 도서 예보").draw();
//	var fcs_bg = $D.create("img").setId("fcs_bg").setPos(0,0).draw();
//	var area_name = $D.create("font").setPos(73,69).setSize(575,20).setId("area_name").setAlign("center").setFontSize(20).setColor("#f0f0f0").setBold(true).draw(); //상단 도시이름 영영지정 
}
/*
function areaName(){
	$D.get("area_name").setText(obj[current].RD_NAME);
}
*/
function setArea(){	
	menu = new NaviEvent();
	for ( var i = 0; i < obj.length; i++) {
		var x = 0;
		x += parseInt(obj[i].RD_SCREEN_X);
		var y = 0;
		y += parseInt(obj[i].RD_SCREEN_Y);
		var on = $D.create("div").setPos(0,0).setSize(720, 434).setDepth(2);
		$D.create("img").setPos(0,0).setPath("${imgRoot}/weather/" + obj[i].W3_X + "_" + obj[i].W3_Y + "_fcs.png").draw(on);
		$D.create("font").setPos(72,69).setSize(565,20).setAlign("center").setText(obj[i].RD_NAME).setFontSize(20).setColor("#f0f0f0").draw(on);
		$D.create("img").setPos(obj[i].RD_SCREEN_X,obj[i].RD_SCREEN_Y).setPath("${imgRoot}/weather/04-3_map_fcs.png").draw(on);		
		$D.create("img").setPos(x+6,y+6).setSize(39,34).setPath("${imgRoot}/common/w_icon_m/" + obj[i].W3_PTY + obj[i].W3_SKY+".png").draw(on);
		$D.create("font").setId("icon_name").setAlign("center").setPos(x+46,y+17).setSize(50,22).setFontSize(15).setColor("#fff566").setBold(true).setText(obj[i].RD_NAME).draw(on);

		var off = $D.create("div").setPos(0,0).setSize(720, 434).setDepth(1);		
		$D.create("img").setPos(obj[i].RD_SCREEN_X,obj[i].RD_SCREEN_Y).setPath("${imgRoot}/weather/04-3_map_nrml.png").draw(off);	
		$D.create("img").setPos(x+6,y+6).setSize(39,34).setPath("${imgRoot}/common/w_icon_m/" + obj[i].W3_PTY + obj[i].W3_SKY+".png").draw(off);
		$D.create("font").setId("icon_name").setAlign("center").setPos(x+46,y+17).setSize(50,22).setFontSize(15).setColor("#205879").setBold(true).setText(obj[i].RD_NAME).draw(off);
		menu.addItem(new NaviItem(on, null), new NaviItem(off, null));		
	}

	menu.setRolling(true);
	menu.start();
}
/*
function draw_fcs(){
	$D.get("fcs_bg").setPath("${imgRoot}/weather/" + obj[current].RD_NAME+ "_fcs.png"); // Pos지정
}
*/
function drawColorKey() {
	/*
	//상세키
		$D.create("img").setPos(335,404).setPath("${imgRoot}/common/ok_key.png").draw();
		$D.create("font").setFontSize(15).setColor("#dcdcdc").setPos(359,407).setText("상세정보").draw();	
	//yellow키	
		$D.create("img").setPos(425,404).setPath("${imgRoot}/common/yellow_key.png").draw();
		$D.create("font").setFontSize(15).setColor("#dcdcdc").setPos(447,407).setText("이전지역").draw();		
	//green키		
		$D.create("img").setPos(512,404).setPath("${imgRoot}/common/green_key.png").draw();
		$D.create("font").setFontSize(15).setColor("#dcdcdc").setPos(534,407).setText("다음지역").draw();
	//blue키		
		$D.create("img").setPos(599,404).setPath("${imgRoot}/common/blue_key.png").draw();
		$D.create("font").setFontSize(15).setColor("#dcdcdc").setPos(621,407).setText("메뉴로").draw();
		*/
	ColorKeyDrawer.draw([[ColorKeyDrawer.OK, "시간별예보"],[ColorKeyDrawer.YELLOW, "이전지역"], [ColorKeyDrawer.GREEN, "다음지역"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
}


function save(){}
function load(param){
	menu.setFocus(param);
}

function prevPage(){
	current -= 1;
  	if(current < 0) current = total -1 ;
  //	areaName();
}
function nextPage(){
	current += 1;
	if(current >= total) current = 0;
	//areaName();
}

$K.enter(function(){
	var param = {};
	param.title = obj[menu.getIndex()].RD_NAME;
	param.idx = menu.getIndex();
	param.list = obj;
	$H.foward("${ctxRoot}/citydetail.do?w3_x=" + obj[menu.getIndex()].W3_X + "&w3_y=" + obj[menu.getIndex()].W3_Y , param);
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
