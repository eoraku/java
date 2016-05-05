<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
 <!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp" %>
<script type='text/javascript'>
var townObj = $.getJsonObj('${result}');
var currentPage = 0;
var totalPage = townObj.length;
if(townObj.length != 0 && townObj != ""){
	$D.create("img").setPath("${imgRoot}/etc/07-2_pg_pre.png");
	$D.create("img").setPath("${imgRoot}/etc/07-2_pg_next.png");
	
	var imgTemp = $D.create("img").setPath("${serverRoot}/bgs/" + townObj[0].EG_IMAGE);
	imgTemp.onerror=function(){townObj="";};
	var imgTemp1 = $D.create("img").setPath("${serverRoot}/vill/" + townObj[currentPage].EI_TITLE_IMG);
	imgTemp1.onerror=function(){townObj="";};
	var imgTemp2 = $D.create("img").setPath("${serverRoot}/vill/" + townObj[currentPage].EI_IMAGE);
	imgTemp2.onerror=function(){townObj="";};
	//$D.create("img").setPath("${serverRoot}/bgs/" + townObj[0].EG_IMAGE);
	//$D.create("img").setPath("${serverRoot}/vill/" + townObj[currentPage].EI_TITLE_IMG);
	//$D.create("img").setPath("${serverRoot}/vill/" + townObj[currentPage].EI_IMAGE);
}
function init(){
	if ("${rCode}" == "100") {
		if(townObj.length == 0 || townObj==""){
			/*
			2013-06-14 seoseo
			내용이 없을 시에 경고 팝업 대신 안내 배경이 나오도록 수정
			*/
			$D.create("img").setSize(720, 434).setPos(0, 0).setPath("${serverRoot}/nothing/town.png").draw();
			//return "501";
		}else{
			drawBg();
			drawContents();
			insertContents();
		}
	}
	return "${rCode}";
}

function drawBg() {
	$D.create("img").setPath("${serverRoot}/bgs/" + townObj[0].EG_IMAGE).setPos(0, 0).setSize(720, 434).draw();
	$D.create("img").setPath("${imgRoot}/etc/07-2_pg_pre.png").setPos(307, 378).draw();
	$D.create("img").setPath("${imgRoot}/etc/07-2_pg_next.png").setPos(403, 378).draw();

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

function drawContents() {

	$D.create("img").setId("titleimg").setPos(386, 53).draw();
							// title : font or img ??

	$D.create("img").setId("img").setPos(79, 111).setSize(294, 242).draw();

	$D.create("font").setId("promote").setPos(400, 181).setFontSize(18).setColor("#1e1e1e").setSize(218, 0).draw();
	$D.create("font").setId("content").setPos(400, 280).setFontSize(18).setColor("#1e1e1e").setSize(218, 0).draw();

	$D.create("font").setId("currentpage").setPos(321, 377).setSize(33, 20).setColor("#324917").setFontSize(18).setAlign("right").draw();
	$D.create("font").setText(totalPage).setPos(368, 377).setSize(33, 20).setColor("#798f62").setFontSize(18).setAlign("left").draw();
	$D.create("font").setText("/").setPos(357, 377).setSize(8, 20).setColor("#798f62").setFontSize(18).setAlign("center").draw();

	insertContents();
}

function insertContents() {
	$D.get("titleimg").setPath("${serverRoot}/vill/" + townObj[currentPage].EI_TITLE_IMG);
	
	$D.get("img").setPath("${serverRoot}/vill/" + townObj[currentPage].EI_IMAGE);
	
	$D.get("promote").setText(townObj[currentPage].EI_PROMOTE);
	$D.get("content").setText(townObj[currentPage].EI_CONTENT);

	$D.get("currentpage").setText(currentPage + 1);
}

function save(){}
function load(){}

$K.left(function() {
	if(currentPage == 0){
		currentPage = townObj.length;
	}
	currentPage--;
	insertContents();
});


$K.right(function() {
	currentPage++;
	if(currentPage == townObj.length){
		currentPage = 0;
	}
	insertContents();
});

$K.yellow(function() {
	if(currentPage == 0){
		currentPage = townObj.length;
	}
	currentPage--;
	insertContents();
});


$K.green(function() {
	currentPage++;
	if(currentPage == townObj.length){
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
