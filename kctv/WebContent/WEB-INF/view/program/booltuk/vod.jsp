<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div id="impd_top">
	<img src="../images/program/booltuk/tuk_top.jpg" width="720" height="361"/>
</div>
<div id="impd_menu">
	<ul>
		<li><img src="../images/program/booltuk/tuk_00.jpg" width="48" height="44"/></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=525&guid=524"><img src="../images/program/booltuk/tuk_10.jpg" width="132" height="44" alt="프로그램소개"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=525&guid=525"><img src="../images/program/booltuk/tuk_21.jpg" width="141" height="44" alt="방송 다시보기"/></a></li>
		<li><img src="../images/program/booltuk/tuk_30.jpg" width="399" height="44"/></li>
	</ul>
</div>
<div id="program_vod">
	<jsp:include page="/vod/0/1010/list_vod.htm"/>
</div>	