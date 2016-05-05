<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content_main">
	<div id="sitemap_top">
		<img src="../images/sitemap/topimg.gif" width="670" height="115" alt="사이트맵" />
	</div>
	<div id="sitemap_title">
		<img src="../images/sitemap/c_title01.gif" width="225" height="18"/>
	</div>
	<div class="sitemap_content">
		<dl>
			<dt><img src="../images/sitemap/site_00.gif" alt="회사소개" /></dt>
			<c:forEach items="${sitemap00 }" var="item">
			<dd><a href="${ctxRoot }contents/company.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
		<dl>
			<dt><img src="../images/sitemap/site_01.gif" alt="상품안내" /></dt>
			<c:forEach items="${sitemap01 }" var="item">
			<dd><a href="${ctxRoot }contents/product.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
		<dl>
			<dt><img src="../images/sitemap/site_02.gif" alt="채널가이드" /></dt>
			<c:forEach items="${sitemap02 }" var="item">
			<dd><a href="${ctxRoot }contents/chGuide.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
		<dl>
			<dt><img src="../images/sitemap/site_03.gif" alt="KCTV뉴스" /></dt>
			<dd><a href="${ctxRoot }news/index.htm">KCTV뉴스</a></dd>
			<dd><a href="${ctxRoot }eng/">영어뉴스</a></dd>
			<dd><a href="${ctxRoot }news/list.htm?guid=10">중국어뉴스</a></dd>
			<dd><a href="${ctxRoot }news/vod.htm">다시보기</a></dd>
			<dd><a href="${ctxRoot }news/report.htm">뉴스제보</a></dd>
			<dd><a href="${ctxRoot }news/profile.htm">기자소개</a></dd>
		</dl>
	</div>
	<div class="sitemap_content">
		<dl>
			<dt><img src="../images/sitemap/site_04.gif" alt="프로그램(CH7)" /></dt>
			<c:forEach items="${sitemap04 }" var="item">
			<dd><a href="${ctxRoot }contents/program.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
		<dl>
			<dt><img src="../images/sitemap/site_08.gif" alt="KCTVN(정보채널)" /></dt>
			<c:forEach items="${sitemap05 }" var="item">
			<dd><a href="${ctxRoot }contents/kctvn.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
		<dl>
			<dt><img src="../images/sitemap/site_05.gif" alt="사이버홍보" /></dt>
			<c:forEach items="${sitemap06 }" var="item">
			<dd><a href="${ctxRoot }contents/cPublic.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
		<dl>
			<dt><img src="../images/sitemap/site_06.gif" alt="고객감동실" /></dt>
			<c:forEach items="${sitemap07 }" var="item">
			<dd><a href="${ctxRoot }contents/customer.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
	</div>
</div>