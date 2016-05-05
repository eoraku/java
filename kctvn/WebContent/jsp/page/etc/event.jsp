<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
 <!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp" %>
<script type='text/javascript'>
var cultureObj = $.getJsonObj('${result}');
var currentPage = 0;
var totalPage = cultureObj.length;
if(cultureObj.length != 0 && cultureObj != ""){
	$D.create("img").setPath("${imgRoot}/etc/07-1_pg_pre.png");
	$D.create("img").setPath("${imgRoot}/etc/07-1_pg_next.png");
	
	var imgTemp = $D.create("img").setPath("${serverRoot}/bgs/" + cultureObj[0].EG_IMAGE);
	imgTemp.onerror=function(){cultureObj="";};
	var imgTemp1 = $D.create("img").setPath("${serverRoot}/event/" + cultureObj[currentPage].EV_PHOTO);
	imgTemp1.onerror=function(){cultureObj="";};
	//$D.create("img").setPath("${serverRoot}/bgs/" + cultureObj[0].EG_IMAGE);
	//$D.create("img").setPath("${serverRoot}/event/" + cultureObj[currentPage].EV_PHOTO);
}
function init(){
	//$D.create("img").setPath("${serverRoot}/event/" + cultureObj[currentPage]["EV_PHOTO"]);
	if ("${rCode}" == "100") {
		if(cultureObj.length == 0 || cultureObj==""){
			return "501";
		}
		drawBg();
		drawContents();
	}
	return "${rCode}";
}

function drawBg() {
	$D.create("img").setPath("${serverRoot}/bgs/" + cultureObj[0].EG_IMAGE).setPos(0, 0).setSize(720, 434).draw();
	$D.create("img").setPath("${imgRoot}/etc/07-1_pg_pre.png").setPos(307, 378).draw();
	$D.create("img").setPath("${imgRoot}/etc/07-1_pg_next.png").setPos(403, 378).draw();

	ColorKeyDrawer.draw([[ColorKeyDrawer.YELLOW, "이전"], [ColorKeyDrawer.GREEN, "다음"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
	/*
	$D.create("img").setPath("${imgRoot}/common/yellow_key.png").setPos(476, 404).draw();
	$D.create("font").setText("이전").setPos(499, 408).setFontSize(15).setColor("#dcdcdc").draw();
	$D.create("img").setPath("${imgRoot}/common/green_key.png").setPos(538, 404).draw();
	$D.create("font").setText("다음").setPos(560, 408).setFontSize(15).setColor("#dcdcdc").draw();
	$D.create("img").setPath("${imgRoot}/common/blue_key.png").setPos(599, 404).draw();
	$D.create("font").setText("메뉴로").setPos(621, 408).setFontSize(15).setColor("#dcdcdc").draw();
	*/
}


//title
function drawContents() {

	var x = 429;
	var y = 144;
	var yspace = 35;

	$D.create("font").setId("date").setPos(x, y).setFontSize(20).setColor("#1e1e1e").draw();
	$D.create("font").setId("city").setPos(x, y + 46).setFontSize(20).setColor("#1e1e1e").draw();
	$D.create("font").setId("actor").setPos(x, y + (46 * 2)).setFontSize(20).setColor("#1e1e1e").draw();
	$D.create("font").setId("promote").setPos(x, y + (46 * 3)).setFontSize(20).setColor("#1e1e1e").draw();
	$D.create("font").setId("phone").setPos(x, y + (46 * 4)).setFontSize(20).setColor("#1e1e1e").draw();
	
	$D.create("img").setId("img").setPos(90, 102).setSize(252, 257).draw();
	
	$D.create("font").setId("currentpage").setPos(321, 377).setSize(33, 20).setColor("#4a1506").setFontSize(18).setAlign("right").draw();
	$D.create("font").setText(totalPage).setPos(368, 377).setSize(33, 20).setColor("#80544d").setFontSize(18).setAlign("left").draw();
	$D.create("font").setText("/").setPos(357, 377).setSize(8, 20).setColor("#80544d").setFontSize(18).setAlign("center").draw();
	
	insertContents();
}

function insertContents() {
	$D.get("img").setPath("${serverRoot}/event/" + cultureObj[currentPage].EV_PHOTO);
	$D.get("date").setText(cultureObj[currentPage].EV_DATE);
	$D.get("city").setText(cultureObj[currentPage].EV_LOCATION);
	$D.get("actor").setText(cultureObj[currentPage].EV_MANS);
	$D.get("promote").setText(cultureObj[currentPage].EV_PROMOTE);
	$D.get("phone").setText(cultureObj[currentPage].EV_TELL);

	$D.get("currentpage").setText(currentPage + 1);
}


/*
//ajax
function getCultureData() {
	var request = Ajax.createXHR(
		function(){
			cultureObj = eval(request.getResultText());
			drawCfont();
			drawCtitle();
			drawCimg();
			
		//	$D.get("page").setText(currentPage + 1 + " / " + maxPage);
		}, 
		function() {
			alert("ajax fail");	
		}
	);
	request.setParam("command", "event");
	request.setParam("page", currentPage);
	request.send("get", "${ctxRoot}/ajax.do", true);
}
*/
function save(){}
function load(){}

$K.yellow(function() {

	if(totalPage == 1) return;
	
	if(currentPage == 0){
		 currentPage = cultureObj.length;
	}
	currentPage--;
	insertContents();
});


$K.green(function() {

	if(totalPage == 1) return;
	
	currentPage++;
	if(currentPage == cultureObj.length){
		currentPage = 0;
	}
	insertContents();
});


$K.left(function() {

	if(totalPage == 1) return;
	
	if(currentPage == 0){
		 currentPage = cultureObj.length;
	}
	currentPage--;
	insertContents();
});


$K.right(function() {

	if(totalPage == 1) return;
	
	currentPage++;
	if(currentPage == cultureObj.length){
		currentPage = 0;
	}
	insertContents();
});

$K.blue(function() {
	$H.home();	
});

$K.back(function(){$H.back();});



</script>
</head>
<body>
<!-- ***** insert HTML ***** -->
</body>
</html>
