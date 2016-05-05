<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
 <!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp" %>
<script type='text/javascript'>
$D.create("img").setPath("${imgRoot}/weather/olle/olle_bg.png");
$D.create("img").setPath("${imgRoot}/common/st_02.png");

var obj = $.getJsonObj('${result}');
var current = 0;
var total = obj.length;

var div = [];
if(obj.length != 0 && obj != ""){
	$D.create("img").setPath("${imgRoot}/weather/olle/olle_bg.png");
	$D.create("img").setPath("${imgRoot}/common/st_02.png");
	for ( var i = 0; i < obj.length; i++) {
		$D.create("img").setPath("${imgRoot}/weather/olle/" + obj[i].RD_NAME+ "_fcs.png");
		$D.create("img").setPath("${imgRoot}/weahter/04-1_map_fcs.png");		
	//	$D.create("img").setPath("${imgRoot}/common/w_icon_m/" + obj[i].W3_PTY + obj[i].W3_SKY+".png");
		$D.create("img").setPath("${imgRoot}/common/04-1_map_fcs_nrml.png");		
	//	$D.create("img").setPath("${imgRoot}/weahter/w_icon_m/" + obj[i].W3_PTY + obj[i].W3_SKY+".png");
	}
}
function init(){
	if ("${rCode}" == "100") {
		//$D.create("img").setSize(720, 434).setPos(0, 0).setPath("${serverRoot}/nothing/olle.png").draw();
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
	$D.create("img").setPos(0,0).setPath("${imgRoot}/weather/olle/olle_bg.png").draw();
	//$D.create("img").setPos(44,25).setPath("${imgRoot}/common/st_02.png").draw();
	//$D.create("font").setPos(78,30).setFontSize(18).setColor("#0e3c5d").setText("날씨 | 올레길예보").draw();
}
function setArea(){	
	menu = new NaviEvent();
	for ( var i = 0; i < obj.length; i++) {
		var x = 0;
		x += parseInt(obj[i].RD_SCREEN_X);
		var y = 0;
		y += parseInt(obj[i].RD_SCREEN_Y);
		var on = $D.create("div").setPos(0,0).setSize(720, 434);
		$D.create("font").setPos(72,69).setSize(565,20).setText(obj[i].RD_NAME +" "+ obj[i].RD_TXT).setAlign("center").setFontSize(20).setColor("#f0f0f0").setDepth(10).draw(on);
		$D.create("img").setPos(0,0).setPath("${imgRoot}/weather/olle/" + obj[i].RD_NAME+ "_fcs.png").setDepth(2).draw(on);
		$D.create("img").setPos(obj[i].RD_SCREEN_X,obj[i].RD_SCREEN_Y).setPath("${imgRoot}/weather/olle/olle_button.png").setDepth(10).draw(on);		
		$D.create("img").setPos(x+9,y+6).setSize(39,34).setPath("${imgRoot}/common/w_icon_m/" + obj[i].W3_PTY + obj[i].W3_SKY+".png").setDepth(10).draw(on);
		$D.create("font").setId("icon_name").setAlign("center").setPos(x+40,y+8).setSize(83,14).setFontSize(13).setColor("#fff566").setBold(true).setText(obj[i].RD_NAME).setDepth(10).draw(on);
		$D.create("font").setId("icon_temp").setAlign("center").setPos(x+41,y+26).setSize(83,18).setFontSize(17).setColor("#f0f0f0").setBold(true).setText(obj[i].WL_T1H).setDepth(10).draw(on);
		$D.create("font").setId("icon_tempdo").setAlign("center").setPos(x+53,y+26).setSize(83,18).setFontSize(17).setColor("#f0f0f0").setBold(true).setText("˚").setDepth(10).draw(on);
		
	    var off = $D.create("div").setPos(0,0).setSize(720, 434);		
	  //$D.create("img").setPos(obj[i].RD_SCREEN_X,obj[i].RD_SCREEN_Y).setPath("${imgRoot}/weather/olle/back_nrml.png").setDepth(5).draw(off);		
	  //$D.create("img").setPos(x+9,y+6).setSize(39,34).setPath("${imgRoot}/common/w_icon_m/" + obj[i].W3_PTY + obj[i].W3_SKY+".png").setDepth(5).draw(off);
	  //$D.create("font").setId("icon_name").setAlign("center").setPos(x+40,y+8).setSize(83,14).setFontSize(13).setColor("#205879").setBold(true).setText(obj[i].RD_NAME).setDepth(5).draw(off);
	  //$D.create("font").setId("icon_temp").setAlign("center").setPos(x+41,y+26).setSize(83,18).setFontSize(17).setColor("#464646").setBold(true).setText(obj[i].W3_T3H).setDepth(5).draw(off);
		
		menu.addItem(new NaviItem(on, null), new NaviItem(off, null));
		
	//참고 	function NaviItem(element, evt) {
	//		this.element = element;
	//		this.evt = evt;
	//	}
		
	//	this.addItem = function(onKNaviItem, offKNaviItem) {
	//		onItems.push(onKNaviItem);
	//		offItems.push(offKNaviItem);
	//		self.setMaxItem(onItems.length);
	//this.setMaxItem = function(_maxCount) {
	//	maxCount = _maxCount;
	//	if (maxCount > onItems.length) {
	//		maxCount = onItems.length;
	//	}	
		
	}
	menu.setRolling(true);
	menu.start();
}

function save(){}
function load(param){
	menu.setFocus(param);
}
function drawColorKey() {
	ColorKeyDrawer.draw([[ColorKeyDrawer.OK, "시간별예보"],[ColorKeyDrawer.YELLOW, "이전지역"], [ColorKeyDrawer.GREEN, "다음지역"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
}
function prevPage(){
	
  	current -= 1;	  	
  	if(current < 0) current = total-1 ;  	
}
function nextPage(){
	current += 1;
	if(current >= total) current = 0 ;	
}
$K.enter(function(){
	var param = {};
	param.title = obj[menu.getIndex()].RD_NAME + " " + obj[menu.getIndex()].RD_TXT;
	param.idx = menu.getIndex();
	param.list = obj;
	$H.foward("${ctxRoot}/olledetail.do?&w3_x=" + obj[menu.getIndex()].W3_X + "&w3_y=" + obj[menu.getIndex()].W3_Y , param);
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
</body>
</html>
