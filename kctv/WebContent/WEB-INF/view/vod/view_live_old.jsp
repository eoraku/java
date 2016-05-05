<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>▒ KCTV제주방송 ▒</title>
<link href="${ctxRoot }common/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${ctxRoot }js/movie2.js" charset="utf-8"></script>
<script type="text/javascript">
<!-- Hide from old browsers
if (navigator.appName == "Netscape") {
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown = checkClick;

	function checkClick(ev) {
		if (ev.which != 1) {
			alert('마우스 오른쪽 버튼은 사용할 수 없습니다.');
			return false;
		}
	}
}
// -->
</script>

</head>
<body leftmargin="0" topmargin="0" bgcolor="#242424" onselectstart="return false" ondragstart="return false">
<script type="text/javascript" event="Buffering(B)" for="m_player">Buffering(B);</script><!--플레이어 버퍼링시작-->
<script type="text/javascript" event="NewStream()" for="m_player">NewStream();</script>
<script type="text/javascript" event="Error()" for="m_player">mError();</script>


<!--플레이어 소리바--> 
<div id="soundbg" style="Z-INDEX: 2; TOP: 402px; LEFT: 509px; HEIGHT: 10px; WIDTH: 35px; POSITION: absolute;">
	<table border="0" cellpadding="0" cellspacing="0" width="100%" height="6" background="${ctxRoot }images/vod/time_scg.gif" id="sbg">
		<tr>
			<td>
				<div id="sound" style="Z-INDEX: 3; LEFT: 35px; WIDTH: 22px; POSITION: absolute; TOP: 0px"><a onmousedown=setVolumeBar() onmouseover="this.style.cursor='hand'"><IMG src="${ctxRoot }images/vod/time.gif"  border=0 alt="볼륨"></a></div>
			</td>
		</tr>
	</table>
</div>

<form name="form">
<input type=hidden name="e_time" value="100000">
<input type=hidden name="s_time" value="1">
</form>

<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table border="0" cellpadding="0" cellspacing="0" width="667">
				<tr>
					<td align="left" background="${ctxRoot }images/vod/vod_top_back2.gif"><p><img src="${ctxRoot }images/vod/vod_top_left3.gif" width="28" height="31" border="0"></p></td>
					<td align="right" background="${ctxRoot }images/vod/vod_top_back2.gif"><p><img src="${ctxRoot }images/vod/vod_top_right3_live.gif" width="177" height="31" border="0"></p></td>
				</tr>
				<tr>
					<td colspan="2" valign="top">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td background="${ctxRoot }images/vod/vod_left_back.gif"><img src="${ctxRoot }images/vod/vod_left_back.gif" width="13" height="8" border="0"></td>
								<td>
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<table border="0" align="center" cellpadding="0" cellspacing="0" width="641">
													<tr>
														<td align="center">
															<!--font color="#CCCCCC">여기는 동영상이 나와야함 </font-->
															<table border="0" cellpadding="0" cellspacing="0">
																<input type="hidden" name="bufferchk" value="">
																<tr>
																	<td width="640" height="360" align="center" valign="top" bgcolor="black">
																		<div id="Advertising">
																		<center><img src="${ctxRoot }images/vod/loading.gif" width="465" height="350"></center>
																		</div>
																		<div id="divPlayer">
																			<object id="m_player" classid="CLSID:22D6f312-B0F6-11D0-94AB-0080C74C7E95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701" id="MMP" style="left:0px; top:0px;" width="100%" height="100%">
																				<param name="transparentAtStart" value="True">
																				<param name="transparentAtStop" value="True">
																				<param name="AnimationAtStart" value="true">
																				<param name="CurrentPosition" value="1">
																				<param name="SetCurrentEntry" value="1">
																				<param name="ClickToPlay" value="1">
																				<param name="AutoSize" value="1">
																				<param name="AutoStart" value="1">
																				<param name="AutoResize" value="1">
																				<param name="AutoStart" value="1">
																				<param name="ShowControls" value="0">
																				<param name="ShowAudioControls" value="1">
																				<param name="ShowDisplay" value="0">
																				<param name="ShowTracker" value="1">
																				<param name="ShowStatusBar" value="0">
																				<param name="EnableContextMenu" value="0">
																				<param name="FileName" value="${liveCh }">
																				<param name="ShowPositionControls" value="0">
																				<param name="DisplayBackColor" value="0">
																				<param name="ShowTracker" value="1">
																				<param name="ShowCaptioning" value="0">
																			</object>
																		</div>
																	</td>
																</tr>
															</table>
															<!-- 플레이바 이미지 -->
															<table width="100%" border="0" cellpadding="0" cellspacing="0" height="28" background="${ctxRoot }images/vod/controll_live.gif" width="640">
																<tr>
																	<td width="5">&nbsp;</td>
																	<td width="37">&nbsp;</td>
																	<td width="362">&nbsp;</td>
																	<td width="209">
																		<!-- 플레이 시간 보이기 -->
																		<span style="font-size:11px"><div id="sTime" name="sTime" style="color:rgb(255,192,0); position:relative; top:3px; z-index:100; visibility:show;">00:00/00:00</DIV></span>
																		<!-- 플레이 시간 보이기 -->
																	</td>
																	<td width="27"><img src="${ctxRoot }images/vod/full.gif" width="21" height="21" border="0" onclick="onClickFull();" style="cursor:hand" alt="전체보기"></td>
																</tr>
															</table>
															<!-- 플레이바 이미지 -->
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td background="${ctxRoot }images/vod/vod_right_back.gif"><img src="${ctxRoot }images/vod/vod_right_back.gif" width="14" height="8" border="0"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%" align="left" background="${ctxRoot }images/vod/vod_foot_back2.gif" height="14"><p><img src="${ctxRoot }images/vod/vod_foot_left2.gif" width="23" height="13" border="0"></p></td>
					<td width="100%" align="right" background="${ctxRoot }images/vod/vod_foot_back2.gif" height="14"><p><img src="${ctxRoot }images/vod/vod_foot_wide_right2.gif" width="112" height="13" border="0" usemap="#ImageMap1"></p></td>
				</tr>
			</table>
		</td>
		<td width="312" valign="top" background="${ctxRoot }images/vod/memo_back.gif">&nbsp;</td>
	</tr>
</table>
<map name="ImageMap1">
	<area shape="rect" coords="1, 4, 46, 21" Onclick="MMP.DisplaySize = 3;">
	<area shape="rect" coords="48, 2, 95, 21"  href="javascript:window.close();">
</map>

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