<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="news_vod_title">
	<img src="../images/news/news_vod16_title.png" width="130" height="20"/>
</div>
<div id="news_vod_table">
	<table id="table_vod_list">
		<c:choose>
		<c:when test="${vodTotal=='0' }">
		<tr>
			<c:choose>
			<c:when test="${schText=='' }">
			<td colspan="2">There is no VOD</td>
			</c:when>
			<c:otherwise>
			<td colspan="2"><b>'${schText }'</b> Empty result</td>
			</c:otherwise>
			</c:choose>
		</tr>
		</c:when>
		<c:otherwise>
		<c:forEach items="${listVod }" var="item">
		<tr>
			<td class="td_img"><a href="#" onclick="javascript:newWindow('${ctxRoot }vod/flv/${item.num }/view.htm','VOD',1022,446,0);"><img src="${item.photo_url }" width="180" height="100"/></a></td>
			<td class="td_content">
				<ul class="ul_content">
					<li class="li_title"><a href="#" onclick="javascript:vod_flv('${ctxRoot }',${item.num });">${item.title }</a></li>
					<li class="li_firstdt">Date : ${item.firstdt }</li>
					<li class="li_viewcnt">Views : ${item.view_cnt }<br/>
						<a href="#" onclick="javascript:vod_flv('${ctxRoot }',${item.num });"><img src="${ctxRoot }images/news/eng_btn_vod.png" width="71" height="20" alt="View VOD" /></a></li>
				</ul>
			</td>
		</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="2"></td>
		</tr>
		</tfoot>
	</table>
	<div id="news_btm_pages">
		<table id="ul_news_pages">
			<tr>
				<c:if test="${vodPaging.prev!='' }">
				<td><a class="page_prev" href="${urlQuery }${vodPaging.prev }">Previous page</a></td>
				</c:if>
				<c:forEach items="${vodPaging.pages }" var="item">
				<c:choose>
				<c:when test="${item.isCurrent }">
				<td><div class="page_curr">${item.pageNo }</div></td>
				</c:when>
				<c:otherwise>
				<td><a class="page_link" href="${urlQuery }${item.pageLink }">${item.pageNo }</a></td>
				</c:otherwise>
				</c:choose>
				</c:forEach>
				<c:if test="${vodPaging.next!='' }">
				<td><a class="page_next" href="${urlQuery }${vodPaging.next }">Next page</a></td>
				</c:if>
			</tr>
		</table>
	</div>
</div>