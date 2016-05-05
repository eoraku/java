<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>⑵ KCTV力林规价 ⑵</title>
<link href="${ctxRoot }css/common.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<div id="vod_wmv_outer">
	<div id="vod_wmv_left">
		<!--[if !IE]>
		<-->
		<object data="${vod.urlfile}" width="640" height="427">
			<param name="src" type="${vod.urlfile}" value="${vod.urlfile}" valuetype="ref" />
			<param name="animationatStart" value="1" />
			<param name="transparentatStart" value="1" />
			<param name="autoStart" value="1" />
			<param name="ShowControls" value="1" />
			<param name="ShowDisplay" value="0" />
			<param name="ShowStatusBar" value="1" />
			<param name="loop" value="0" />
		</object>
		<!--> 
		<![endif]-->
		<!--[if IE]>
		<object type="video/x-ms-wmv" data="${vod.urlfile}"  width="640" height="427">
			<param name="src" value="${vod.urlfile}" valuetype="ref">
			<param name="animationatStart" value="1">
			<param name="transparentatStart" value="1">
			<param name="autoStart" value="1">
			<param name="ShowControls" value="1">
			<param name="ShowDisplay" value="0">
			<param name="ShowStatusBar" value="1">
			<param name="loop" value="0">
		</object>
		<![endif]-->
	</div>
	<div id="vod_wmv_right">
		<div id="vod_wmv_content">
			<dl>
				<dt><img src="${ctxRoot }images/vod/tab_00.gif" width="310" height="26" border="0"/></dt>
				<dd>
					<p style="font-size:10pt;margin-left:5px;margin-right:5px;margin-top:5px;"><img src="${ctxRoot }images/vod/icon_arrow1.gif" width="3" height="5" /> <strong>规价力格</strong> : ${vod.title }<br/>
					<img src="${ctxRoot }images/vod/icon_arrow1.gif" width="3" height="5" /> <strong>朝楼</strong> : ${vod.firstdt }<br/>
					<img src="${ctxRoot }images/vod/icon_arrow1.gif" width="3" height="5" /> <strong>M C</strong> : ${vod.character }<br/>
					<img src="${ctxRoot }images/vod/icon_arrow1.gif" width="3" height="5" /> <strong>郴侩</strong></p>
					<p style="margin-left:5px;margin-right:5px;">${vod.content }</p>
				</dd>
			</dl>
		</div>
		<div id="vod_wmv_player_down">
			<a href="http://windows.microsoft.com/ko-KR/windows/windows-media-player" target="_blank"><img src="${ctxRoot }images/vod/player_down2.png" width="310" height="37" border="0"/></a>
		</div>
	</div>
</div>
<script type="text/javascript"> 
<!-- Hide from old browsers
/********** s:备臂 烹拌 **********/
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-32905528-1']);
_gaq.push(['_trackPageview']);

(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
/********** e:备臂 烹拌 **********/
// -->
</script>
</body>
</html>