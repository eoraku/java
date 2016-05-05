<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
 <!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp" %>
<script type='text/javascript'>
var result = $.getJsonObj('${result}');
var tempResult = result;
if(result.length != 0 && result != ""){
	$D.create("img").setPath("${imgRoot}/etc/07-0_bg.png");
	$D.create("img").setPath("${imgRoot}/etc/st_07.png");
}

var listCount = 5;
var currentPage = 1;
var totalPage = (result.length % listCount == 0) ? parseInt(result.length/listCount) :  parseInt(result.length/listCount)+1;
var popupIdx = "CLB000";

function init(){
	if ("${rCode}" == "100") {
		if(result.length == 0 || result==""){
			return "501";
		}
		drawBg();
		drawTitle();
		drawContents();
		insertContents();
	}
	return "${rCode}";
}

function drawBg(){
	$D.create("img").setPath("${imgRoot}/etc/07-0_bg.png").setSize(720, 434).setPos(0, 0).draw();
	$D.create("img").setPath("${imgRoot}/etc/st_07.png").setPos(44, 25).draw();
	$D.create("font").setText("모임소식").setPos(78, 30).setFontSize(18).setColor("#0e3c5d").draw();
	$D.create("img").setPath("${imgRoot}/common/page_pre.png").setPos(307, 378).draw();
	$D.create("img").setPath("${imgRoot}/common/page_next.png").setPos(403, 378).draw();
	ColorKeyDrawer.draw([[ColorKeyDrawer.RED, "모임선택"], [ColorKeyDrawer.YELLOW, "이전"], [ColorKeyDrawer.GREEN, "다음"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
	$D.create("font").setId("totalPage").setText(totalPage).setPos(368, 377).setSize(33, 20).setColor("#536674").setFontSize(18).setAlign("left").draw();
}


function drawTitle(){
	$D.create("font").setPos(56, 66).setText("모임/단체").setFontSize(16).setBold(true).setColor("#f0f0f0").setSize(153, 55).setAlign("center").draw();	
	$D.create("font").setPos(213, 66).setText("일시").setFontSize(16).setBold(true).setColor("#f0f0f0").setSize(76, 55).setAlign("center").draw();	
	//$D.create("font").setPos(233, 66).setText("시간").setFontSize(16).setBold(true).setColor("#f0f0f0").setSize(66, 55).setAlign("center").draw();	
	$D.create("font").setPos(293, 66).setText("행사내용").setFontSize(16).setBold(true).setColor("#f0f0f0").setSize(131, 55).setAlign("center").draw();	
	$D.create("font").setPos(428, 66).setText("장소").setFontSize(16).setBold(true).setColor("#f0f0f0").setSize(123, 55).setAlign("center").draw();	
	$D.create("font").setPos(555, 66).setText("문의").setFontSize(16).setBold(true).setColor("#f0f0f0").setSize(109, 55).setAlign("center").draw();
}

function drawContents(){
	var y = 112;
	var ys = 55;
	for ( var i = 0; i < listCount; i++) {
		$D.create("font").setId("ncname" + i).setPos(56, (y + (i * ys))).setColor("#10564b").setFontSize(17).setSize(153, 55).setAlign("center").draw();
		$D.create("font").setId("ncdate" + i).setPos(213, (y + (i * ys)) - 10).setColor("#34560c").setFontSize(17).setSize(76, 55).setAlign("center").draw();
		//$D.create("font").setId("nctime" + i).setPos(233, y + (i * ys)).setColor("#3c3c3c").setFontSize(17).setSize(66, 55).setAlign("center").draw();
		$D.create("font").setId("nctitle" + i).setPos(293, y + (i * ys)).setColor("#3c3c3c").setFontSize(17).setSize(131, 55).setAlign("center").draw();
		$D.create("font").setId("nclocation" + i).setPos(428, y + (i * ys)).setColor("#3c3c3c").setFontSize(17).setSize(123, 55).setAlign("center").draw();
		$D.create("font").setId("nctell" + i).setPos(555, y + (i * ys)).setColor("#3c3c3c").setFontSize(17).setSize(109, 55).setAlign("center").draw();
	}
	$D.create("font").setId("currentpage").setPos(321, 377).setSize(33, 20).setColor("#0e3c5d").setFontSize(18).setAlign("right").draw();
	$D.create("font").setText("/").setPos(357, 377).setSize(8, 20).setColor("#536674").setFontSize(18).setAlign("center").draw();
}

function insertContents(){
	var font = $D.create("font").setFontSize(17);
	var width = 0;
	var y = 112;
	var ys = 55;
	
	for ( var i = 0; i < listCount; i++) {
		if(((currentPage - 1) * listCount) + i > result.length - 1) break;
		
		var ncName = result[((currentPage - 1) * listCount) + i].NC_NAME;
		$D.get("ncname" + i).setText(ncName);
		width = FontMetrics.getWidth(font, ncName);
		if(width >= 153) $D.get("ncname" + i).setPos(56, (y + (i * ys)) - 10);  
		else $D.get("ncname" + i).setPos(56, (y + (i * ys)));
		
		$D.get("ncdate" + i).setText(result[((currentPage - 1) * listCount) + i].NC_DATE + "<br />" + result[((currentPage - 1) * listCount) + i].NC_TIME);		
		//$D.get("nctime" + i).setText(result[((currentPage - 1) * listCount) + i].NC_TIME);
		
		var ncTitle = result[((currentPage - 1) * listCount) + i].NC_TITLE;
		$D.get("nctitle" + i).setText(ncTitle);
		width = FontMetrics.getWidth(font, ncTitle);
		if(width >= 126) $D.get("nctitle" + i).setPos(293, (y + (i * ys)) - 10);  
		else $D.get("nctitle" + i).setPos(293, (y + (i * ys)));
		
		var ncLocation = result[((currentPage - 1) * listCount) + i].NC_LOCATION;
		$D.get("nclocation" + i).setText(ncLocation);
		width = FontMetrics.getWidth(font, ncLocation);
		if(width >= 123) $D.get("nclocation" + i).setPos(428, (y + (i * ys)) - 10);  
		else $D.get("nclocation" + i).setPos(428, (y + (i * ys)));
		
		$D.get("nctell" + i).setText(result[((currentPage - 1) * listCount) + i].NC_TELL);
	}
	$D.get("currentpage").setText(currentPage);
}

function drawNull() {
	var index = (currentPage != totalPage) ? ((currentPage-1)*listCount)+listCount : result.length;
	for ( var i = 0; i < listCount; i++) {
		$D.get("ncname" + i).setText("");
		$D.get("ncdate" + i).setText("");
		//$D.get("nctime" + i).setText("");
		$D.get("nctitle" + i).setText("");
		$D.get("nclocation" + i).setText("");
		$D.get("nctell" + i).setText("");
	}
}

function replaceList(code) {
	result = [];
	if(code == "CLB000") {
		result = tempResult;		
	} else {
		for ( var i = 0; i < tempResult.length; i++) {
			if(tempResult[i].NC_CATEGORY == code) {
				result[result.length] = tempResult[i];
			}		
		}
	}
	currentPage = 1;
	totalPage = (result.length % listCount == 0) ? parseInt(result.length/listCount) :  parseInt(result.length/listCount)+1;
	top.showLoading();
	setTimeout(function(){
		drawNull();
		insertContents();
		$D.get("totalPage").setText(totalPage);
		top.hideLoading();
	}, 200);
}

function save(){}
function load(){}

function $rpm(data) {
	popupIdx = data;
	replaceList(popupIdx);
}

$K.red(function() {
	$P.show("${ctxRoot}/clubpopup.do", popupIdx);
});

$K.left(function() {
	if(totalPage <= 1) return;
	top.showLoading();
	setTimeout(function(){
		drawNull();
		currentPage = (currentPage == 1) ? currentPage = totalPage : currentPage - 1; 
		insertContents();
		top.hideLoading();
	}, 200);
});

$K.right(function() {
	if(totalPage <= 1) return;
	top.showLoading();
	setTimeout(function(){
		drawNull();
		currentPage = (currentPage == totalPage) ? 1 : currentPage+1; 
		insertContents();
		top.hideLoading();
	}, 200);
});

$K.yellow(function() {
	if(totalPage <= 1) return;
	top.showLoading();
	setTimeout(function(){
		drawNull();
		currentPage = (currentPage == 1) ? currentPage = totalPage : currentPage - 1; 
		insertContents();
		top.hideLoading();
	}, 200);
});


$K.green(function() {
	if(totalPage <= 1) return;
	top.showLoading();
	setTimeout(function(){
		drawNull();
		currentPage = (currentPage == totalPage) ? 1 : currentPage+1; 
		insertContents();
		top.hideLoading();
	}, 200);
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
