<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
 <!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp" %>
<script>
//좌우 공백 제거

function trim(str)
 {
  while(str && str.indexOf(" ") == 0)
   str = str.substring(1);

  while(str && str.lastIndexOf(" ") == str.length-1)
   str = str.substring(0, str.length-1);

  return str;
 }


</script>
<script type='text/javascript'>
var obj = $.getJsonObj('${result}');
if(obj.length != 0 && obj != ""){
	$D.create("img").setPath("${imgRoot}/weather/04-5_bg.png");
	$D.create("img").setPath("${imgRoot}/common/st_02.png");
	for(var i = 0 ; i < 2 ; i++){
		$D.create("img").setPath("${imgRoot}/common/w_icon_l/"+obj[i].WK_F2+".png");
		$D.create("img").setPath("${imgRoot}/common/w_icon_l/"+obj[i].WK_F3+".png");
		$D.create("img").setPath("${imgRoot}/common/w_icon_l/"+obj[i].WK_F4+".png");
		$D.create("img").setPath("${imgRoot}/common/w_icon_l/"+obj[i].WK_F5+".png");
		$D.create("img").setPath("${imgRoot}/common/w_icon_l/"+obj[i].WK_F6+".png");
		$D.create("img").setPath("${imgRoot}/common/w_icon_l/"+obj[i].WK_F7+".png");
	}
}
var current = 0;
var total = obj.length;
var week = ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'];
//var week = ['<span style=color:#9d3535>일요일</span>','월요일','화요일','수요일','목요일','금요일','<span style=color:#396493>토요일</span>'];
var day = [];
var date = [];
var month = ['31','28','31','30','31','30','31','31','30','31','30','31'];
checkYear();
function init(){
	if ("${rCode}" == "100") {
		if(obj.length == 0 || obj==""){
			return "501";
		}
		drawBg();
		insertIcon();
		insertDate();
		drawDay(98);
		drawDay(264);
		drawColorKey();
	}
	return "${rCode}";
}
function drawBg(){
	$D.create("img").setPos(0,0).setPath("${imgRoot}/weather/04-5_bg.png").draw();
	//$D.create("img").setPos(44,25).setPath("${imgRoot}/common/st_02.png").draw();
	//$D.create("font").setPos(78,30).setFontSize(18).setColor("#0e3c5d").setText("날씨 | 주간 예보").draw();	
	$D.create("font").setFontSize(16).setPos(72,65).setSize(576,16).setColor("#5b2d2d").setBold(true).setAlign("center").setText("제주").draw(); //좌표찍어야함 도시명
	$D.create("font").setFontSize(16).setPos(72,232).setSize(576,16).setColor("#5b2d2d").setBold(true).setAlign("center").setText("서귀포").draw(); //좌표찍어야함 도시명
}
/*
function drawDay(height){
	var start_w = 52;
	var h = height;	
	for(var i = 0; i < 6; i++){
		checkdate();
		$D.create("font").setPos(start_w+(104*i),h).setSize(104,16).setFontSize(16).setColor("#6e6e6e").setAlign("center").setText(day[i]).draw();//date[i] + "("+ 
	}
}
*/
function drawDay(height){
	var start_w = 52;
	var h = height;	
	for(var i = 0; i < 6; i++){
		checkdate();
		var sTxt = day[i];
		if(day[i] == "일요일"){
			$D.create("font").setPos(start_w+(104*i),h).setSize(104,16).setFontSize(16).setColor("#6e6e6e").setAlign("center").setText(date[i] + "(<span style=color:#9d3535>일</span>)").draw();
		}else if(day[i] =="토요일"){
			$D.create("font").setPos(start_w+(104*i),h).setSize(104,16).setFontSize(16).setColor("#6e6e6e").setAlign("center").setText(date[i] + "(<span style=color:#396493>토</span>)").draw();
		}else{
			$D.create("font").setPos(start_w+(104*i),h).setSize(104,16).setFontSize(16).setColor("#6e6e6e").setAlign("center").setText(date[i] + "("+ day[i].substring(0, 1) + ")").draw();
		}
	}
}

function checkYear(){
	d = new Date();
	var yy = d.getYear(obj[0].WK_DATE);
	if((yy%4)==0 && (yy%100) !=0) month[1] = 28;	
}
//////////////////////////////////////////// 다시
function checkdate(){  // 날짜&요일
	var d = new Date();	
	d.setFullYear(d.getFullYear(obj[0].WK_DATE));
	d.setMonth(d.getMonth(obj[0].WK_DATE));
	d.setDate(d.getDate(obj[0].WK_DATE)+2);
	// 기상청 날씨가 6시에 초기화 되기 때문에 날짜 변경이 6시간 늦게 되게함
	d.setHours(d.getHours()-6);
	for(var i = 0 ; i < 6 ; i++){
		date[i] = d.getDate();
		day[i] = week[d.getDay()];
		d.setDate(d.getDate()+1);
	}
	return d;
}
////////////////////////////////////////////다시
function insertIcon(){
	start_x = 65;
	start_y = 121;
	x = 104;
	y = 166;
	for(var i = 0 ; i < 2 ; i++){
		$D.create("img").setPos(65,start_y).setPath("${imgRoot}/common/w_icon_l/"+trim(obj[i].WK_F2)+".png").draw();
		$D.create("img").setPos(169,start_y).setPath("${imgRoot}/common/w_icon_l/"+trim(obj[i].WK_F3)+".png").draw();
		$D.create("img").setPos(273,start_y).setPath("${imgRoot}/common/w_icon_l/"+trim(obj[i].WK_F4)+".png").draw();
		$D.create("img").setPos(377,start_y).setPath("${imgRoot}/common/w_icon_l/"+trim(obj[i].WK_F5)+".png").draw();
		$D.create("img").setPos(481,start_y).setPath("${imgRoot}/common/w_icon_l/"+trim(obj[i].WK_F6)+".png").draw();
		$D.create("img").setPos(585,start_y).setPath("${imgRoot}/common/w_icon_l/"+trim(obj[i].WK_F7)+".png").draw();
		start_y += y;
	}
}

function insertDate(){
	start_y = 192;
	min_x = 51;
	max_x = 107;
	split_x = 96;
	plus_x = 104;
	plus_y = 166;
	var temp;

	for(var i = 0; i < 2; i++){		
		for(var j = 2; j < 8; j++){
			temp = eval("obj[" + i + "].TEMP" + j);
			temp = temp.split("/");
			$D.create("font").setPos(min_x + (plus_x * (j-2)) ,start_y).setSize(45,18).setFontSize(18).setAlign("right").setColor("#396493").setText(temp[0]).draw();
			$D.create("font").setPos(96 + (plus_x * (j-2)),start_y).setSize(10,18).setFontSize(18).setColor("#898989").setText("/").draw();			
			$D.create("font").setPos(max_x + (plus_x * (j-2)),start_y).setSize(45,18).setFontSize(18).setAlign("left").setColor("#9d3535").setText(temp[1]).draw();
		}
		start_y += plus_y;
	}
	
	
}

function drawColorKey() {
	ColorKeyDrawer.draw([[ColorKeyDrawer.RED, "주간예보"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
}

function save(){}
function load(){}

function prevPage(){
	current -= 1;
  	if(current < 1) current = total -1 ;
  	draw_fcs();
  	Dataarea();
  	ChangeData();	
}
function nextPage(){
	current += 1;
	if(current >= total) current = 0 ;
	draw_fcs();
	Dataarea();
	ChangeData();
}

$K.left(function(){
//	prevPage();	
});
$K.right(function(){
	//nextPage();
});
$K.back(function(){
	$H.back();
});
$K.blue(function(){
	$H.home();
});
$K.red(function(){
	$P.show("${ctxRoot}/weatherpopup.do",obj[0].WK_CONTENT);
});
function save(){}
function load(){}
</script>
</head>
<body>
<!-- ***** insert HTML ***** -->
</body>
</html>
