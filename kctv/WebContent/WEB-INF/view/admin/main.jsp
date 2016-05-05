<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/admin_header.asp"/>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td valign="top">
			<table width="725" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="25">&nbsp;</td>
					<td width="700"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="28"><img src="../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong><font class="font05">관리자 모드</font></strong></td>
				</tr>
				<tr>
					<td height="1" bgcolor="#DDDDDD"><img src="../images/admin/line.gif" width="204" height="2"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align="center">
			<!-- 내용 -->
			<BR><BR><BR><BR><BR><BR><BR><BR>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr align="center">
					<td>
						${adminName } 님은 <B>${adminLevel }</B>레벨로 들어 오셨습니다.<br>
						작업을 마치시고 로그 아웃 해 주십시요.<br><br>
						ID : <FONT COLOR="#336699">${adminId }</FONT><br>
						위치 : ${adminIp }<br>
						서버위치(server_name) : www.kctvjeju.com<br>
						서버위치(HTTP_HOST) : www.kctvjeju.com<br>
					</td>
				</tr>
			</table>
			<BR><BR><BR><BR><BR><BR><BR><BR>
			<!-- 내용 -->
		</td>
	</tr>
</table>
<jsp:include page="/include/admin_footer.asp"/>