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
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">�����ڰ���</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>�ڱ���������</b></td>
	</tr>
</table>
<form name="admin_form" method="post" action="update.asp">
<input type="hidden" name="mode" value="basic"/>
<input type="hidden" name="id" value="${admin.adad_id }"/>
<table width="90%" border="1" cellspacing="0" cellpadding="5" align="center">
	<caption style="text-align:left;">&#8226;������:${detail.adde_regdate }&nbsp;&nbsp;&nbsp;&nbsp;&#8226;�ֱ�������:${detail.adde_accessdate }&nbsp;&nbsp;&nbsp;&nbsp;&#8226;���Ӽ�:${detail.adde_hit }</caption>
	<tr>
		<th colspan="2" style="background-color:#efefef;color:#000000;">����������</th>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#000000;">���̵�</th>
		<td>${admin.adad_id }</td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#000000;">����</th>
		<td>${admin.adad_level }</td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">�̸�</th>
		<td><input type="text" name="name" value="${admin.adad_name }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">�μ�</th>
		<td><input type="text" name="dept" value="${detail.adde_dept }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">����</th>
		<td><input type="text" name="position" value="${detail.adde_position }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">�̸���</th>
		<td><input type="text" name="email" value="${detail.adde_email }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">��ȭ</th>
		<td><input type="text" name="phone" value="${detail.adde_phone }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#000000;">�繫����ȭ</th>
		<td><input type="text" name="o_phone" value="${detail.adde_o_phone }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#000000;">�繫���ּ�</th>
		<td><input type="text" name="o_address" value="${detail.adde_o_address }"/></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">��й�ȣ</th>
		<td><input type="text" name="passwd" value=""/> <input type="button" value="��й�ȣ ����" onclick="changePasswd();" class="button_1"></td>
	</tr>
	<tr>
		<th style="background-color:#efefef;color:#990000;">�޴�����</th>
		<td>
			<dl>
				<dt style="float:left;">
					<c:choose>
					<c:when test="${auth_AD }"><input type="checkbox" name="auth_AD" value="1" checked="checked"/> �����ڰ���</c:when>
					<c:otherwise><input type="checkbox" name="auth_AD" value="1"/> �����ڰ���</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_CD }"><input type="checkbox" name="auth_CD" value="1" checked="checked"/> �ڵ����</c:when>
					<c:otherwise><input type="checkbox" name="auth_CD" value="1"/> �ڵ����</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_CM }"><input type="checkbox" name="auth_CM" value="1" checked="checked"/> �޴�/����������<br/></c:when>
					<c:otherwise><input type="checkbox" name="auth_CM" value="1"/> �޴�/����������<br/></c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_NE }"><input type="checkbox" name="auth_NE" value="1" checked="checked"/> ��������</c:when>
					<c:otherwise><input type="checkbox" name="auth_NE" value="1"/> ��������</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_VO }"><input type="checkbox" name="auth_VO" value="1" checked="checked"/> VOD����</c:when>
					<c:otherwise><input type="checkbox" name="auth_VO" value="1"/> VOD����</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_BD }"><input type="checkbox" name="auth_BD" value="1" checked="checked"/> �Խ��ǰ���<br/></c:when>
					<c:otherwise><input type="checkbox" name="auth_BD" value="1"/> �Խ��ǰ���<br/></c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_ET }"><input type="checkbox" name="auth_ET" value="1" checked="checked"/> ��Ÿ����</c:when>
					<c:otherwise><input type="checkbox" name="auth_ET" value="1"/> ��Ÿ����</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_CA }"><input type="checkbox" name="auth_CA" value="1" checked="checked"/> ��ǥ����</c:when>
					<c:otherwise><input type="checkbox" name="auth_CA" value="1"/> ��ǥ����</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${auth_JA }"><input type="checkbox" name="auth_JA" value="1" checked="checked"/> �ڸ���������</c:when>
					<c:otherwise><input type="checkbox" name="auth_JA" value="1"/> �ڸ���������</c:otherwise>
					</c:choose>
				</dt>
				<dd style="float:left;">
					<input type="button" value="���� ����" onclick="changeAuthMenu();" class="button_1">
				</dd>
			</dl>
		</td>
</table>
<table width="100%" cellpadding="10" cellspacing="0" border="0">
	<tr>
		<td align="center">
			<input type="submit" value="����" class="button_1">
			<input type="reset" value="���" class="button_1">
			<input type="button" value="�ڷ�" onclick="history.back();" class="button_1">
			<c:if test="${!isMine }">
			<input type="button" value="�����ڻ���" onclick="delMember();" class="button_1">
			</c:if>
		</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>