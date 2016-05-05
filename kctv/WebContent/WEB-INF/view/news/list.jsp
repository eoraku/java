<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="news_list">
	<div class="news_list_top">
		<img src="../images/news/news_group${guid }_title.png" width="70" height="20"/>
	</div>
	<div class="news_list_body">
		<c:choose>
		<c:when test="${listTotal>0 }">
		<ul>
			<c:forEach items="${listNews}" var="item">
			<c:choose>
			<c:when test="${item.svrfile2=='0' }">
			<li class="li_news_noimg">
				<div class="news_title">
					<dl>
						<dt><a class="a_news_title" href="view.htm?guid=${guid }&nuid=${item.num }">${item.title }</a></dt>
						<dd><a class="a_news_name" href="list.htm?guid=${guid }&schType=name&schText=${item.name }">${item.name }</a></dd>
					</dl>
				</div>
				<div class="news_content"><a class="a_news_content" href="view.htm?guid=${guid }&nuid=${item.num }">${item.content }</a><span>${item.ldate }</span></div>
			</li>
			</c:when>
			<c:otherwise>
			<li class="li_news_img">
				<div class="news_img"><a href=""><img src="${item.svrfile2 }" width="100" height="60"/></a></div>
				<div class="news_title">
					<dl>
						<dt><a class="a_news_title" href="view.htm?guid=${guid }&nuid=${item.num }">${item.title }</a></dt>
						<dd><a class="a_news_name" href="list.htm?guid=${guid }&schType=name&schText=${item.name }">${item.name }</a></dd>
					</dl>
				</div>
				<div class="news_content"><a class="a_news_content" href="view.htm?guid=${guid }&nuid=${item.num }">${item.content }</a><span>${item.ldate }</span></div>
			</li>
			</c:otherwise>
			</c:choose>
			</c:forEach>
		</ul>
		</c:when>
		<c:otherwise>
		검색 결과가 없습니다.
		</c:otherwise>
		</c:choose>
	</div>
	<div id="news_btm_pages">
		<table id="ul_news_pages">
			<tr>
				<c:if test="${newsPaging.prev!='' }">
				<td><a class="page_prev" href="${urlQuery }${newsPaging.prev }">이전페이지</a></td>
				</c:if>
				<c:forEach items="${newsPaging.pages }" var="item">
				<c:choose>
				<c:when test="${item.isCurrent }">
				<td><div class="page_curr">${item.pageNo }</div></td>
				</c:when>
				<c:otherwise>
				<td><a class="page_link" href="${urlQuery }${item.pageLink }">${item.pageNo }</a></td>
				</c:otherwise>
				</c:choose>
				</c:forEach>
				<c:if test="${newsPaging.next!='' }">
				<td><a class="page_next" href="${urlQuery }${newsPaging.next }">다음페이지</a></td>
				</c:if>
			</tr>
		</table>
	</div>
</div>