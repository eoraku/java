<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Test Document</title>
<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.css" />
<link rel="stylesheet" href="../css/nodejs/s4m.css" />
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.js"></script>
<script type="text/javascript" src="../js/nodejs/socket.io.js"></script>
<script type="text/javascript" src="../js/nodejs/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	setSocket('${serverUrl}');
	
	socket.on('connect', function(){
		//alert("Connected");
		//sendToView("goHref","v4.htm");
	});
	
	$(".left").click(function(){
		sendToView("v4Prev",0);
	});
	
	$(".right").click(function(){
		sendToView("v4Next",0);
	});
	
	$(".stop").click(function(){
		sendToView("v4Stop",0);
	});
	
	$("#play").click(function(){
		sendToView("v4Play",0);
	});
	
	$("#full").click(function(){
		sendToView("v4Full",0);
	});
});
</script>
</head>
<body>
	<div data-role="page" id="page1">
		<div data-role="content" id="article_2h">
			<a href="#" class="left"><img src="../images/nodejs/m3/icon_L.png"></a>
			<a href="#" class="right"><img src="../images/nodejs/m3/icon_R.png"></a>
		</div>
		<div data-id="PersistentFooter" data-role="footer" data-position="fixed">
			<div data-role="navbar">
				<ul>
					<li><a href="#page1" class="ui-btn-active ui-state-persist">One</a></li>
					<li><a href="#page2">Two</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div data-role="page" id="page2">
		<div data-role="content" id="article_3h">
			<a href="#" class="left"><img src="../images/nodejs/m3/icon_L.png" width="90%"></a>
			<a href="#" class="stop"><img src="../images/nodejs/m3/icon_S.png" width="90%"></a>
			<a href="#" class="right"><img src="../images/nodejs/m3/icon_R.png" width="90%"></a>
		</div>
		<div class="article_line top">⇡ 이미지 컨트롤 ⇡</div>
		<div class="article_line">⇣ 비디오 컨트롤 ⇣</div>
		<div id="article_2h">
			<a href="#"><img src="../images/nodejs/m3/play.png" width="80%" id="play"></a>
			<a href="#"><img src="../images/nodejs/m3/full.png" width="80%" id="full"></a>
		</div>
		<div data-id="PersistentFooter" data-role="footer" data-position="fixed">
			<div data-role="navbar">
				<ul>
					<li><a href="#page1">One</a></li>
					<li><a href="#page2" class="ui-btn-active ui-state-persist">Two</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>