<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">�Խ��� ����</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>�Խ��� ���</b></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="10">
	<tr>
		<td>
			<table cellpadding="5" width="100%" cellspacing="1" bgcolor="#666666" align="center">
				<tr align="center" bgcolor="#999999">
					<th>���̵�</th>
					<th>�̸�</th>
					<th>�۵�ϼ�</th>
					<th>�Խ��Ǻ���</th>
					<th>ī�װ�</th>
					<th>�����</th>
				</tr>
				<c:choose>
				<c:when test="${listTotal>0 }">
				<c:forEach items="${listBoard }" var="item">
				<tr align="center" bgcolor="#FFFFFF">
					<td><a href="board_insert.asp?board_id=notice">${item.cfg_board_id }</a></td>
					<td><a href="board_insert.asp?board_id=notice">${item.cfg_board_name }</a></td>
					<td>227 ��</td>
					<td><a href="${item.cfg_board_id }/board.asp">[�Խ��Ǻ���]</a></td>
					<td>[none]</td>
					<td>${item.cfg_board_name }</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
				</c:otherwise>
				</c:choose>
			</table>
		</td>
	</tr>
</table>
<jsp:include page="/include/admin_footer.asp"/>