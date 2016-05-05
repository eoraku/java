<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
 <!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp" %>
<script type='text/javascript'>
//WW_TIME 발표시각
//WW_WTIME 특보발효현황시각
var obj1 = $.getJsonObj('${result1}');
var obj2 = $.getJsonObj('${result2}');
var obj3 = $.getJsonObj('${result3}');
/*
var obj1 = $.getJsonObj('[{"WW_WTIME":"2011-02-28 15:00","WW_TIME":"2011-02-28 13:00","WW_TITLE":"강풍주의보 해제","WW_WCONTENT":"o 풍랑주의보 : 동해전해상, 남해동부전해상<br />o 강풍주의보 : 울릉도독도","WW_CONTENTS":"(1)  강풍주의보 해제<br />  o 위 구역의 강풍주의보를 해제함.","WW_REMARK":"o 없음","WW_REGION":"(1) 강풍주의보 해제 : 경상북도(포항시, 경주시)","WW_ETIME":"(1) 강풍주의보 해제 : 2011년 02월 28일 10시 30분"}]');
var obj2 = $.getJsonObj('[{"WT_CP":"985","WT_SPDMAX":"27","WT_ATIME":"201102281500","WT_IMAGE":"a52b86c160ef9355767ee3b1f029ec47.jpg","WT_TSEQ":"2","WT_SPEED":"27","WT_DIRECTION":"W","WT_KNAME":"꼰선","CC_TYPHOON":"Y","WT_LOCATION":"중국 홍콩 남쪽 약 690 km 부근 해상"}]');
var obj3 = $.getJsonObj('[{"WP_TIME":"2011022723","WP_FILE":"2011022723.gif"},{"WP_TIME":"2011022800","WP_FILE":"2011022800.gif"},{"WP_TIME":"2011022801","WP_FILE":"2011022801.gif"},{"WP_TIME":"2011022802","WP_FILE":"2011022802.gif"},{"WP_TIME":"2011022804","WP_FILE":"2011022804.gif"},{"WP_TIME":"2011022805","WP_FILE":"2011022805.gif"},{"WP_TIME":"2011022806","WP_FILE":"2011022806.gif"},{"WP_TIME":"2011022807","WP_FILE":"2011022807.gif"},{"WP_TIME":"2011022808","WP_FILE":"2011022808.gif"},{"WP_TIME":"2011022810","WP_FILE":"2011022810.gif"},{"WP_TIME":"2011022811","WP_FILE":"2011022811.gif"},{"WP_TIME":"2011022812","WP_FILE":"2011022812.gif"}]');
*/
$D.create("img").setPath("${imgRoot}/weather/04-7_bg.png");
$D.create("img").setPath("${imgRoot}/common/st_02.png");

var direction = {"S":"남","SSE":"남남동","SSW":"남남서","SE":"남동","SW":"남서","E":"동","ESE":"동남동","ENE":"동북동","N":"북","NE":"북동","NNE":"북북동","NNW":"북북서","NW":"북서","W":"서","WSW":"서남서","WNW":"서북서"};

//태풍경로가 img가 없는 db
//var obj2 = [{"WT_CP":"985","WT_SPDMAX":"27","WT_ATIME":"201007151600","WT_IMAGE":"","WT_TSEQ":"2","WT_SPEED":"27","WT_DIRECTION":"W","WT_KNAME":"꼰선","WT_LOCATION":"중국 홍콩 남쪽 약 690 km 부근 해상"}];

//기상특보가 1page로 나오는 db
//var obj1 = [{"WW_WTIME":"2011-01-31 10:00","WW_TIME":"2011-01-31 10:00","WW_TITLE":"한파경보·한파주의보 해제·한파주의보 대치","WW_WCONTENT":"없음없음","WW_CONTENTS":"(1)  한파주의보 대치<br />(2)  한파경보 해제<br />  o 위 구역의 한파경보를 해제함.<br />(3)  한파주의보 해제<br />  o 위 구역의 한파주의보를 해제함.","WW_REMARK":"o 없음","WW_REGION":"(1) 한파주의보 대치 : 경기도(동두천시, 연천군, 포천시, 가평군, 양주시, 파주시, 남양주시), 강원도(강릉시산간, 속초시산간, 고성군산간, 양양군산간, 평창군평지, 평창군산간, 정선군평지, 횡성군, 철원군, 화천군, 홍천군평지, 홍천군산간, 춘천시, 양구군, 인제군평지, 인제군산간), 충청북도(괴산군, 제천시), 경상북도(봉화군평지, 봉화군산간)<br />(2) 한파경보 해제 : 경기도(고양시, 의정부시, 이천시, 여주군, 광주시, 양평군), 강","WW_ETIME":"(1) 한파주의보 대치 : 2011년 01월 31일 10시 00분<br />(2) 한파경보 해제 : 2011년 01월 31일 10시 00분<br />(3) 한파주의보 해제 : 2011년 01월 31일 10시 00분"}];

//기상특보- 특보가 일정 시간 사이에 있는 경우 db
//var obj1 = [{"WW_WTIME":"2012-01-31 10:00","WW_TIME":"2011-01-31 10:00","WW_TITLE":"한파경보·한파주의보 해제·한파주의보 대치","WW_WCONTENT":"없음없음","WW_CONTENTS":"(1)  한파주의보 대치<br />(2)  한파경보 해제<br />  o 위 구역의 한파경보를 해제함.<br />(3)  한파주의보 해제<br />  o 위 구역의 한파주의보를 해제함.","WW_REMARK":"o 없음","WW_REGION":"(1) 한파주의보 대치 : 경기도(동두천시, 연천군, 포천시, 가평군, 양주시, 파주시, 남양주시), 강원도(강릉시산간, 속초시산간, 고성군산간, 양양군산간, 평창군평지, 평창군산간, 정선군평지, 횡성군, 철원군, 화천군, 홍천군평지, 홍천군산간, 춘천시, 양구군, 인제군평지, 인제군산간), 충청북도(괴산군, 제천시), 경상북도(봉화군평지, 봉화군산간)<br />(2) 한파경보 해제 : 경기도(고양시, 의정부시, 이천시, 여주군, 광주시, 양평군), 강","WW_ETIME":"(1) 한파주의보 대치 : 2011년 01월 31일 10시 00분<br />(2) 한파경보 해제 : 2011년 01월 31일 10시 00분<br />(3) 한파주의보 해제 : 2011년 01월 31일 10시 00분"}];
/*
var obj1 = [];
obj1[0] = "";
*/
/*
var obj2 = [];
obj2[0] = "";
*/

var tab = [];
var cloudThread = null;

function init(){
	if ("${rCode}" == "100") {
		drawBg();
		drawTab();
		drawTextArea();
	}
	return "${rCode}";
}

function drawBg(){
	$D.create("img").setPath("${imgRoot}/weather/04-7_bg.png").setPos(0, 0).setSize(720, 434).draw();
	//$D.create("img").setPath("${imgRoot}/common/st_02.png").setPos(44, 25).draw();
	//$D.create("font").setText("날씨 |").setPos(78, 30).setFontSize(18).setColor("#0e3c5d").draw();
	//$D.create("font").setId("title").setText("기상특보").setPos(135, 30).setFontSize(18).setColor("#0e3c5d").draw();
	ColorKeyDrawer.draw([[ColorKeyDrawer.YELLOW, "이전항목"], [ColorKeyDrawer.GREEN, "다음항목"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
}


function drawTab() {
	var tabTitle = ["기상특보", "위성사진", "태풍정보", "태풍경로"];
	var xs = 158;		// tab x좌표 간격

	menu = new NaviEvent();
	
	for ( var i = 0; i < tabTitle.length; i++) {
		var on = $D.create("div").setPos(46, 54).setSize(156, 48).setDepth(2);
		$D.create("img").setPath("${imgRoot}/weather/tap_fcs.png").setPos(0+(i*xs), 0).draw(on);
		$D.create("font").setText(tabTitle[i]).setPos(23+(i*xs), 15).setColor("#f0f0f0").setFontSize(19).setSize(110,20).setAlign("center").draw(on);
		
		var off = $D.create("div").setPos(46, 54).setSize(156, 48).setDepth(1);
		$D.create("font").setText(tabTitle[i]).setPos(23+(i*xs), 15).setColor("#3c3c3c").setFontSize(19).setSize(110,20).setAlign("center").draw(off);
		menu.addItem(new NaviItem(on, changeTabEvent), new NaviItem(off, changeTabEvent));
	}
	menu.setRolling(true);
	menu.start();
}


function drawTextArea() {
	var titles = [];
	var values = [];

	//기상특보 div
	var div1 = $D.create("div").setPos(65, 163).setHidden(false).setSize(600, 210).draw();	//특보현황
	$D.create("img").setId("nullSpecialImg").setPos(287, 19).draw(div1);
	$D.create("font").setId("nullSpecialFont").setPos(4, 70).setColor("#3c3c3c").setFontSize(20).setSize(584, 20).setAlign("center").draw(div1);	//태풍경로 이미지가 없을 때 

	//태풍정보 div
	var div2 = $D.create("div").setPos(65, 163).setHidden(false).setSize(600, 210).draw();	//태풍정보
	$D.create("img").setId("nullInfoImg").setPos(287, 19).draw(div2);
	$D.create("font").setId("nullInfoFont").setPos(4, 70).setColor("#3c3c3c").setFontSize(20).setSize(584, 20).setAlign("center").draw(div2);	//태풍경로 이미지가 없을 때 

	//태풍경로 div
	var div3 = $D.create("div").setId("typhoonPath").setPos(179, 103).setHidden(false).setSize(300, 300).draw();	//태풍경로
	$D.create("img").setId("nullPathImg").setPos(173, 79).draw(div3);
	$D.create("font").setId("nullPathFont").setPos(-110, 130).setColor("#3c3c3c").setFontSize(20).setSize(584, 20).setAlign("center").draw(div3);	//태풍경로 이미지가 없을 때 

	$D.create("img").setId("pathbg").setPos(0, 0).draw(div3);
	$D.create("img").setId("pathimg").setPos(0, 0).setSize(362, 281).draw(div3);

	//위성사진 div
	var div4 = $D.create("div").setId("cloud").setPos(217, 103).setHidden(false).setSize(500, 300).draw();	//위성사진
	$D.create("img").setId("cloudbg").setPos(0, 0).draw(div4);
	$D.create("img").setId("cloudimg").setPos(5, 2).setSize(277, 277).draw(div4);
	
	var bg = $D.create("div").setId("cloudbg").setPos(0, 251).setSize(287, 30).draw(div4);
	bg.style.backgroundColor = "#000000";	
	bg.style.opacity = "0.5";
	
	if(obj3.length > 0){
		var durationTime = "";
		durationTime += obj3[0].WP_TIME.substring(0, 4) + "_";
		durationTime += obj3[0].WP_TIME.substring(4, 6) + "_";
		durationTime += obj3[0].WP_TIME.substring(6, 8) + "&nbsp;";
		durationTime += obj3[0].WP_TIME.substring(8, 10) + ":00";
		$D.create("font").setId("cloudContent").setText(durationTime).setPos(0, 258).setSize(287, 30).setColor("#eafa5b").setFontSize(16).setAlign("center").setDepth(100).draw(div4);
	}

	//line과 기상특보&태풍정보 title을 나타내는 div
	var titlediv = $D.create("div").setId("titlediv").setHidden(false).setPos(53, 100).draw();	//특보현황, 태중정보에서 title, line 위한 div
	$D.create("font").setId("name1").setPos(19, 11).setSize(584, 26).setColor("#205879").setFontSize(23).setAlign("center").draw(titlediv);
	$D.create("font").setId("name2").setPos(19, 11).setSize(584, 26).setColor("#205879").setFontSize(23).setAlign("center").draw(titlediv);
	$D.create("img").setPath("${imgRoot}/weather/04-7_line.png").setPos(0, 46).draw(titlediv);

	//scroll 위-아래 화살표
	$D.create("img").setId("up").setPos(645, 156).setPath("${imgRoot}/common/scr_up.png").draw();
	$D.create("img").setId("down").setPos(645, 359).setPath("${imgRoot}/common/scr_down.png").draw();

	ta = new TextArea(0, 0, 580, 200);		//기상특보 textArea
	ta2 = new TextArea(0, 0, 580, 200);		//태풍정보 textArea

	tab[0] = div1;
	tab[1] = div4;
	tab[2] = div2;
	tab[3] = div3;
	
	ta.appendArea(div1);
	ta2.appendArea(div2);

	drawTyphoonInfo();		//태풍정보
	drawTyphoonPath();		//태풍경로
	drawCloud();			//위성사진
	drawSpecial();			//기상특보

	div2.setHidden(true);
	div3.setHidden(true);
	div4.setHidden(true);

	scroll = new Scroll(651, 177, 8, 182, "#acacac", "#5e487d");	//기상특보 scroll 생성
	scroll2 = new Scroll(651, 177, 8, 182, "#acacac", "#5e487d");	//태풍정보 scroll 생성

	scroll.setTotalCnt(ta.getTotalCnt());
	scroll2.setTotalCnt(ta2.getTotalCnt());

	scroll2.hide();

	if(obj2[0] == "" || obj2[0] == null || obj2[0].CC_TYPHOON == "N"){	//태풍정보 정보가 없을 경우
	//if(obj2[0] == "" || obj2[0] == null){	//태풍정보 정보가 없을 경우
		scroll2.hide();
	}

	if(obj1[0] == "" || obj1[0] == null){		// 기상특보 정보가 없을 경우
		scroll.hide();
	}else{
		drawAllHidden(false);
		$D.get("name1").setHidden(false);
		scroll.show();
		
		if(ta.getTotalCnt() == 1)		//기상특보가 1페이지 일경우 scroll 비활성화
		{
			scroll.hide();
			$D.get("up").setHidden(true);
			$D.get("down").setHidden(true);
		}
	}
}

//현재시간이 ww_time과 ww_wtime 사이에 있을 때
function betweenTime(){
	$D.get("name1").setText("\"특보현황 : " + obj1[0].WW_TIME + " 발표\"");
	$D.get("name2").setHidden(true);
	
	var fontTitle1 = $D.create("font").setText("&nbsp;&nbsp;&nbsp;발효시각").setColor("#3c3c3c").setFontSize(18);
	var fontTitle2 = $D.create("font").setText("&nbsp;&nbsp;&nbsp;해당구역").setColor("#3c3c3c").setFontSize(18);
	var fontTitle3 = $D.create("font").setText("&nbsp;&nbsp;&nbsp;내용").setColor("#3c3c3c").setFontSize(18);

	var fontValue1 = $D.create("font").setText(obj1[0].WW_ETIME).setColor("#476f2d").setFontSize(18);
	var fontValue2 = $D.create("font").setText(obj1[0].WW_REGION).setColor("#476f2d").setFontSize(18);
	var fontValue3 = $D.create("font").setText(obj1[0].WW_CONTENTS).setColor("#476f2d").setFontSize(18);

	ta.inserSimbol("${imgRoot}/weather/bullet.png", 0, 3);
	ta.insertText(fontTitle1);	//발효시각
	ta.insertLine(5);
	ta.insertText(fontValue1);
	ta.insertLine();
	
	ta.inserSimbol("${imgRoot}/weather/bullet.png", 0, 3);
	ta.insertText(fontTitle2);	//해당구역
	ta.insertLine(5);
	ta.insertText(fontValue2);
	ta.insertLine();

	ta.inserSimbol("${imgRoot}/weather/bullet.png", 0, 3);
	ta.insertText(fontTitle3);	//내용
	ta.insertLine(5);
	ta.insertText(fontValue3);
}


//현재시간이 ww_wtime 이후 일 때
function overTime(){
	$D.get("name1").setText("\"특보현황 : " + obj1[0].WW_WTIME + " 이후\"");
	$D.get("name2").setHidden(true);
	
	ta.inserSimbol("${imgRoot}/weather/bullet.png", 0, 3);
	var fontTitle1 = $D.create("font").setText("&nbsp;&nbsp;&nbsp;내용").setColor("#3c3c3c").setFontSize(18);
	var fontValue1 = $D.create("font").setText(obj1[0].WW_WCONTENT).setColor("#476f2d").setFontSize(18);
	ta.insertText(fontTitle1);
	ta.insertText(fontValue1);
	ta.insertLine();

	ta.inserSimbol("${imgRoot}/weather/bullet.png", 0, 3);
	var fontTitle2 = $D.create("font").setText("&nbsp;&nbsp;&nbsp;참고사항").setColor("#3c3c3c").setFontSize(18);
	ta.insertText(fontTitle2);

	var fontValue2 = $D.create("font").setText(obj1[0].WW_REMARK).setColor("#476f2d").setFontSize(18);
	ta.insertText(fontValue2);
}


function time(){		// 현재 시간과 DB 시간 비교
	//ww_wtime
	var time1 = obj1[0].WW_WTIME;
	var year1 = time1.substring(0, 4);
	var month1 = time1.substring(5, 6);

	if(month1 == 0){		// 01월 ~ 09월 -> 앞자리 0	
		month1 = parseInt(time1.substring(6, 7));
		month1 = month1 - 1;
	}
	else if(month1 == 1){	// 10월 ~ 12월 -> 앞자리 1
		month1 = parseInt(time1.substring(6, 7));
		month1 = month1 + 9;
	}
	var date1 = time1.substring(8, 10);
	var hour1 = time1.substring(11,13);		//시
	var minute1 = time1.substring(14,16);	//분


	//ww_time
	var time2 = obj1[0].WW_TIME;
	var year2 = time2.substring(0, 4);
	var month2 = time2.substring(5, 6);

	if(month2 == 0){		// 01월 ~ 09월 -> 앞자리 0	
		month2 = parseInt(time2.substring(6, 7));
		month2 = month2 - 1;
	}
	else if(month2 == 1){	// 10월 ~ 12월 -> 앞자리 1
		month2 = parseInt(time2.substring(6, 7));
		month2 = month2 + 9;
	}
	
	var date2 = time2.substring(8, 10);
	var hour2 = time2.substring(11,13);		//시
	var minute2 = time2.substring(14,16);	//분
	
	//시간 객체 생성
	now = new Date();		//현재 시간
	dbtime = new Date();	//db 시간 - ww_wtime
	dbtime2 = new Date();	//db 시간 - ww_time

	//db에 있는 시간 값들을 생성한 시간 객체에 넣는다.
	dbtime.setFullYear(year1);
	dbtime.setMonth(month1);
	dbtime.setDate(date1);
	dbtime.setHours(hour1);
	dbtime.setMinutes(minute1);


	dbtime2.setFullYear(year2);
	dbtime2.setMonth(month2);
	dbtime2.setDate(date2);
	dbtime2.setHours(hour2);
	dbtime2.setMinutes(minute2);

	if(((dbtime.getTime() - now.getTime()) >=0 ) && ( (dbtime2.getTime() - now.getTime()) <= 0 ) ){
		betweenTime();
	}
	else if((now.getTime() - dbtime.getTime()) >= 0){
		overTime();
	}
	else{
		betweenTime();		
	}
}



function special2() {
	var special2Title = "";
	special2Title += "제 " + obj2[0].WT_TSEQ + "호 태풍 " + obj2[0].WT_KNAME;
	special2Title += "&nbsp;("; 
	special2Title += obj2[0].WT_ATIME.substring(0, 4) + "-";
	special2Title += obj2[0].WT_ATIME.substring(4, 6) + "-";
	special2Title += obj2[0].WT_ATIME.substring(6, 8) + "&nbsp;";
	special2Title += obj2[0].WT_ATIME.substring(8, 10) + ":";
	special2Title += obj2[0].WT_ATIME.substring(10, 12);
	special2Title += " 발표)"; 
	$D.get("name2").setText(special2Title);


	//$D.get("name2").setText("제 " + obj2[0].WT_TSEQ + "호 태풍 " + obj2[0].WT_KNAME);

	var fontTitle3 = $D.create("font").setText("&nbsp;&nbsp;&nbsp;현재위치 : " + obj2[0].WT_LOCATION).setColor("#3c3c3c").setFontSize(18);
	var fontTitle1 = $D.create("font").setText("&nbsp;&nbsp;&nbsp;이동방향 : " + direction[obj2[0].WT_DIRECTION]).setColor("#3c3c3c").setFontSize(18);
	var fontTitle2 = $D.create("font").setText("&nbsp;&nbsp;&nbsp;진행속도 : " + obj2[0].WT_SPEED + " km/h").setColor("#3c3c3c").setFontSize(18);
	var fontTitle4 = $D.create("font").setText("&nbsp;&nbsp;&nbsp;중심기압 : " + obj2[0].WT_CP + " hpa").setColor("#3c3c3c").setFontSize(18);
	var fontTitle5 = $D.create("font").setText("&nbsp;&nbsp;&nbsp;최대풍속 : " + obj2[0].WT_SPDMAX + " m/s").setColor("#3c3c3c").setFontSize(18);
	
	/*
	var fontTitle6 = $D.create("font").setText("&nbsp;&nbsp;&nbsp;특보발표현황 ").setColor("#3c3c3c").setFontSize(18);
	var fontTitle7 = $D.create("font").setText("&nbsp;&nbsp;&nbsp;참고사항 ").setColor("#3c3c3c").setFontSize(18);


	//기상특보 DB(obj1)의 특보발표현황 정보가 없는 경우
	if(obj1[0] == "" || obj1[0] == null || obj1[0].WW_WCONTENT == "" || obj1[0].WW_WCONTENT == null)
		var fontTitle61 = $D.create("font").setText("정보없음").setColor("#3c3c3c").setFontSize(18);
	else
		var fontTitle61 = $D.create("font").setText(obj1[0].WW_WCONTENT).setColor("#3c3c3c").setFontSize(18);

	
	//기상특보 DB(obj1)의 참고사항 정보가 없는 경우
	if(obj1[0] == "" || obj1[0] == null || obj1[0].WW_REMARK == "" || obj1[0].WW_REMARK == null)
		var fontTitle71 = $D.create("font").setText("정보없음").setColor("#3c3c3c").setFontSize(18);
	else
		var fontTitle71 = $D.create("font").setText(obj1[0].WW_REMARK).setColor("#3c3c3c").setFontSize(18);
	*/
	
	//현재위치
	ta2.inserSimbol("${imgRoot}/weather/bullet.png", 0, 3);
	ta2.insertText(fontTitle3);
	ta2.insertLine();
	//이동방향
	ta2.inserSimbol("${imgRoot}/weather/bullet.png", 0, 3);	
	ta2.insertText(fontTitle1); 
	ta2.insertLine();
	//진행속도
	ta2.inserSimbol("${imgRoot}/weather/bullet.png", 0, 3);
	ta2.insertText(fontTitle2);
	ta2.insertLine();
	//중심기압
	ta2.inserSimbol("${imgRoot}/weather/bullet.png", 0, 3);
	ta2.insertText(fontTitle4);
	ta2.insertLine();
	//최대풍속
	ta2.inserSimbol("${imgRoot}/weather/bullet.png", 0, 3);
	ta2.insertText(fontTitle5);
	/*
	ta2.insertLine();
	//특보발표현황
	ta2.inserSimbol("${imgRoot}/weather/bullet.png", 0, 3);
	ta2.insertText(fontTitle6);
	ta2.insertText(fontTitle61);
	ta2.insertLine();
	
	//경계사항(참고사항)
	ta2.inserSimbol("${imgRoot}/weather/bullet.png", 0, 3);
	ta2.insertText(fontTitle7);
	ta2.insertText(fontTitle71);
	*/
}


function typhoonTime(){
	var year = obj2[0].WT_ATIME.substring(0, 4);	//년
	var month = obj2[0].WT_ATIME.substring(4, 6);	//월

	/*
	if(month == 0){		// 01월 ~ 09월 -> 앞자리 0	
		month = parseInt(obj2[0].WT_ATIME.substring(5, 6));
		month = month - 1;
	}
	else if(month == 1){	// 10월 ~ 12월 -> 앞자리 1
		month = parseInt(obj2[0].WT_ATIME.substring(5, 6));
		month = month + 9;
	}
*/

	var date = obj2[0].WT_ATIME.substring(6, 8);	//일
	var hour = obj2[0].WT_ATIME.substring(8, 10);	//시
	var minute = obj2[0].WT_ATIME.substring(10, 12);	//분
	
	now = new Date();		//현재 시간
	now.setMonth(now.getMonth()+1, now.getDate()); //Month 0부터 시작하기에 +1 시켰음
	typhoontime = new Date();

	typhoontime.setFullYear(year, month, date);
	typhoontime.setHours(hour, minute, 0, 0);
	
	/*
	var y = typhoontime.getFullYear();
	var mth = typhoontime.getMonth();
	var d = typhoontime.getDate();
	var h = typhoontime.getHours();
	var m = typhoontime.getMinutes();
	$D.create("font").setText(y + "년     "+ mth +"월     " + d + "일     " + h + "시    " + m + "분   ").setColor("#3c3c3c").setPos(0, 0).setFontSize(18).draw();
	*/
	
	if((now.getTime() - typhoontime.getTime()) >= 48*1000*60*60){		// millisecond => hour로 변환
	//	drawTyphoonNull();
		return true;
	}
	else 
//		special2();	
		return false;
}


function changeTabEvent() {
	if(menu.getIndex() == "1") {
		ColorKeyDrawer.draw([[ColorKeyDrawer.RED, "다시보기"], [ColorKeyDrawer.YELLOW, "이전항목"], [ColorKeyDrawer.GREEN, "다음항목"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
		drawCloud();
	} else {
		clearInterval(cloudThread);
		cloudThread = null;
		if(obj3.length>0)
			$D.get("cloudimg").setPath("${serverRoot}/cloud/" + obj3[0].WP_FILE);
		else
			$D.get("cloudimg").setPath("${imgRoot}/weather/no_photo.png");
		ColorKeyDrawer.draw([[ColorKeyDrawer.YELLOW, "이전항목"], [ColorKeyDrawer.GREEN, "다음항목"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
	}
	for ( var i = 0; i < tab.length; i++) {
		if(i == menu.getIndex()) {
			tab[i].setHidden(false);
		} else {
			tab[i].setHidden(true);
		}
	}
	showHide();		//tab 바뀔때마다 showHide()함수 호출
}


//title과 scroll 화살표를 지우는 함수
function drawAllHidden(value){		
	$D.get("titlediv").setHidden(value);
	$D.get("up").setHidden(value);
	$D.get("down").setHidden(value);
}



//기상특보
function drawSpecial() {
	if(obj1[0] == "" || obj1[0] == null){		//기상특보 정보가 없을 경우
		drawAllHidden(true);
		$D.get("nullSpecialImg").setPath("${imgRoot}/weather/info_icon.png");
		$D.get("nullSpecialFont").setText("현재 발표된 기상특보가 없습니다");
	}else{
		time();
	}
}


//태풍정보
function drawTyphoonInfo() {
	if(obj2[0] == "" || obj2[0] == null || typhoonTime() == true || obj2[0].CC_TYPHOON == "N"){	//태풍정보가 없고 48시간 이상일 경우
			drawTyphoonNull();
	}
/*
	else if(typhoonTime() == true){
		$D.get("nullInfoFont").setText("현재 활동 중인 태풍정보가 없습니다......48이상!");
		drawAllHidden(true);
	}
*/
	else{
		special2();
	}
}


function drawTyphoonNull(){
	drawAllHidden(true);
	$D.get("nullInfoImg").setPath("${imgRoot}/weather/info_icon.png");
	$D.get("nullInfoFont").setText("현재 태풍정보가 없습니다");
}


//태풍 경로
function drawTyphoonPath() {		
	if(obj2[0] == "" || obj2[0] == null || typhoonTime() == true || obj2[0].CC_TYPHOON == "N" || obj2[0].WT_IMAGE == ""){	//태풍정보가 없을 때 or 태풍경로 이미지가 없을 때 or 48시간 이상일 떄
		$D.get("pathimg").setPath("${serverRoot}/typhoon/t0.jpg");
		//$D.get("pathimg").setPath("${serverRoot}/gather/typhoons/t0.jpg");
	}else{		
		$D.get("pathbg").setPath("${imgRoot}/weather/typhoon_bg.png");
		$D.get("pathimg").setPath("${serverRoot}/typhoon/" + obj2[0].WT_IMAGE);
	}
}

//위성사진
/*
 function drawCloud(){
	$D.get("cloudbg").setPath("${imgRoot}/weather/satellite_bg.png");
	$D.get("cloudimg").setPath("${serverRoot}/cloud/" + obj3[0].WP_FILE);
	setInterval(function(){
		obj3.push(obj3.shift());
		$D.get("cloudimg").setPath("${serverRoot}/cloud/" + obj3[0].WP_FILE);
		var durationTime = "";
		durationTime += obj3[0].WP_TIME.substring(0, 4) + "_";
		durationTime += obj3[0].WP_TIME.substring(4, 6) + "_";
		durationTime += obj3[0].WP_TIME.substring(6, 8) + "&nbsp;";
		durationTime += obj3[0].WP_TIME.substring(8, 10) + ":00";
		$D.get("cloudContent").setText(durationTime);
	}, 1000);	
}
*/

function drawCloud(){
	clearInterval(cloudThread);
	cloudThread = null;
	$D.get("cloudbg").setPath("${imgRoot}/weather/satellite_bg.png");
	
	if(obj3.length>0){
		$D.get("cloudimg").setPath("${serverRoot}/cloud/" + obj3[0].WP_FILE);
		var durationTime = "";
		durationTime += obj3[0].WP_TIME.substring(0, 4) + "_";
		durationTime += obj3[0].WP_TIME.substring(4, 6) + "_";
		durationTime += obj3[0].WP_TIME.substring(6, 8) + "&nbsp;";
		durationTime += obj3[0].WP_TIME.substring(8, 10) + ":00";
		$D.get("cloudContent").setText(durationTime);
	
		var imgCnt = 1;
		cloudThread = setInterval(function(){
			$D.get("cloudimg").setPath("${serverRoot}/cloud/" + obj3[imgCnt].WP_FILE);
			var durationTime = "";
			durationTime += obj3[imgCnt].WP_TIME.substring(0, 4) + "_";
			durationTime += obj3[imgCnt].WP_TIME.substring(4, 6) + "_";
			durationTime += obj3[imgCnt].WP_TIME.substring(6, 8) + "&nbsp;";
			durationTime += obj3[imgCnt].WP_TIME.substring(8, 10) + ":00";
			$D.get("cloudContent").setText(durationTime);
			imgCnt++;
			if(imgCnt == obj3.length) {
				clearInterval(cloudThread);
				cloudThread = null;
			}
		}, 1000);
	}
}


function showHide() {		//페이지 넘어갈 때 마다 show, hide 처리하는 함수.
	//기상특보일때
	if(menu.getIndex() == 0){		
		if(obj1[0] == "" || obj1[0] == null){
			scroll.hide();
			scroll2.hide();
			drawAllHidden(true);
		}else{
			scroll.show();
			scroll2.hide();
			drawAllHidden(false);
			$D.get("name1").setHidden(false);
			$D.get("name2").setHidden(true);


			//기상특보가 1페이지 일경우 scroll 비활성화
			if(ta.getTotalCnt() == 1){
				scroll.hide();
				$D.get("up").setHidden(true);
				$D.get("down").setHidden(true);
			}
		}
		$D.get("title").setText("기상특보");
	}
	//위성사진
	else if(menu.getIndex() == 1){		
		scroll.hide();
		scroll2.hide();
		drawAllHidden(true);
		$D.get("title").setText("위성사진");
	}

	//태풍정보
	else if(menu.getIndex() == 2){
		if(obj2[0] == "" || obj2[0] == null || typhoonTime() == true || obj2[0].CC_TYPHOON == "N"){
			scroll.hide();
			scroll2.hide();
			drawAllHidden(true);
		}else{
			scroll.hide();
			scroll2.show();
			drawAllHidden(false);
			
			$D.get("name1").setHidden(true);
			$D.get("name2").setHidden(false);

			//태풍정보가 1페이지 일경우 scroll 비활성화
			if(ta2.getTotalCnt() == 1){
				scroll2.hide();
				$D.get("up").setHidden(true);
				$D.get("down").setHidden(true);
			}
		}
		$D.get("title").setText("태풍정보");
	}

	//태풍경로
	else if(menu.getIndex() == 3){	
		scroll.hide();
		scroll2.hide();
		drawAllHidden(true);
		$D.get("title").setText("태풍경로");
	}
}

function save(){}
function load(){}

$K.left(function() {
	menu.selectPrevItem();
	changeTabEvent();
});
$K.right(function() {
	menu.selectNextItem();
	changeTabEvent();
});
$K.yellow(function() {
	menu.selectPrevItem();
	changeTabEvent();
});
$K.green(function() {
	menu.selectNextItem();
	changeTabEvent();
});

$K.up(function() {
	if(menu.getIndex() == 0){	//기상특보
		scroll.up();
		ta.up();
	 }else if(menu.getIndex() == 2){ 	//태풍정보
		scroll2.up();
		ta2.up();
	}
});

$K.down(function() {
	if(menu.getIndex() == 0){	//기상특보
		scroll.down();
		ta.down();
	}else if(menu.getIndex() == 2){ 	//태풍정보
		scroll2.down();
		ta2.down();
	}
});


//enter 치면 내용 바뀔 경우는 enter에 있는 changeTabEvent 주석 없애고, left, right 주석 처리!
$K.enter(function(){		
//	changeTabEvent();		
});


$K.red(function() {
	if(menu.getIndex() == "1" && cloudThread == null) {
		drawCloud();
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
