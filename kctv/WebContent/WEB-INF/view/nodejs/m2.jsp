<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" /> 
<link rel="stylesheet" href="../css/nodejs/ui_s3.css" />
<script type="text/javascript" src="../js/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/nodejs/socket.io.js"></script>
<script type="text/javascript" src="../js/nodejs/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	setSocket('${serverUrl}');
	
	socket.on('connect', function(){
		//alert("Connected");
		sendToView("goHref","v3.htm");
	});

	$("#fullScreen").click(function(){
		sendToView("fullScreen",0);
	});
	
	$("#normalScreen").click(function(){
		sendToView("normalScreen",0);
	});
	
	$(".up").click(function(){
		sendToView("slideLeft",0);
	});
	
	$(".up").bind("vmousedown",function(){
		$(this).css("background-position","0 -156px");
	});
	
	$(".up").bind("vmouseup",function(){
		$(this).css("background-position","0 0");
	});
	
	$(".down").click(function(){
		sendToView("slideRight",0);
	});
});
</script>
</head>

<body>
	<div class="full">
		<img src="../images/nodejs/m2/full.png" id="fullScreen" style="cursor:pointer;">
		<img src="../images/nodejs/m2/nomal.png" id="normalScreen" style="cursor:pointer;">
	</div>
	<div class="arrow">
		<a href="#" class="up"><span>up</span></a>
		<a href="#" class="down"><span>down</span></a>
	</div>
</body>
</html>