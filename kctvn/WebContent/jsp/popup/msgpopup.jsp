<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp"%>
<script type="text/javascript">
	//         
	function init(param) {
		$D.create("font").setFontSize(16).setColor("#e6e6e6").setPos(355,321).setText("확인").draw();
		$D.create("font").setFontSize(18).setColor("#0e3c5d").setPos(230,144).setSize(259,18).setAlign("center").setText(param.title).draw();
		$D.create("font").setFontSize(18).setColor("#3c3c3c").setPos(230,224).setSize(259,18).setAlign("center").setText(param.msg).draw();
		return "100";
	}
	function save() {
	}
	function load() { 
	}
	$K.back(function() {
		$P.hide();
	});
	$K.down(function() {
		$P.hide();
	});
	$K.up(function() {
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
<img src="${imgRoot}/common/pop_bg.png" style="position:absolute; left:206px; top:129px;"/>
<img src="${imgRoot}/common/ok_key.png" style="position:absolute; left:331px; top:316px;"/>
</body>
</html>