<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp"%>
<script type="text/javascript">
	//전역 변수 선언
	var commonImgRoot = "${imgRoot}/common/"; //공통 이미지 경로
	var airImgRoot = "${imgRoot}/airline/"; //항공 이미지 경로
	var listStateImg = { // 리스트 상태 이미지 경로 값
	"BOARDING" : airImgRoot + "boarding.png",
	"ARRIVED" : airImgRoot + "arrived.png",
	"NORMAL" : airImgRoot + "normal.png",
	"GO TO GATE" : airImgRoot + "gotogate.png",
	"PROCESSING" : airImgRoot + "processing.png",
	"CANCELED" : airImgRoot + "canceled.png",
	"DELAYED" : airImgRoot + "delayed.png",
	"DELAYED      FLIGHT" : airImgRoot + "delayedflight.png",
	"NONE" : airImgRoot + "none.png"
	};
	var tableX = [ 53, 197, 299, 400, 491, 580 ];
	var tableY = [ 68, 117, 170, 225, 280, 332 ];//[0] 타이틀, [1]~[END]리스트
	var tableW = [ 140, 100, 93, 88, 86, 90 ];
	var tableH = 20;
	var listRowCnt = 5; //리스트 세로 줄 개수
	var pageCnt = 0; //페이지 총 수량
	var currPageIdx = 0; //현재 페이지 인덱스
	var reserveList = []; //국내선, 국외선으로 분류된 항공사 전체 리스트
	var reserveTxt = [];
	var reserveTxtIdx = 0;
	var list = [];
	var title = null;
	var code = null;
	var result = null;
	var sortKind = "전체";
	
	//이미지 로딩
	$D.create("img").setPath(airImgRoot + "03-1_bg.png");
	for ( var property in listStateImg) {
		$D.create("img").setPath(listStateImg[property]);
	}
</script>

<script type='text/javascript'>
	function init(param) {
		if ("${rCode}" == "100") {
			title = param.title;
			result = $.getJsonObj('${result}');
			code = $.getJsonObj('${code}');
			if(result.length == 0 || result==""){
				return "501";
			}
			
			//if(result.length==0){
			//return -1;
			//}
			initReserveList(title);
			drawBg();
			drawPageTitle();
			drawReserve();
			drawListTitle();
			drawList();
			drawColorKey();
			drawPageInfo();
			setPageData();
			startReserveTimer(3000);
		}
		return "${rCode}";
	}

	function setPageData() {
		setPageTitle(sortKind);
		initReserveTxt(sortKind);
		//setReserveTxt(reserveTxt[reserveTxtIdx]);
		repaintReserve(reserveTxt[reserveTxtIdx]);
		initList(sortKind);
		initPageInfo();
		setPageInfoTxt();
		setListTxt();
	}

	function $rpm(obj) {
		sortKind = obj;
		setPageData();
	}

	function getKorAirList() {
		var temp = [ "전체" ];
		for ( var i = 0; i < code.length; i++) {
			if (code[i]["AL_DOM"] == "Y") {
				temp.push(code[i]["AL_KNAME"]);
			}
		}
		return temp;
	}

	function getNoKorAirList() {
		var temp = [ "전체" ];
		for ( var i = 0; i < code.length; i++) {
			if (code[i]["AL_INT"] == "Y") {
				temp.push(code[i]["AL_KNAME"]);
			}
		}
		return temp;
	}

	function initList(sort) {
		if (sort == "전체") {
			list = result;
		} else {
			list = [];
			for ( var i = 0; i < result.length; i++) {
				if (sort == result[i]["AL_KNAME"]) {
					list.push(result[i]);
				}
			}
		}
	}

	function initReserveList(title) {
		reserveList = [];
		if (title.indexOf("국내선") > -1) {
			for ( var i = 0; i < code.length; i++) {
				if (code[i]["AL_DOM"] == "Y") {
					reserveList.push(code[i]["AL_KNAME"] + code[i]["AL_INQUIRY"]);
				}
			}
		} else {
			for ( var i = 0; i < code.length; i++) {
				if (code[i]["AL_INT"] == "Y") {
					reserveList.push(code[i]["AL_KNAME"] + code[i]["AL_INQUIRY"]);
				}
			}
		}
	}
	function initReserveTxt(sort) {
		reserveTxt = [];
		if (sort == "전체") {
			reserveTxt = reserveList;
		} else {
			for ( var i = 0; i < reserveList.length; i++) {
				if (reserveList[i].indexOf(sort)>-1) {
					reserveTxt.push(reserveList[i]);
					break;
				}
			}
		}
	}

	function drawBg() {
		$D.create("img").setPos(0, 0).setPath(airImgRoot + "03-1_bg.png").setSize(720, 434).draw();
	}

	function initPageInfo() {
		currPageIdx = 0;
		if (list.length <= listRowCnt) {
			pageCnt = 1;
		} else {
			var rest = list.length % listRowCnt;
			pageCnt = (list.length-rest)/listRowCnt;

			if(rest!=0){
				pageCnt++;
			}
		}
	}

	function startReserveTimer(nTime) {
		setInterval(function reserveTicker() {
			if (reserveTxt.length > 0) {
				var first = reserveTxt.shift();
				reserveTxt.push(first);
				//$D.get("reserveTxt").setText(first);
				repaintReserve(first);
			}
		}, nTime);
	}

	function drawPageTitle() {
		if(title.indexOf("도착")>-1){
			$D.create("img").setPos(44, 25).setPath("${imgRoot}/airline/sm_icon_arrival.png").draw();
		}else{
			$D.create("img").setPos(44, 25).setPath("${imgRoot}/airline/sm_icon_start.png").draw();
		}
//			$D.create("img").setPos(44, 25).setPath(commonImgRoot + "st_01.png").draw();
		$D.create("font").setId("pageTitle").setFontSize(18).setColor("#0e3c5d").setPos(78, 30).setSize(300, 20).setAlign("left").draw();
	}
	function setPageTitle(sTxt) {
		$D.get("pageTitle").setText("항공 | " + title + " | " + sTxt);
	}
	function drawColorKey() {
		ColorKeyDrawer.draw([[ColorKeyDrawer.RED, "항공사선택"],[ColorKeyDrawer.YELLOW, "이전스케줄"], [ColorKeyDrawer.GREEN, "다음스케줄"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
	}

	function setPageInfoTxt() {
		$D.get("pageInfoTxt1").setText((currPageIdx + 1));
		$D.get("pageInfoTxt0").setText("/");
		$D.get("pageInfoTxt2").setText(pageCnt);
		$D.get("arrowL").setHidden(false);
		$D.get("arrowR").setHidden(false);
	}

	function drawPageInfo() {
		$D.create("img").setId("arrowL").setPos(307, 378).setPath(commonImgRoot + "page_pre.png").draw();
		$D.create("img").setId("arrowR").setPos(403, 378).setPath(commonImgRoot + "page_next.png").draw();
		$D.create("font").setId("pageInfoTxt1").setPos(321, 377).setFontSize(20).setColor("#0e3c5d").setSize(33, 20).setAlign("right").draw();
		$D.create("font").setId("pageInfoTxt0").setPos(357, 377).setFontSize(20).setColor("#536674").setSize(8, 20).draw();
		$D.create("font").setId("pageInfoTxt2").setPos(368, 377).setFontSize(20).setColor("#536674").setSize(33, 20).setAlign("left").draw();
	}
	function save() {	}
	function load() {	}

	function setListTxt() {
		var startIdx = currPageIdx * listRowCnt;
		var endIdx = startIdx + listRowCnt;
		if (endIdx >= list.length) {
			endIdx = list.length;
		}

		for ( var i = 0; i < listRowCnt; i++) {
			if(startIdx < endIdx){
				$D.get("t0" + i).setText(list[startIdx]["AL_KNAME"]);
				$D.get("t1" + i).setText(list[startIdx]["AL_ENAME"]);
				$D.get("t2" + i).setText(list[startIdx]["AIR2C"]);
				$D.get("t3" + i).setText(list[startIdx]["SDT"]);
				if($D.get("tField").innerHTML == "변경시각"){
					if(list[startIdx]["CDT"] == "-"){
						$D.get("t4" + i).setColor('#3c3c3c');
					}else{
						$D.get("t4" + i).setColor('#8d1414');
					}
				}
				$D.get("t4" + i).setText(list[startIdx]["CDT"]);
				$D.get("t5" + i).setText(list[startIdx]["CITYKOR"]);
				$D.get("t6" + i).setText(list[startIdx]["CITYENG"]);
				$D.get("t7" + i).setPath(listStateImg[list[startIdx]["STENG"]]);
			}else{
				$D.get("t0" + i).setText("");
				$D.get("t1" + i).setText("");
				$D.get("t2" + i).setText("");
				$D.get("t3" + i).setText("");
				$D.get("t4" + i).setText("");
				$D.get("t5" + i).setText("");
				$D.get("t6" + i).setText("");
				$D.get("t7" + i).setPath("noImg");
			}
			startIdx += 1;
		}
	}

	function invaliTxt(sTxt){
		if(!sTxt){
			sTxt="";
		}
		return sTxt;
	}
	
	function drawList() {
		for ( var i = 0; i < listRowCnt; i++) {
			$D.create("font").setId("t0" + i).setPos(tableX[0], tableY[i + 1] - 10).setSize(tableW[0], tableH).setFontSize(17).setBold(false).setColor('#3c3c3c').setAlign("center").draw();
			$D.create("font").setId("t1" + i).setPos(tableX[0], tableY[i + 1] + 10).setSize(tableW[0], tableH).setFontSize(16).setBold(false).setColor('#0e3c5d').setAlign("center").draw();
			$D.create("font").setId("t2" + i).setPos(tableX[1], tableY[i + 1]).setSize(tableW[1], tableH).setFontSize(17).setBold(false).setColor('#3c3c3c').setAlign("center").draw();
			$D.create("font").setId("t3" + i).setPos(tableX[2], tableY[i + 1]).setSize(tableW[2], tableH).setFontSize(17).setBold(false).setColor('#3c3c3c').setAlign("center").draw();
			$D.create("font").setId("t4" + i).setPos(tableX[3], tableY[i + 1]).setSize(tableW[3], tableH).setFontSize(17).setBold(false).setColor('#3c3c3c').setAlign("center").draw();
			$D.create("font").setId("t5" + i).setPos(tableX[4], tableY[i + 1] - 10).setSize(tableW[4], tableH).setFontSize(17).setBold(false).setColor('#3c3c3c').setAlign("center").draw();
			$D.create("font").setId("t6" + i).setPos(tableX[4], tableY[i + 1] + 10).setSize(tableW[4], tableH).setFontSize(16).setBold(false).setColor('#0e3c5d').setAlign("center").draw();
			$D.create("img").setId("t7" + i).setPos(tableX[5] + 5, tableY[i + 1] - 15).draw();
		}
	}

	function drawListTitle() {
		if(title.indexOf("출발",0)>-1){
			$D.create("font").setPos(tableX[0], tableY[0]).setSize(tableW[0], tableH).setFontSize(16).setBold(true).setColor('#e6e6e6').setAlign("center").setText("항공사").draw();
			$D.create("font").setPos(tableX[1], tableY[0]).setSize(tableW[1], tableH).setFontSize(16).setBold(true).setColor('#e6e6e6').setAlign("center").setText("편명").draw();
			$D.create("font").setPos(tableX[2], tableY[0]).setSize(tableW[2], tableH).setFontSize(16).setBold(true).setColor('#e6e6e6').setAlign("center").setText("출발시각").draw();
			$D.create("font").setId("tField").setPos(tableX[3], tableY[0]).setSize(tableW[3], tableH).setFontSize(16).setBold(true).setColor('#e6e6e6').setAlign("center").setText("변경시각").draw();
			$D.create("font").setPos(tableX[4], tableY[0]).setSize(tableW[4], tableH).setFontSize(16).setBold(true).setColor('#e6e6e6').setAlign("center").setText("목적지").draw();
			$D.create("font").setPos(tableX[5], tableY[0]).setSize(tableW[5], tableH).setFontSize(16).setBold(true).setColor('#e6e6e6').setAlign("center").setText("현황").draw();
		}else{
			$D.create("font").setPos(tableX[0], tableY[0]).setSize(tableW[0], tableH).setFontSize(16).setBold(true).setColor('#e6e6e6').setAlign("center").setText("항공사").draw();
			$D.create("font").setPos(tableX[1], tableY[0]).setSize(tableW[1], tableH).setFontSize(16).setBold(true).setColor('#e6e6e6').setAlign("center").setText("편명").draw();
			$D.create("font").setPos(tableX[2], tableY[0]).setSize(tableW[2], tableH).setFontSize(16).setBold(true).setColor('#e6e6e6').setAlign("center").setText("도착시각").draw();
			$D.create("font").setId("tField").setPos(tableX[3], tableY[0]).setSize(tableW[3], tableH).setFontSize(16).setBold(true).setColor('#e6e6e6').setAlign("center").setText("변경시각").draw();
			$D.create("font").setPos(tableX[4], tableY[0]).setSize(tableW[4], tableH).setFontSize(16).setBold(true).setColor('#e6e6e6').setAlign("center").setText("출발지").draw();
			$D.create("font").setPos(tableX[5], tableY[0]).setSize(tableW[5], tableH).setFontSize(16).setBold(true).setColor('#e6e6e6').setAlign("center").setText("현황").draw();
		}
	}
	function setReserveTxt(sTxt) {
		var txt = document.getElementById("reserveTxt");
		txt.innerHTML = sTxt;
	}

	function drawReserve() {
		$D.create("img").setId("reserveImg").setPath(airImgRoot + "icon_reserve.png").draw();
		$D.create("font").setId("reserveTxt").setFontSize(16).setColor("#0e3c5d").draw();
	}

	function repaintReserve(sTxt){
		if($D.get("reserveTxt").innerHTML != sTxt){
			var temp = $D.create("font").setFontSize(16).setText(sTxt);
			temp.style.visibility="hidden";
			temp.draw();
			var r = FontMetrics.getBounds(temp);
			$D.get("reserveTxt").setText(sTxt).setPos(670-r.width, 33);
			$D.get("reserveImg").setPos(670 - r.width - 84 - 5, 25);
			document.body.removeChild(temp);
		}
	}
	
	function prevPage() {
		if (pageCnt > 1) {
			top.showLoading();
			setTimeout(function(){
				currPageIdx -= 1;
				if (currPageIdx < 0) {
					if (pageCnt != 0) {
						currPageIdx = pageCnt - 1;
					} else {
						currPageIdx = 0;
					}
				}
				setListTxt();
				setPageInfoTxt();
				top.hideLoading();				
			}, 200);
		}
	}
	function nextPage() {
		if (pageCnt > 1) {
			top.showLoading();
			setTimeout(function(){
				currPageIdx += 1;
				if (currPageIdx >= pageCnt) {
					currPageIdx = 0;
				}
				setListTxt();
				setPageInfoTxt();
				top.hideLoading();
			}, 200);
		}
	}
	$K.left(function() {
			prevPage();
	});
	$K.right(function() {
			nextPage();
	});
	$K.red(function() {
		if (title.indexOf("국내선",0)>-1) {
			$P.show("${ctxRoot}/airlinepopup.do", [getKorAirList(), sortKind]);
		} else {
			$P.show("${ctxRoot}/airlinepopup.do", [getNoKorAirList(), sortKind]);
		}
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
		$H.back();
	});
</script>
</head>
<body>
</body>
</html>

