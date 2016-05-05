<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">ȸ������</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="5" align="absmiddle"><b>ȸ������Ʈ</b></td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="3" cellspacing="0">
	<tr>
		<td>
			<form name="user_sch_form" method="get" action="listSecede.asp" style="margin:0;border:0;">
			<table width="100%" cellpadding="5" cellspacing="1" border="0" bgcolor="#CCCCCC">
				<tr>
					<td bgcolor="#EFEFEF">
						<table width=100% cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td align="right">
									&#8226; �˻� : 
									<select name="schType">
										<option value="id"<c:if test="${schType=='mmus_id' }"> selected="selected"</c:if>>ID</option>
									</select>
									<input type="text" name="schText" value="${schText }">
									<input type="submit" value="�˻�" class="button_1">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width=100% cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>&nbsp;&nbsp;<b style="font-family:Arial;font-size:10pt;">(<font color="red">${pageNo }</font>/${listPaging.pageMax}) Pages&nbsp;&nbsp;|&nbsp;&nbsp;Total: ${listTotal }</b></td>
					<td align="right">
					&#8226; �Խù� ��� �� : 
					<select name="pageSize" onchange="this.form.submit();">
						<option value="10"<c:if test="${pageSize==10 }"> selected="selected"</c:if>>10</option>
						<option value="20"<c:if test="${pageSize==20 }"> selected="selected"</c:if>>20</option>
						<option value="30"<c:if test="${pageSize==30 }"> selected="selected"</c:if>>30</option>
						<option value="50"<c:if test="${pageSize==50 }"> selected="selected"</c:if>>50</option>
						<option value="100"<c:if test="${pageSize==100 }"> selected="selected"</c:if>>100</option>
					</select>
				</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
	<tr>
		<td height="4" bgcolor="#F4F4F4"></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#CCCCCC"></td>
	</tr>
	<tr>
		<td>
			<form name="user_list_form" method="post" style="margin:0;border:0;">
			<table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#CCCCCC">
				<tr>
					<td height="2" colspan="5" bgcolor="#FFFFFF"></td>
				</tr>
				<tr bgcolor="#444444" align="center">
					<th><input type="checkbox" name="chkAll" onclick="LA_checkAll(this.form,'userId')"></th>
					<th>��ȣ</th>
					<th>ID</th>
					<th>Ż�����</th>
					<th>Ż����</th>
				</tr>
				<tr>
					<td height="2" colspan="5" bgcolor="#FFFFFF"></td>
				</tr>
				<c:choose>
				<c:when test="${listTotal>0 }">
				<c:forEach items="${listUser }" var="item">
				<tr onmouseover="this.style.backgroundColor='#EFEFEF'" onmouseout="this.style.backgroundColor=''" bgcolor="#FFFFFF" align="center">
					<td><input type="checkbox" name="userId" value="${item.id}"></td>
					<td>${listTotal-item.linenum+1}</td>
					<td><b>${item.id}</b> </td>
					<td>${item.intro}</td>
					<td>${item.regdate}</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
					<td colspan="5" align="center">�ƢƢƢ� ������� �����ϴ�.�ƢƢƢ�</td>
				</tr>
				</c:otherwise>
				</c:choose>
			</table>
			</form>
		</td>
	</tr>
	<tr>
		<td height="1" bgcolor="#CCCCCC"></td>
	</tr>
	<tr>
		<td height="4" bgcolor="#F4F4F4"></td>
	</tr>
</table>
<c:if test="${listPaging.pageMax>0 }">
<div id="div_btm_pages">
	<table id="ul_board_pages">
		<tr>
			<c:if test="${listPaging.prev!='' }">
			<td><a class="page_prev" href="${urlQuery }${listPaging.prev }">����������</a></td>
			</c:if>
			<c:forEach items="${listPaging.pages }" var="item">
			<c:choose>
			<c:when test="${item.isCurrent }">
			<td><div class="page_curr">${item.pageNo }</div></td>
			</c:when>
			<c:otherwise>
			<td><a class="page_link" href="${urlQuery }${item.pageLink }">${item.pageNo }</a></td>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${listPaging.next!='' }">
			<td><a class="page_next" href="${urlQuery }${listPaging.next }">����������</a></td>
			</c:if>
		</tr>
	</table>
</div>
</c:if>
<table width="100%" cellpadding="10" cellspacing="0" border="0">
	<tr>
		<td align="right">
			<input type="button" value="ó������" onclick="location.href='listSecede.asp';" class="button_1">
			<input type="button" value="����ȸ�� ����" onclick="LA_secede();" class="button_1" style="width:120;">
		</td>
	</tr>
</table>
<jsp:include page="/include/admin_footer.asp"/>