<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">KCTV ����</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>��������</b></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="0">
	<tr>
		<td height="10" colspan="2"></td>
	</tr>
	<tr>
		<td height="30" colspan="2" align="center" bgcolor="#599BB4"><strong><font color="#FFFFFF">���� ����</font></strong></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#F6F6F6"><font color="#666666"><strong>�����</strong></font></td>
		<td>${item.board_regdate }</td>
	</tr>
	<tr>
		<td align="center" bgcolor="#F6F6F6"><font color="#666666"><strong>IP</strong></font></td>
		<td>${item.board_ip }</td>
	</tr>
	<tr>
		<td align="center" bgcolor="#F6F6F6"><font color="#666666"><strong>�� ��</strong></font></td>
		<td>${item.board_name }</td>
	</tr>
	<tr>
		<td align="center" bgcolor="#F6F6F6"><font color="#666666"><strong>��ȭ��ȣ</strong></font></td>
		<td>${item.board_homepage }</td>
	</tr>
	<tr>
		<td align="center" bgcolor="#F6F6F6"><font color="#666666"><strong>�̸���</strong></font></td>
		<td>${item.board_email }</td>
	</tr>
	<tr>
		<td align="center" bgcolor="#F6F6F6"><font color="#666666"><strong>�� ��</strong></font></td>
		<td>${item.board_title }</td>
	</tr>
	<tr>
		<td align="center" bgcolor="#F6F6F6"><font color="#666666"><strong>�� ��</strong></font></td>
		<td>${item.board_group_id }</td>
	</tr>
	<tr>
		<td align="center" bgcolor="#f6f6f6"><font color="#666666"><strong>÷������</strong></font></td>
		<td><c:if test="${item.pds_file_name2 != '' }"><img src="${item.pds_file_name2 }"/></c:if></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#599BB4" colspan="2"><font color="#666666"><strong>�� ��</strong></font></td>
	</tr>
	<tr>
		<td colspan="2">${item.board_contents }</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><a href="listReport.asp"><img src="../../images/admin/btn_list.gif" width="61" height="22" border="0" alt="���"></a></td>
	</tr>
</table>
</body>
</html>