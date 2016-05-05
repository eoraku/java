<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript">
function changePasswd(){
	var f=document.admin_form;
	f.mode.value="passwd";
	f.submit();
}

function changeAuthMenu(){
	var f=document.admin_form;
	f.mode.value="authMenu";
	f.submit();
}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">관리자관리</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>자기정보관리</b></td>
	</tr>
</table>
<form name="admin_form" method="post" action="update.asp">
<input type="hidden" name="mode" value="basic"/>
<input type="hidden" name="id" value="${admin.adad_id }"/>
<table width="90%" border="1" cellspacing="0" cellpadding="5" align="center">
	<caption style="text-align:left;">&#8226;가입일:${detail.adde_regdate }&nbsp;&nbsp;&nbsp;&nbsp;&#8226;최근접속일:${detail.adde_accessdate }&nbsp;&nbsp;&nbsp;&nbsp;&#8226;접속수:${detail.adde_hit }</caption>
	<tr>
		<th colspan="2" style="background-color:#efefef;color:#000000;">관리자정보</th>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#000000;">아이디</th>
		<td>${admin.adad_id }</td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#000000;">권한</th>
		<td>${admin.adad_level }</td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">이름</th>
		<td><input type="text" name="name" value="${admin.adad_name }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">부서</th>
		<td><input type="text" name="dept" value="${detail.adde_dept }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">직위</th>
		<td><input type="text" name="position" value="${detail.adde_position }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">이메일</th>
		<td><input type="text" name="email" value="${detail.adde_email }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">전화</th>
		<td><input type="text" name="phone" value="${detail.adde_phone }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#000000;">사무실전화</th>
		<td><input type="text" name="o_phone" value="${detail.adde_o_phone }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#000000;">사무실주소</th>
		<td><input type="text" name="o_address" value="${detail.adde_o_address }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">비밀번호</th>
		<td><input type="text" name="passwd" value=""/> <input type="button" value="비밀번호 변경" onclick="changePasswd();" class="button_1"></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">메뉴권한</th>
		<td>
			<dl>
				<dt style="float:left;">
					<c:choose>
					<c:when test="${auth_AD }"><input type="checkbox" name="auth_AD" value="1" checked="checked"/> 관리자관리</c:when>
					<c:otherwise><input type="checkbox" name="auth_AD" value="1"/> 관리자관리</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_CD }"><input type="checkbox" name="auth_CD" value="1" checked="checked"/> 코드관리</c:when>
					<c:otherwise><input type="checkbox" name="auth_CD" value="1"/> 코드관리</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_CM }"><input type="checkbox" name="auth_CM" value="1" checked="checked"/> 메뉴/컨텐츠관리<br/></c:when>
					<c:otherwise><input type="checkbox" name="auth_CM" value="1"/> 메뉴/컨텐츠관리<br/></c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_NE }"><input type="checkbox" name="auth_NE" value="1" checked="checked"/> 뉴스관리</c:when>
					<c:otherwise><input type="checkbox" name="auth_NE" value="1"/> 뉴스관리</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_VO }"><input type="checkbox" name="auth_VO" value="1" checked="checked"/> VOD관리</c:when>
					<c:otherwise><input type="checkbox" name="auth_VO" value="1"/> VOD관리</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_BD }"><input type="checkbox" name="auth_BD" value="1" checked="checked"/> 게시판관리<br/></c:when>
					<c:otherwise><input type="checkbox" name="auth_BD" value="1"/> 게시판관리<br/></c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_ET }"><input type="checkbox" name="auth_ET" value="1" checked="checked"/> 기타관리</c:when>
					<c:otherwise><input type="checkbox" name="auth_ET" value="1"/> 기타관리</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_CA }"><input type="checkbox" name="auth_CA" value="1" checked="checked"/> 편성표관리</c:when>
					<c:otherwise><input type="checkbox" name="auth_CA" value="1"/> 편성표관리</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_JA }"><input type="checkbox" name="auth_JA" value="1" checked="checked"/> 자막뉴스관리</c:when>
					<c:otherwise><input type="checkbox" name="auth_JA" value="1"/> 자막뉴스관리</c:otherwise>
					</c:choose>
				</dt>
				<dd style="float:left;">
					<input type="button" value="권한 변경" onclick="changeAuthMenu();" class="button_1">
				</dd>
			</dl>
		</td>
</table>
<table width="100%" cellpadding="10" cellspacing="0" border="0">
	<tr>
		<td align="center">
			<input type="submit" value="저장" class="button_1">
			<input type="reset" value="취소" class="button_1">
			<input type="button" value="뒤로" onclick="history.back();" class="button_1">
			<c:if test="${!isMine }">
			<input type="button" value="관리자삭제" onclick="delMember();" class="button_1">
			</c:if>
		</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>