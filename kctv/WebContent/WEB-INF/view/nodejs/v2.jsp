<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Untitled</title>
<!--Adobe Edge Runtime-->
<script type="text/javascript" charset="utf-8" src="../js/nodejs/soccer_edgePreload.js"></script>
<style>
.edgeLoad-EDGE-13201907 { visibility:hidden; }
</style>
<!--Adobe Edge Runtime End-->
<script type="text/javascript" src="../js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/nodejs/socket.io.js"></script>
<script type="text/javascript" src="../js/nodejs/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	setSocket('${serverUrl}');
	
	socket.on('connect', function(){
		//alert("Connected");
	});

	socket.on('toServer', function(data){
		if(data.act == 'goHref')
			goHref(data.val);
		else if(data.act == 'clickV2ById')
			clickV2ById(data.val);
	});
});
</script>
</head>
<body style="margin:0;padding:0;">
	<div id="Stage" class="EDGE-13201907">
	</div>
</body>
</html>