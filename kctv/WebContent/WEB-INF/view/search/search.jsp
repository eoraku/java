<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/common_header.htm"/>
<jsp:include page="/include/common_top.htm"/>
<div id="search_main">
	<div id="div_search_main">
		<div id="div_search_left">
			<ul>
				<c:choose>
				<c:when test="${subMenu=='main' }">
				<li class="search_menu_on"><img src="${ctxRoot}images/search/search_menu01_on.gif" width="169" height="40" alt="통합검색" /></li>
				</c:when>
				<c:otherwise>
				<li class="search_menu_off"><a href="search.htm?schText=${enSchText }"><img src="${ctxRoot}images/search/search_menu01_out.gif" width="169" height="30" alt="통합검색" /></a></li>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${subMenu=='program' }">
				<li class="search_menu_on"><img src="${ctxRoot}images/search/search_menu02_on.gif" width="169" height="40" alt="프로그램" /></li>
				</c:when>
				<c:when test="${programTotal>0 }">
				<li class="search_menu_off"><a href="search.htm?schText=${enSchText }&subMenu=program"><img src="${ctxRoot}images/search/search_menu02_out.gif" width="169" height="30" alt="프로그램" /></a></li>
				</c:when>
				</c:choose>
				<c:choose>
				<c:when test="${subMenu=='news' }">
				<li class="search_menu_on"><img src="${ctxRoot}images/search/search_menu03_on.gif" width="169" height="40" alt="뉴스" /></li>
				</c:when>
				<c:when test="${newsTotal>0 }">
				<li class="search_menu_off"><a href="search.htm?schText=${enSchText }&subMenu=news"><img src="${ctxRoot}images/search/search_menu03_out.gif" width="169" height="30" alt="뉴스" /></a></li>
				</c:when>
				</c:choose>
				<c:choose>
				<c:when test="${subMenu=='vod' }">
				<li class="search_menu_on"><img src="${ctxRoot}images/search/search_menu04_on.gif" width="169" height="40" alt="동영상" /></li>
				</c:when>
				<c:when test="${vodTotal>0 }">
				<li class="search_menu_off"><a href="search.htm?schText=${enSchText }&subMenu=vod"><img src="${ctxRoot}images/search/search_menu04_out.gif" width="169" height="30" alt="동영상" /></a></li>
				</c:when>
				</c:choose>
				<c:choose>
				<c:when test="${subMenu=='board' }">
				<li class="search_menu_on"><img src="${ctxRoot}images/search/search_menu05_on.gif" width="169" height="40" alt="게시판" /></li>
				</c:when>
				<c:when test="${boardTotal[0]>0 }">
				<li class="search_menu_off search_menu_sub"><img src="${ctxRoot}images/search/search_menu05_out.gif" width="169" height="30" alt="게시판" /></li>
				</c:when>
				</c:choose>
				<c:choose>
				<c:when test="${subMenu=='blog' }">
				<li id="blog_btn" class="search_menu_on"><img src="${ctxRoot}images/search/search_menu07_on.gif" width="169" height="40" alt="블로그" /></li>
				</c:when>
				<c:when test="${blogTotal>0 }">
				<li id="blog_btn" class="search_menu_off"><a href="search.htm?schText=${enSchText }&subMenu=blog"><img src="${ctxRoot}images/search/search_menu07_out.gif" width="169" height="30" alt="블로그" /></a></li>
				</c:when>
				</c:choose>
				<c:choose>
				<c:when test="${subMenu=='web' }">
				<li id="web_btn" class="search_menu_on"><img src="${ctxRoot}images/search/search_menu06_on.gif" width="169" height="40" alt="웹문서" /></li>
				</c:when>
				<c:when test="${webTotal>0 }">
				<li id="web_btn" class="search_menu_off"><a href="search.htm?schText=${enSchText }&subMenu=web"><img src="${ctxRoot}images/search/search_menu06_out.gif" width="169" height="30" alt="웹문서" /></a></li>
				</c:when>
				</c:choose>
			</ul>
			<div id="search_left_blank"></div>
			<div id="search_left_board">
				<ul>
					<c:forEach var="i" begin="1" end="6">
					<c:if test="${boardTotal[i]>0}">
					<li class="search_menu_sub_off"><a href="search.htm?schText=${enSchText}&subMenu=board&board=${i}"><img src="${ctxRoot}images/search/search_menu_sub0${i}_out.gif" width="150" height="30" alt="${boardName[i]}" /></a></li>
					</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="div_search_right">
			<jsp:include page="/search/${subMenu }.htm"/>
		</div>
	</div>
</div>
<jsp:include page="/include/common_footer.htm"/>