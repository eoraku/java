<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="news_vod_title">
	<c:choose>
	<c:when test="${guid==0 }">
	<img src="../images/news/news_vod11_title.png" width="130" height="20"/>
	</c:when>
	<c:otherwise>
	<img src="../images/news/news_vod${guid }_title.png" width="130" height="20"/>
	</c:otherwise>
	</c:choose>
</div>
<div id="news_vod_table">
	<table id="table_vod_list">
		<c:choose>
		<c:when test="${vodTotal=='0' }">
		<tr>
			<c:choose>
			<c:when test="${schText=='' }">
			<td colspan="2">다시보기가 없습니다.</td>
			</c:when>
			<c:otherwise>
			<td colspan="2"><b>${schText }</b> 에 대한 검색결과가 없습니다.</td>
			</c:otherwise>
			</c:choose>
		</tr>
		</c:when>
		<c:otherwise>
		<c:forEach items="${listVod }" var="item">
		<tr>
			<td class="td_img"><a href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });"><img src="${item.photo_url }" width="120" height="68"/></a></td>
			<td class="td_content">
				<ul class="ul_content">
					<li class="li_title"><a href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });">${item.title }</a> <span>[${item.code_name }]</span></li>
					<li class="li_firstdt">방송일 : ${item.firstdt }</li>
					<li class="li_viewcnt">조회수 : ${item.view_cnt }건</li>
				</ul>
			</td>
		</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="2"></td>
		</tr>
		</tfoot>
	</table>
</div>
<%-- <div id="news_vod_search">
	<form id="vodSchForm" name="vodSchForm" method="get" action="program.htm">
	<ul>
		<li id="search_type">
			<select name="schType">
				<c:choose>
				<c:when test="${schType=='title' }">
				<option value="title" selected="selected">제목</option>
				<option value="date">방송일</option>
				</c:when>
				<c:when test="${schType=='date' }">
				<option value="title">제목</option>
				<option value="date" selected="selected">방송일</option>
				</c:when>
				<c:otherwise>
				<option value="title" selected="selected">제목</option>
				<option value="date">방송일</option>
				</c:otherwise>
				</c:choose>
			</select>
		</li>
		<li id="search_text"><input id="schText" name="schText" type="text" size="20" maxlength="20" value="${schText }"/></li>
		<li id="search_btn"><input type="image" src="../images/common/search_vod.png" width="41" height="19" alt="검색"/></li>
	</ul>
	</form>
</div> --%>
<div id="news_vod_pages">	
	<table id="table_vod_pages">
		<tr>
			<c:if test="${vodPaging.prev!='' }">
			<td><a class="page_prev" href="${urlQuery }${vodPaging.prev }">이전페이지</a></td>
			</c:if>
			<c:forEach items="${vodPaging.pages }" var="item">
			<c:choose>
			<c:when test="${item.isCurrent }">
			<td><div class="page_curr">${item.pageNo }</div></td>
			</c:when>
			<c:otherwise>
			<td><a class="page_link" href="${urlQuery }${item.pageLink }">${item.pageNo }</a></td>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${vodPaging.next!='' }">
			<td><a class="page_next" href="${urlQuery }${vodPaging.next }">다음페이지</a></td>
			</c:if>
		</tr>
	</table>
</div>