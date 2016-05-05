<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="bicycle_top">
	<div id="wheel1"><img src="../images/program/bicycle/wheel1.gif" width="175" height="170"/></div>
	<div id="top1"><img src="../images/program/bicycle/top1.png" width="525" height="170"/></div>
	<div id="top2"><img src="../images/program/bicycle/top2.png" width="700" height="56"/></div>
	<div id="top3"><img src="../images/program/bicycle/top3.png" width="558" height="134"/></div>
	<div id="wheel2"><img src="../images/program/bicycle/wheel2.gif" width="142" height="134"/></div>
</div>
<div id="bicycle_menu">
	<ul>
		<c:choose>
		<c:when test="${guid==367 }">
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=365"><img src="../images/program/bicycle/menu1.gif" width="128" height="45" alt="���α׷� �Ұ�"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=367"><img src="../images/program/bicycle/menu2-ani.gif" width="128" height="45" alt="�˷��帳�ϴ�"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=366"><img src="../images/program/bicycle/menu3.gif" width="128" height="45" alt="��� �ٽú���"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=368"><img src="../images/program/bicycle/menu4.gif" width="94" height="45" alt="�̸�����"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=369"><img src="../images/program/bicycle/menu5.gif" width="114" height="45" alt="��û�� ����"/></a></li>
		</c:when>
		<c:when test="${guid==368 }">
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=365"><img src="../images/program/bicycle/menu1.gif" width="128" height="45" alt="���α׷� �Ұ�"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=367"><img src="../images/program/bicycle/menu2.gif" width="128" height="45" alt="�˷��帳�ϴ�"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=366"><img src="../images/program/bicycle/menu3.gif" width="128" height="45" alt="��� �ٽú���"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=368"><img src="../images/program/bicycle/menu4-ani.gif" width="94" height="45" alt="�̸�����"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=369"><img src="../images/program/bicycle/menu5.gif" width="114" height="45" alt="��û�� ����"/></a></li>
		</c:when>
		<c:when test="${guid==369 }">
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=365"><img src="../images/program/bicycle/menu1.gif" width="128" height="45" alt="���α׷� �Ұ�"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=367"><img src="../images/program/bicycle/menu2.gif" width="128" height="45" alt="�˷��帳�ϴ�"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=366"><img src="../images/program/bicycle/menu3.gif" width="128" height="45" alt="��� �ٽú���"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=368"><img src="../images/program/bicycle/menu4.gif" width="94" height="45" alt="�̸�����"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=365&guid=369"><img src="../images/program/bicycle/menu5-ani.gif" width="114" height="45" alt="��û�� ����"/></a></li>
		</c:when>
		</c:choose>
	</ul>
</div>
<link href="${ctxRoot }css/board.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src='${ctxRoot }js/board.js'></script>
<div id="program_board">
	<jsp:include page="/board/pgBoard_${guid }/${mode }.htm"/>
</div>