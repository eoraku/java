<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<title></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../css/nodejs/iview.css" />
<link rel="stylesheet" href="../css/nodejs/skin 2/style.css" />
<script type="text/javascript" src="../js/nodejs/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/nodejs/raphael-min.js"></script>
<script type="text/javascript" src="../js/nodejs/jquery.easing.js"></script>
<script type="text/javascript" src="../js/nodejs/iview.js"></script>
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
		else if(data.act == 'v4Prev'){
			$(".iview-prevNav").trigger('click');
		}else if(data.act == 'v4Next'){
			$(".iview-nextNav").trigger('click');
		}else if(data.act == 'v4Stop'){
			$("#iview-timer").trigger('click');
		}else if(data.act == 'v4Play'){
			playPause();
		}else if(data.act == 'v4Full'){
			fullVideo();
		}else if(data.act == 'normalScreen'){
			cancelFullscreen();
		}else if(data.act == 'slideLeft'){
			$("span.left").trigger('click');
		}else if(data.act == 'slideRight'){
			$("span.right").trigger('click');
		}
	});
	
	$('#iview').iView({
		pauseTime: 7000,
		pauseOnHover: true,
		directionNav: true,
		directionNavHide: false,
		directionNavHoverOpacity: 0,
		controlNav: false,
		nextLabel: "Nächste",
		previousLabel: "Vorherige",
		playLabel: "Spielen",
		pauseLabel: "Pause",
		timer: "360Bar",
		timerPadding: 3,
		timerColor: "#0F0"
	});
});

function playPause() {
	var myVideo = document.getElementsByTagName('video')[0];
	if (myVideo.paused)
		myVideo.play();
	else
		myVideo.pause();
}

function fullVideo(){
	var myVideo = document.getElementsByTagName('video');
	$("video").attr('width',"100%");
	$("video").attr('height',"100%");
}
</script>
</head>
<body>
<div class="container">
	<div id="iview">
		<div data-iview:image="../images/nodejs/v4/photos/photo6.jpg">
			<div class="iview-caption caption1" data-x="940" data-y="480" data-transition="expandLeft">사람을 키우는 제주, 사람이 제주를 바꿉니다.</div>
		</div>

		<div data-iview:image="../images/nodejs/v4/photos/photo7.jpg">
			<div class="iview-caption video-caption" data-x="70" data-y="50" data-transition="wipeUp">

				<video id="video" width="1280" height="720" controls>
				<source src="http://media1.kctvjeju.com/p2_video.mp4" type="video/mp4">
				Your browser does not support the video tag.
				</video>
			</div>
			<!-- playpause -->
			<!-- <input type="button" onclick="playPause()" value="Play/Pause" id="playPause"> -->
			
			<div class="iview-caption caption4" data-x="1400" data-y="540" data-transition="wipeRight">Video</div>
			<div class="iview-caption caption5" data-x="1540" data-y="545" data-transition="wipeLeft">Support</div>
			<div class="iview-caption caption3" data-x="1400" data-y="600" data-width="440" data-height="70" data-transition="wipeLeft">You can easily add <b>KCTV</b> & <b>NEWS</b> to your <b>Slides</b> & <b>Captions</b></div>
		</div>

		<div data-iview:image="../images/nodejs/v4/photos/photo8.jpg">
			<div class="iview-caption caption2" data-x="540" data-y="750" data-transition="wipeRight">OPTIONAL AUTO-HIDE CONTROLS + OPTIONAL ROLLOVER SLIDESHOW PAUSE</div>
		</div>

		<div data-iview:image="../images/nodejs/v4/photos/photo9.jpg">
			<div class="iview-caption" data-x="900" data-y="800" data-transition="wipeLeft">A SMOOTH AND SEXY CROSS-BROWSER SLIDER FOR YOUR IMAGES & VIDEOS</div>
		</div>

		<div data-iview:image="../images/nodejs/v4/photos/photo10.jpg">
			<div class="iview-caption caption3" data-x="200" data-y="900" data-transition="wipeLeft">FEATURING ANIMATED CAPTIONS WITH MANY TRANSITION EFFECTS</div>
		</div>
	</div>
</div>	
</body>
</html>