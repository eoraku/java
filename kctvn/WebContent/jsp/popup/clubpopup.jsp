<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp"%>
<script type="text/javascript">
//이미지 로딩
var bg = null;
var simbol = null;
var okKey=null;
var exitKey=null;
(function(){
	//bg = $D.create("img").setPos(236, 35).setPath("${imgRoot}/airline/03-1-1_bg.png");
	//simbol = $D.create("img").setPos(283, 46).setPath("${imgRoot}/common/st_01.png");
	//okKey=$D.create("img").setPos(301, 383).setPath("${imgRoot}/common/ok_key.png");
	//exitKey=$D.create("img").setPos(367, 383).setPath("${imgRoot}/common/exit_key.png");
}());
</script>
<script type="text/javascript">
	var list=null;         
	var focusIdx = 0;
	var selectedIdx = 0;

	var focusImg ={"on":"${imgRoot}/airline/03-1-1_sel.png","off":"${imgRoot}/airline/03-1-1_fcs.png"};
	var checkImg = {"on":"${imgRoot}/airline/check_sel.png","off":"${imgRoot}/airline/check_nrml.png"};
	var listFontColor = {"on":"#f0f0f0","off":"#3c3c3c"};
	var rowGap = 36; 
	function init(param) {
		list = [{ID : "CLB000", TITLE : "전체"}, {ID : "CLB001", TITLE : "클럽/단체"}, {ID : "CLB002", TITLE : "동문(창)회"}, 
		        {ID : "CLB003", TITLE : "친목모임"}, {ID : "CLB004", TITLE : "동호회"}, {ID : "CLB005", TITLE : "복지시설"}, 
		        {ID : "CLB006", TITLE : "기타"}];
		for(var i=0; i<list.length; i++){
			if(param == list[i].ID){
				focusIdx = i;
				selectedIdx = i;
				break;
			}
		}
		//bg.draw();
		//simbol.draw();
		//okKey.draw();
		//exitKey.draw();
		$D.create("font").setFontSize(18).setColor("#0e3c5d").setPos(320, 52).setText("모임선택").draw();
		$D.create("font").setFontSize(16).setColor("#e6e6e6").setPos(355, 388).setText("선택").draw();
	//	$D.create("font").setFontSize(16).setColor("#e6e6e6").setPos(391, 388).setText("닫기").draw();

		setListData();
		drawListData();
		return "100";
	}

	function setListData(){
		$D.create("img").setId("focusImg").setPath(focusImg.off).draw();
		for ( var i = 0; i < list.length; i++) {
			var padding = (i * rowGap);
			$D.create("img").setId("checkImg"+i).setPos(264, 87 + padding).draw();
			$D.create("font").setId("listFont"+i).setFontSize(17).setPos(294, 93 + padding).setText(list[i].TITLE).draw();
		}
	}
	
	function drawListData(){
		for ( var i = 0; i < list.length; i++) {
			var padding = (i * rowGap);
			if(selectedIdx==i){
				$D.get("checkImg"+i).setPath(checkImg.on);
			}else{
				$D.get("checkImg"+i).setPath(checkImg.off);
			}
			if(focusIdx==i){
				$D.get("listFont"+i).setColor(listFontColor.on);
			}else{
				$D.get("listFont"+i).setColor(listFontColor.off);
			}
		}
		$D.get("focusImg").setPos(249, 77+(focusIdx*rowGap));
	}
	
	
	function save() {
	}
	function load() {
	}

	$K.back(function() {
		$P.hide();
	});
	$K.down(function() {
		focusIdx++;
		if(focusIdx >= list.length){
			focusIdx = 0;
		}

		drawListData();
	});
	$K.up(function() {
		focusIdx--;
		if(focusIdx < 0){
			focusIdx = list.length-1;
		}

		drawListData();
	});
	$K.enter(function() {
		selectedIdx=focusIdx;
		drawListData();
		$P.sendMsg(list[selectedIdx].ID);
		$P.hide();
	});

	
	//
</script>
</head>
<body>
<img src="${imgRoot}/common/loading.png" width="720px" height="480px" style="position:absolute; left:0px; top:0px;"/>
<img src="${imgRoot}/airline/03-1-1_bg.png" style="position:absolute; left:236px; top:35px;"/>
<img src="${imgRoot}/etc/st_07.png" style="position:absolute; left:283px; top:46px;"/>
<img src="${imgRoot}/common/ok_key.png" style="position:absolute; left:330px; top:383px;"/>

</body>
</html>