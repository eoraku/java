<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content_main">
	<div id="sitemap_top">
		<img src="../images/sitemap/topimg.gif" width="670" height="115" alt="����Ʈ��" />
	</div>
	<div id="sitemap_title">
		<img src="../images/sitemap/c_title01.gif" width="225" height="18"/>
	</div>
	<div class="sitemap_content">
		<dl>
			<dt><img src="../images/sitemap/site_00.gif" alt="ȸ��Ұ�" /></dt>
			<c:forEach items="${sitemap00 }" var="item">
			<dd><a href="${ctxRoot }contents/company.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
		<dl>
			<dt><img src="../images/sitemap/site_01.gif" alt="��ǰ�ȳ�" /></dt>
			<c:forEach items="${sitemap01 }" var="item">
			<dd><a href="${ctxRoot }contents/product.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
		<dl>
			<dt><img src="../images/sitemap/site_02.gif" alt="ä�ΰ��̵�" /></dt>
			<c:forEach items="${sitemap02 }" var="item">
			<dd><a href="${ctxRoot }contents/chGuide.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
		<dl>
			<dt><img src="../images/sitemap/site_03.gif" alt="KCTV����" /></dt>
			<dd><a href="${ctxRoot }news/index.htm">KCTV����</a></dd>
			<dd><a href="${ctxRoot }eng/">�����</a></dd>
			<dd><a href="${ctxRoot }news/list.htm?guid=10">�߱����</a></dd>
			<dd><a href="${ctxRoot }news/vod.htm">�ٽú���</a></dd>
			<dd><a href="${ctxRoot }news/report.htm">��������</a></dd>
			<dd><a href="${ctxRoot }news/profile.htm">���ڼҰ�</a></dd>
		</dl>
	</div>
	<div class="sitemap_content">
		<dl>
			<dt><img src="../images/sitemap/site_04.gif" alt="���α׷�(CH7)" /></dt>
			<c:forEach items="${sitemap04 }" var="item">
			<dd><a href="${ctxRoot }contents/program.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
		<dl>
			<dt><img src="../images/sitemap/site_08.gif" alt="KCTVN(����ä��)" /></dt>
			<c:forEach items="${sitemap05 }" var="item">
			<dd><a href="${ctxRoot }contents/kctvn.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
		<dl>
			<dt><img src="../images/sitemap/site_05.gif" alt="���̹�ȫ��" /></dt>
			<c:forEach items="${sitemap06 }" var="item">
			<dd><a href="${ctxRoot }contents/cPublic.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
		<dl>
			<dt><img src="../images/sitemap/site_06.gif" alt="��������" /></dt>
			<c:forEach items="${sitemap07 }" var="item">
			<dd><a href="${ctxRoot }contents/customer.htm?muid=${item.uid }">${item.name }</a></dd>
			</c:forEach>
		</dl>
	</div>
</div>