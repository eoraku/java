<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="news_top_menu">
	<dl>
		<dt style="width:106px;"><a href="${homeUrl }news/"><img src="../images/news/eng_news_menu01_over.png" width="106" height="32"/></a></dt>
		<dt style="width:92px;"><a href="${homeUrl }contents/program.htm?muid=173&cuid=30"><img src="../images/news/eng_news_menu05_over.png" width="92" height="32"/></a></dt>
		<dt style="width:100px;"><a href="${homeUrl }news/report.htm"><img src="../images/news/eng_news_menu06_over.png" width="100" height="32"/></a></dt>
		<dt style="width:102px;"><a href="${homeUrl }news/profile.htm"><img src="../images/news/eng_news_menu07_over.png" width="102" height="32"/></a></dt>
		<dt style="width:178px;"><a href="${homeUrl }contents/program.htm?muid=217"><img src="../images/news/eng_news_menu08_over.png" width="178" height="32"/></a></dt>
		<dd>
			<div id="top_search_form">
				<form id="newsSchForm" name="vodSchForm" method="get" action="${ctxRoot }eng/list.htm">
				<input type="hidden" name="guid" value="${guid }"/>
				<ul>
					<li id="search_type">
						<select name="schType" id="schType">
							<c:choose>
							<c:when test="${schType=='title' }">
							<option value="title" selected="selected">Title</option>
							<option value="content">Content</option>
							<option value="date">Date</option>
							</c:when>
							<c:when test="${schType=='content' }">
							<option value="title">Title</option>
							<option value="content" selected="selected">Content</option>
							<option value="date">Date</option>
							</c:when>
							<c:when test="${schType=='date' }">
							<option value="title">Title</option>
							<option value="content">Content</option>
							<option value="date" selected="selected">Date</option>
							</c:when>
							<c:otherwise>
							<option value="title" selected="selected">Title</option>
							<option value="content">Content</option>
							<option value="date">Date</option>
							</c:otherwise>
							</c:choose>
						</select>
					</li>
					<li>
						<input class="schText" name="schText" id="schText" type="text" size="20" maxlength="20" value="${schText }"/>
						<input class="schText" name="schDate" id="schDate" type="text" size="20" maxlength="20" value="${schText }"/>
					</li>
					<li id="schBtn"><input type="image" src="../images/news/eng_btn_search.png" width="56" height="20" alt="Search English News"/></li>
				</ul>
				</form>
			</div>
		</dd>
	</dl>
</div>