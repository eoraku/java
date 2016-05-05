<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> node.js - control </title>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link href="${ctxRoot }css/common.css" rel="stylesheet" type="text/css" />
<style type="text/css">
p{width:320px;padding:5px;background-color:#dddddd;font-weight:bold;text-align:center;color:red;}
div{width:330px;}
ul{}
li{float:left;width:90px;height:50px;margin:10px;cursor:pointer;}
dl{width:310px;padding:10px;}
dd{float:right;}
</style>
<script type="text/javascript" src="${ctxRoot }js/nodejs/socket.io.js"></script>
<script type="text/javascript" src="${ctxRoot }js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var socket;
$(document).ready(function(){
	socket = io.connect('${serverUrl}',{
		'reconnect':true
		, 'resource':'socket.io'
	});
	
	socket.on('connect', function(){
		$("p").text('Connected').css("color","blue");
	});

	$("li").hover(
		function(){
			var idx = $("ul li").index($(this));
			send("over",idx);
			$(this).css("background-color","#ffdddd");
		},
		function(){
			var idx = $("ul li").index($(this));
			send("out",idx);
			$(this).css("background-color","#ffffff");
	});

	$("li").click(function(){
		var idx = $("ul li").index($(this));
		send("click",idx);
	});

	$("#btn").click(function(){
		send("closeAll",0);
	});
});

function send(act, val){
	socket.emit('fromClient', {act:act, val:val});
}
</script>
</head>

<body>
<p>Not connected</p>
<div>
	<ul>
		<c:forEach items="${listNews}" var="item">
		<li><img src="${item.svrfile2 }" width="90" height="50" /></li>
		</c:forEach>
	</ul>
	<dl>
		<dd><input type="button" id="btn" value="Close All"/></dd>
	</dl>
</div>
</body>
</html>
