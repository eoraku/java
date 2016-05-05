<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
 <!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp" %>
<script type='text/javascript'>
var vodObj = $.getJsonObj('${result}');
var currentPage = 0;
var totalPage = (vodObj.length % 2 == 1) ? parseInt(vodObj.length / 2) + 1 : parseInt(vodObj.length / 2);
if(vodObj.length != 0 && vodObj != ""){
	$D.create("img").setPath("${imgRoot}/etc/07-3_pg_pre.png");
	$D.create("img").setPath("${imgRoot}/etc/07-3_pg_next.png");
	
	var imgTemp = $D.create("img").setPath("${serverRoot}/bgs/" + vodObj[0].EG_IMAGE);
	imgTemp.onerror=function(){vodObj="";};
	var imgTemp1 = $D.create("img").setPath("${serverRoot}/vod/" + vodObj[currentPage].NV_IMAGE);
	imgTemp1.onerror=function(){vodObj="";};
	var imgTemp2 = $D.create("img").setPath("${serverRoot}/vod/" + vodObj[currentPage + 1].NV_IMAGE);
	imgTemp2.onerror=function(){vodObj="";};
	//$D.create("img").setPath("${serverRoot}/bgs/" + vodObj[0].EG_IMAGE);
	//$D.create("img").setPath("${serverRoot}/vod/" + vodObj[currentPage].NV_IMAGE);
	//$D.create("img").setPath("${serverRoot}/vod/" + vodObj[currentPage + 1].NV_IMAGE);
}
function init(){
	if ("${rCode}" == "100") {
		if(vodObj.length == 0 || vodObj==""){
			return "501";
		}
		drawBg();
		if( vodObj.length == 1)	{
			drawContents();	
			insertContents();
		}else{
			drawContents();
			drawContents2();
			insertContents();
			insertContents2();
		}
	}
	return "${rCode}";
}

function drawBg(){
	$D.create("img").setPath("${serverRoot}/bgs/" + vodObj[0].EG_IMAGE).setPos(0, 0).setSize(720, 434).draw();
	$D.create("img").setPath("${imgRoot}/etc/07-3_pg_pre.png").setPos(307, 378).draw();
	$D.create("img").setPath("${imgRoot}/etc/07-3_pg_next.png").setPos(403, 378).draw();

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


function drawContents(){
	$D.create("img").setId("img").setPos(90, 81).setSize(175, 121).draw();
	$D.create("font").setId("title").setPos(305, 45).setFontSize(20).setColor("#1e1e1e").setSize(300, 0).draw();
	
	var div = $D.create("div").setId("div1").setPos(304, 97).setSize(340, 80).draw();
	$D.create("font").setId("content").setPos(0, 0).setFontSize(16).setColor("#000000").draw(div);

	$D.create("font").setId("currentpage").setPos(321, 377).setSize(33, 20).setColor("#591b5f").setFontSize(18).setAlign("right").draw();
	$D.create("font").setText(totalPage).setPos(368, 377).setSize(33, 20).setColor("#8e6092").setFontSize(18).setAlign("left").draw();
	$D.create("font").setText("/").setPos(357, 377).setSize(8, 20).setColor("#8e6092").setFontSize(18).setAlign("center").draw();
}


function drawContents2(){
	$D.create("img").setId("img2").setPos(90, 244).setSize(175, 121).draw();
	$D.create("font").setId("title2").setPos(305, 210).setFontSize(20).setColor("#1e1e1e").setSize(300, 0).draw();

	var div = $D.create("div").setId("div2").setPos(304, 262).setSize(340, 80).draw();
	$D.create("font").setId("content2").setPos(0, 0).setFontSize(16).setColor("#000000").draw(div);
}


function insertContents(){
	var font = $D.create("font").setFontSize(16);
	var font2 = $D.create("font").setFontSize(16);
	var comment = "";
	var strArr = FontMetrics.parseFont(font, vodObj[currentPage].NV_COMMENT, 340);
	for ( var i = 0; i < strArr.length; i++) {
		if(i == 4) {
			comment += textWidthSplitAddDot(font2, strArr[i], 330, "...");
			break;
		} else {
			comment += strArr[i];
		}
	}
	$D.get("img").setPath("${serverRoot}/vod/" + vodObj[currentPage].NV_IMAGE);
	$D.get("title").setText(vodObj[currentPage].NV_TITLE);
	if(vodObj[currentPage].NV_YEAR != "") {
		$D.get("title").setText(vodObj[currentPage].NV_TITLE + " (" + vodObj[currentPage].NV_YEAR + ")");
	}
	$D.get("content").setText(comment);
	$D.get("currentpage").setText(parseInt(currentPage / 2) + 1);
//	$D.get("totalpage").setText(totalPage);
}


function insertContents2(){
	var font = $D.create("font").setFontSize(16);
	var font2 = $D.create("font").setFontSize(16);
	var comment = "";
	var strArr = FontMetrics.parseFont(font, vodObj[currentPage + 1].NV_COMMENT, 340);
	for ( var i = 0; i < strArr.length; i++) {
		if(i == 4) {
			comment += textWidthSplitAddDot(font2, strArr[i], 330, "...");
			break;
		} else {
			comment += strArr[i];
		}
	}
	$D.get("img2").setPath("${serverRoot}/vod/" + vodObj[currentPage + 1].NV_IMAGE);
	$D.get("title2").setText(vodObj[currentPage + 1].NV_TITLE);
	if(vodObj[currentPage + 1].NV_YEAR != "") {
		$D.get("title2").setText(vodObj[currentPage + 1].NV_TITLE + " (" + vodObj[currentPage + 1].NV_YEAR + ")");
	}
	$D.get("content2").setText(comment);
}

function drawNull(){
	$D.get("img2").setPath("");
	$D.get("title2").setText("");
	$D.get("content2").setText("");
}


function save(){}
function load(){}
$K.left(function() {

	if(vodObj.length == 1) return;
	
	currentPage -= 2;
	if(currentPage < 0) currentPage = (totalPage - 1) * 2;	
	insertContents();
	if(currentPage + 1 > vodObj.length - 1) {
		drawNull();
	} else {
		insertContents2();
	}
});


$K.right(function() {

	if(vodObj.length == 1) return;

	currentPage += 2;
	if(currentPage > vodObj.length -1) currentPage = 0;	
	insertContents();
	if(currentPage + 1 > vodObj.length - 1) {
		drawNull();
	} else {
		insertContents2();
	}

});

$K.yellow(function() {

	if(vodObj.length == 1) return;
	
	currentPage -= 2;
	if(currentPage < 0) currentPage = (totalPage - 1) * 2;	
	insertContents();
	if(currentPage + 1 > vodObj.length - 1) {
		drawNull();
	} else {
		insertContents2();
	}
});


$K.green(function() {

	if(vodObj.length == 1) return;

	currentPage += 2;
	if(currentPage > vodObj.length -1) currentPage = 0;	
	insertContents();
	if(currentPage + 1 > vodObj.length - 1) {
		drawNull();
	} else {
		insertContents2();
	}

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
