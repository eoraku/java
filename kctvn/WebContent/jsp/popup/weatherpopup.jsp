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
var text = null;

bg = $D.create("img").setPos(156, 35).setPath("${imgRoot}/weather/04-5-1_bg.png");
simbol = $D.create("img").setPos(306, 46).setPath("${imgRoot}/common/st_02.png");
okKey=$D.create("img").setPos(334, 384).setPath("${imgRoot}/common/ok_key.png");
	
</script>
<script type="text/javascript">
	var list=null;         
	function init(param) {
		if (!param && param.length == 0) {
			return -1;
		}
		list = param;
		
		bg.draw();
		simbol.draw();
		okKey.draw();
		$D.create("font").setFontSize(18).setColor("#0e3c5d").setPos(340, 51).setText("주간예보").draw();
		$D.create("font").setPos(359, 388).setColor("#e6e6e6").setFontSize(16).setText("닫기").draw();
		text = new TextArea(178,91,343,271);
		 //.setSize(372,242)
		var content = $D.create("font").setColor("#3c3c3c").setFontSize(18).setText(list);
		text.insertText(content);
		var totalPage = text.getTotalCnt();
		scroll = new Scroll(532, 110, 8, 232, "#acacac", "#5e487d", totalPage);
		if(totalPage > 1){
			$D.create("img").setPos(526, 89).setPath("${imgRoot}/common/scr_up.png").draw();
			$D.create("img").setPos(526, 341).setPath("${imgRoot}/common/scr_down.png").draw();
		}else{
			$D.create("img").setPos(526, 89).setPath("${imgRoot}/common/scr_up_dim.png").draw();
			$D.create("img").setPos(526, 341).setPath("${imgRoot}/common/scr_down_dim.png").draw();
		}
		
		return "100";
	}

	
	
	function save() {
	}
	function load() {
	}
	$K.up(function() {
		text.up();
		scroll.up();
	});
	$K.down(function() {
		text.down();
		scroll.down();
	});
	$K.back(function() {
		$P.hide();
	});
	$K.enter(function() {
		$P.hide();
	});
	//
</script>
</head>
<body>
<img src="${imgRoot}/common/loading.png" width="720px" height="480px" style="position:absolute; left:0px; top:0px;"/>
</body>
</html>