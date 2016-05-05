<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="div_category_page">
	<table id="ul_board_pages">
		<tr>
			<c:if test="${searchPaging.prev!='' }">
			<td><a class="page_prev" href="${urlQuery }${searchPaging.prev }">이전페이지</a></td>
			</c:if>
			<c:forEach items="${searchPaging.pages }" var="item">
			<c:choose>
			<c:when test="${item.isCurrent }">
			<td><div class="page_curr">${item.pageNo }</div></td>
			</c:when>
			<c:otherwise>
			<td><a class="page_link" href="${urlQuery }${item.pageLink }">${item.pageNo }</a></td>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${searchPaging.next!='' }">
			<td><a class="page_next" href="${urlQuery }${searchPaging.next }">다음페이지</a></td>
			</c:if>
		</tr>
	</table>
</div>