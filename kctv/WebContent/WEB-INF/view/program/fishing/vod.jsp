<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div id="fishing_top">
	<img src="../images/program/fishing/top1.jpg" width="700" height="330"/>
</div>
<div id="fishing_menu">
	<ul>
		<li><img src="../images/program/fishing/menu_back1.jpg" width="23" height="63"/></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=73&guid=73"><img src="../images/program/fishing/menu1_out.jpg" width="126" height="63" alt="프로그램소개"/></a></li>
		<li><img src="../images/program/fishing/menu_back2.jpg" width="13" height="63"/></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=73&guid=74"><img src="../images/program/fishing/menu2_over.jpg" width="126" height="63" alt="방송다시보기"/></a></li>
		<li><img src="../images/program/fishing/menu_back3.jpg" width="13" height="63"/></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=73&guid=75"><img src="../images/program/fishing/menu3_out.jpg" width="126" height="63" alt="시청자참여"/></a></li>
		<li><img src="../images/program/fishing/menu_back4.jpg" width="273" height="63"/></li>
	</ul>
</div>
<div id="program_vod">
	<jsp:include page="/vod/0/74/list_vod.htm"/>
</div>