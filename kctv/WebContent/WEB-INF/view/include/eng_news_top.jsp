<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="news_top">
	<div id="news_top_link">
		<ul>
			<li class="top_link"><a href="${homeUrl }">KCTV Home</a></li>
			<li class="top_vertical">│</li>
			<c:choose>
			<c:when test="${isLogin }">
			<li class="top_link"><a href="${sslDomain }user/logout.htm">Log Out</a></li>
			<li class="top_vertical">│</li>
			<li class="top_link"><a href="${sslDomain }user/info.htm">User Info</a></li>
			</c:when>
			<c:otherwise>
			<li class="top_link"><a href="${sslDomain }user/login.htm">Log In</a></li>
			<li class="top_vertical">│</li>
			<li class="top_link"><a href="${sslDomain }user/join1.htm">Register</a></li>
			</c:otherwise>
			</c:choose>
			<li class="top_vertical">│</li>
			<li class="top_link"><a href="${ctxRoot }contents/customer.htm?muid=202">Customer Service</a></li>
			<li style="width:5px;height:20px;"></li>
			<li class="top_link" style="padding-top:0px;"><a href="${ctxRoot }contents/sitemap.htm?muid=185"><img src="${ctxRoot}images/news/eng_news_top_sitemap.png" width="83" height="21" alt="Site Map"/></a></li>
		</ul>
	</div>
	<div id="news_top_logo">
		<ul>
			<li style="padding-top:13px;"><a href="${homeUrl }eng/"><img src="${ctxRoot}images/news/eng_kctv_logo.png" width="240" height="34" alt="KCTV English News Home" /></a></li>
			<li><img src="${ctxRoot}images/news/eng_kctv_logo3.png" width="170" height="56"/></li>
			<!-- <li style="float:right;margin-top:4px;padding:4px 7px 3px 7px;font-style:italic;color:#000062;border:1px solid #DBDBDB;background-color:#FAFAFA;">KCTV was the victim of a cyber attack on June 25, band we have been unable to upload<br/>new videos or articles since then. We are very sorry for the inconvenience, and we are<br/>doing everything possible to restore service as soon as possible.</li> -->
		</ul>
	</div>
	<%-- <div id="news_top_search">
		<form name="common_search" method="get" action="${ctxRoot}search/">
		<div id="top_search_form">
			<ul>
				<li><input type="text" name="schText" value="${schText }"/></li>
				<li><a href="#" onclick="javascript:totalSearch();"><img src="${ctxRoot}images/news/eng_btn_search.png" width="55" height="17" alt="Search"></a></li>
			</ul>
		</div>
		</form>
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
	</div> --%>
</div>