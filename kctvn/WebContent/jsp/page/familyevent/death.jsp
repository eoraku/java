<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp"%>
<script type='text/javascript'>
var obj = $.getJsonObj('${result}');
var currentPage = 0;
var totalPage = 0;
if(obj.length != 0 && obj != ""){
	$D.create("img").setPath("${imgRoot}/familyevent/05-2_pg_pre.png");
	$D.create("img").setPath("${imgRoot}/familyevent/05-2_pg_next.png");
	
	var imgTemp = $D.create("img").setPath("${serverRoot}/bgs/" + obj[currentPage].EG_IMAGE);
	imgTemp.onerror=function(){obj="";};
	
	//$D.create("img").setPath("${serverRoot}/bgs/" + obj[currentPage].EG_IMAGE);
}
function init() {
	if ("${rCode}" == "100") {
		if(obj.length == 0 || obj==""){
			/*
			2013-06-14 seoseo
			내용이 없을 시에 경고 팝업 대신 안내 배경이 나오도록 수정
			*/
			$D.create("img").setSize(720, 434).setPos(0, 0).setPath("${serverRoot}/nothing/death.png").draw();
			//return "501";
		}else{
			reciveData();
			drawbg();
			drawInfo();
			insertInfo();
			page();
			drawColorKey();
		}
	}
	return "${rCode}";
}

function reciveData(){
	if(obj && obj.length != 0) 
		totalPage = obj.length;
}

function drawbg() {
	$D.create("img").setSize(720, 434).setPos(0, 0).setPath("${serverRoot}/bgs/" + obj[currentPage].EG_IMAGE).draw();
}
function insertInfo() {
	if(obj[currentPage].EB_AGE_JOB == "" || obj[currentPage].EB_AGE_JOB == "　"){
		$D.get("goin").setText(obj[currentPage].EB_NAME + " "+obj[currentPage].EB_AGE_JOB).draw();
	}else{
		$D.get("goin").setText(obj[currentPage].EB_NAME + " <span style='font-size:17pt; '>("+obj[currentPage].EB_AGE_JOB+")</span>").draw();
	}
	$D.get("widow").setText(obj[currentPage].EB_WIDOW);
	$D.get("son").setText(obj[currentPage].EB_SON);
	$D.get("daughter").setText(obj[currentPage].EB_DAUGHTER);
	$D.get("son_law").setText(obj[currentPage].EB_SON_LAW);
	$D.get("daughter_law").setText(obj[currentPage].EB_DAUGHTER_LAW);
	$D.get("balin").setText(obj[currentPage].EB_DATETIME+ "  "+ obj[currentPage].EH_NAME);
	$D.get("tel").setText(obj[currentPage].EB_TELL1 +"  " +obj[currentPage].EB_TELL2);
}
function drawInfo() {
	//고인
	$D.create("font").setId("goin").setFontSize(22).setColor("#1e1e1e").setPos(182,87).draw();
	$D.create("font").setId("widow").setFontSize(18).setColor("#1e1e1e").setPos(182,153).draw();
	$D.create("font").setId("son").setFontSize(18).setColor("#1e1e1e").setPos(182,181).draw();
	$D.create("font").setId("daughter").setFontSize(18).setColor("#1e1e1e").setPos(182,209).draw();
	$D.create("font").setId("son_law").setFontSize(18).setColor("#1e1e1e").setPos(182,237).draw();
	$D.create("font").setId("daughter_law").setFontSize(18).setColor("#1e1e1e").setPos(182,265).draw();
	//발인
	$D.create("font").setId("balin").setFontSize(18).setColor("#1e1e1e").setPos(182,302).draw();
	//연락처
	$D.create("font").setId("tel").setFontSize(18).setColor("#1e1e1e").setPos(182,330).draw();
}
function page() {
		$D.create("img").setPos(307,378).setSize(13,16).setPath("${imgRoot}/familyevent/05-2_pg_pre.png").draw();
		$D.create("font").setId("page").setAlign("right").setPos(321,377).setSize(33,20).setFontSize(20).setText(currentPage+1).setColor("#36230f").draw(); 
		$D.create("font").setPos(357,377).setSize(8,20).setFontSize(20).setText("/").setColor("#6f5d4a").draw(); 
		$D.create("font").setAlign("left").setPos(368,377).setSize(33,20).setFontSize(20).setText(totalPage).setColor("#6f5d4a").draw(); 
		$D.create("img").setPos(403,378).setSize(13,16).setPath("${imgRoot}/familyevent/05-2_pg_next.png").draw();
}

var colorKey = [[[ColorKeyDrawer.RED, "식장안내"],[ColorKeyDrawer.YELLOW, "이전"], [ColorKeyDrawer.GREEN, "다음"], [ColorKeyDrawer.BLUE, "메뉴로"]], [[ColorKeyDrawer.YELLOW, "이전"], [ColorKeyDrawer.GREEN, "다음"], [ColorKeyDrawer.BLUE, "메뉴로"]]];

function drawColorKey() {
	changeColorKey();
}
function save() {
}
function load() {
}
function changeColorKey() {
	if(obj[currentPage].EH_IMG == "") {
		ColorKeyDrawer.draw(colorKey[1]);
	} else {
		//ColorKeyDrawer.draw(colorKey[0]);
		ColorKeyDrawer.draw(colorKey[1]); //식장안내 제거, 2013-07-01
	}
}
function prevPage(){
	currentPage -= 1;
  	if(currentPage < 0) currentPage = totalPage -1 ;
	insertInfo();
	$D.get("page").setText(currentPage + 1);
	changeColorKey();
}
function nextPage(){
	currentPage += 1;
	if(currentPage >= totalPage) currentPage = 0 ;
	insertInfo();
	$D.get("page").setText(currentPage + 1);
	changeColorKey();
}
$K.left(function(){
	prevPage();	
});
$K.right(function(){
	nextPage();
});
/* 식장안내 제거, 2013-07-01
$K.red(function(){
	if(obj[currentPage].EH_IMG != "") {
		$D.create("img").setPath("${serverRoot}/halls/" + obj[currentPage].EH_IMG);
		$P.show("${ctxRoot}/imgpopup.do","${serverRoot}/halls/" + obj[currentPage].EH_IMG);
	}
}); */
$K.blue(function(){
	$H.home();
});
$K.yellow(function(){
	prevPage();
});
$K.green(function(){
	nextPage();
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
