<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/common_header.htm"/>
<script type="text/javascript" src="${ctxRoot }js/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctxRoot }js/user_join.js" charset="utf-8"></script>
<div id="info_top">
	<div><a href="${homeUrl }"><img src="${ctxRoot }images/user/info_logo.png" width="260" height="60" alt="KCTV 홈으로" /></a></div>
	<dl>
		<dt><a href="${ctxRoot }user/info.htm"><img src="${ctxRoot }images/user/info_home.png" width="200" height="36" alt="회원정보 홈" /></a></dt>
		<dd><a href="${ctxRoot }user/info_pw.htm"><img src="${ctxRoot }images/user/info_basic_out.png" width="120" height="36" alt="기본정보 변경" /></a></dd>
		<dd><a href="${ctxRoot }user/info_edit_pw.htm"><img src="${ctxRoot }images/user/info_pw_out.png" width="130" height="36" alt="비밀번호 변경" /></a></dd>
		<dd><a href="${ctxRoot }user/info_del.htm"><img src="${ctxRoot }images/user/info_del_out.png" width="120" height="36" alt="온라인 회원 탈퇴" /></a></dd>
	</dl>
</div>

<div id="common_main">
	<jsp:include page="/user/info_side.htm"/>
	<div id="info_content">
		<div id="info_menu_top"><img src="../images/user/info_main_top.png" width="534" height="180"/></div>
		<ul id="ul_info_menu">
			<li><a href="info_pw.htm"><img src="../images/user/edit_info.png" width="200" height="240"/></a></li>
			<li><a href="info_edit_pw.htm"><img src="../images/user/edit_passwd.png" width="200" height="240"/></a></li>
			<li><a href="info_del.htm"><img src="../images/user/del_info.png" width="200" height="240"/></a></li>
		</ul>
	</div>
</div>
<jsp:include page="/include/common_footer.htm"/>