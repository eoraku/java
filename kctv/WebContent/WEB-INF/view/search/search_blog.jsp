<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="search_blog" class="div_search_category">
	<div class="div_blog_title">ºí·Î±×</div>
	<div class="div_blog_OpenAPI"><a href="http://dev.naver.com/openapi" target="_blank"><img src="${ctxRoot }images/search/logo07_1.gif" width="135" height="5" alt="NAVER OpenAPI"/></a></div>
	<div class="div_category_content">
		<ul>
			<li class="li_border"></li>
			<c:forEach items="${blogList }" var="item" varStatus="status">
			<li class="li_blogs">
				<div class="blog_title"><a class="a_title" href="" target="_new">${item.title }</a></div>
				<div class="blog_desc"><a class="a_content" href="${item.link }" target="_new">${item.desc }</a></div>
				<div class="blog_link"><a class="a_blog" href="${item.bloggerlink }" target="_new">[${item.bloggername }]</a></div>
			</li>
			<c:if test="${!status.last }">
			<li class="li_blogs_hori"></li>
			</c:if>
			</c:forEach>
			<li class="li_border"></li>
		</ul>
	</div>
	<jsp:include page="/search/paging.htm"/>
</div>