<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/eng_news_header.htm"/>
<jsp:include page="/include/eng_news_top.htm"/>
<jsp:include page="/include/eng_news_top_menu.htm"/>
<div id="common_main">
	<div id="common_center">
		<div id="news_hot">
			<div id="news_hot_top">
				<div class="news_group_title">
					<img src="../images/news/eng_top_news_title.png" width="72" height="20" alt="Top News"/>
				</div>
				<div class="news_group_more">
					<a href="list.htm"><img src="../images/common/more02.gif" width="36" height="11" alt="more"/></a>
				</div>
			</div>
			<div id="news_hot_body">
				<ul class="ul_news_image">
					<c:forEach items="${listNewsHot }" var="item" varStatus="status">
					<li><a href="view.htm?guid=-1&nuid=${item.num }"><img src="../upload/news/${item.svrfile2 }" width="248" height="140"<c:if test="${!status.first }"> style="display:none;"</c:if>/></a></li>
					</c:forEach>
				</ul>
				<ul class="ul_news_text">
					<c:forEach items="${listNewsHot }" var="item">
					<li>
						<dl>
							<dt><a class="a_news_title" href="view.htm?guid=-1&nuid=${item.num }">${item.title }</a></dt>
							<dd><a class="a_news_name" href="list.htm?guid=-1&schType=name&schText=${item.name }">${item.name }</a></dd>
						</dl>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="news_list_top">
			<img src="../images/news/news_group_eng.png" width="100" height="20"/>
		</div>
		<div class="news_list_body">
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
					<div class="news_img"><a href=""><img src="${ctxRoot }upload/news/${item.svrfile2 }" width="100" height="60"/></a></div>
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
		</div>
	</div>
	<div id="common_right">
		<div id="news_right_gray">
			<div id="news_search">
				<form id="newsSchForm" name="vodSchForm" method="get" action="${ctxRoot }news/list.htm">
				<input type="hidden" name="guid" value="${guid }"/>
				<ul>
					<li id="search_type">
						<select name="schType">
							<c:choose>
							<c:when test="${schType=='title' }">
							<option value="title" selected="selected">Title</option>
							<option value="name">Name</option>
							<option value="date">Date</option>
							</c:when>
							<c:when test="${schType=='name' }">
							<option value="title">Title</option>
							<option value="name" selected="selected">Name</option>
							<option value="date">Date</option>
							</c:when>
							<c:when test="${schType=='date' }">
							<option value="title">Title</option>
							<option value="name">Name</option>
							<option value="date" selected="selected">Date</option>
							</c:when>
							<c:otherwise>
							<option value="title" selected="selected">Title</option>
							<option value="name">Name</option>
							<option value="date">Date</option>
							</c:otherwise>
							</c:choose>
						</select>
					</li>
					<li id="search_text"><input id="schText" name="schText" type="text" size="20" maxlength="20" value="${schText }"/></li>
					<li id="search_btn"><input type="image" src="../images/news/eng_search_news.png" width="52" height="19" alt="Search News"/></li>
				</ul>
				</form>
			</div>
			<div id="news_top_view">
				<div id="news_top_view_top">
					<div id="news_top_view_title">
						<img src="../images/news/eng_news_top_title.png" width="79" height="14" alt="Most Popular"/>
					</div>
				</div>
				<div class="news_top_eng_body">
					<ul>
						<c:forEach items="${listNews}" var="item">
						<li>¡¤ <a class="a_news_title" href="view.htm?nid=${item.num}">${item.title }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div id="news_vodeng">
				<div id="news_vodeng_top">
					<div id="news_vodeng_title">
						<img src="../images/news/eng_news_vod_title.png" width="108" height="14" alt="English News VOD"/>
					</div>
					<div id="news_vodeng_more">
						<a href="${ctxRoot }eng/vod.htm"><img src="../images/common/more02.gif" width="36" height="11" alt="more"/></a>
					</div>
				</div>
				<div id="news_vodeng_body">
					<ul>
						<c:forEach items="${listVod}" var="item">
						<li>
							<dl>
								<dt><a href="#" onclick="javascript:newWindow('${ctxRoot }vod/0101/238/view_flv.htm?num=${item.num }','VOD',720,404,0);"><img src="${ctxRoot }upload/vod/${item.photo_url }" width="120" height="90"/></a></dt>
								<dd><a href="#" onclick="javascript:newWindow('${ctxRoot }vod/0101/238/view_flv.htm?num=${item.num }','VOD',720,404,0);">${item.title }</a><br/><span>${item.firstdt }</span></dd>
							</dl>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/include/eng_news_footer.htm"/>