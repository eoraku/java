<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>▒ KCTV제주방송 ▒</title>
<link href="${ctxRoot }css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="JavaScript" src="${ctxRoot }js/movie1.js"></script>
<script language="JavaScript">
<!--
function na_restore_img_src(name, nsdoc)
{
	var img = eval((navigator.appName.indexOf('Netscape', 0) != -1) ? nsdoc+'.'+name : 'document.all.'+name);
	if (name == '')
		return;
	if (img && img.altsrc) {
		img.src = img.altsrc;
		img.altsrc = null;
	}
}

function na_preload_img()
{
	var img_list = na_preload_img.arguments;
	if (document.preloadlist == null)
		document.preloadlist = new Array();
	var top = document.preloadlist.length;
	for (var i=0; i < img_list.length-1; i++) {
		document.preloadlist[top+i] = new Image;
		document.preloadlist[top+i].src = img_list[i+1];
	}
}

function na_change_img_src(name, nsdoc, rpath, preload)
{
	var img = eval((navigator.appName.indexOf('Netscape', 0) != -1) ? nsdoc+'.'+name : 'document.all.'+name);
	if (name == '')
		return;
	if (img) {
		img.altsrc = img.src;
		img.src = rpath;
	}
}
// -->
</script>

</head>
<body leftmargin="0" topmargin="0" bgcolor="#242424" onselectstart="return false" ondragstart="return false" OnLoad="na_preload_img(false, '${ctxRoot}images/vod/play.gif', '${ctxRoot}images/vod/still.gif', '${ctxRoot}images/vod/stop.gif');">
<script language="javascript" event="Buffering(B)" for="m_player">Buffering(B);</script><!--플레이어 버퍼링시작-->
<script language="javascript" event="NewStream()" for="m_player">NewStream();</script>
<script language="javascript" event="Error()" for="m_player">mError();</script>

<!--플레이어 재생바-->
<div id="timebg" style="Z-INDEX: 1; TOP: 402px; LEFT: 188px; HEIGHT: 10px; WIDTH: 0px; POSITION: absolute;">
<table border="0" cellpadding="0" cellspacing="0" width="100%" height="6" background="${ctxRoot}images/vod/time_scg.gif">
	<tr>
		<td>
			<div id="time" style="Z-INDEX: 3; LEFT: 0px; WIDTH: 20px; POSITION: absolute; TOP:0px"><a onmousedown="setTimeBar()" onmouseover="this.style.cursor='hand'"><img src="${ctxRoot}images/vod/time.gif" border="0" alt="진행바"></a></div>
		</td>
	</tr>
</table>
</div>

<!--플레이어 소리바-->
<div id="soundbg" style="Z-INDEX: 2; TOP: 402px; LEFT: 509px; HEIGHT: 10px; WIDTH: 35px; POSITION: absolute;">
<table border="0" cellpadding="0" cellspacing="0" width="100%" height="6" background="${ctxRoot}images/vod/time_scg.gif" id="sbg">
	<tr>
		<td>
			<div id="sound" style="Z-INDEX: 3; LEFT: 35px; WIDTH: 22px; POSITION: absolute; TOP: 0px"><a onmousedown="setVolumeBar()" onmouseover="this.style.cursor='hand'"><img src="${ctxRoot}images/vod/time.gif" border="0" alt="볼륨"></a></div>
		</td>
	</tr>
</table>
</div>

<form name="form">
	<input type=hidden name="e_time" value="100000">
	<input type=hidden name="s_time" value="1">
</form>
<input type="hidden" name="bufferchk" value="">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table border="0" cellpadding="0" cellspacing="0" width="667">
				<tr>
					<td align="left" background="${ctxRoot}images/vod/vod_top_back2.gif"><img src="${ctxRoot}images/vod/vod_top_left3.gif" width="28" height="31" border="0"></td>
					<td align="right" background="${ctxRoot}images/vod/vod_top_back2.gif"><img src="${ctxRoot}images/vod/vod_top_right3.gif" width="177" height="31" border="0"></td>
				</tr>
				<tr>
					<td colspan="2" valign="top">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td background="${ctxRoot}images/vod/vod_left_back.gif">
									<img src="${ctxRoot}images/vod/vod_left_back.gif" width="13" height="8" border="0">
								</td>
								<td>
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<table border="0" align="center" cellpadding="0" cellspacing="0" width="641">
													<tr>
														<td align="center"><!--font color="#CCCCCC">여기는 동영상이 나와야함 </font-->
															<table border="0" cellpadding="0" cellspacing="0">
																<input type="hidden" name="bufferchk" value="">
																<tr>
																	<td width="640" height="360" align="center" valign="top" bgcolor="black">
																		<div id="Advertising">
																			<center>
																			<img src="${ctxRoot}images/vod/loading.gif" width="465" height="350">
																			</center>
																		</div>
																		<div id="divPlayer">
																		<object id="m_player" classid="CLSID:22D6f312-B0F6-11D0-94AB-0080C74C7E95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701" style="left:0px; top:0px;" width="100%" height="100%">
																			<PARAM NAME="transparentAtStart" VALUE="True">
																			<PARAM NAME="transparentAtStop" VALUE="True">
																			<PARAM NAME="AnimationAtStart" VALUE="true">
																			<param name="CurrentPosition" value="1">
																			<param name="SetCurrentEntry" value="1">
																			<param name="ClickToPlay" value="1">
																			<param name="AutoSize" value="1">
																			<param name="AutoStart" value="1">
																			<param name="AutoResize" value="1">
																			<param name="ShowControls" value="0">
																			<param name="ShowAudioControls" value="1">
																			<param name="ShowDisplay" value="0">
																			<param name="ShowTracker" value="1">
																			<param name="ShowStatusBar" value="0">
																			<param name="EnableContextMenu" value="0">
																			<param name="Filename" value="${vod.urlfile}">
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
															<table width="100%" border="0" cellpadding="0" cellspacing="0" height="28" background="${ctxRoot}images/vod/controll.gif" width="640">
																<tr>
																	<td width="5">&nbsp;</td>
																	<td width="33"><img src="${ctxRoot}images/vod/play.gif" name="image1" width="33" height="22" border="0" onclick="onClickPlay();" style="cursor:hand" OnMouseOut="na_restore_img_src('image1', 'document')" OnMouseOver="na_change_img_src('image1', 'document', '${ctxRoot}images/vod/play_on.gif', true)"></td>
																	<td width="21"><img src="${ctxRoot}images/vod/still.gif" name="image2" width="21" height="21" border="0" onclick="onClickPause();" style="cursor:hand" OnMouseOut="na_restore_img_src('image2', 'document')" OnMouseOver="na_change_img_src('image2', 'document', '${ctxRoot}images/vod/still_on.gif', true)"></td>
																	<td width="21"><img src="${ctxRoot}images/vod/stop.gif" name="image3" width="21" height="21" border="0" onclick="onClickStop();" style="cursor:hand" OnMouseOut="na_restore_img_src('image3', 'document')" OnMouseOver="na_change_img_src('image3', 'document', '${ctxRoot}images/vod/stop_on.gif', true)"></td>
																	<td valign="middle" width="83">
																		<!-- 플레이 시간 보이기 -->
																		<div id="sTime" style="font-size:11px;color:rgb(255,192,0); position:relative; top:0px; z-index:100; visibility:show;">00:00/00:00</div>
																		<!-- 플레이 시간 보이기 -->
																	</td>
																	<td width="375">&nbsp;</td>
																	<td width="21"><img src="${ctxRoot}images/vod/full.gif" width="21" height="21" border="0" onclick="onClickFull();" style="cursor:hand" alt="전체보기"></td>
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
								<td background="${ctxRoot}images/vod/vod_right_back.gif">
									<img src="${ctxRoot}images/vod/vod_right_back.gif" width="14" height="8" border="0">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%" align="left" background="${ctxRoot}images/vod/vod_foot_back2.gif"><img src="${ctxRoot}images/vod/vod_foot_left2.gif" width="23" height="13" border="0"></td>
					<td width="100%" align="right" background="${ctxRoot}images/vod/vod_foot_back2.gif"><img src="${ctxRoot}images/vod/vod_foot_wide_right2.gif" width="112" height="13" border="0"></td>
				</tr>
			</table>
		</td>
		<td width="312" valign="top" background="${ctxRoot}images/vod/memo_back.gif">
			<table border="0" cellpadding="0" cellspacing="0" width="308" height="410">
				<tr>
					<td width="10">&nbsp;</td>
					<td width="300" valign="top">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="264" height="20">&nbsp;</td>
							</tr>
							<tr>
								<td width="280" valign="top">
									<table width="280" height="26" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td><img src="${ctxRoot }images/vod/tab_00.gif" width="280" height="26" border="0"></td>
										</tr>
										<tr>
											<td valign="top" bgcolor="#ffffff" style="width:280px;height:370px;overflow:auto;">
												<div style="width:280px;height:370px;overflow:auto;">
												<p style="font-size:10pt;margin-left:5px;margin-right:5px;"><img src="${ctxRoot }images/vod/icon_arrow1.gif" width="3" height="5" /> <strong>방송제목</strong> : ${vod.title }<br/>
												<img src="${ctxRoot }images/vod/icon_arrow1.gif" width="3" height="5" /> <strong>날짜</strong> : ${vod.firstdt }<br/>
												<img src="${ctxRoot }images/vod/icon_arrow1.gif" width="3" height="5" /> <strong>M C</strong> : ${vod.character }<br/>
												<img src="${ctxRoot }images/vod/icon_arrow1.gif" width="3" height="5" /> <strong>내용</strong></p>
												<p style="margin-left:5px;margin-right:5px;">${vod.content }</p>
												</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<map name="Map">
	<area shape="rect" coords="4,6,64,23" href="javascript:ShowScore('1')">
	<area shape="rect" coords="77,4,139,22" href="javascript:ShowScore('2')">
</map>
<map name="Map3">
	<area shape="rect" coords="8,4,67,22" href="javascript:ShowScore('1')"><area shape="rect" coords="74,5,141,23" href="javascript:ShowScore('2')">
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