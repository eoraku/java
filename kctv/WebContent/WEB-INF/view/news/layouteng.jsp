<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/eng_news_header.htm"/>
<jsp:include page="/include/eng_news_top.htm"/>
<jsp:include page="/include/eng_news_top_menu.htm"/>
<div id="common_main">
	<div id="common_center">
		<c:if test="${isIndex }">
		<div id="news_hot">
			<div id="news_hot_top">
				<div class="news_group_title">
					<img src="../images/news/eng_top_news_title.png" width="72" height="20" alt="Top News"/>
				</div>
				<div class="news_group_more">
					<a href="listhot.htm"><img src="../images/news/eng_more.png" width="46" height="14" alt="more"/></a>
				</div>
			</div>
			<div id="news_hot_body">
				<ul class="ul_news_image">
					<c:forEach items="${listNewsHot }" var="item" varStatus="status">
					<li<c:if test="${!status.first }"> style="display:none;"</c:if>><a href="view.htm?nuid=${item.num }"><img src="../upload/news/${item.svrfile2 }" width="248" height="140"/></a></li>
					</c:forEach>
				</ul>
				<ul class="ul_news_text">
					<c:forEach items="${listNewsHot }" var="item">
					<li>
						<dl>
							<dt><a class="a_news_title" href="view.htm?guid=-1&nuid=${item.num }">${item.title }</a></dt>
							<%-- <dd><a class="a_news_name" href="list.htm?guid=-1&schType=name&schText=${item.name }">${item.name }</a></dd> --%>
						</dl>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		</c:if>
		<jsp:include page="/eng/${mainPage }.htm"/>
	</div>
	<div id="common_right">
		<div id="news_right_gray">
			<%-- <div id="news_search">
				<form id="newsSchForm" name="vodSchForm" method="get" action="${ctxRoot }eng/list.htm">
				<input type="hidden" name="guid" value="${guid }"/>
				<ul>
					<li id="search_type">
						<select name="schType" id="schType">
							<c:choose>
							<c:when test="${schType=='title' }">
							<option value="title" selected="selected">Title</option>
							<option value="date">Date</option>
							</c:when>
							<c:when test="${schType=='date' }">
							<option value="title">Title</option>
							<option value="date" selected="selected">Date</option>
							</c:when>
							<c:otherwise>
							<option value="title" selected="selected">Title</option>
							<option value="date">Date</option>
							</c:otherwise>
							</c:choose>
						</select>
					</li>
					<li id="search_text">
						<input name="schText" id="schText" type="text" size="20" maxlength="20" value="${schText }"/>
						<input name="schDate" id="schDate" type="text" size="20" maxlength="20" value="${schText }"/>
					</li>
					<li id="search_btn"><input type="image" src="../images/news/eng_search_news.png" width="52" height="19" alt="Search News"/></li>
				</ul>
				</form>
			</div> --%>
			<div id="news_notice">
				<img src="../images/news/eng_notice_130523.gif" width="256" height="104"/>
				<img src="../images/news/eng_talk_jeju.png" width="256" height="100" style="margin-top:5px;"/>
				<img src="../images/news/eng_facebook_title.png" width="256" height="35" style="margin-top:5px;" />
				<a href="https://www.facebook.com/kctvjejunews" target="_blank"><img src="../images/news/eng_facebook.png" width="256" height="65" /></a>
			</div>
			<c:if test="${hideVOD == null}">
			<div id="news_vodeng">
				<div id="news_vodeng_top">
					<div id="news_vodeng_title">
						<img src="../images/news/eng_news_vod_title.png" width="126" height="16" alt="English News VOD"/>
					</div>
					<div id="news_vodeng_more">
						<a href="${ctxRoot }eng/vod.htm"><img src="../images/news/eng_more.png" width="46" height="14" alt="more"/></a>
					</div>
				</div>
				<div id="news_vodeng_body">
					<ul>
						<c:forEach items="${listVod}" var="item">
						<li>
							<dl>
								<dt><a href="#" onclick="javascript:vod_flv('${ctxRoot }',${item.num });"><img src="${item.photo_url }" width="140" height="80"/></a></dt>
								<dd><a href="#" onclick="javascript:vod_flv('${ctxRoot }',${item.num });">${item.title }</a><br/><span>${item.firstdt }</span></dd>
							</dl>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			</c:if>
			<div id="news_top_view">
				<div id="news_top_view_top">
					<div id="news_top_view_title">
						<img src="../images/news/eng_news_top_title.png" width="92" height="16" alt="Most Popular"/>
					</div>
				</div>
				<div class="news_top_eng_body">
					<ul>
						<c:forEach items="${listNews}" var="item">
						<li><a class="a_news_title" href="view.htm?nuid=${item.num}">${item.title }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div id="news_kctv_about">
				<a href="#" onclick="javascript:vod_intro('/',25031);"><img src="../images/news/eng_kctv_about.png" width="219" height="80"/></a>
			</div>
		</div>
	</div>
</div>
<c:if test="${isIndex }">
<div id="common_btm_banner">
	<ul>
		<li><a href="http://english.jeju.go.kr/" target="_new"><img src="${ctxRoot }images/banner/eng_btm_link_1.png" width="180" height="54" alt="Jeju Special Self-Governing Province" /></a></li>
		<li><a href="http://www.ijto.or.kr/english/" target="_new"><img src="${ctxRoot }images/banner/eng_btm_link_2.png" width="180" height="54" alt="Jeju Tourism Organization" /></a></li>
		<li><a href="http://www.visitkorea.or.kr/" target="_new"><img src="${ctxRoot }images/banner/eng_btm_link_3.png" width="180" height="54" alt="Korea Tourism Organization" /></a></li>
		<li><a href="http://www.hikorea.go.kr/" target="_new"><img src="${ctxRoot }images/banner/eng_btm_link_4.png" width="180" height="54" alt="Hi Korea" /></a></li>
	</ul>
</div>
</c:if>
<jsp:include page="/include/eng_news_footer.htm"/>