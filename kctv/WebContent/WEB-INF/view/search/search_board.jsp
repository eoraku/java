<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="search_board" class="div_search_category">
	<div id="board_menu_sub">
		<dl>
			<c:forEach var="i" begin="1" end="6">
			<c:if test="${boardTotal[i]>0 }">
			<c:choose>
			<c:when test="${i==board }">
			<dt>${boardName[i] }</dt>
			</c:when>
			<c:otherwise>
			<dd><a class="a_title" href="search.htm?schText=${schText }&subMenu=board&board=${i}">${boardName[i] }</a></dd>
			</c:otherwise>
			</c:choose>
			</c:if>
			</c:forEach>
		</dl>
	</div>
	<div class="div_category_title">게시판 - ${boardName[board] }</div>
	<div class="div_category_content">
		<ul>
			<li class="li_border"></li>
			<c:forEach items="${boardList }" var="item" varStatus="status">
			<li class="li_board">
				<c:choose>
				<c:when test="${board==3 }">
				<div class="board_title_long"><a class="a_content" href="${ctxRoot }contents/program.htm?muid=${item.board_cate_uid}" target="_new">[${item.cate_name}]</a> <a class="a_title" href="${item.viewHref}" target="_new">${item.board_title}</a></div>
				</c:when>
				<c:when test="${board==4 || board==5 }">
				<div class="board_title_long"><strong>[${item.cate_name}]</strong> <a class="a_title" href="${item.viewHref}" target="_new">${item.board_title}</a></div>
				</c:when>
				<c:when test="${board==6 }">
				<div class="board_title_long"><strong>[${item.cate_name}]</strong> <img src="../images/board/q.gif" width="16" height="15"> <a class="a_title" href="${item.viewHref}" target="_new">${item.board_title}</a></div>
				</c:when>
				<c:otherwise>
				<div class="board_title_long"><a class="a_title" href="${item.viewHref}" target="_new">${item.board_title}</a></div>
				</c:otherwise>
				</c:choose>
				<div class="board_name">${item.board_name}</div>
				<div class="board_date">${item.board_regdate}</div>
				<c:choose>
				<c:when test="${item.board_is_html=='1'}">
				<div class="board_content"><a class="a_content" href="${item.viewHref}" target="_new">HTML 형식의 글은 본문을 참고해주세요.</a></div>
				</c:when>
				<c:otherwise>
				<div class="board_content"><a class="a_content" href="${item.viewHref}" target="_new">${item.board_contents}</a></div>
				</c:otherwise>
				</c:choose>
			</li>
			</c:forEach>
		</ul>
	</div>
	<jsp:include page="/search/paging.htm"/>
</div>