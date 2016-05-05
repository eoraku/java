<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<script type="text/javascript" charset="utf-8">
function selectDateSubmit(){
	var f = document.schedule_new_form;
	f.method="get";
	f.action="new.asp";
	f.submit();
}
function checkFormSubmit(){
	var f = document.schedule_new_form;
	f.method="post";
	f.action="insert.asp";
	$("#schedule_new_form input[name='title']").val(encodeURIComponent($("#schedule_new_form input[name='title']").val()));
	$("#schedule_new_form textarea[name='content']").val(encodeURIComponent($("#schedule_new_form textarea[name='content']").val()));
	
	f.submit();
}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong style="font-size:15;color:336699;">편성표</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td height="35" style="padding-left:5;" valign="bottom"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>CH7편성표</b></td>
	</tr>
</table>
<form id="schedule_new_form" name="schedule_new_form" style="border:0;margin:0;" accept-charset="utf-8" enctype="application/x-www-form-urlencoded">
<input type="hidden" name="mode" value="${mode }"/>
<input type="hidden" name="num" value="${num }"/>
<input type="hidden" name="firstdt" value="${firstdt }"/>
<table width="100%" border="0" cellspacing="0" cellpadding="10">
	<tr>
		<td align="center">
			<table cellpadding="3" width="96%" cellspacing="1" bgcolor="#333333" align="center">
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">기본사항</td>
				</tr>
				<tr height="30">
					<td width="20%" style="background-color:#666666;color:#ffffff;font-weight:bold;"> * 담당자</td>
					<td bgcolor="#ffffff" width="80%">
						<input type="text" name="writer" maxlength="20" value="${writer }">
					</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * 제목</td>
					<td bgcolor="#FFFFFF">
						<input type="text" name="title" size="40" value="${title }"<c:if test="${mode=='view' }"> readonly="readonly"</c:if>>
					</td>
				</tr>
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">내용</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * 편성일</td>
					<td bgcolor="#FFFFFF">
						<select name="year" tabindex="1"<c:if test="${mode=='view' }"> disabled="disabled"</c:if>>
							<c:forEach var="i" begin="2008" end="${year }">
							<option value="${i }"<c:if test="${year==i }"> selected="selected"</c:if>>${i }</option>
							</c:forEach>
						</select>년
						<select name="month" tabindex="2"<c:if test="${mode=='view' }"> disabled="disabled"</c:if>>
							<c:forEach var="i" begin="1" end="12">
							<option value="${i }"<c:if test="${month==i }"> selected="selected"</c:if>>${i }</option>
							</c:forEach>
						</select>월
						<select name="day" tabindex="3" onchange="selectDateSubmit();"<c:if test="${mode=='view' }"> disabled="disabled"</c:if>>
							<c:forEach var="i" begin="1" end="31">
							<option value="${i }"<c:if test="${day==i }"> selected="selected"</c:if>>${i }</option>
							</c:forEach>
						</select>일
					</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * 내용</td>
					<td bgcolor="#FFFFFF">
						<textarea  name="content" rows="30" style="width:100%;">${content }</textarea>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center"> 
			<input type="button" value="설정완료" onclick="checkFormSubmit();" class="button_1">
			<input type="button" value="취    소" onclick="history.back();" class="button_1">
		</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>