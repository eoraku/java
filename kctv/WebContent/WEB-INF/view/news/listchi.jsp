<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="news_list">
	<div class="news_list_top">
		<div class="news_group_title">
			<img src="../images/news/chi_article_title.png" width="72" height="20"/>
		</div>
		<c:if test="${isIndex }">
		<div class="news_group_more">
			<a href="list.htm"><img src="../images/news/eng_more.png" width="46" height="14" alt="more"/></a>
		</div>
		</c:if>
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
						<%-- <dd><a class="a_news_name" href="view.htm?guid=${guid }&nuid=${item.num }">${item.name }</a></dd> --%>
					</dl>
				</div>
				<div class="news_content"><a class="a_news_content" href="view.htm?guid=${guid }&nuid=${item.num }">${item.content }</a><span>${item.ldate }</span></div>
			</li>
			</c:when>
			<c:otherwise>
			<li class="li_news_img">
				<div class="news_img"><a href="view.htm?guid=${guid }&nuid=${item.num }"><img src="${item.svrfile2 }" width="100" height="60"/></a></div>
				<div class="news_title">
					<dl>
						<dt><a class="a_news_title" href="view.htm?guid=${guid }&nuid=${item.num }">${item.title }</a></dt>
						<%-- <dd><a class="a_news_name" href="view.htm?guid=${guid }&nuid=${item.num }">${item.name }</a></dd> --%>
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
		There is no result.
		</c:otherwise>
		</c:choose>
	</div>
	<c:if test="${!isIndex }">
	<div id="news_btm_pages">
		<table id="ul_news_pages">
			<tr>
				<c:if test="${newsPaging.prev!='' }">
				<td><div class="page_move move_prev" href="${urlQuery }${newsPaging.prev }"></div></td>
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
				<td><div class="page_move move_next" href="${urlQuery }${newsPaging.next }"></div></td>
				</c:if>
			</tr>
		</table>
	</div>
	</c:if>
</div>