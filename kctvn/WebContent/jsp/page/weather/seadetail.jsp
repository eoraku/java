<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp"%>
<script type='text/javascript'>
	//로딩 보장
	data = $.getJsonObj('${result}');
	$D.create("img").setPath("${imgRoot}/weather/04-2-1_bg.png");
	$D.create("img").setPath("${imgRoot}/common/st_02.png");
	$D.create("img").setPath("${imgRoot}/common/w_icon_m/"+data[0]["WN_RAINF"]+data[0]["WN_FORECAST"]+".png");
	$D.create("img").setPath("${imgRoot}/common/w_icon_m/"+data[0]["WN_RAINF"]+data[1]["WN_FORECAST"]+".png");
	$D.create("img").setPath("${imgRoot}/common/w_icon_m/"+data[0]["WN_RAINF"]+data[2]["WN_FORECAST"]+".png");
	$D.create("img").setPath("${imgRoot}/common/w_icon_m/"+data[0]["WN_RAINF"]+data[3]["WN_FORECAST"]+".png");
	/*
	"WN_WTRAND" : "1", //'풍향연결코드
	"WN_WHEN" : "3", //'발표번호
	"WN_WINDB" : "N", //'풍향2
	"WN_WHEIGHT" : "1-2", //'파고
	"WN_RAINF" : "0", //'강수형태
	"WN_WINDA" : "NW", //'풍향1
	"WN_TIME" : "201101241700", //'발표시각
	"WN_FORECAST" : "3", //'날씨코드
	"WN_WSPEED" : "8-12" //'풍속
	*/
	/*
	23:00 ~ 04:59
	  0 오늘 오후
	  1 내일 오전
	  2 내일 오후
	  3 모레 오전
	05:00 ~ 10:59
	  0 오늘 오전
	  1 오늘 오후
	  2 내일 오전
	  3 내일 호후
	11:00 ~ 22:59
	  0 오늘 오후
	  1 내일 오전
	  2 내일 오후
	  3 모레 오전
	*/

	//페이지 타이틀
	var pageTitle;
	//페이지 순번
	var pageIdx;
	//페이지 리스트
	var pageList;
	// 페이지 정보 타입
	var type; 
	// 참조 데이터
	var refData={
			"AM":{"DAY":["오늘","내일"],"TIME":["오전","오후","오전","오후"]},
			"PM":{"DAY":["오늘","내일","모레"],"TIME":["오후","오전","오후","오전"]}, 
			"DAWN":{"DAY":["오늘","내일","모레"],"TIME":["오후","오전","오후","오전"]},
			"DIRECTION":{"S":"남","SSE":"남남동","SSW":"남남서","SE":"남동","SW":"남서","E":"동","ESE":"동남동","ENE":"동북동","N":"북","NE":"북동","NNE":"북북동","NNW":"북북서","NW":"북서","W":"서","WSW":"서남서","WNW":"서북서"}
			};
	function init(args) {
		if ("${rCode}" == "100") {
			pageTitle = args.title;
			pageIdx = args.idx;
			pageList = args.list;

			var announceTime = parseInt(data[0]["WN_TIME"].substring(8, 10),10);
			if(announceTime >= 5 &&  announceTime < 11){ //05:00~10:59
				type="AM";
			}else if(announceTime >= 11 &&  announceTime < 23){ //11:00~22:59
				type="PM";
			}else{//23:00~04:59
				type="DAWN";
			}
			
			drawBg();
			drawFix();
			drawLine();
			createTimeColum();
			createDayColum();
			drawDiv();
			drawColorKey();
			repaint();
		}
		return "${rCode}";
	}

	function repaint(){
			vibleLine();
			setTimeColumdata();
			setDayColumdata();
			insertData();
			setTitle();
	}
	
	function setTitle(){
		$D.get("area").setText(pageTitle);
	}
	
	function drawBg() {
		$D.create("img").setPos(0, 0).setSize(720, 434).setPath("${imgRoot}/weather/04-2-1_bg.png").draw();
		//$D.create("img").setPos(44, 25).setPath("${imgRoot}/common/st_02.png").draw();
		//$D.create("font").setPos(78, 30).setFontSize(18).setColor("#0e3c5d").setText("날씨 | 해상  | 상세예보").draw();
		$D.create("img").setPos(125, 102).setSize(2, 286).setPath("${imgRoot}/common/line_l.png").draw();
	}

	function vibleLine(){
		if(refData[type]["DAY"].length == 3){
			$D.get("line01").setHidden(false);
			$D.get("line02").setHidden(false);
			$D.get("line03").setHidden(false);
			$D.get("line11").setHidden(true);
			$D.get("line12").setHidden(true);
			$D.get("line13").setHidden(true);
		}else{
			$D.get("line01").setHidden(true);
			$D.get("line02").setHidden(true);
			$D.get("line03").setHidden(true);
			$D.get("line11").setHidden(false);
			$D.get("line12").setHidden(false);
			$D.get("line13").setHidden(false);
		}
	}
	
	function drawLine(){
		//refData[type]["DAY"].length == 3
		$D.create("img").setId("line01").setPos(393, 131).setSize(2, 257).setPath("${imgRoot}/common/line_s.png").setHidden(true).draw();
		$D.create("img").setId("line02").setPos(259, 102).setSize(2, 286).setPath("${imgRoot}/common/line_l.png").setHidden(true).draw();
		$D.create("img").setId("line03").setPos(527, 102).setSize(2, 286).setPath("${imgRoot}/common/line_l.png").setHidden(true).draw();

		//refData[type]["DAY"].length == 2
		$D.create("img").setId("line11").setPos(393, 102).setSize(2, 286).setPath("${imgRoot}/common/line_l.png").setHidden(true).draw();
		$D.create("img").setId("line12").setPos(259, 131).setSize(2, 257).setPath("${imgRoot}/common/line_s.png").setHidden(true).draw();
		$D.create("img").setId("line13").setPos(527, 131).setSize(2, 257).setPath("${imgRoot}/common/line_s.png").setHidden(true).draw();
	} 

	function drawFix() {
		//왼쪽 컬럼
		$D.create("font").setPos(50, 109).setSize(72, 25).setAlign("center").setFontSize(16).setColor("#828282").setText("날짜").draw();
		$D.create("font").setPos(50, 141).setSize(72, 25).setAlign("center").setFontSize(16).setColor("#828282").setText("시간").draw();
		$D.create("font").setPos(50, 205).setSize(72, 37).setAlign("center").setFontSize(16).setColor("#828282").setText("날씨").draw();
		$D.create("font").setPos(50, 266).setSize(72, 25).setAlign("center").setFontSize(16).setColor("#828282").setText("풍향").draw();
		$D.create("font").setPos(50, 298).setSize(72, 37).setAlign("center").setFontSize(16).setColor("#828282").setText("풍속").draw();
		$D.create("font").setPos(50, 318).setSize(72, 37).setAlign("center").setFontSize(16).setColor("#828282").setText("(m/s)").draw();
		$D.create("font").setPos(50, 346).setSize(72, 37).setAlign("center").setFontSize(16).setColor("#828282").setText("파고").draw();
		$D.create("font").setPos(50, 366).setSize(72, 37).setAlign("center").setFontSize(16).setColor("#828282").setText("(m)").draw();
	}

	function createTimeColum(){//상단 컬럼
		for(var i=0; i < refData[type]["TIME"].length; i++){
			$D.create("font").setId("time"+i).setPos(125+(i*134), 141).setSize(134, 25).setFontSize(16).setAlign("center").setColor("#828282").draw();
		}
	}

	function setTimeColumdata(){
		for(var i=0; i < refData[type]["TIME"].length; i++){
			$D.get("time"+i).setText(refData[type]["TIME"][i]);
		}
	}
	
	function createDayColum(){
		$D.create("font").setId("day0").setFontSize(16).setAlign("center").setColor("#828282").draw();
		$D.create("font").setId("day1").setFontSize(16).setAlign("center").setColor("#828282").draw();
		$D.create("font").setId("day2").setFontSize(16).setAlign("center").setColor("#828282").draw();
	}

	function setDayColumdata(){
		if(refData[type]["DAY"].length == 2){
			$D.get("day0").setPos(125, 109).setSize(268, 25).setText(refData[type]["DAY"][0]);
			$D.get("day1").setPos(393, 109).setSize(268, 25).setText(refData[type]["DAY"][1]);
			$D.get("day2").style.display="none";
		}else{
			$D.get("day0").setPos(125, 109).setSize(134, 25).setText(refData[type]["DAY"][0]);
			$D.get("day1").setPos(259, 109).setSize(268, 25).setText(refData[type]["DAY"][1]);
			$D.get("day2").setPos(527, 109).setSize(134, 25).setText(refData[type]["DAY"][2]);
			$D.get("day2").style.display="block";
		}
	}
	
	function drawDiv() {
		//상단 표시줄 영역지정
		var area = $D.create("font").setId("area").setPos(47, 69).setSize(626, 42).setFontSize(20).setColor("#f0f0f0").setAlign("center").setText("??????").draw();

		//날씨아이콘 영역지정
		var today_weather = $D.create("img").setId("today_weather").setPos(159, 179).setSize(70, 55).draw(); //샘플
		var tommr_weather_m = $D.create("img").setId("tommr_weather_m").setPos(295, 179).setSize(70, 55).draw();
		var tommr_weather_a = $D.create("img").setId("tommr_weather_a").setPos(431, 179).setSize(70, 55).draw();
		var after_weather = $D.create("img").setId("after_weather").setPos(567, 179).setSize(70, 55).draw();

		//풍향영역지정
		var wd_to = $D.create("font").setId("wd_to").setFontSize(18).setColor("#323232").setSize(134, 25).setAlign("center").setPos(125, 264).draw();
		var wd_tm_m = $D.create("font").setId("wd_tm_m").setFontSize(18).setColor("#323232").setSize(134, 25).setAlign("center").setPos(259, 264).draw();
		var wd_tm_a = $D.create("font").setId("wd_tm_a").setFontSize(18).setColor("#323232").setSize(134, 25).setAlign("center").setPos(393, 264).draw();
		var wd_a = $D.create("font").setId("wd_a").setFontSize(18).setColor("#323232").setSize(134, 25).setAlign("center").setPos(527, 264).draw();

		//풍속영역지정
		var ws_to = $D.create("font").setId("ws_to").setFontSize(26).setColor("#205879").setSize(134, 25).setAlign("center").setPos(125, 303).draw();
		var ws_tm_m = $D.create("font").setId("ws_tm_m").setFontSize(26).setColor("#205879").setSize(134, 25).setAlign("center").setPos(259, 303).draw();
		var ws_tm_a = $D.create("font").setId("ws_tm_a").setFontSize(26).setColor("#205879").setSize(134, 25).setAlign("center").setPos(393, 303).draw();
		var ws_a = $D.create("font").setId("ws_a").setFontSize(26).setColor("#205879").setSize(134, 25).setAlign("center").setPos(527, 303).draw();

		//파고영역지정
		var pg_to = $D.create("font").setId("pg_to").setFontSize(18).setColor("#323232").setSize(134, 25).setAlign("center").setPos(125, 354).draw();
		var pg_tm_m = $D.create("font").setId("pg_tm_m").setFontSize(18).setColor("#323232").setSize(134, 25).setAlign("center").setPos(259, 354).draw();
		var pg_tm_a = $D.create("font").setId("pg_tm_a").setFontSize(18).setColor("#323232").setSize(134, 25).setAlign("center").setPos(393, 354).draw();
		var pg_a = $D.create("font").setId("pg_a").setFontSize(18).setColor("#323232").setSize(134, 25).setAlign("center").setPos(527, 354).draw();
	}

	function insertData() {
		//날씨아이콘 데이터 삽입
		$D.get("today_weather").setPath("${imgRoot}/common/w_icon_m/"+data[0]["WN_RAINF"]+data[0]["WN_FORECAST"]+".png");
		$D.get("tommr_weather_m").setPath("${imgRoot}/common/w_icon_m/"+data[0]["WN_RAINF"]+data[1]["WN_FORECAST"]+".png");
		$D.get("tommr_weather_a").setPath("${imgRoot}/common/w_icon_m/"+data[0]["WN_RAINF"]+data[2]["WN_FORECAST"]+".png");
		$D.get("after_weather").setPath("${imgRoot}/common/w_icon_m/"+data[0]["WN_RAINF"]+data[3]["WN_FORECAST"]+".png");
		//풍향 데이터 삽입
		$D.get("wd_to").setText(refData["DIRECTION"][data[0]["WN_WINDA"]]+"-"+refData["DIRECTION"][data[0]["WN_WINDB"]]);
		$D.get("wd_tm_m").setText(refData["DIRECTION"][data[1]["WN_WINDA"]]+"-"+refData["DIRECTION"][data[1]["WN_WINDB"]]);
		$D.get("wd_tm_a").setText(refData["DIRECTION"][data[2]["WN_WINDA"]]+"-"+refData["DIRECTION"][data[2]["WN_WINDB"]]);
		$D.get("wd_a").setText(refData["DIRECTION"][data[3]["WN_WINDA"]]+"-"+refData["DIRECTION"][data[3]["WN_WINDB"]]);
		//풍속 데이터 삽입
		$D.get("ws_to").setText(data[0]["WN_WSPEED"]);
		$D.get("ws_tm_m").setText(data[1]["WN_WSPEED"]);
		$D.get("ws_tm_a").setText(data[2]["WN_WSPEED"]);
		$D.get("ws_a").setText(data[3]["WN_WSPEED"]);
		//파고 데이터 삽입
		$D.get("pg_to").setText(data[0]["WN_WHEIGHT"]);
		$D.get("pg_tm_m").setText(data[1]["WN_WHEIGHT"]);
		$D.get("pg_tm_a").setText(data[2]["WN_WHEIGHT"]);
		$D.get("pg_a").setText(data[3]["WN_WHEIGHT"]);
	}

	function drawColorKey() {
		/*
		//yellow키	
		$D.create("img").setPos(424, 404).setPath("${imgRoot}/common/yellow_key.png").draw();
		$D.create("font").setFontSize(15).setColor("#dcdcdc").setPos(447, 407).setText("이전지역").draw();
		//green키		
		$D.create("img").setPos(512, 404).setPath("${imgRoot}/common/green_key.png").draw();
		$D.create("font").setFontSize(15).setColor("#dcdcdc").setPos(534, 407).setText("다음지역").draw();
		//blue키		
		$D.create("img").setPos(599, 404).setPath("${imgRoot}/common/blue_key.png").draw();
		$D.create("font").setFontSize(15).setColor("#dcdcdc").setPos(621, 407).setText("메뉴로").draw();
		*/
		ColorKeyDrawer.draw([[ColorKeyDrawer.YELLOW, "이전지역"], [ColorKeyDrawer.GREEN, "다음지역"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
	}

	function save() {
	}
	function load() {
	}

	$K.left(function() {
		prevPage();
	});
	$K.right(function() {
		nextPage();
	});
	$K.blue(function() {
		$H.home();
	});
	$K.yellow(function() {
		prevPage();
	});
	$K.green(function() {
		nextPage();
	});
	$K.back(function() {
		$H.back(pageIdx);
	});

	function prevPage(){
		pageIdx-=1;
		if(pageIdx < 0){
			pageIdx = pageList.length-1;
		}
		reloadPageData();
	}
	function nextPage(){
		pageIdx+=1;
		if(pageIdx >= pageList.length){
			pageIdx = 0;
		}
		reloadPageData();
	}

	function reloadPageData(){
		top.showLoading();
		var ajax = Ajax.createXHR();
		ajax.setParam("command", "seadetail");
		ajax.setParam("wn_region", pageList[pageIdx].WN_REGION);
		ajax.send("get", "${ctxRoot}/ajax.do", false);

		data = $.getJsonObj(ajax.getResultText());
		var announceTime = parseInt(data[0]["WN_TIME"].substring(8, 10),10);
		if(announceTime >= 5 &&  announceTime < 11){ //05:00~10:59
			type="AM";
		}else if(announceTime >= 11 &&  announceTime < 23){ //11:00~22:59
			type="PM";
		}else{//23:00~04:59
			type="DAWN";
		}
		pageTitle = pageList[pageIdx].RC_NAME;
		repaint();
		top.hideLoading();
	}
</script>
</head>
<body>
<!-- ***** insert HTML ***** -->
</body>
</html>
