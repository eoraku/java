<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/common_header.htm"/>
<jsp:include page="/include/common_top.htm"/>
<jsp:include page="/include/common_top_menu.htm"/>
<div id="common_top_shadow">
</div>
<div id="common_main">
<c:choose>
	<c:when test="${isLeftMenu }">
	<!--jsp:include page="/contents/${menu }/left_menu.htm"/-->
	<jsp:include page="/include/common_left_menu.htm"/>
	<div id="content_with_left_menu">
	<c:choose>
	<c:when test="${cmContent.type==1 }">
	<link href="${ctxRoot }css/board.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src='${ctxRoot }js/board.js'></script>
	<c:if test="${mode=='list' }"><script type="text/javascript" src='${ctxRoot }js/jquery/purl.js'></script></c:if>
	<jsp:include page="/${menu }/content_top.htm?muid=${muid }"/>
	<jsp:include page="/board/content_top.htm"/>
	<jsp:include page="/board/${cmContent.board_id }/${mode }.htm"/>
	</c:when>
	<c:otherwise>
	<jsp:include page="/${menu }/content_top.htm"/>
	<jsp:include page="/${menu }/${subPage }.htm"/>
	</c:otherwise>
	</c:choose>
	</div>
	</c:when>
	<c:otherwise>
	<div id="content_no_left_menu">
	${boardId }
	</div>
	</c:otherwise>
</c:choose>
</div>
<jsp:include page="/include/common_footer.htm"/>