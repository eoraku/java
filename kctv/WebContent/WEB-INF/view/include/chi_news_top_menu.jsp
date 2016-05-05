<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="news_top_menu">
	<dl>
		<dt style="width:80px;"><a href="http://${domain}${ctxRoot }"><img src="../images/news/chi_news_menu01_over.png" width="80" height="32"/></a></dt>
		<dt style="width:110px;"><a href="http://${domain}${ctxRoot }cn/vod.htm"><img src="../images/news/chi_news_menu05_over.png" width="110" height="32"/></a></dt>
		<dt style="width:97px;"><a href="http://${domain}${ctxRoot }news/schedule.htm"><img src="../images/news/chi_news_menu06_over.png" width="97" height="32"/></a></dt>
		<dt style="width:116px;"><a href="http://${domain}${ctxRoot }news/profile.htm"><img src="../images/news/chi_news_menu07_over.png" width="116" height="32"/></a></dt>
		<dt style="width:175px;"><a href="http://${domain}${ctxRoot }contents/program.htm?muid=217"><img src="../images/news/chi_news_menu08_over.png" width="175" height="32"/></a></dt>
		<dd>
			<div id="top_search_form">
				<form id="newsSchForm" name="vodSchForm" method="get" action="${ctxRoot }cn/list.htm">
				<input type="hidden" name="guid" value="${guid }"/>
				<ul>
					<li id="search_type">
						<c:choose>
						<c:when test="${schType=='title' }">
						<input type="radio" name="schType" value="title" checked="checked"/><img src="${ctxRoot }images/news/chi_schType1.png" width="28" height="15"/>
						<input type="radio" name="schType" value="content"/><img src="${ctxRoot }images/news/chi_schType2.png" width="28" height="15"/>
						<input type="radio" name="schType" value="date"/><img src="${ctxRoot }images/news/chi_schType3.png" width="27" height="15"/>
						</c:when>
						<c:when test="${schType=='content' }">
						<input type="radio" name="schType" value="title"/><img src="${ctxRoot }images/news/chi_schType1.png" width="28" height="15"/>
						<input type="radio" name="schType" value="content" checked="checked"/><img src="${ctxRoot }images/news/chi_schType2.png" width="28" height="15"/>
						<input type="radio" name="schType" value="date"/><img src="${ctxRoot }images/news/chi_schType3.png" width="27" height="15"/>
						</c:when>
						<c:when test="${schType=='date' }">
						<input type="radio" name="schType" value="title"/><img src="${ctxRoot }images/news/chi_schType1.png" width="28" height="15"/>
						<input type="radio" name="schType" value="content"/><img src="${ctxRoot }images/news/chi_schType2.png" width="28" height="15"/>
						<input type="radio" name="schType" value="date" checked="checked"/><img src="${ctxRoot }images/news/chi_schType3.png" width="27" height="15"/>
						</c:when>
						<c:otherwise>
						<input type="radio" name="schType" value="title" checked="checked"/><img src="${ctxRoot }images/news/chi_schType1.png" width="28" height="15"/>
						<input type="radio" name="schType" value="content"/><img src="${ctxRoot }images/news/chi_schType2.png" width="28" height="15"/>
						<input type="radio" name="schType" value="date"/><img src="${ctxRoot }images/news/chi_schType3.png" width="27" height="15"/>
						</c:otherwise>
						</c:choose>
					</li>
					<li>
						<input class="schText" name="schText" id="schText" type="text" size="20" maxlength="20" value="${schText }"/>
						<input class="schText" name="schDate" id="schDate" type="text" size="20" maxlength="20" value="${schText }"/>
					</li>
					<li id="schBtn"><input type="image" src="../images/news/chi_btn_search.png" width="48" height="20"/></li>
				</ul>
				</form>
			</div>
		</dd>
	</dl>
</div>