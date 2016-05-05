<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/chi_news_header.htm"/>
<jsp:include page="/include/chi_news_top.htm"/>
<jsp:include page="/include/chi_news_top_menu.htm"/>
<div id="common_main">
	<div id="common_center">
		<c:if test="${isIndex }">
		<div id="news_hot">
			<div id="news_hot_top">
				<div class="news_group_title">
					<img src="../images/news/chi_top_news_title.png" width="72" height="20"/>
				</div>
				<div class="news_group_more">
					<a href="listhot.htm"><img src="../images/news/eng_more.png" width="46" height="14"/></a>
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
		<jsp:include page="/cn/${mainPage }.htm"/>
	</div>
	<div id="common_right">
		<div id="news_right_gray">
			<c:if test="${hideVOD == null}">
			<div id="news_vodeng">
				<div id="news_vodeng_top">
					<div id="news_vodeng_title">
						<img src="../images/news/chi_news_vod_title.png" width="126" height="16"/>
					</div>
					<div id="news_vodeng_more">
						<a href="${ctxRoot }cn/vod.htm"><img src="../images/news/eng_more.png" width="46" height="14"/></a>
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
						<img src="../images/news/chi_news_top_title.png" width="74" height="16"/>
					</div>
				</div>
				<div class="news_top_chi_body">
					<ul>
						<c:forEach items="${listNews}" var="item">
						<li><a class="a_news_title" href="view.htm?nuid=${item.num}">${item.title }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div id="news_banner">
				<img src="../images/news/chi_report_banner.png" width="276" height="103" usemap="#Map"/>
			</div>
			<div id="news_kctv_about">
				<a href="#" onclick="javascript:vod_intro('/',25032);"><img src="../images/news/chi_kctv_about.png" width="219" height="80"/></a>
			</div>
		</div>
	</div>
</div>
<c:if test="${isIndex }">
<div id="common_btm_banner">
	<ul>
		<li><a href="http://chinese.jeju.go.kr/" target="_new"><img src="${ctxRoot }images/banner/chi_btm_link_1.png" width="180" height="54" /></a></li>
		<li><a href="http://ijto.or.kr/chinese/" target="_new"><img src="${ctxRoot }images/banner/chi_btm_link_2.png" width="180" height="54" /></a></li>
		<li><a href="http://chinese.visitkorea.or.kr/chs/index.kto" target="_new"><img src="${ctxRoot }images/banner/chi_btm_link_3.png" width="180" height="54" /></a></li>
		<li><a href="http://www.hikorea.go.kr/" target="_new"><img src="${ctxRoot }images/banner/chi_btm_link_4.png" width="180" height="54" /></a></li>
	</ul>
</div>
</c:if>
<map name="Map" id="Map">
	<area shape="rect" coords="60,36,205,51" href="mailto:misu02@kctvjeju.com" />
	<area shape="rect" coords="60,53,205,68" href="mailto:tqyte@naver.com" />
</map>
<jsp:include page="/include/chi_news_footer.htm"/>