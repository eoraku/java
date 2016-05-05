<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="search_vod" class="div_search_category">
	<div class="div_category_title">µ¿¿µ»ó</div>
	<div class="div_category_content">
		<ul>
			<c:forEach items="${vodList }" var="item">
			<li class="li_vods">
				<div class="vod_img"><a href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });"><img src="${item.photo_url}"/></a></div>
				<div class="vod_name"><a class="a_content" href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });">[${item.code_name}]</a></div>
				<div class="vod_title"><a class="a_title" href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });">${item.vodname}</a></div>
				<div class="vod_date">${item.firstdt}</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	<jsp:include page="/search/paging.htm"/>
</div>