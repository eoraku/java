<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<style type="text/css">
th, td{font-size:9pt;font-family:"굴림";}
th{background-color:#EFEFEF;color:#990000;}
.td01_d1{text-align:left;padding-left:20px;}
.td01_d2{text-align:left;padding-left:40px;}
.td02{width:50px;text-align:center;}
.td03{width:50px;text-align:center;}
.td_current{color:#0000ff;text-decoration:underline;}
.notUse{color:red;margin-left:20px;}
</style>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">코드관리</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>코드관리</b></td>
	</tr>
</table>
<div style="padding-left:20px;">
<span style="color:red;">+</span> 분류 위치를 <span style="color:red;">변경/삭제</span>하면 해당 하위분류도 자동적으로 <span style="color:red;">변경/삭제</span> 됩니다!!<br/>
<span style="color:red;">+</span> 하위 분류 생성시 해당 분류 선택한 후 분류 추가하세요!<br/>
<span style="color:red;">+ (X)</span> 표시는 해당 분류를 사이트에 표시하지 않습니다! <br/>
</div>
<table width="90%" border="1" cellspacing="0" cellpadding="3" style="margin:20px;">
	<tr>
		<c:choose>
		<c:when test="${code_uid == 0}">
		<td colspan="3">+ <a href="list.asp?code_uid=0"><strong class="td_current">root</strong></a></td>
		</c:when>
		<c:otherwise>
		<td colspan="3">+ <a href="list.asp?code_uid=0"><strong>root</strong></a></td>
		</c:otherwise>
		</c:choose>
	</tr>
	<c:forEach items="${listCode }" var="item">
	<tr>
		<c:choose>
		<c:when test="${item.code_uid == code_uid }">
		<td class="td01_d${item.code_depth }">+ <a href="list.asp?code_uid=${item.code_uid }"><strong class="td_current">${item.code_name }</strong></a> (분류코드:${item.code_number })
		</c:when>
		<c:otherwise>
		<td class="td01_d${item.code_depth }">+ <a href="list.asp?code_uid=${item.code_uid }"><strong>${item.code_name }</strong></a> (분류코드:${item.code_number })
		</c:otherwise>
		</c:choose>
		<c:if test="${item.code_is_view==0 }"><span class="notUse">(X)</span></c:if></td>
		<td class="td02"><a href="list.asp?code_uid=${item.code_uid }">[수정]</a></td>
		<td class="td03"><a href="javascript:code_del(${item.code_uid })">[삭제]</td>
	</tr>
	</c:forEach>
</table>
<form name="code_form" method="post" action="insert.asp">
<input type="hidden" name="code_uid" value="${code.code_uid }"/>
<input type="hidden" name="code_depth" value="${code.code_depth }"/>
<input type="hidden" name="code_parent" value="${code.code_parent }"/>
<input type="hidden" name="code_d1" value="${code.code_d1 }"/>
<input type="hidden" name="code_d2" value="${code.code_d2 }"/>
<input type="hidden" name="code_d3" value="${code.code_d3 }"/>
<input type="hidden" name="code_d4" value="${code.code_d4 }"/>
<input type="hidden" name="code_d5" value="${code.code_d5 }"/>
<table width="90%" border="1" cellspacing="0" cellpadding="3" style="margin:20px;">
	<c:if test="${code != null }">
	<tr>
		<th>상위분류</th>
		<td>${code.code_name }</td>
	</tr>
	</c:if>
	<tr>
		<th>분류명</th>
		<td><input type="text" name="code_name" value=""/></td>
	</tr>
	<tr>
		<th>분류코드번호</th>
		<td><input type="text" name="code_number" value=""/></td>
	</tr>
	<tr>
		<th>출력여부</th>
		<td><input type="radio" name="code_is_view" value="1" checked="checked"/>출력 <input type="radio" name="code_is_view" value="0"/>비출력</td>
	</tr>
	<tr>
		<th colspan="2">
			
			<input type="submit" value="등 록" class="button_1">
			<input type="reset" value="취 소" class="button_1">
		</th>
	</tr>
</table>
</form>
<br/>
<script type="text/javascript">
$(document).ready(function(){
	$("form").submit(function(){
		if(!chkInputEmpty("input[name=code_name]","'분류명'을 입력해주세요.")) return false;
		if(!chkInputEmpty("input[name=code_number]","'분류코드번호'를 입력해주세요.")) return false;
		return true;
	});
});
</script>
<jsp:include page="/include/admin_footer.asp"/>