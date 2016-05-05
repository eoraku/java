<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="info_side">
	<%-- <div id="info_photo">
		<dl>
			<dt><img src="../images/user/user_photo.gif" width="86" height="87"/></dt>
			<dd>${infoBasic2.name }님</dd>
			<dd>비밀번호 변경</dd>
		</dl>
	</div> --%>
	<div id="info_login">
		<dl>
			<dd><strong>${infoBasic2.name }</strong>님</dd>
			<dd><strong>마지막 로그인 시간</strong><br/>${infoBasic2.accessdate }</dd>
		</dl>
	</div>
	<div id="info_ext">
		<dl>
			<dd><a href="${homeUrl }contents/customer.htm?muid=259"><img src="../images/user/emergency.gif" width="60" height="52"/></a></dd>
			<dd><a href="${homeUrl }contents/customer.htm?muid=202"><img src="../images/user/customer_qa.gif" width="60" height="52"/></a></dd>
			<dd><a href="${homeUrl }contents/customer.htm?muid=129"><img src="../images/user/service_req.gif" width="60" height="52"/></a></dd>
			<dt><a href="${homeUrl }contents/customer.htm?muid=203"><img src="../images/user/customer_banner.png" width="187" height="70"/></a></dt>
		</dl>
	</div>
	<div id="info_notice">
		<div id="notice_top">
			<div id="notice_top_title">
				<a href="${homeUrl }contents/?muid=117&pmuid=116"><img src="../images/index/left_notice.gif" width="67" height="16"></a>
			</div>
			<div id="notice_top_more">
				<a href="${homeUrl }contents/?muid=117&pmuid=116"><img src="../images/common/more02.gif" width="36" height="11"></a>
			</div>
		</div>
		<div id="notice_body">
			<ul>
				<c:forEach items="${listNotice }" var="item">
				<li><a href="${homeUrl }contents/company.htm?muid=117&mode=view&buid=${item.board_uid }">${item.board_title }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div id="info_faq">
	</div>
</div>