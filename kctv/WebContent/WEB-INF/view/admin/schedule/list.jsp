<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript">
function schedule_delete(){
	document.schedule_list_form.submit();
}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="3" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">편성표</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="3" hspace="8" align="absmiddle"><b>CH7편성표</b></td>
	</tr>
</table>
<form method="post" name="schedule_list_form" action="delete.asp" style="border:0;margin:0;">
<input type="hidden" name="listSize" value="${listSize }"/>
<table width="100%" border="0" cellpadding="5" cellspacing="0">
	<tr>
		<td height="2" colspan="3" align="center" bgcolor="#94BA73"></td>
	</tr>
	<tr>
		<td height="1" colspan="3" align="center" bgcolor="#FFFFFF"></td>
	</tr>
	<tr align="center" bgcolor="#599BB4">
		<th>No</th>
		<th>제목</th>
		<th>편성일</th>
	</tr>
	<tr>
		<td height="3" colspan="3"></td>
	</tr>
	<c:choose>
	<c:when test="${listTotal>0 }">
	<c:forEach items="${listSchedule }" var="item" varStatus="status">
	<input type="hidden" name="chk_val_${status.index }" value="${item.num }"/>
	<tr>
		<td align="center" bgcolor="#FFFFFF">${item.num }</td>
		<td align="left" bgcolor="#FFFFFF"><a href="new.asp?mode=view&firstdt=${item.firstdt }">${item.title }</a></td>
		<td align="center" bgcolor="#FFFFFF">${item.firstdt }</td>
		<%-- <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="chk_del_${status.index }" value="${item.num }"></td> --%>
	</tr>
	<tr>
		<td height="1" colspan="3" align="center" bgcolor="#E7E7E7"></td>
	</tr>
	</c:forEach>
	</c:when>
	<c:otherwise>
	<tr>
		<td colspan="3" align="center">▒▒▒▒ 결과값이 없습니다.▒▒▒▒</td>
	</tr>
	</c:otherwise>
	</c:choose>
	<tr bgcolor="#548699">
		<td height="3" colspan="3" width="1123"></td>
	</tr>
</table>
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
<table width="100%" border="0" cellspacing="0" cellpadding="10">
	<tr>
		<%-- <td>
			<select name="schType">
				<option value="name">제목</option>
				<option value="date">편성일</option>
			</select>
			<input name="schText" type="text" size="15" maxlength="20" value="${schText }" class="form_03">
			<input type="image" src="../../images/admin/btn_search.gif" alt="검색" align="absmiddle">
		</td> --%>
		<td align="right">
			<a href="new.asp"><img src="../../images/admin/btn_write.gif" width="61" height="22" hspace="3" border="0" alt="글쓰기"></a>
			<!-- <a href="#" onclick="javascript:schedule_delete();"><img src="../../images/admin/btn_del.gif" border="0" alt="삭제"></a> -->
		</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>