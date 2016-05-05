<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">KCTV 뉴스</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>뉴스제보</b></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="5">	
	<tr bgcolor="#599BB4">
		<th>No</th>
		<th>분류</th>
		<th>제 목</th>
		<th>글쓴이</th>
		<th>등록일</th>
	</tr>
	<tr>
		<td height="5" colspan="5"></td>
	</tr>
	<c:forEach items="${listReport }" var="item">
	<tr>
		<td align="center">${item.board_uid }</td>
		<td align="center">${newsCategory[item.board_cate_uid] }</td>
		<td><a href="viewReport.asp?uid=${item.board_uid }">${item.board_title }${item.comments }</a>${item.fileLink }</td>
		<td align="center">${item.board_name }</td>
		<td align="center">${item.board_regdate }</td>
	</tr>
	<tr>
		<td height="1" colspan="5" align="center" bgcolor="#E7E7E7"></td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="5"></td>
	</tr>
</table>

<c:if test="${listPaging.pageMax>0 }">
<div id="div_btm_pages">
	<table id="ul_board_pages">
		<tr>
			<c:if test="${listPaging.prev!='' }">
			<td><a class="page_prev" href="${urlQuery }${listPaging.prev }">이전페이지</a></td>
			</c:if>
			<c:forEach items="${listPaging.pages }" var="item">
			<c:choose>
			<c:when test="${item.isCurrent }">
			<td><div class="page_curr">${item.pageNo }</div></td>
			</c:when>
			<c:otherwise>
			<td><a class="page_link" href="${urlQuery }${item.pageLink }">${item.pageNo }</a></td>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${listPaging.next!='' }">
			<td><a class="page_next" href="${urlQuery }${listPaging.next }">다음페이지</a></td>
			</c:if>
		</tr>
	</table>
</div>
</c:if>
</body>
</html>