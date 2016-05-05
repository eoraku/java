<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KCTV VOD</title>
<style type="text/css">
@charset "utf-8";

/* http://meyerweb.com/eric/tools/css/reset/ 
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;

	vertical-align: baseline;
	font-size: 12px;
	font-family: "dotum";
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 130%;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

/* VOD 플레이어 */
#eng_vod_palyer{width:1022px;height:446px;background-color:#000000;}
	#vod_player_main{float:left;width:720px;height:404px;padding:21px;overflow:hidden;background:url(${ctxRoot}images/news/eng_vod_bg.png) no-repeat;}
	#vod_player_content{float:left;width:260px;height:446px;overflow:hidden;}
	#vod_player_content dl{}
	#vod_player_content dt{float:left;padding-left:5px;padding-top:5px;}
	#vod_player_content dd{float:left;width:250px;height:408px;padding:5px;overflow:scroll;background-color:#ffffff;}
</style>
</head>
<body>
<div id="eng_vod_palyer">
	<div id="vod_player_main">
	<object id="player" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" name="player" width="720" height="404">
		<param name="movie" value="${ctxRoot }images/flash/player.swf" />
		<param name="allowfullscreen" value="true" />
		<param name="allowscriptaccess" value="always" />
		<param name="showShareWidget" value="false" />
		<param name="flashvars" value="showShareWidget=false&src=http://media1.kctvjeju.com/${vod.svrfile }&poster=${ctxRoot }upload/vod/${vod.photo_url }" />
		<embed type="application/x-shockwave-flash" id="player2" name="player2" src="${ctxRoot }images/flash/player.swf" 
			width="720" height="404" allowscriptaccess="always" showShareWidget="false" allowfullscreen="true" 
			flashvars="showShareWidget=false&src=http://media1.kctvjeju.com/${vod.svrfile }&poster=/upload/vod/${vod.photo_url }" />
	</object>
	</div>
	<div id="vod_player_content">
		<dl>
			<dt><img src="${ctxRoot }images/news/${engchi }_vod_title.png" width="208" height="23" /></dt>
			<dd>
			<strong>On Date : ${vod.firstdt }</strong><br/><br/>
			${vod.content }
			</dd>
		</dl>
	</div>
</div>
<script type="text/javascript"> 
<!-- Hide from old browsers
/********** s:구글 통계 **********/
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-32905528-1']);
_gaq.push(['_trackPageview']);

(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
/********** e:구글 통계 **********/
// -->
</script>
</body>
</html>