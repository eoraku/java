<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
 <!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp" %>
<script type='text/javascript'>
var obj = $.getJsonObj('${result}');
if(obj.length != 0 && obj != ""){
	$D.create("img").setPath("${imgRoot}/common/03-2_bg.png");
	$D.create("img").setPath("${imgRoot}/common/st_02.png");
	for ( var i = 0; i < obj.length; i++) {
		$D.create("img").setPath("${imgRoot}/common/map_nrml.png");
		$D.create("img").setPath("${imgRoot}/common/w_icon_m/"+obj[i].WN_RAINF+obj[i].WN_FORECAST+".png");
	}
}

function init(){
	if ("${rCode}" == "100") {
		if(obj.length == 0 || obj==""){
			return "501";
		}
		drawBg();
		drawArea();
		drawColorKey();
	}
	return "${rCode}";
}
function drawBg(){
	$D.create("img").setPos(0,0).setSize(720,434).setPath("${imgRoot}/common/03-2_bg.png").draw();
	//$D.create("img").setPos(44,25).setPath("${imgRoot}/common/st_02.png").draw();
	//$D.create("font").setPos(78,30).setFontSize(18).setColor("#0e3c5d").setText("날씨 | 현재 전국 날씨").draw();
}
function getWeatherSrc(id) { //날씨코드와 이미지맵핑
	var result = ""; 
	for ( var i = 0; i < weather.length; i++) {
		if(weather[i].id == id) {
			result = wehater[i].src;	
		}
	}
	return result;
}
function drawArea(){ //DB에서 좌표값도 받아온다.
	for ( var i = 0; i < obj.length; i++) {
		var divElement = $D.create("div").setPos(obj[i].RC_X,obj[i].RC_Y).draw(); //obj에 있는 x좌표와 y좌표를 가지고 와서 한다 
		$D.create("img").setPos(0,0).setSize(88,50).setPath("${imgRoot}/common/map_nrml.png").draw(divElement);
		$D.create("img").setPos(6, 6).setSize(39,34).setPath("${imgRoot}/common/w_icon_m/"+obj[i].WN_RAINF+obj[i].WN_FORECAST+".png").draw(divElement); //날씨이미지
		$D.create("font").setPos(42,8).setSize(45,22).setFontSize(12).setColor("#205879").setAlign("center").setText(obj[i].RC_NAME).setBold(true).draw(divElement); //지역명
		$D.create("font").setPos(42,24).setSize(45,22).setFontSize(17).setColor("#464646").setAlign("center").setText(obj[i].WN_TEMP).setBold(true).draw(divElement); //온도
	}
}

function drawColorKey() {	
	//blue키		
/*	
		$D.create("img").setPos(599,404).setId("blue").setPath("${imgRoot}/common/blue_key.png").draw();
		$D.create("font").setFontSize(15).setColor("#ffffff").setPos(621,407).setText("메뉴로").draw();
		*/
	ColorKeyDrawer.draw([[ColorKeyDrawer.BLUE, "메뉴로"]]);
}

function save(){}
function load(){}

$K.blue(function(){
	$H.home();
});
$K.back(function(){
	$H.back();
});
</script>
</head>
<body>
<!-- ***** insert HTML ***** -->
</body>
</html>
