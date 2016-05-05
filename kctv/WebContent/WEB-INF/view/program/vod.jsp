<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="program_banner">
	<img src="../images/program/topimg.gif" width="670" height="78"/>
</div>
${subContent }
<div id="program_tab">
	<c:forEach items="${cmSubMenu }" var="item">
	<ul>
		<li class="program_tab_left"><img src="../images/program/tab_left_r.gif" width="3" height="27" /></li>
		<c:choose>
		<c:when test="${item.cmme_uid == guid }">
		<li class="program_tab_menu"><nobr><a href="program.htm?muid=${muid }&guid=${item.cmme_uid}"><strong>${item.cmme_name }</strong></a></nobr></li>
		</c:when>
		<c:otherwise>
		<li class="program_tab_menu"><nobr><a href="program.htm?muid=${muid }&guid=${item.cmme_uid}">${item.cmme_name }</a></nobr></li>
		</c:otherwise>
		</c:choose>
		<li class="program_tab_right"><img src="../images/program/tab_right_r.gif" width="5" height="27" /></li>
	</ul>
	</c:forEach>
</div>
<div id="program_vod">
	<jsp:include page="/vod/0/${cmct_exefile }/list_vod.htm"/>
</div>