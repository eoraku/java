<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="sam_top">
	<img src="../images/uncle/top1.jpg" width="700" height="310"/>
</div>
<div id="sam_menu">
	<ul>
		<li><img src="../images/uncle/menu_back1.jpg" width="11" height="40"/></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=54&guid=54"><img src="../images/uncle/menu1_out.jpg" width="120" height="40" alt="프로그램소개"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=54&guid=55"><img src="../images/uncle/menu2_over.jpg" width="120" height="40" alt="방송다시보기"/></a></li>
		<li><img src="../images/uncle/menu_back2.jpg" width="449" height="40"/></li>
	</ul>
</div>
<div id="program_vod">
	<jsp:include page="/vod/0/55/list_vod.htm"/>
</div>