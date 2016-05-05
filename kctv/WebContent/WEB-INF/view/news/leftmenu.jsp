<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<dl id="news_leftmenu">
	<dt style="height:39px;"><img src="../images/news/leftmenu_top.png" width="140" height="39"/></dt>
	<dd>
		<ul id="news_leftmenu_menus">
			<li><a <c:if test="${guid!=-1 }">class="out" </c:if>href="list.htm?guid=-1"><img src="../images/news/leftmenu_-1_over.png" width="127" height="19" alt="주요뉴스"/></a></li>
			<li><a <c:if test="${guid!=0 }">class="out" </c:if>href="list.htm?guid=0"><img src="../images/news/leftmenu_0_over.png" width="127" height="19" alt="전체보기"/></a></li>
			<li><a <c:if test="${guid!=1 }">class="out" </c:if>href="list.htm?guid=1"><img src="../images/news/leftmenu_1_over.png" width="127" height="19" alt="정치/행정"/></a></li>
			<li><a <c:if test="${guid!=2 }">class="out" </c:if>href="list.htm?guid=2"><img src="../images/news/leftmenu_2_over.png" width="127" height="19" alt="경제/관광"/></a></li>
			<li><a <c:if test="${guid!=3 }">class="out" </c:if>href="list.htm?guid=3"><img src="../images/news/leftmenu_3_over.png" width="127" height="19" alt="사회/교육"/></a></li>
			<li><a <c:if test="${guid!=4 }">class="out" </c:if>href="list.htm?guid=4"><img src="../images/news/leftmenu_4_over.png" width="127" height="19" alt="문화/체육"/></a></li>
			<li><a <c:if test="${guid!=9 }">class="out" </c:if>href="${ctxRoot }eng/"><img src="../images/news/leftmenu_9_over.png" width="127" height="19" alt="영어뉴스(English News)"/></a></li>
			<li><a <c:if test="${guid!=10 }">class="out" </c:if>href="${ctxRoot }cn/"><img src="../images/news/leftmenu_10_over.png" width="127" height="19" alt="중국어뉴스(中文新闻)"/></a></li>
			<li><a class="out" href="${ctxRoot }contents/cPublic.htm?muid=256"><img src="../images/news/leftmenu_11_over.png" width="127" height="19" alt="행사&알림"/></a></li>
		</ul>
	</dd>
	<dt style="height:15px;"><img src="../images/news/leftmenu_btm.png" width="140" height="15"/></dt>
</dl>

<dl id="news_leftvod">
	<dt><img src="../images/news/news_vod_top.png" width="140" height="30" /></dt>
	<dd>
		<ul>
			<li><a <c:if test="${guid==11 }">class="bold" </c:if>href="${ctxRoot }news/vod.htm?guid=11">전체보기</a></li>
			<li><a <c:if test="${guid==12 }">class="bold" </c:if>href="${ctxRoot }news/vod.htm?guid=12&pageNo=1&schType=title&schText=아침">아침뉴스</a></li>
			<li><a <c:if test="${guid==13 }">class="bold" </c:if>href="${ctxRoot }news/vod.htm?guid=13&pageNo=1&schType=title&schText=낮">낮뉴스</a></li>
			<li><a <c:if test="${guid==14 }">class="bold" </c:if>href="${ctxRoot }news/vod.htm?guid=14&pageNo=1&schType=title&schText=저녁">저녁뉴스</a></li>
			<li><a <c:if test="${guid==15 }">class="bold" </c:if>href="${ctxRoot }news/vod.htm?guid=15&pageNo=1&schType=title&schText=주말">주말뉴스</a></li>
		</ul>
	</dd>
	<dt><img src="../images/news/news_vod_btm.png" width="140" height="9" /></dt>
</dl>

<dl id="news_leftext">
	<dt><img src="../images/news/news_ext_top.png" width="140" height="9" /></dt>
	<dd>
		<ul>
			<li><a <c:if test="${page=='schedule' }">class="bold" </c:if>href="${ctxRoot }news/schedule.htm">뉴스편성표</a></li>
			<li><a <c:if test="${page=='search' }">class="bold" </c:if>href="${ctxRoot }news/search.htm">뉴스 검색</a></li>
		</ul>
	</dd>
	<dt><img src="../images/news/news_ext_btm.png" width="140" height="9" /></dt>
</dl>