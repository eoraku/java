<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript">
function changePasswd(){
	var f=document.user_form;
	f.mode.value="passwd";
	f.submit();
}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">회원관리</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>회원수정</b></td>
	</tr>
</table>
<form name="user_form" method="post" action="update.asp">
<input type="hidden" name="mode" value="basic"/>
<input type="hidden" name="id" value="${user.id }"/>
<table width="90%" border="1" cellspacing="0" cellpadding="5" align="center">
	<caption style="text-align:left;">&#8226;가입일:${user.regdate }&nbsp;&nbsp;&nbsp;&nbsp;&#8226;최근접속일:${user.accessdate }&nbsp;&nbsp;&nbsp;&nbsp;&#8226;접속수:${user.hit }</caption>
	<tr>
		<th colspan="2" style="background-color:#efefef;color:#000000;">회원정보</th>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">아이디</th>
		<td>${user.id }</td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">이름</th>
		<td><input type="text" name="name" value="${user.name }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#000000;">소속/단체</th>
		<td><input type="text" name="group" value="${user.group }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">회원 승인여부</th>
		<c:choose>
		<c:when test="${user.status==1 }">
		<td><input type="radio" name="status" value="1" checked="checked"/>정회원 <input type="radio" name="status" value="0"/>준회원</td>
		</c:when>
		<c:otherwise>
		<td><input type="radio" name="status" value="1"/>정회원 <input type="radio" name="status" value="0" checked="checked"/>준회원</td>
		</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">주민번호</th>
		<td><input type="text" name="jumin" value="${user.jumin }" readonly="readonly"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">주소</th>
		<td><input type="text" name="zipcode" value="${user.zipcode }" size="10" maxlength="7"/><br/>
			<input type="text" name="address1" value="${user.address1 }" size="50"/><br/>
			<input type="text" name="address2" value="${user.address2 }" size="50"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">전화번호</th>
		<td><input type="text" name="phone" value="${user.phone }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">핸드폰번호</th>
		<td><input type="text" name="cellphone" value="${user.cellphone }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">이메일주소</th>
		<td><input type="text" name="email" value="${user.email }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">메일링</th>
		<c:choose>
		<c:when test="${user.status==1 }">
		<td><input type="radio" name="mailing" value="1" checked="checked"/>받음<input type="radio" name="mailing" value="0"/>받지안음</td>
		</c:when>
		<c:otherwise>
		<td><input type="radio" name="mailing" value="1"/>받음<input type="radio" name="mailing" value="0" checked="checked"/>받지안음</td>
		</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">비밀번호</th>
		<td><input type="text" name="passwd" value=""/> <input type="button" value="비밀번호 변경" onclick="changePasswd();" class="button_1"></td>
	</tr>
</table>
<table width="100%" cellpadding="10" cellspacing="0" border="0">
	<tr>
		<td align="center">
			<input type="submit" value="저장" class="button_1">
			<input type="reset" value="취소" class="button_1">
			<input type="button" value="뒤로" onclick="history.back();" class="button_1">
			<input type="button" value="회원탈퇴" onclick="delMember();" class="button_1">
		</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>