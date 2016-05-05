<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
 <!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp" %>
<script type='text/javascript'>
//var obj = "";
var obj = $.getJsonObj('${result}');
document.write("aaa");
var totalPage = 0;
var currentPage = 0;

if(obj.length != 0 && obj != ""){
	var imgTemp = $D.create("img").setPath("${serverRoot}/bgs/" + obj[currentPage].EG_IMAGE);
	imgTemp.onerror=function(){obj="";};
	var imgTemp1 = $D.create("img").setPath("${serverRoot}/wedding/" + obj[currentPage].EW_PHOTO);
	imgTemp1.onerror=function(){obj="";};
	
	/*
	$D.create("img").setPath("${serverRoot}/bgs/" + obj[currentPage].EG_IMAGE);
	$D.create("img").setPath("${serverRoot}/wedding/" + obj[currentPage].EW_PHOTO);
	*/
}
function init(){
	if ("${rCode}" == "100") {
		if(obj.length == 0 || obj==""){
			/*
			2013-06-14 seoseo
			내용이 없을 시에 경고 팝업 대신 안내 배경이 나오도록 수정
			*/
			$D.create("img").setSize(720, 434).setPos(0, 0).setPath("${serverRoot}/nothing/marry.png").draw();
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
	if(obj && obj.length != 0) totalPage = obj.length;
}
function drawbg() {
	$D.create("img").setSize(720, 434).setPos(0, 0).setPath("${serverRoot}/bgs/" + obj[currentPage].EG_IMAGE).draw();
	$D.create("img").setSize(191,136).setPos(444,70).setPath("${serverRoot}/wedding/"+obj[currentPage].EW_PHOTO).draw();
	
}

function insertInfo() {	
	if(obj[currentPage].EW_M_JOB == ""){
		$D.get("sinrang").setText(obj[currentPage].EW_M_NAME);
	}else{
		$D.get("sinrang").setText(obj[currentPage].EW_M_NAME+ " <span style='font-size:12pt'>(" +obj[currentPage].EW_M_JOB + ")</span>");
	} 
	if(obj[currentPage].EW_MF_JOB == ""){
		$D.get("sinrang_bu").setText(obj[currentPage].EW_MF_NAME);
	}else{
		$D.get("sinrang_bu").setText(obj[currentPage].EW_MF_NAME + " <span style='font-size:12pt'>("+ obj[currentPage].EW_MF_JOB + ")</span>");
	}
	if(obj[currentPage].EW_MM_JOB == ""){
		$D.get("sinrang_mo").setText(obj[currentPage].EW_MM_NAME);
	}else{
		$D.get("sinrang_mo").setText(obj[currentPage].EW_MM_NAME+" <span style='font-size:12pt'>("  + obj[currentPage].EW_MM_JOB+")</span>");
	}
	$D.get("sinrang_bu_re").setText("의 " + obj[currentPage].EW_M_REL);

	if(obj[currentPage].EW_B_JOB ==""){
		$D.get("sinbu").setText(obj[currentPage].EW_B_NAME); 
	}else{
		$D.get("sinbu").setText(obj[currentPage].EW_B_NAME+ " <span style='font-size:12pt'>(" + obj[currentPage].EW_B_JOB +")</span>"); 
	}
	if(obj[currentPage].EW_BF_JOB==""){
		$D.get("sinbu_bu").setText(obj[currentPage].EW_BF_NAME);
	}else{
		$D.get("sinbu_bu").setText(obj[currentPage].EW_BF_NAME + " <span style='font-size:12pt'>(" + obj[currentPage].EW_BF_JOB + ")</span>");
	}
	if(obj[currentPage].EW_BM_JOB==""){
		$D.get("sinbu_mo").setText(obj[currentPage].EW_BM_NAME);
	}else{
		$D.get("sinbu_mo").setText(obj[currentPage].EW_BM_NAME+" <span style='font-size:12pt'>(" + obj[currentPage].EW_BM_JOB + ")</span>");
	}
	
	$D.get("sinbu_bu_re").setText("의 " + obj[currentPage].EW_B_REL);

	$D.get("info").setText(obj[currentPage].EW_DATE + "<br />" + obj[currentPage].EH_NAME);//+ obj[currentPage].EW_TIME 
	$D.get("tel").setText("신랑측 : " + obj[currentPage].EW_M_TEL + "<br />신부측 : " + obj[currentPage].EW_B_TEL);
}

function drawInfo() {
	//신랑정보	
	$D.create("font").setId("sinrang").setPos(150,107).setFontSize(20).setColor("#1e1e1e").draw();
	$D.create("font").setId("sinrang_bu").setPos(150,142).setFontSize(18).setColor("#1e1e1e").draw();
	$D.create("font").setId("sinrang_bu_re").setPos(210,195).setFontSize(15).setColor("#1e1e1e").draw();
	$D.create("font").setId("sinrang_mo").setPos(150,172).setFontSize(18).setColor("#1e1e1e").draw();
	
	//신부정보
	$D.create("font").setId("sinbu").setPos(150,225).setFontSize(20).setColor("#1e1e1e").draw();
	$D.create("font").setId("sinbu_bu").setPos(150,259).setFontSize(18).setColor("#1e1e1e").draw();
	$D.create("font").setId("sinbu_bu_re").setPos(210,312).setFontSize(15).setColor("#1e1e1e").draw();	
	$D.create("font").setId("sinbu_mo").setPos(150,289).setFontSize(18).setColor("#1e1e1e").draw();

	//하단정보
	$D.create("font").setId("info").setPos(459,236).setFontSize(15).setColor("#1e1e1e").draw();
	$D.create("font").setId("tel").setPos(459,308).setFontSize(15).setColor("#1e1e1e").draw();
}

function page() {
	$D.create("img").setPos(307,378).setSize(13,16).setPath("${imgRoot}/familyevent/05-1_pg_pre.png").draw();
	$D.create("font").setId("page").setAlign("right").setPos(321,377).setSize(33,20).setFontSize(20).setText(currentPage+1).setColor("#401c30").draw(); 
	$D.create("font").setPos(357,377).setSize(8,20).setFontSize(20).setText("/").setColor("#8d5475").draw(); 
	$D.create("font").setAlign("left").setPos(368,377).setSize(33,20).setFontSize(20).setText(totalPage).setColor("#8d5475").draw(); 
	$D.create("img").setPos(403,378).setSize(13,16).setPath("${imgRoot}/familyevent/05-1_pg_next.png").draw();
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
		ColorKeyDrawer.draw(colorKey[1]); // 식장안내 제거, 2013-07-01
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
</body>
</html>

