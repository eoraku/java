<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 
 * Markup for jQuery Orbit Plugin 1.2.3
 * www.ZURB.com/playground
 * Copyright 2010, ZURB
 * Free to use under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 -->
<head>
<meta charset="utf-8" />
<title>KCTV NEWS Gallery Demo</title>
<!-- Attach our CSS -->
<link rel="stylesheet" href="../css/nodejs/orbit-1.2.3.css">
<link rel="stylesheet" href="../css/nodejs/demo-style.css">
<!-- Attach necessary JS -->
<script type="text/javascript" src="../js/jquery/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery/jquery.orbit-1.2.3.min.js"></script>
<script type="text/javascript" src="../js/nodejs/socket.io.js"></script>
<script type="text/javascript" src="../js/nodejs/common.js"></script>
<!--[if IE]>
	 <style type="text/css">
		 .timer { display: none !important; }
		 div.caption { background:transparent; filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,endColorstr=#99000000);zoom: 1; }
	</style>
<![endif]-->
<!-- Run the plugin -->
<script type="text/javascript">
$(document).ready(function(){
	setSocket('${serverUrl}');
	
	socket.on('connect', function(){
		//alert("Connected");
	});

	socket.on('toServer', function(data){
		if(data.act == 'goHref')
			goHref(data.val);
		else if(data.act == 'fullScreen'){
			launchFullscreen();
			//$("#fullButton").trigger('click');
		}else if(data.act == 'normalScreen'){
			cancelFullscreen();
		}else if(data.act == 'slideLeft'){
			$("span.left").trigger('click');
		}else if(data.act == 'slideRight'){
			$("span.right").trigger('click');
		}
	});
});

$(window).load(function() {
	$('#featured').orbit();
});
</script>
<!-- Full Screen -->
</head>

<body>
<!-- =======================================

THE ACTUAL ORBIT SLIDER CONTENT 

======================================= -->
	<div id="featured"> 
		<div class="content" style="">
			<h1>Orbit does content now.</h1>
			<h3>Highlight me...I'm text.</h3>
		</div>
		<a href="#"><img src="../images/nodejs/v3/dummy-images/01.jpg" /></a>
		<img src="../images/nodejs/v3/dummy-images/02.jpg" data-caption="#htmlCaption1" />
		<img src="../images/nodejs/v3/dummy-images/03.jpg" data-caption="#htmlCaption2" />
		<img src="../images/nodejs/v3/dummy-images/04.jpg" data-caption="" />
		<img src="../images/nodejs/v3/dummy-images/05.jpg" data-caption="" />
		<img src="../images/nodejs/v3/dummy-images/06.jpg" data-caption="" />
		<img src="../images/nodejs/v3/dummy-images/07.jpg" data-caption="" />
		<img src="../images/nodejs/v3/dummy-images/03.jpg" data-caption="" />
	</div>
	<!-- Captions for Orbit -->	
	<span class="orbit-caption" id="htmlCaption1"><strong>삼다수 근본적 대책은?</strong></span>
	<span class="orbit-caption" id="htmlCaption2"><strong>I'm A Badass Caption:</strong></span>
	<!-- <button onclick="launchFullscreen();" id="fullButton">Launch Fullscreen</button> -->
</body>
</html>