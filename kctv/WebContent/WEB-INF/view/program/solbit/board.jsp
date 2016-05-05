<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div id="impd_top">
	<img src="../images/program/solbit/sol_top.jpg" width="720" height="361"/>
</div>
<div id="impd_menu">
	<ul>
		<li><img src="../images/program/solbit/sol_00.jpg" width="42" height="44"/></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=529&guid=529"><img src="../images/program/solbit/sol_10.jpg" width="98" height="44" alt="솔빛별 가족"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=529&guid=530"><img src="../images/program/solbit/sol_20.jpg" width="140" height="44" alt="산티아고 가는 길"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=529&guid=531"><img src="../images/program/solbit/sol_30.jpg" width="117" height="44" alt="방송다시보기"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=529&guid=532"><img src="../images/program/solbit/sol_41.jpg" width="110" height="44" alt="시청자게시판"/></a></li>
		<li><img src="../images/program/solbit/sol_50.jpg" width="213" height="44"/></li>
	</ul>
</div>
<link href="${ctxRoot }css/board.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src='${ctxRoot }js/board.js'></script>
<div id="program_board">
	<jsp:include page="/board/pgBoard_532/${mode }.htm"/>
</div>