<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
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
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>관리자리스트</b></td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="3" cellspacing="0">
	<tr>
		<td>
			<form name="admin_sch_form"method="get" action="list.asp" style="margin:0;border:0;">
			<table width="100%" cellpadding="5" cellspacing="1" border="0" bgcolor="#CCCCCC">
				<tr>
					<td bgcolor="#EFEFEF">
						<table width=100% cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td align="right">
									&#8226; 검색 : 
									<select name="schType">
										<option value="id"<c:if test="${schType=='id' }"> selected="selected"</c:if>>ID</option>
										<option value="name"<c:if test="${schType=='name' }"> selected="selected"</c:if>>이름</option>
										<option value="dept"<c:if test="${schType=='dept' }"> selected="selected"</c:if>>부서</option>
										<option value="position"<c:if test="${schType=='position' }"> selected="selected"</c:if>>직위</option>
									</select>
									<input type="text" name="schText" value="${schText }">
									<input type="submit" value="검색" class="button_1">
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
					&#8226; 게시물 출력 수 : 
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
					<td height="2" colspan="8" bgcolor="#FFFFFF"></td>
				</tr>
				<tr bgcolor="#444444" align="center">
					<th><input type="checkbox" name="chkAll" onclick="LA_checkAll(this.form,'userId')"></th>
					<th>ID</th>
					<th>권한</th>
					<th>이름</th>
					<th>부서</th>
					<th>직위</th>
					<th>연락처</th>
					<th>최근접속일</th>
				</tr>
				<tr>
					<td height="2" colspan="8" bgcolor="#FFFFFF"></td>
				</tr>
				<c:choose>
				<c:when test="${listTotal>0 }">
				<c:forEach items="${listAdmin }" var="item">
				<tr onmouseover="this.style.backgroundColor='#EFEFEF'" onmouseout="this.style.backgroundColor=''" bgcolor="#FFFFFF" align="center">
					<td><input type="checkbox" name="userId" value="${item.id}"></td>
					<td><a href="view.asp?id=${item.id }"><B>${item.id}</B></a></td>
					<td>${item.level}</td>
					<td>${item.name}</td>
					<td>${item.dept}</td>
					<td>${item.position}</td>
					<td>${item.phone}</td>
					<td>${item.accessdate}</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
					<td colspan="8" align="center">▒▒▒▒ 결과값이 없습니다.▒▒▒▒</td>
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
			<td><a class="page_prev" href="${urlQuery }${listPaging.prev }">이전페이지</a></td>
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
			<td><a class="page_next" href="${urlQuery }${listPaging.next }">다음페이지</a></td>
			</c:if>
		</tr>
	</table>
</div>
</c:if>
<table width="100%" cellpadding="10" cellspacing="0" border="0">
	<tr>
		<td>
			<!-- <input type="button" value="선택회원 메일발송" onclick="LA_sendEmail();" class="button_1" style="width:150;"> -->
			<!--<input type="button" value='선택회원 SMS발송' onclick="LA_sendSMS();" class='button_1' style="width:150;">-->
		</td>
		<td align="right">
			<input type="button" value="처음으로" onclick="location.href='list.asp';" class="button_1">
			<input type="button" value="선택관리자 삭제" onclick="LA_secede();" class="button_1" style="width:120;">
		</td>
	</tr>
</table>
<jsp:include page="/include/admin_footer.asp"/>