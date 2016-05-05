<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp"%>
<script type="text/javascript" src="${ctxRoot}/js/wz_jsgraphics.js"></script>
<script type='text/javascript'>
$D.create("img").setPath("${imgRoot}/weather/olle/olle_detail_bg.png");
$D.create("img").setPath("${imgRoot}/common/tem_point_l.png");
$D.create("img").setPath("${imgRoot}/common/tem_point_s.png");
$D.create("img").setPath("${imgRoot}/common/graph_bar.png");
$D.create("img").setPath("${imgRoot}/common/st_02.png");
$D.create("img").setPath("${imgRoot}/common/line_l.png");
$D.create("img").setPath("${imgRoot}/common/line_s.png");
$D.create("img").setPath("${imgRoot}/common/line_ss.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/01.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/02.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/03.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/04.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/11.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/12.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/13.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/14.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/21.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/22.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/23.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/24.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/31.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/32.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/33.png");
$D.create("img").setPath("${imgRoot}/common/w_icon_s/34.png");

	var data = null;
	var pageTitle = null;
	var pageIdx = 0;
	var pageList = null; 
	var day = null;
	var metrix = null;
	var metrixColMax=0;
	var metrixH = [ 30, 32, 91, 35, 50, 50 ];
	var table={x:48,y:102,obj:null};
	var lineImg={l:[], s:[], ss:[]};
	var grapeLayer = [];
	var canvas=null;
	var g=null;
</script>
<script type='text/javascript'>
	function init(args) {
		if ("${rCode}" == "100") {
			//"W3_WAV" : "0.4",  //유의파고
			//"W3_WSD" : "8", //풍속
			//"W3_T3H" : "3", //3시간 기온
			//"W3_TIME" : "201101201800", //시각
			//"W3_PTY" : "0", //강수형태 [날씨 아이콘] 
			//"W3_SKY" : "4" //하늘상태 [날씨 아이콘]
			//"W3_R12" : "0", //12시간 강수량 [강수/적설량]
			//"W3_S12" : "0", //12시간 최심 신적설 [강수/적설량]
			
			pageIdx = args.idx;
			pageList = args.list;
			pageHeaderTitle = "올레길";
			data = $.getJsonObj('${result}');
			pageTitle = args.title;
			setBg();
			drawPage();
			drawColorKey();
		}
		return "${rCode}";	
	}

	function dataFiltering(){
		var time = new Date().getHours();
		var showDataLen=0;
		
		if((0 <= time && time < 3) || (12 <= time && time < 15)){
			showDataLen=15;
		}else if((15 <= time && time < 18) || (3 <= time && time < 6)){
			showDataLen=14;
		}else{
			showDataLen=16;
		}
		
		while(data.length > showDataLen){
			data.pop();
		}
	}
	
	function drawPage(){
		dataFiltering();
		var point = drawGraphe();
		drawTempLine(point);
		initPageInfo();
		initTable();
		initLine();
		setTableData();
		setTitle(pageTitle);
	}
	
	function drawTempLine(point){
		if(canvas){
			document.body.removeChild(canvas);
		}

		canvas = $D.create("div").setPos(0, 0).setSize(720, 434).setDepth(1).draw();
		g = new jsGraphics(canvas);
		g.setColor("#7ba85a");
		g.setStroke(4);

		var offsetX=15;
		var offsetY=-2;
		for(var i=0; i<point.length-1; i++){
			g.drawLine(point[i]["x"]+offsetX, point[i]["y"]+offsetY, point[i+1]["x"]+offsetX, point[i+1]["y"]+offsetY);
		}
		g.paint();
	}
	
	function drawGraphe(){
		var point=[];
		
		var maxTemp = -1000;
		var minTemp = 1000;
		for(var i=0; i < data.length;i++){
			maxTemp = Math.max(maxTemp,parseInt(data[i]["W3_T3H"],10));
			minTemp = Math.min(minTemp,parseInt(data[i]["W3_T3H"],10));
		}

		for(var i=0; i<grapeLayer.length; i++){
			document.body.removeChild(grapeLayer[i]);
		}

		var bigTempImg={src:"${imgRoot}/common/tem_point_l.png",w:34,h:34};
		var smallTempImg={src:"${imgRoot}/common/tem_point_s.png",w:12,h:12};
		var graphBar={src:"${imgRoot}/common/graph_bar.png",w:16,h:1};
		
		var layerRect ={};
		layerRect.x = table.x+75+2;
		layerRect.y = table.y+metrixH[0]+metrixH[1]+bigTempImg.h/2;
		layerRect.w = 34;
		layerRect.h = metrixH[2]-bigTempImg.h;

		var divRect ={};

		grapeLayer = [];
		var growX=0;
		var temp = 0;
		var timg = 0;
		for(var i=0; i<data.length; i++){
			growX = i*layerRect.w;
			var t = parseInt(data[i]["W3_T3H"],10);
			t=Math.abs(minTemp-t);
			divRect.h = Math.round((t/Math.abs(minTemp-maxTemp)) * layerRect.h);
			divRect.y = layerRect.h- divRect.h;

			temp = $D.create("div").setPos(layerRect.x + growX, layerRect.y).setSize(layerRect.w, layerRect.h).setDepth(10).draw();
			time = data[i]["W3_TIME"].substring(8,10);
			if(time == "03" || time == "15"){
				//그래프 바
				$D.create("img").setPos(layerRect.w/2-(graphBar.w/2), divRect.y).setSize(graphBar.w, divRect.h+(bigTempImg.h/2)).setPath(graphBar.src).draw(temp);
				//큰 온도 이미지
				$D.create("img").setPos(layerRect.w/2-(bigTempImg.w/2), divRect.y-(bigTempImg.h/2)).setSize(bigTempImg.w,bigTempImg.h).setPath(bigTempImg.src).draw(temp);
				//큰 온도 이미지 글자
				$D.create("font").setPos(layerRect.w/2-(bigTempImg.w/2), divRect.y-8).setAlign("center").setSize(bigTempImg.w,bigTempImg.h).setColor("#f0f0f0").setFontSize(18).setText(data[i]["W3_T3H"]).draw(temp);
			}else{
				//작은 온도 이미지
				$D.create("img").setPos(layerRect.w/2-(smallTempImg.w/2), divRect.y-(smallTempImg.h/2)).setSize(smallTempImg.w,smallTempImg.h).setPath(smallTempImg.src).draw(temp);
				//작은 온도 글자
				if(divRect.y + bigTempImg.h/2 < divRect.y+divRect.h){
					$D.create("font").setPos(layerRect.w/2-(bigTempImg.w/2), divRect.y+10).setAlign("center").setSize(bigTempImg.w,bigTempImg.h).setColor("#323232").setFontSize(18).setText(data[i]["W3_T3H"]).draw(temp);
				}else{
					$D.create("font").setPos(layerRect.w/2-(bigTempImg.w/2), divRect.y-26).setAlign("center").setSize(bigTempImg.w,bigTempImg.h).setColor("#323232").setFontSize(18).setText(data[i]["W3_T3H"]).draw(temp);
				}
			}
			grapeLayer.push(temp);
			point.push({x:layerRect.x + (i*34), y:layerRect.y + divRect.y});
		}
		return point;
	}

	function isBigTempImgDraw(nCurrIdx){
		var isBig = 0;
		for(var k=1; k<metrix[5].length; k++){
			isBig += (getTd(5,k)).colSpan;
			if(nCurrIdx == isBig){
				return true;
			}
		}return false;
	}
		
	function setBg(){
		$D.create("img").setPos(0, 0).setPath("${imgRoot}/weather/olle/olle_detail_bg.png").draw();
		//$D.create("img").setPos(44, 25).setPath("${imgRoot}/common/st_02.png").draw();
		//$D.create("font").setPos(78, 30).setFontSize(18).setColor('#0e3c5d').setText("날씨 | " + pageHeaderTitle + " | 시간별예보").draw();
		$D.create("font").setId("title").setPos(72,69).setSize(565,20).setFontSize(20).setColor('#f0f0f0').setAlign("center").draw();
	}
	function setTitle(sTxt){
		$D.get("title").setText(sTxt);
	}
	function initPageInfo(){
		metrixColMax=17;
		setDays();
		metrix=[];
		var temp=[1];
		for(var i=0; i<day.length; i++){
			if(day[i]!=0){
				temp.push(day[i]);
			}
		}
		metrix.push(temp);
		metrix.push([ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]);
		metrix.push([ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]);
		metrix.push([ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]);
		metrix.push([ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]);
		metrix.push(getRainMetrix( day ));
	}
	
	function setTableData(){
		var td=null;
		//좌측 텍스트
		var rowDescr = [ "날짜", "시간", "기온(<img src='${imgRoot}/weather/temp.png'/>)", "날씨", "풍속<br>(m/s)", "강수/적설<br>(mm/cm)" ];
		for ( var i = 0; i < metrix.length; i++) {
			td=getTd(i,0);
			td.style.fontSize = "16px";
			td.style.color = "#828282";
			td.innerHTML = rowDescr[i];
		}

		//상단 텍스트
		var colDescr = [ "날짜", "오늘", "내일", "모레" ];
		for ( var i = 0; i < metrix[0].length; i++) {
			td=getTd(0,i);
			td.style.fontSize = "16px";
			td.style.color = "#828282";
			td.innerHTML = colDescr[i];
		}

		//시간
		var dataIdx=0;
		var temp =  0;
		for ( var i = 1; i < metrix[1].length; i++) {
			td=getTd(1,i);
			if (dataIdx < data.length) {
				td.style.fontSize = "16px";
				td.style.color = "#828282";
				temp =  parseInt(data[dataIdx]["W3_TIME"].substring(8, 10),10);
				if(temp == 0) temp=24;
				td.innerHTML = temp;
				//td.innerHTML = parseInt(data[dataIdx]["W3_TIME"].substring(8, 10)); //현재시간 +3시간
			} else {
				td.style.fontSize = "16px";
				td.style.color = "#828282";
				if(temp == 24){
					temp = 3;
				}else{
					temp = temp+3;
				}
				td.innerHTML = temp;
				//getNoRecordStyleTd(td);
			}
			dataIdx++;
		}

		//기온에 데이터 없으면 '-' 기호 넣는부분
		for ( var i = 1; i < metrix[2].length; i++) {
			td=getTd(2,i);
			if(i>data.length){
				getNoRecordStyleTd(td);
			}
		}
		
		//날씨 아이콘
		dataIdx=0;
		for ( var i = 1; i < metrix[3].length; i++) {
			td = getTd(3,i);
			if (dataIdx < data.length) {
				td.innerHTML = "<img src='${imgRoot}/common/w_icon_s/" +data[dataIdx]["W3_PTY"] + data[dataIdx]["W3_SKY"] + ".png' />"; 
			} else {
				getNoRecordStyleTd(td);
			}
			dataIdx++;
		}

		//풍속
		dataIdx=0;
		for ( var i = 1; i < metrix[4].length; i++) {
			td = getTd(4,i);
			if (dataIdx < data.length) {
				td.style.fontSize = "26px";
				td.style.color = "#205879";
				td.innerHTML = data[dataIdx]["W3_WSD"];
			} else {
				getNoRecordStyleTd(td);
			}
			dataIdx++;
		}

		//강수량, 적설량
		var start=0;
		dataIdx = 0;
		for ( var i = 1; i < metrix[5].length; i++) {
			td = getTd(5,i); 
			if(dataIdx < data.length){
				td.style.fontSize="18x";
				td.style.color="#323232";


				var end = start +  td.colSpan;
				if(end > data.length){
					end=data.length;
				}

				var rainValue=0 , snowValue=0;
				
				for(var r = start; r < end; r++){
					rainValue+=parseInt(data[r]["W3_R12"] , 10);
					snowValue+=parseInt(data[r]["W3_S12"] , 10);
				}
				//rainValue = Math.round(rainValue/td.colSpan);
				//snowValue = Math.round(snowValue/td.colSpan);
				start+=td.colSpan;
				
				var rainTxt = "-<br>";
				if(rainValue != 0){
					if(rainValue =="1"){
						rainTxt = "1mm미만<br>";	
						}
					else if(rainValue == "5"){
					rainTxt = "1~4<br>";	
					}
					else if(rainValue =="10"){
						rainTxt = "5~9<br>";	
						}
					else if(rainValue =="25"){
						rainTxt = "10~24<br>";	
						}
					else if(rainValue =="50"){
						rainTxt = "25~49<br>";	
						}
					else if(rainValue =="100"){
						rainTxt = "50mm이상<br>";	
						}
					else{
						//rainTxt = rainValue+"mm미만<br>";
					}
				}
				var snowTxt ="-";
				if(snowValue != 0){
					if(snowValue =="1"){
						snowTxt = "1cm미만<br>";	
						}
					else if(snowValue == "5"){
						snowTxt = "1~4<br>";	
					}
					else if(snowValue =="10"){
						snowTxt = "5~9<br>";	
						}
					else if(snowValue =="20"){
						snowTxt = "10~19<br>";	
						}
					else if(snowValue =="100"){
						snowTxt = "20cm이상<br>";	
						}
					else{
						//snowTxt = snowValue+"cm미만";
					}
										
				}
				
				if(rainTxt == "-<br>" && snowTxt == "-"){
					getNoRecordStyleTd(td);
				}else{
					td.innerHTML = rainTxt+snowTxt;
				}
			} else {
				getNoRecordStyleTd(td);
			}
			dataIdx++;
		}
	}
	
	function initTable(){
		var newTable = createTable();
		createTableList(newTable);
		if(table.obj){
			document.body.replaceChild(newTable, table.obj);
		}else{
			document.body.appendChild(newTable);
		}
		table.obj=newTable;
	}
	function initLine(){
		var newLine_l = createLine_l();
		var newLine_s = createLine_s();
		var newLine_ss = createLine_ss();

		if(lineImg.l && lineImg.l.length>0){
			for(var i=0; i<lineImg.l.length; i++){
				document.body.removeChild(lineImg.l[i]);
			}
		}
		if(lineImg.s && lineImg.s.length>0){
			for(var i=0; i<lineImg.s.length; i++){
				document.body.removeChild(lineImg.s[i]);
			}
		}
		if(lineImg.ss && lineImg.ss.length>0){
			for(var i=0; i<lineImg.ss.length; i++){
				document.body.removeChild(lineImg.ss[i]);
			}
		}
		
		lineImg.l=newLine_l;
		lineImg.s=newLine_s;
		lineImg.ss=newLine_ss;
	}
	function createTableList(eTable){
		for ( var i = 0; i < metrix.length; i++) {
			var mr = metrix[i];
			var tr = document.createElement("tr");
			eTable.appendChild(tr);
			for ( var j = 0; j < mr.length; j++) {
				var td = document.createElement("td");
				td.colSpan = mr[j];
				td.align = "center";
				if (j == 0) {
					td.width = 75;
				} else if (mr[j] == 1) {
					td.width = mr[j] * 34;
				}

				td.height = metrixH[i];
				tr.appendChild(td);
			}
		}
	}
	function createTable(){
		var t = document.createElement("table");
		t.border = 0;
		t.cellSpacing = 0;
		t.cellPadding = 0;
		t.style.position = "absolute";
		t.style.left = table.x+"px";
		t.style.top = table.y+"px";
		return t;
	}
	
	function createLine_ss(){
		var temp=[];
		var gap = 0;
		var x = 124;
		var y = 131;
		for ( var i = 1; i < metrix[1].length; i++) {
			if(isBigTempImgDraw(i-1) || i==1){
				temp.push($D.create("img").setPos(x + gap, y).setSize(2,metrixH[1]+metrixH[2]+metrixH[3]+metrixH[4]).setPath("${imgRoot}/common/line_s.png").draw());
			}else{
				temp.push($D.create("img").setPos(x + gap, y).setSize(2,metrixH[1]+metrixH[2]+metrixH[3]+metrixH[4]).setPath("${imgRoot}/common/line_ss.png").draw());
			}
			gap=i*34;
		}
		return temp;
	}
	

	function createLine_s(){
		var temp = [];
		var gap = 0; 
		var x = 124;
		var y = 339;
		for ( var i = 1; i < metrix[5].length; i++) {
			temp.push($D.create("img").setPos(x+gap, y).setSize(2,metrixH[5]).setPath("${imgRoot}/common/line_s.png").draw());
			gap += (getTd(5,i)).colSpan * 34;
		}
		return temp;
	}

	function createLine_l(){
		var temp = [];
		var gap=0;
		var x=124;
		var y=table.y;
		for(var i=1; i < metrix[0].length;i++){
			temp.push($D.create("img").setPos(x+gap, y).setSize(2,metrixH[0]).setPath("${imgRoot}/common/line_l.png").draw());
			gap+=(getTd(0,i)).colSpan * 34;
		}
		return temp;
	}

	function getTd(nRow, nCol){
		return table.obj.rows[nRow].cells[nCol];
	}
	
	function setDays(){
		day=[0,0,0];
		
		if(data[0]["W3_TIME"].substring(8, 10) == "00"){ // 첫번째 시간이 00(24)일때
			day[0] ++;
		}else{
			for ( var i = 0; i < data.length; i++) {
				if (data[0]["W3_TIME"].substring(6, 8) == data[i]["W3_TIME"].substring(6, 8)) { //날짜 비교
					day[0] ++;
				}
			}
			day[0]++;
		}

		day[1] = 8;
		day[2] = metrixColMax - 1 - (day[0] + day[1]);
	}
	
	function getRainMetrix(arrDay) {
		var temp = [];
		temp.push(1);
		var idx = 0;

		for ( var i = 0; i < arrDay.length; i++) {
			if(arrDay[i]!=0){
				if (arrDay[i] == 8) {
					temp.push(4);
					temp.push(4);
				} else if (arrDay[i] > 4 && arrDay[i] < 8) {
					for(var k=idx+1; k<idx+arrDay[i]; k++){
						if(k<data.length){
							var cDay = data[k]["W3_TIME"].substring(8,10);
							if((cDay=="03"||cDay=="15")){
								temp.push(k-idx); //증가치
								temp.push(arrDay[i]-(k-idx)); //배열 길이에서 증가치를 제외한
								break;
							}
						}else{
							temp.push(k-idx); //증가치
							temp.push(arrDay[i]-(k-idx)); //배열 길이에서 증가치를 제외한
							break;
						}
					}
				} else {
					temp.push(arrDay[i]);
				}
				arrDay[i];
				idx+=arrDay[i];
			}
		}
		return temp;
	};

	function getNoRecordStyleTd(eTd) {
		eTd.style.fontSize = "16px";
		eTd.style.color = "#828282";
		eTd.innerHTML = "-";
		return eTd;
	}

	function getGrapheTag(str) {
		return str;
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
	$K.red(function() {
	});
	$K.yellow(function() {
		prevPage();
	});
	$K.green(function() {
		nextPage();
	});
	$K.blue(function() {
		$H.home();
	});
	$K.back(function() {
		$H.back(pageIdx);
	});

	function prevPage(){
		top.showLoading();
		pageIdx-=1;
		if(pageIdx < 0){
			pageIdx = pageList.length-1;
		}
		var ajax = Ajax.createXHR();
		ajax.setParam("command", "landdetail");
		ajax.setParam("w3_x", pageList[pageIdx].W3_X);
		ajax.setParam("w3_y", pageList[pageIdx].W3_Y);
		ajax.send("get", "${ctxRoot}/ajax.do", false);

		data = $.getJsonObj(ajax.getResultText());
		pageTitle = pageList[pageIdx].RD_NAME + " " + pageList[pageIdx].RD_TXT;
		drawPage();
		top.hideLoading();
	}
	function nextPage(){
		top.showLoading();
		pageIdx+=1;
		if(pageIdx >= pageList.length){
			pageIdx = 0;
		}
		var ajax = Ajax.createXHR();
		ajax.setParam("command", "landdetail");
		ajax.setParam("w3_x", pageList[pageIdx].W3_X);
		ajax.setParam("w3_y", pageList[pageIdx].W3_Y);
		ajax.send("get", "${ctxRoot}/ajax.do", false);

		data = $.getJsonObj(ajax.getResultText());
		pageTitle = pageList[pageIdx].RD_NAME + " " + pageList[pageIdx].RD_TXT;
		drawPage();
		top.hideLoading();
	}
	function drawColorKey() {
	/*		
		var yellow = $D.create("div").setId("yellow").setPos(396, 402).setSize(111, 22).draw();
		$D.create("img").setPos(0,2).setPath("${imgRoot}/common/yellow_key.png").draw(yellow);
		$D.create("font").setFontSize(15).setColor("#dcdcdc").setPos(22, 5).setText("이전지역").draw(yellow);
		var green = $D.create("div").setId("green").setPos(498, 402).setSize(111, 22).draw();
		$D.create("img").setPos(0,2).setId("green").setPath("${imgRoot}/common/green_key.png").draw(green);
		$D.create("font").setFontSize(15).setColor("#dcdcdc").setPos(22, 5).setText("다음지역").draw(green);
		var blue = $D.create("div").setId("blue").setPos(599, 402).setSize(111, 22).draw();
		$D.create("img").setPos(0,2).setId("blue").setPath("${imgRoot}/common/blue_key.png").draw(blue);
		$D.create("font").setFontSize(15).setColor("#dcdcdc").setPos(22, 5).setText("메뉴로").draw(blue);
		*/
		ColorKeyDrawer.draw([[ColorKeyDrawer.YELLOW, "이전지역"], [ColorKeyDrawer.GREEN, "다음지역"], [ColorKeyDrawer.BLUE, "메뉴로"]]);
	}
	
</script>
</head>
<body>
</body>
</html>
