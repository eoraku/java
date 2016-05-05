<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/jsp/head.jsp"%>
<script type="text/javascript">
$D.create("img").setPath("${imgRoot}/common/icon.png");
	var timer = null;
	function init(param) {
		var centerX = 230 + (260/2)+8;
		var title = $D.create("font").setFontSize(18).setColor("#0e3c5d").setText(param.title);
		//var titleW = FontMetrics.getBounds(title).width;
		var titleW = FontMetrics.getWidth($D.create("font").setFontSize(18), param.title);
		//alert(titleW);
		$D.create("img").setPath("${imgRoot}/common/icon.png").setPos(centerX-(titleW/2)-(12/2)-10, 138).setSize(12, 30).draw();
		title.setPos(centerX-(titleW/2), 144).draw();
		//$D.create("img").setPath("${imgRoot}/common/icon.png").setPos(230, 137).setSize(12, 30).draw();
		//$D.create("font").setFontSize(18).setColor("#0e3c5d").setPos(250, 143).setText(param.title).draw();
		$D.create("font").setFontSize(16).setColor("#e6e6e6").setPos(355,321).setText("확인").draw();
		//$D.create("font").setFontSize(18).setColor("#0e3c5d").setPos(230,144).setSize(260,18).setAlign("center").setText(param.title).draw();
		$D.create("font").setFontSize(18).setColor("#3c3c3c").setPos(230,224).setSize(260,18).setAlign("center").setText(param.msg).draw();
		
		var time = 0;
		timer = setInterval(function(){
			if(time<10){
				time+=1;
			}else{
				clearInterval(timer);
				$P.hide();
			}
		}, 1000);
		return "100";
	}
	function save() {
	}
	function load() { 
	}
	$K.back(function() {
		clearInterval(timer);
		$P.hide();
	});
	$K.down(function() {
		clearInterval(timer);
		$P.hide();
	});
	$K.up(function() {
		clearInterval(timer);
		$P.hide();
	});
	$K.enter(function() {
		clearInterval(timer);
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