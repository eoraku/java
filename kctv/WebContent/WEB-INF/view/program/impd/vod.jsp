<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div id="impd_top">
	<img src="../images/program/impd/impd_top.jpg" width="720" height="361"/>
</div>
<div id="impd_menu">
	<ul>
		<li><img src="../images/program/impd/impd_00.jpg" width="48" height="44"/></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=517&guid=517"><img src="../images/program/impd/impd_10.jpg" width="126" height="44" alt="프로그램소개"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=517&guid=519"><img src="../images/program/impd/impd_20.jpg" width="90" height="44" alt="미리보기"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=517&guid=518"><img src="../images/program/impd/impd_31.jpg" width="126" height="44" alt="방송다시보기"/></a></li>
		<li><img src="../images/program/impd/impd_40.jpg" width="330" height="44"/></li>
	</ul>
</div>
<div id="program_vod">
	<jsp:include page="/vod/0/518/list_vod.htm"/>
</div>