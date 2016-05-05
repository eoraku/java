<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="common_top">
	<div id="common_top_link">
		<ul>
			<c:if test="${isLogin }">
			<li class="top_link">${login_name }(${login_userid })님</li>
			</c:if>
			<c:choose>
			<c:when test="${isLogin }">
			<li class="top_link"><a href="${sslDomain }user/logout.htm"><img src="${ctxRoot}images/common/top_menu1-2.png" width="59" height="19" alt="로그아웃"/></a></li>
			<li class="top_vertical">│</li>
			<li class="top_link"><a href="${sslDomain }user/info.htm"><img src="${ctxRoot}images/common/top_menu2-2.png" width="59" height="19" alt="회원정보"/></a></li>
			</c:when>
			<c:otherwise>
			<li class="top_link"><a href="${sslDomain }user/login.htm"><img src="${ctxRoot}images/common/top_menu1-1.png" width="48" height="19" alt="로그인"/></a></li>
			<li class="top_vertical">│</li>
			<li class="top_link"><a href="${sslDomain }user/join1.htm"><img src="${ctxRoot}images/common/top_menu2-1.png" width="59" height="19" alt="회원가입"/></a></li>
			</c:otherwise>
			</c:choose>
			<li class="top_vertical">│</li>
			<li class="top_link"><a href="${ctxRoot }contents/customer.htm?muid=202"><img src="${ctxRoot}images/common/top_menu3.png" width="70" height="19" alt="고객의소리"/></a></li>
			<li class="top_vertical">│</li>
			<li class="top_link"><a href="${ctxRoot }contents/customer.htm?muid=129"><img src="${ctxRoot}images/common/top_menu4.png" width="51" height="19" alt="AS신청"/></a></li>
			<li class="top_vertical">│</li>
			<li class="top_link"><a href="${ctxRoot }contents/sitemap.htm?muid=185"><img src="${ctxRoot}images/common/top_menu5.png" width="59" height="19" alt="사이트맵"/></a></li>
		</ul>
	</div>
	<div id="common_top_logo">
		<a href="${ctxRoot }"><img src="${ctxRoot}images/common/top_logo.png" width="167" height="37" alt="첫화면으로" /></a>
	</div>
	<div id="common_top_search">
		<form name="common_search" method="post" action="${ctxRoot}search/">
		<div id="top_search_form">
			<dl>
				<dt><input type="text" name="schText" value="${schText }"/></dt>
				<%-- <li><a href="#" onclick="javascript:totalSearch();"><img src="${ctxRoot}images/common/btn_search.png" width="44" height="26" alt="검색"></a></li> --%>
				<dd><input type="image" src="${ctxRoot}images/common/btn_search.png" width="44" height="26" alt="검색"/></dd>
			</dl>
		</div>
		</form>
		<c:if test="${listTopSearch != null }">
		<div id="top_search_top">
			<ul>
				<li><img src="${ctxRoot}images/common/btn_search_top.png" width="14" height="14" alt="검색어 순위" /></li>
				<c:forEach items="${listTopSearch }" var="item" varStatus="status">
				<li class="search_text"><a href="#" onclick="set_search_text('${item}')">${item}</a></li>
				<c:if test="${!status.last }">
				<li class="search_vertical">|</li>
				</c:if>
				</c:forEach>
			</ul>
		</div>
		</c:if>
	</div>
	<!-- <div id="common_top_banner">
		<ul id="ul_top_banner_img">
			<li><a href="/contents/index.asp?muid=327&pmuid=326"><img src="${ctxRoot}images/common/top_banner_ch7.png" width="128" height="65" alt="CH20" /></a></li></li>
			<li><a href="/contents/index2.asp?muid=217&pmuid=50"><img src="${ctxRoot}images/common/top_banner_ch20.png" width="128" height="65" alt="CH7" /></a></li></li>
		</ul>
		<ul id="ul_top_banner_arrow">
			<li id="top_banner_btn_perv"><img src="${ctxRoot}images/common/top_banner_prev.gif" width="16" height="14" alt="이전" /></a></li>
			<li id="top_banner_btn_next"><img src="${ctxRoot}images/common/top_banner_next.gif" width="16" height="14" alt="다음" /></a></li>
		</ul>
	</div> -->
</div>