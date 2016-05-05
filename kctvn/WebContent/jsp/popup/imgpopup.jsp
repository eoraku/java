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
	bg = $D.create("img").setPos(66, 35).setPath("${imgRoot}/familyevent/05-1-1_bg.png");
	simbol = $D.create("img").setPos(306, 46).setPath("${imgRoot}/familyevent/st_05.png");
	okKey=$D.create("img").setPos(334, 384).setPath("${imgRoot}/common/ok_key.png");
	
}());
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
		$D.create("font").setFontSize(18).setColor("#0e3c5d").setPos(340, 51).setText("식장안내").draw();
		$D.create("font").setPos(359, 388).setColor("#e6e6e6").setFontSize(16).setText("확인").draw();
		$D.create("img").setPos(93, 91).setSize(534,272).setPath(list).draw();
		return "100";
	}
	
	function save() {
	}
	function load() {
	}
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