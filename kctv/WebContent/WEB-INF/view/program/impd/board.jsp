<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div id="impd_top">
	<img src="../images/program/impd/impd_top.jpg" width="720" height="361"/>
</div>
<div id="impd_menu">
	<ul>
		<li><img src="../images/program/impd/impd_00.jpg" width="48" height="44"/></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=517&guid=517"><img src="../images/program/impd/impd_10.jpg" width="126" height="44" alt="프로그램소개"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=517&guid=519"><img src="../images/program/impd/impd_21.jpg" width="90" height="44" alt="미리보기"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=517&guid=518"><img src="../images/program/impd/impd_30.jpg" width="126" height="44" alt="방송다시보기"/></a></li>
		<li><img src="../images/program/impd/impd_40.jpg" width="330" height="44"/></li>
	</ul>
</div>
<link href="${ctxRoot }css/board.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src='${ctxRoot }js/board.js'></script>
<div id="program_board">
	<jsp:include page="/board/pgBoard_519/${mode }.htm"/>
</div>