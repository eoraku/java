<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${ctxRoot }js/bjqs-1.3.min.js"></script>
<link rel="stylesheet" href="${ctxRoot }css/bjqs.css">
<div id="news_top">
	<div id="news_top_link">
		<ul>
			<c:if test="${isLogin }">
			<li class="top_link">${login_name }(${login_userid })님</li>
			<li class="top_vertical">│</li>
			</c:if>
			<c:choose>
			<c:when test="${isLogin }">
			<li class="top_link"><a href="${sslDomain }user/logout.htm">로그아웃</a></li>
			<li class="top_vertical">│</li>
			<li class="top_link"><a href="${sslDomain }user/info.htm">회원정보</a></li>
			</c:when>
			<c:otherwise>
			<li class="top_link"><a href="${sslDomain }user/login.htm">로그인</a></li>
			<li class="top_vertical">│</li>
			<li class="top_link"><a href="${sslDomain }user/join1.htm">회원가입</a></li>
			</c:otherwise>
			</c:choose>
			<li class="top_vertical">│</li>
			<li class="top_link"><a href="${ctxRoot }contents/customer.htm?muid=202">고객의소리</a></li>
			<li class="top_vertical">│</li>
			<li class="top_link"><a href="${ctxRoot }contents/customer.htm?muid=129">AS신청</a></li>
			<li style="width:5px;height:20px;"></li>
			<li class="top_link" style="padding-top:0px;"><a href="${ctxRoot }contents/sitemap.htm?muid=185"><img src="${ctxRoot}images/news/news_top_sitemap.png" width="91" height="21" alt="전체메뉴보기"/></a></li>
		</ul>
	</div>
	<div id="news_top_logo">
		<ul>
			<li><a href="${ctxRoot }"><img src="${ctxRoot}images/news/kctv_logo.png" width="151" height="56" alt="첫화면으로" /></a></li>
			<li><a href="${ctxRoot }"><img src="${ctxRoot}images/news/news_logo.gif" width="31" height="56" alt="뉴스홈" /></a></li>
			<li><img src="${ctxRoot}images/news/kctv_logo2.gif" width="174" height="56"/></li>
		</ul>
	</div>
	<div id="news_top_search">
		<form name="common_search" method="post" action="${ctxRoot}search/">
		<div id="top_search_form">
			<dl>
				<dt><input type="text" name="schText" value=""/></dt>
				<%-- <li><a href="#" onclick="javascript:totalSearch();"><img src="${ctxRoot}images/news/btn_search.png" width="39" height="17" alt="검색"></a></li> --%>
				<dd><input type="image" src="${ctxRoot}images/news/btn_search.png" width="39" height="17" alt="검색"/></dd>
			</dl>
		</div>
		</form>
		<%-- <div id="top_search_weather">
			<ul class="bjqs">
				<c:forEach items="${listNational }" var="item">
				<li class="regions">
					<dl>
						<dt><img src="${ctxRoot }images/weather/icon_${item.wn_rainf }${item.wn_forecast }.png" width="52" height="52"/></dt>
						<dd><strong class="region_name">${item.rc_name }</strong><br/>
						현재 온도 <strong class="region_temp">${item.wn_temp }℃</strong><br/>
						<a class="region_more" href="/weather/">더보기</a></dd>
					</dl>
				</li>
				</c:forEach>
			</ul>
		</div> --%>
		<script>
			/* jQuery(document).ready(function($) {
				$('#top_search_weather').bjqs({
					animtype      : 'slide',
					width         : 170,
					height        : 66,
					responsive    : false,
					
					// control and marker configuration
					showcontrols : true, // show next and prev controls
					centercontrols : true, // center controls verically
					nexttext : '>', // Text for 'next' button (can use HTML)
					prevtext : '<', // Text for 'previous' button (can use HTML)
					showmarkers : false, // Show individual slide markers
					// interaction values
					keyboardnav : false, // enable keyboard navigation
				});
			}); */
		</script>
		<c:if test="${listTopSearch != null}">
		<div id="top_search_top">
			<ul>
				<li><img src="${ctxRoot}images/news/btn_search_top.png" width="14" height="14" alt="검색어 순위" /></li>
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
</div>