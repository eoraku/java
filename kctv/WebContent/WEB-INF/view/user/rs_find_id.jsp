<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/common_header.htm"/>
<div id="info_top">
	<div>
		<a href="${homeUrl }"><img
			src="${ctxRoot }images/user/info_logo.png" width="260" height="60"
			alt="KCTV 홈으로" /></a>
	</div>
	<dl>
		<dt>
			<img src="${ctxRoot }images/user/title_findid.png" width="200"
				height="36" />
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/title_small_yourself.png" style="padding-top:2px;" />
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/arrow_on.png" style="padding-top:10px;"/>
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/title_small_viewid_on.png" style="padding-top:2px;" />
		</dt>
	</dl>
</div>
<div id="common_main">
	<div id="findIdResultDiv" style="overflow:hidden; width:600px; float:inherit; margin:auto; padding:20px;">
		<dl id="findIdResultDl" style="border: 1px solid rgb(210,210,210);">
			<dt style="margin:20px;"><img width="100" height="32" src="/images/user/chkid.png"></dt>
			<c:choose>
				<c:when test="${userId != null}">
					<dt style="margin:30px;">${realName }님의 아이디는</dt>
					<dd style="margin:30px;"><span style="margin-right:5px; color:blue; font-weight:bold;">${userId }</span>입니다.</dd>
					<dt style="margin:20px; text-align:center;"><a href="${sslDomain }user/find_pw.htm"><img style="width:100px; height:32px; margin:10px;" src="/images/user/btn_findpw_rsid.png" alt="비밀번호찾기"></a><a href="${sslDomain }user/login.htm"><img style="width:100px; height:32px; margin:10px;" src="/images/user/btn_login_rsid.png" alt="로그인"></a></dt>
				</c:when>
				<c:otherwise>
					<dt style="margin:30px;">${realName }님은</dt>
					<dd style="margin:30px;">현재 KCTV제주방송 온라인 회원이 아닙니다.</dd>
					<dt style="margin:20px; text-align:center;"><a href="${sslDomain }user/join1.htm"><img style="width:100px; height:32px; margin:10px;" src="/images/user/btn_join.png" alt="회원가입"></a><a href="${homeUrl }"><img style="width:100px; height:32px; margin:10px;" src="/images/user/btn_gohome.png" alt="홈으로"></a></dt>
				</c:otherwise>
			</c:choose>
		</dl>
	</div>
</div>
<jsp:include page="/include/common_footer.htm"/>