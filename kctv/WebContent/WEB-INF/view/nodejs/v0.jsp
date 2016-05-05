<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> node.js - view </title>
<link href="${ctxRoot }css/common.css" rel="stylesheet" type="text/css" />
<style type="text/css">
p{width:650px;padding:5px;background-color:#dddddd;font-weight:bold;text-align:center;color:red;}
</style>
<script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/nodejs/socket.io.js"></script>
<script type="text/javascript" src="../js/nodejs/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	setSocket('${serverUrl}');
	
	socket.on('connect', function(){
		$("p").text('Connected').css("color","blue");
	});

	socket.on('toServer', function(data){
		if(data.act == 'goHref')
			goHref(data.val);
	});
});
</script>
</head>

<body>
<p>Not connected</p>
<button onclick="launchFullscreen();" id="fullButton">Launch Fullscreen</button>
</body>
</html>
