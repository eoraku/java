<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/news_header.htm"/>
<jsp:include page="/include/news_top.htm"/>
<jsp:include page="/include/news_top_menu.htm"/>
<link href="${ctxRoot}css/news_index.css" rel="stylesheet" type="text/css" />
<div id="common_main">
	<div id="common_left1">
		<div id="news_hot">
			<div id="news_hot_top">
				<div class="news_group_title">
					<img src="../images/news/news_group-1_title.png" width="70" height="20" alt="주요뉴스"/>
				</div>
				<div class="news_group_more">
					<a href="list.htm?guid=-1"><img src="../images/common/more02.gif" width="36" height="11" alt="more"/></a>
				</div>
			</div>
			<div id="news_hot_body">
				<ul class="ul_news_image">
					<c:forEach items="${listNewsHot }" var="item" varStatus="status">
					<li<c:if test="${!status.first }"> style="display:none;"</c:if>><a href="view.htm?guid=-1&nuid=${item.num }"><img src="${item.svrfile2 }" width="240" height="150"/></a></li>
					</c:forEach>
				</ul>
				<ul class="ul_news_text">
					<c:forEach items="${listNewsHot }" var="item">
					<li>
						<dl>
							<dt><a class="a_news_title" href="view.htm?guid=-1&nuid=${item.num }">${item.title }</a></dt>
							<!-- <dd><a class="a_news_group" href="list.htm?guid=${item.subcd }">[${item.maincd }]</a></dd> -->
						</dl>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="news_group1" class="news_group">
			<div class="news_group_top">
				<div class="news_group_title">
					<img src="../images/news/news_group1_title.png" width="70" height="20" alt="정치/행정"/>
				</div>
				<div class="news_group_more">
					<a href="list.htm?guid=1"><img src="../images/common/more02.gif" width="36" height="11" alt="more"/></a>
				</div>
			</div>
			<div class="news_group_body">
				<ul>
					<c:forEach items="${listNews1}" var="item">
					<c:choose>
					<c:when test="${item.svrfile2=='0' }">
					<li class="li_news_noimg">
						<div class="news_title">
							<dl>
								<dt><a class="a_news_title" href="view.htm?guid=1&nuid=${item.num }">${item.title }</a></dt>
								<dd><a class="a_news_name" href="list.htm?guid=1&schType=name&schText=${item.name }">${item.name }</a></dd>
							</dl>
						</div>
						<div class="news_content"><a class="a_news_content" href="view.htm?guid=1&nuid=${item.num }">${item.content }</a></div>
					</li>
					</c:when>
					<c:otherwise>
					<li class="li_news_img">
						<div class="news_img"><a href="view.htm?guid=1&nuid=${item.num }"><img src="${item.svrfile2 }" width="100" height="60"/></a></div>
						<div class="news_title">
							<dl>
								<dt><a class="a_news_title" href="view.htm?guid=1&nuid=${item.num }">${item.title }</a></dt>
								<dd><a class="a_news_name" href="list.htm?guid=1&schType=name&schText=${item.name }">${item.name }</a></dd>
							</dl>
						</div>
						<div class="news_content"><a class="a_news_content" href="view.htm?guid=1&nuid=${item.num }">${item.content }</a></div>
					</li>
					</c:otherwise>
					</c:choose>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="news_group2" class="news_group">
			<div class="news_group_top">
				<div class="news_group_title">
					<img src="../images/news/news_group2_title.png" width="70" height="20" alt="경제/관광"/>
				</div>
				<div class="news_group_more">
					<a href="list.htm?guid=2"><img src="../images/common/more02.gif" width="36" height="11" alt="more"/></a>
				</div>
			</div>
			<div class="news_group_body">
				<ul>
					<c:forEach items="${listNews2}" var="item">
					<c:choose>
					<c:when test="${item.svrfile2=='0' }">
					<li class="li_news_noimg">
						<div class="news_title">
							<dl>
								<dt><a class="a_news_title" href="view.htm?guid=2&nuid=${item.num }">${item.title }</a></dt>
								<dd><a class="a_news_name" href="list.htm?guid=2&schType=name&schText=${item.name }">${item.name }</a></dd>
							</dl>
						</div>
						<div class="news_content"><a class="a_news_content" href="view.htm?guid=2&nuid=${item.num }">${item.content }</a></div>
					</li>
					</c:when>
					<c:otherwise>
					<li class="li_news_img">
						<div class="news_img"><a href="view.htm?guid=2&nuid=${item.num }"><img src="${item.svrfile2 }" width="100" height="60"/></a></div>
						<div class="news_title">
							<dl>
								<dt><a class="a_news_title" href="view.htm?guid=2&nuid=${item.num }">${item.title }</a></dt>
								<dd><a class="a_news_name" href="list.htm?guid=2&schType=name&schText=${item.name }">${item.name }</a></dd>
							</dl>
						</div>
						<div class="news_content"><a class="a_news_content" href="view.htm?guid=2&nuid=${item.num }">${item.content }</a></div>
					</li>
					</c:otherwise>
					</c:choose>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="news_group3" class="news_group">
			<div class="news_group_top">
				<div class="news_group_title">
					<img src="../images/news/news_group3_title.png" width="70" height="20" alt="사회/교육"/>
				</div>
				<div class="news_group_more">
					<a href="list.htm?guid=3"><img src="../images/common/more02.gif" width="36" height="11" alt="more"/></a>
				</div>
			</div>
			<div class="news_group_body">
				<ul>
					<c:forEach items="${listNews3}" var="item">
					<c:choose>
					<c:when test="${item.svrfile2=='0' }">
					<li class="li_news_noimg">
						<div class="news_title">
							<dl>
								<dt><a class="a_news_title" href="view.htm?guid=3&nuid=${item.num }">${item.title }</a></dt>
								<dd><a class="a_news_name" href="list.htm?guid=3&schType=name&schText=${item.name }">${item.name }</a></dd>
							</dl>
						</div>
						<div class="news_content"><a class="a_news_content" href="view.htm?guid=3&nuid=${item.num }">${item.content }</a></div>
					</li>
					</c:when>
					<c:otherwise>
					<li class="li_news_img">
						<div class="news_img"><a href="view.htm?guid=3&nuid=${item.num }"><img src="${item.svrfile2 }" width="100" height="60"/></a></div>
						<div class="news_title">
							<dl>
								<dt><a class="a_news_title" href="view.htm?guid=3&nuid=${item.num }">${item.title }</a></dt>
								<dd><a class="a_news_name" href="list.htm?guid=3&schType=name&schText=${item.name }">${item.name }</a></dd>
							</dl>
						</div>
						<div class="news_content"><a class="a_news_content" href="view.htm?guid=3&nuid=${item.num }">${item.content }</a></div>
					</li>
					</c:otherwise>
					</c:choose>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="news_group4" class="news_group">
			<div class="news_group_top">
				<div class="news_group_title">
					<img src="../images/news/news_group4_title.png" width="70" height="20" alt="문화/체육"/>
				</div>
				<div class="news_group_more">
					<a href="list.htm?guid=4"><img src="../images/common/more02.gif" width="36" height="11" alt="more"/></a>
				</div>
			</div>
			<div class="news_group_body">
				<ul>
					<c:forEach items="${listNews4}" var="item">
					<c:choose>
					<c:when test="${item.svrfile2=='0' }">
					<li class="li_news_noimg">
						<div class="news_title">
							<dl>
								<dt><a class="a_news_title" href="view.htm?guid=4&nuid=${item.num }">${item.title }</a></dt>
								<dd><a class="a_news_name" href="list.htm?guid=4&schType=name&schText=${item.name }">${item.name }</a></dd>
							</dl>
						</div>
						<div class="news_content"><a class="a_news_content" href="view.htm?guid=4&nuid=${item.num }">${item.content }</a></div>
					</li>
					</c:when>
					<c:otherwise>
					<li class="li_news_img">
						<div class="news_img"><a href="view.htm?guid=4&nuid=${item.num }"><img src="${item.svrfile2 }" width="100" height="60"/></a></div>
						<div class="news_title">
							<dl>
								<dt><a class="a_news_title" href="view.htm?guid=4&nuid=${item.num }">${item.title }</a></dt>
								<dd><a class="a_news_name" href="list.htm?guid=4&schType=name&schText=${item.name }">${item.name }</a></dd>
							</dl>
						</div>
						<div class="news_content"><a class="a_news_content" href="view.htm?guid=4&nuid=${item.num }">${item.content }</a></div>
					</li>
					</c:otherwise>
					</c:choose>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="event_notice">
			<div id="event_notice_top">
				<div class="news_group_title">
					<img src="../images/news/news_event_notice.png" width="70" height="20" alt="행사 & 알림"/>
				</div>
				<div class="news_group_more">
					<a href="${ctxRoot }contents/cPublic.htm?muid=256"><img src="../images/common/more02.gif" width="36" height="11" alt="more"/></a>
				</div>
			</div>
			<div id="event_notice_body">
				<iframe src="${ctxRoot }event/notice2.htm" scrolling="no"></iframe>
			</div>
		</div>
	</div>
	<div id="common_right1">
		<div id="news_banner">
			<ul>
				<li style="height:93px;"><a href="${ctxRoot }eng/"><img src="../images/news/foreign_eng1.png" width="280" height="93" alt="영어뉴스 다시보기"></a></li>
				<li style="height:26px;"><a href="${ctxRoot }eng/list.htm"><img src="../images/news/foreign_eng2.png" width="280" height="26" alt="영어뉴스 기사 보기"></a></li>
				<li style="height:93px;"><a href="${ctxRoot }cn/"><img src="../images/news/foreign_chi1.png" width="280" height="93" alt="중국어뉴스 다시보기"></a></li>
				<li style="height:26px;"><a href="${ctxRoot }cn/list.htm"><img src="../images/news/foreign_chi2.png" width="280" height="26" alt="중국어뉴스 기사 보기"></a></li>
			</ul>
		</div>
		<div id="news_right_gray">
			<div id="news_search">
				<form id="newsSchForm" name="vodSchForm" method="get" action="list.htm?guid=0">
				<ul>
					<li id="search_type">
						<select name="schType" id="schType">
							<c:choose>
							<c:when test="${schType=='title' }">
							<option value="title" selected="selected">제목</option>
							<option value="content">내용</option>
							<option value="name">이름</option>
							<option value="date">날짜</option>
							</c:when>
							<c:when test="${schType=='content' }">
							<option value="title">제목</option>
							<option value="content" selected="selected">내용</option>
							<option value="name">이름</option>
							<option value="date">날짜</option>
							</c:when>
							<c:when test="${schType=='name' }">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="name" selected="selected">이름</option>
							<option value="date">날짜</option>
							</c:when>
							<c:when test="${schType=='date' }">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="name">이름</option>
							<option value="date" selected="selected">날짜</option>
							</c:when>
							<c:otherwise>
							<option value="title" selected="selected">제목</option>
							<option value="content">내용</option>
							<option value="name">이름</option>
							<option value="date">날짜</option>
							</c:otherwise>
							</c:choose>
						</select>
					</li>
					<li id="search_text">
						<input name="schText" id="schText" type="text" size="20" maxlength="20" value="${schText }"/>
						<input name="schDate" id="schDate" type="text" size="20" maxlength="20" value="${schText }"/>
					</li>
					<li id="search_btn"><input type="image" src="../images/common/search_vod.png" width="41" height="19" alt="검색"/></li>
				</ul>
				</form>
			</div>
			<div id="news_top_view">
				<div id="news_top_view_top">
					<div id="news_top_view_title">
						<img src="../images/news/news_top_title.png" width="67" height="14" alt="많이 본 뉴스"/>
					</div>
					<!-- <div id="news_top_view_more">
						<a href="listTop.htm"><img src="../images/common/more02.gif" width="36" height="11" alt="more"/></a>
					</div> -->
				</div>
				<div id="news_top_view_tab">
					<ul>
						<li style="width:36px;" href="list.htm?guid=0"></li>
						<li style="width:55px;" href="list.htm?guid=1"></li>
						<li style="width:55px;" href="list.htm?guid=2"></li>
						<li style="width:55px;" href="list.htm?guid=3"></li>
						<li style="width:55px;" href="list.htm?guid=4"></li>
					</ul>
				</div>
				<div class="news_top_view_body" id="news_top_0" style="display:block;">
					<ul>
						<c:forEach items="${indexNewsTop0}" var="item">
						<li>·<a class="a_news_group" href="list.htm?guid=${item.subcd}">[${item.maincd}]</a> <a class="a_news_title" href="view.htm?guid=0&nuid=${item.num}">${item.title }</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="news_top_view_body" id="news_top_1">
					<ul>
						<c:forEach items="${indexNewsTop1}" var="item">
						<li>·<a class="a_news_title" href="view.htm?guid=1&nuid=${item.num }">${item.title }</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="news_top_view_body" id="news_top_2">
					<ul>
						<c:forEach items="${indexNewsTop2}" var="item">
						<li>·<a class="a_news_title" href="view.htm?guid=2&nuid=${item.num }">${item.title }</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="news_top_view_body" id="news_top_3">
					<ul>
						<c:forEach items="${indexNewsTop3}" var="item">
						<li>·<a class="a_news_title" href="view.htm?guid=3&nuid=${item.num }">${item.title }</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="news_top_view_body" id="news_top_4">
					<ul>
						<c:forEach items="${indexNewsTop4}" var="item">
						<li>·<a class="a_news_title" href="view.htm?guid=4&nuid=${item.num }">${item.title }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<c:if test="${weatherFlv != null }">
			<div id="news_weather">
				<div id="news_weather_top">
					<div id="news_weather_title">
						<img src="../images/news/news_weather_title.png" width="92" height="18" alt="KCTV 날씨"/>
					</div>
				</div>
				<div id="news_weather_body">
					<dl>
						<dt><a href="view.htm?guid=3&nuid=${weatherFlv.num}"><img src="${weatherFlv.svrfile2 }" width="230" height="129"/></a></dt>
						<dd><a href="view.htm?guid=3&nuid=${weatherFlv.num}">${weatherFlv.title} ${weatherFlv.ldate}</a></dd>
					</dl>
				</div>
			</div>
			</c:if>
			<%-- <div id="news_invite">
				<div id="news_invite_top">
					<div id="news_invite_title">
						<img src="../images/news/title_inv.png" width="100" height="18" alt="KCTV 초대석"/>
					</div>
					<div id="news_invite_more">
						<a href="vod.htm?guid=18"><img src="../images/common/more02.gif" width="36" height="11" alt="more"/></a>
					</div>
				</div>
				<div id="news_invite_body">
					<ul>
						<c:forEach items="${invList}" var="item">
						<li>
							<dl>
								<dt><a href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });"><img src="${item.photo_url }" width="100" height="60"/></a></dt>
								<dd><a href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });">${item.title }</a></dd>
							</dl>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div> --%>
			<div id="product_list">
				<%-- <ul>
					<li><img src="../images/news/product.gif" width="204" height="312" usemap="#product"/></li>
					<li><img src="../images/news/note5.gif" width="204" height="66" usemap="#q_menu"/></li>
				</ul>
				<map name="product">
					<area shape="rect" coords="8, 6, 200, 80" href="${ctxRoot }contents/product.htm?muid=293" alt="DV온">
					<area shape="rect" coords="10, 86, 195, 158" href="${ctxRoot }contents/product.htm?muid=300" alt="DV인">
					<area shape="rect" coords="11, 159, 197, 233" href="${ctxRoot }contents/product.htm?muid=297" alt="DV폰">
					<area shape="rect" coords="9, 237, 199, 309" href="${ctxRoot }contents/product.htm?muid=275" alt="DV아이">
				</map>
				<map name="q_menu">
					<area shape="rect" coords="19, 6, 57, 61" href="${ctxRoot }contents/program.htm?muid=173" alt="시청자 게시판">
					<area shape="rect" coords="83, 6, 122, 61" href="report.htm">
					<area shape="rect" coords="142, 6, 180, 61" href="profile.htm">
				</map> --%>
				<ul>
					<li><a href="/contents/?muid=293&pmuid=1"><img src="../images/index/products_title.png" width="64" height="15" alt="KCTV 상품"></a></li>
				</ul>
				<ul>
					<li><img src="../images/index/product_list.png" width="222" height="209" usemap="#product">
						<map name="product">
						<area shape="rect" coords="18, 7, 101, 89" href="${ctxRoot }contents/product.htm?muid=293" alt="DV온">
						<area shape="rect" coords="119, 7, 205, 89" href="${ctxRoot }contents/product.htm?muid=300" alt="DV인">
						<area shape="rect" coords="15, 109, 101, 191" href="${ctxRoot }contents/product.htm?muid=297" alt="DV폰">
						<area shape="rect" coords="114, 107, 202, 189" href="${ctxRoot }contents/product.htm?muid=275" alt="DV아이">
						</map></li>
					<li><img src="../images/index/right_customer.png" width="222" height="121" usemap="#ImageMap1">
						<map name="ImageMap1">
						<area shape="rect" coords="8, 7, 70, 77" href="${ctxRoot }contents/customer.htm?muid=259" alt="응급조치요령">
						<area shape="rect" coords="81, 8, 143, 77" href="${ctxRoot }contents/customer.htm?muid=202" alt="고객의소리">
						<area shape="rect" coords="151, 6, 209, 77" href="${ctxRoot }contents/customer.htm?muid=128" alt="서비스신청">
						</map></li>
					<li><a href="http://www.kait-tvrefund.kr/" target="_new"><img src="../images/index/re_price.gif" width="216" height="33" alt="유료방송비환급액 정보조회서비스"></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/include/news_footer.htm"/>