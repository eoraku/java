<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/news_header.htm"/>
<jsp:include page="/include/news_top.htm"/>
<jsp:include page="/include/news_top_menu.htm"/>
<div id="common_main">
	<div id="common_left2">
	<jsp:include page="/news/leftmenu.htm"/>
	</div>
	<div id="common_center">
	<jsp:include page="${mainPage }"/>
	</div>
	<div id="common_right2">
		<div id="news_right_gray">
			<c:if test="${!isSearch }">
			<div id="news_search">
				<form id="newsSchForm" name="vodSchForm" method="get" action="${ctxRoot }news/list.htm">
				<input type="hidden" name="guid" value="${guid }"/>
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
			</c:if>
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
				<div class="news_top_view_body" id="news_top_0">
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
			<%-- <c:if test="${guid!=18 }">
			<div id="news_invite">
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
			</div>
			</c:if> --%>
			<c:if test="${listWeather != null }">
			<div id="news_list_weather">
				<div id="news_list_weather_top">
					<div id="news_list_weather_title">
						<img src="../images/news/news_weather_title.png" width="92" height="18" alt="KCTV 날씨"/>
					</div>
				</div>
				<div id="news_list_weather_body">
					<ul>
						<c:forEach items="${listWeather }" var="item">
						<li>
							<dl>
								<dt><a href="view.htm?guid=3&nuid=${item.num}"><img src="${item.svrfile2 }" width="100" height="60"/></a></dt>
								<dd><a href="view.htm?guid=3&nuid=${item.num}">${item.title}</a></dd>
								<dd><span>${item.ldate}</span></dd>
							</dl>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			</c:if>
		</div>
	</div>
</div>
<script type="text/javascript">
setNewsHot(${guid});
</script>
<jsp:include page="/include/news_footer.htm"/>