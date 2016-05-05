<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
 <!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp" %>
<script type='text/javascript'>
var jobObj = $.getJsonObj('${result}');
if(jobObj.length != 0 && jobObj != ""){
	$D.create("img").setPath("${imgRoot}/job/06-1_bg.png");
	$D.create("img").setPath("${imgRoot}/job/st_06.png");
}

var listCount = 4;
var currentPage = 1;
var totalPage = (jobObj.length % listCount == 0) ? parseInt(jobObj.length/listCount) :  parseInt(jobObj.length/listCount)+1;

function init(){
	if ("${rCode}" == "100") {
		if(jobObj.length == 0 || jobObj==""){
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
	$D.create("img").setPath("${imgRoot}/job/06-1_bg.png").setSize(720, 434).setPos(0, 0).draw();
	$D.create("img").setPath("${imgRoot}/job/st_06.png").setPos(44, 25).draw();
	$D.create("font").setText("채용").setPos(78, 30).setFontSize(18).setColor("#0e3c5d").draw();
	$D.create("img").setPath("${imgRoot}/common/page_pre.png").setPos(307, 378).draw();
	$D.create("img").setPath("${imgRoot}/common/page_next.png").setPos(403, 378).draw();
	ColorKeyDrawer.draw([[ColorKeyDrawer.YELLOW, "이전"], [ColorKeyDrawer.GREEN, "다음"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
}

function drawTitle(){
	$D.create("font").setPos(76, 63).setText("업체명").setFontSize(16).setBold(true).setColor("#f0f0f0").setSize(410, 16).setAlign("left").draw();	
	$D.create("font").setPos(490, 63).setText("사업내용").setFontSize(16).setBold(true).setColor("#f0f0f0").setSize(174, 16).setAlign("center").draw();	
	$D.create("font").setPos(56, 93).setText("모집직종").setFontSize(16).setBold(true).setColor("#f0f0f0").setSize(216, 16).setAlign("center").draw();	
	$D.create("font").setPos(276, 93).setText("급여").setFontSize(16).setBold(true).setColor("#f0f0f0").setSize(103, 16).setAlign("center").draw();	
	$D.create("font").setPos(383, 93).setText("경력").setFontSize(16).setBold(true).setColor("#f0f0f0").setSize(103, 16).setAlign("center").draw();	
	$D.create("font").setPos(490, 93).setText("문의처").setFontSize(16).setBold(true).setColor("#f0f0f0").setSize(174, 16).setAlign("center").draw();
}

function drawContents(){
	var y1 = 126;
	var y2 = 157;
	var ys = 63;
	var index = (currentPage != totalPage) ? ((currentPage-1)*listCount)+listCount : jobObj.length;
	var i = 0;
	for ( var i = 0; i < listCount; i++) {
		$D.create("font").setId("company" + i).setPos(76, (y1 + (i*ys))).setColor("#34560c").setFontSize(17).setSize(410, 18).setAlign("left").draw();
		$D.create("font").setId("work" + i).setPos(490, (y1 + (i*ys))).setColor("#34560c").setFontSize(17).setSize(174, 18).setAlign("center").draw();
		$D.create("font").setId("dept" + i).setPos(56, y2 + (i * ys)).setColor("#3c3c3c").setFontSize(17).setSize(216, 18).setAlign("center").draw();
		$D.create("font").setId("pay" + i).setPos(276, y2 + (i * ys)).setColor("#3c3c3c").setFontSize(17).setSize(103, 18).setAlign("center").draw();
		$D.create("font").setId("career" + i).setPos(383, y2 + (i * ys)).setColor("#3c3c3c").setFontSize(17).setSize(103, 18).setAlign("center").draw();
		$D.create("font").setId("phone" + i).setPos(490, y2 + (i * ys)).setColor("#3c3c3c").setFontSize(17).setSize(174, 18).setAlign("center").draw();
	}	
	$D.create("font").setId("currentpage").setPos(321, 377).setSize(33, 20).setColor("#0e3c5d").setFontSize(18).setAlign("right").draw();
	$D.create("font").setText(totalPage).setPos(368, 377).setSize(33, 20).setColor("#536674").setFontSize(18).setAlign("left").draw();
	$D.create("font").setText("/").setPos(357, 377).setSize(8, 20).setColor("#536674").setFontSize(18).setAlign("center").draw();
}

function insertContents(){
	for ( var i = 0; i < listCount; i++) {
		if(((currentPage - 1) * listCount) + i > jobObj.length - 1) break;
		$D.get("company" + i).setText(jobObj[((currentPage - 1) * listCount) + i].NJ_COMP);
		$D.get("work" + i).setText(jobObj[((currentPage - 1) * listCount) + i].NJ_WORK);
		$D.get("dept" + i).setText(jobObj[((currentPage - 1) * listCount) + i].NJ_JOB);
		$D.get("pay" + i).setText(jobObj[((currentPage - 1) * listCount) + i].NJ_PAY);
		$D.get("career" + i).setText(jobObj[((currentPage - 1) * listCount) + i].NJ_CAREER);
		$D.get("phone" + i).setText(jobObj[((currentPage - 1) * listCount) + i].NJ_TELL);		
	}
	$D.get("currentpage").setText(currentPage);
}


function drawNull() {
	for ( var i = 0; i < listCount; i++) {
		$D.get("company" + i).setText("");
		$D.get("work" + i).setText("");
		$D.get("dept" + i).setText("");
		$D.get("pay" + i).setText("");
		$D.get("career" + i).setText("");
		$D.get("phone" + i).setText("");
	}
}

function save(){}
function load(){}
$K.left(function() {
	top.showLoading();
	setTimeout(function(){
		drawNull();
		currentPage = (currentPage == 1) ? currentPage = totalPage : currentPage - 1; 
		//drawContents();
		insertContents();
		top.hideLoading();
	}, 200);
});


$K.right(function() {
	top.showLoading();
	setTimeout(function(){
		drawNull();
		currentPage = (currentPage == totalPage) ? 1 : currentPage+1; 
		//drawContents();
		insertContents();
		top.hideLoading();
	}, 200);
});

$K.yellow(function() {
	top.showLoading();
	setTimeout(function(){
		drawNull();
		currentPage = (currentPage == 1) ? currentPage = totalPage : currentPage - 1; 
		//drawContents();
		insertContents();
		top.hideLoading();
	}, 200);
});


$K.green(function() {
	top.showLoading();
	setTimeout(function(){
		drawNull();
		currentPage = (currentPage == totalPage) ? 1 : currentPage+1; 
		//drawContents();
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
