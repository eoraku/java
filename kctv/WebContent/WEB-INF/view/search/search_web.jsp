<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="search_web" class="div_search_category">
	<div class="div_web_title">À¥¹®¼­</div>
	<div class="div_web_OpenAPI"><a href="http://dev.naver.com/openapi" target="_blank"><img src="${ctxRoot }images/search/logo07_1.gif" width="135" height="5" alt="NAVER OpenAPI"/></a></div>
	<div class="div_category_content">
		<ul>
			<li class="li_border"></li>
			<c:forEach items="${webList }" var="item" varStatus="status">
			<li class="li_webs">
				<div class="web_title"><a class="a_title" href="${item.link }" target="_new">${item.title }</a></div>
				<div class="web_desc"><a class="a_content" href="${item.link }" target="_new">${item.desc }</a></div>
			</li>
			<c:if test="${!status.last }">
			<li class="li_webs_hori"></li>
			</c:if>
			</c:forEach>
			<li class="li_border"></li>
		</ul>
	</div>
	<jsp:include page="/search/paging.htm"/>
</div>