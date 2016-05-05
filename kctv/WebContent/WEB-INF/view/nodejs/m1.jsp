<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link rel="stylesheet" type="text/css" href="../css/nodejs/jquery.mobile-1.1.0.min.css" />
<link rel="stylesheet" type="text/css" href="../css/nodejs/ui_s1-2.css" />
<script type="text/javascript" src="../js/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.mobile-1.1.0.min.js"></script>
<script type="text/javascript" src="../js/nodejs/socket.io.js"></script>
<script type="text/javascript" src="../js/nodejs/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	setSocket('${serverUrl}');
	
	socket.on('connect', function(){
		//alert("Connected");
	});
	
	$(".ui-btn-right").click(function(){
		//send("goHref","v0.htm");
	});

	$(".sample1").click(function(){
		sendToView("goHref","v1.htm");
	});
	
	$(".sample2").click(function(){
		sendToView("goHref","v2.htm");
	});
	
	$(".list").click(function(){
		sendToView("clickV1ById",$(this).attr("id"));
	});
	
	$(".backlist").click(function(){
		sendToView("clickV1ById",0);
	});
	
	$("#soccerPlay").click(function(){
		sendToView("clickV2ById","fadeIn");
	});
	
	$(".playerA a").click(function(){
		sendToView("clickV2ById",$(this).attr("id"));
	});
	
	$(".playerB a").click(function(){
		sendToView("clickV2ById",$(this).attr("id"));
	});
});
</script>
</head>

<body>
<!-- Start page -->
<div data-role="page" id="index">
	<!-- Edit.2 17행 data-role="content"삭제-->
	<div>
		<a href="#s1" class="sample1"><span>sample1</span></a>
		<div class="Rule"></div>
		<a href="#s2" class="sample2"><span>sample2</span></a>
	</div>
</div>

<!-- Start of second page -->
<div data-role="page" id="s1">
	<div data-role="header" data-theme="c" class="ui-bar">
	<h1>K C T V / _S a m p l e 1</h1>
	</div><!-- /header -->
	<div data-role="content">
		<a href="m1.htm" data-role="button" data-icon="arrow-u" data-iconpos="top" data-inline="true" class="ui-btn-right">Home</a>
		<div>
			<ul><li>
				<a href="#"><img src="../images/nodejs/m1/list1.png" class="list" id="1"></a>
				<a href="#"><img src="../images/nodejs/m1/list2.png" class="list" id="2"></a>
				<a href="#"><img src="../images/nodejs/m1/list3.png" class="list" id="3"></a>
				<a href="#"><img src="../images/nodejs/m1/list4.png" class="list" id="4"></a>
				<a href="#"><img src="../images/nodejs/m1/list5.png" class="list" id="5"></a>
				<a href="#"><img src="../images/nodejs/m1/list6.png" class="list" id="6"></a>
			</li></ul>
		</div>
		<div>
			<ul><li>
				<img src="../images/nodejs/m1/s1_list.png" class="backlist" style="cursor:pointer;"/>
			</li></ul>
		</div>
	</div><!-- /content -->
</div>

<!-- Start of third page -->
<div data-role="page" id="s2">
	<div data-role="header" data-theme="c" class="ui-bar">
		<h1>K C T V / _S p o r t s</h1>
	</div><!-- /header -->
	<div data-role="content">
		<a href="m1.htm" data-role="button" data-icon="arrow-u" data-iconpos="top" data-inline="true" class="ui-btn-right">Home</a>
		<a href="#" data-role="button" data-icon="arrow-r" data-iconpos="top" data-inline="true" id="soccerPlay">Play</a>
		<div class="playerA">
			<ul>
				<li>
				<a href="#" class="A-p1" id="_5-1"><span>A-p1</span></a>
				<a href="#" class="A-p2" id="_5-2"><span>A-p2</span></a>
				<a href="#" class="A-p3" id="_5-3"><span>A-p3</span></a>
				<a href="#" class="A-p4" id="_5-4"><span>A-p4</span></a>
				</li>
				<li>
				<a href="#" class="A-p5" id="_5-5"><span>A-p5</span></a>
				<a href="#" class="A-p6" id="_5-6"><span>A-p6</span></a>
				<a href="#" class="A-p7" id="_5-7"><span>A-p7</span></a>
				</li>
			</ul>
		</div>
		<div class="playerB">
			<ul>
				<li>
				<a href="#" class="B-p1" id="_4-1"><span>B-p1</span></a>
				<a href="#" class="B-p2" id="_4-2"><span>B-p2</span></a>
				<a href="#" class="B-p3" id="_4-3"><span>B-p3</span></a>
				<a href="#" class="B-p4" id="_4-4"><span>B-p4</span></a>
				</li>
				<li>
				<a href="#" class="B-p5" id="_4-5"><span>B-p5</span></a>
				<a href="#" class="B-p6" id="_4-6"><span>B-p6</span></a>
				<a href="#" class="B-p7" id="_4-7"><span>B-p7</span></a>
				</li>
			</ul>
		</div>
	</div>
</div><!-- /content -->
</body>
</html>