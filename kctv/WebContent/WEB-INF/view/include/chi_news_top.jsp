<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="news_top">
	<div id="news_top_link">
		<ul>
			<c:choose>
			<c:when test="${isLogin }">
			<li class="top_link"><a href="${sslDomain }user/logout.htm"><img src="${ctxRoot }images/news/chi_news_top_logout.png" width="34" height="20"/></a></li>
			<li class="top_vertical"><img src="${ctxRoot }images/news/chi_news_top_vertical.png" width="11" height="20"/></li>
			<li class="top_link"><a href="${sslDomain }user/info.htm"><%-- <img src="${ctxRoot }images/news/chi_news_top_info.png" width="34" height="20"/> --%>Info</a></li>
			</c:when>
			<c:otherwise>
			<li class="top_link"><a href="${sslDomain }user/login.htm"><img src="${ctxRoot }images/news/chi_news_top_login.png" width="34" height="20"/></a></li>
			<li class="top_vertical"><img src="${ctxRoot }images/news/chi_news_top_vertical.png" width="11" height="20"/></li>
			<li class="top_link"><a href="${sslDomain }user/join1.htm"><img src="${ctxRoot }images/news/chi_news_top_join.png" width="34" height="20"/></a></li>
			</c:otherwise>
			</c:choose>
			<li style="width:5px;height:20px;"></li>
			<li class="top_link" style="padding-top:0px;"><a href="${ctxRoot }contents/sitemap.htm?muid=185"><img src="${ctxRoot}images/news/chi_news_top_sitemap.png" width="83" height="21"/></a></li>
		</ul>
	</div>
	<div id="news_top_logo">
		<ul>
			<li style="padding-top:13px;"><a href="${homeUrl }cn/"><img src="${ctxRoot}images/news/chi_kctv_logo.png" width="224" height="34"/></a></li>
			<li><img src="${ctxRoot}images/news/chi_kctv_logo3.png" width="170" height="56"/></li>
		</ul>
	</div>
</div>