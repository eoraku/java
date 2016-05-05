<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="search_news" class="div_search_category">
	<div class="div_category_title">뉴스</div>
	<div class="div_category_content">
		<ul>
			<li class="li_border"></li>
			<c:forEach items="${newsList }" var="item">
			<li class="li_news">
				<c:choose>
				<c:when test="${item.svrfile2=='' }">
				<div class="news_category">[${item.maincd}]</div>
				<div class="news_title"><a class="a_title" href="${ctxRoot }news/view.htm?guid=${item.subcd}&nuid=${item.num}">${item.title}</a></div>
				<div class="news_name">${item.name} 기자</div>
				<div class="news_date">${item.ldate}</div>
				<div class="news_content"><a class="a_content" href="${ctxRoot }news/view.htm?guid=${item.subcd}&nuid=${item.num}">${item.content}</a></div>
				</c:when>
				<c:otherwise>
				<div class="news_img"><a href="${ctxRoot }news/view.htm?guid=${item.subcd}&nuid=${item.num}"><img src="${item.svrfile2}" width="90" height="60" /></a></div>
				<div class="news_img_body">
					<div class="news_category">[${item.maincd}]</div>
					<div class="news_title_img"><a class="a_title" href="${ctxRoot }news/view.htm?guid=${item.subcd}&nuid=${item.num}">${item.title}</a></div>
					<div class="news_name">${item.name} 기자</div>
					<div class="news_date">${item.ldate}</div>
					<div class="news_content_img"><a class="a_content" href="${ctxRoot }news/view.htm?guid=${item.subcd}&nuid=${item.num}">${item.content}</a></div>
				</div>
				</c:otherwise>
				</c:choose>
			</li>
			</c:forEach>
			<li class="li_border"></li>
		</ul>
	</div>
	<jsp:include page="/search/paging.htm"/>
</div>