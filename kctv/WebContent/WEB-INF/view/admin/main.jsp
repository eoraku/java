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
					<td height="28"><img src="../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong><font class="font05">������ ���</font></strong></td>
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
			<!-- ���� -->
			<BR><BR><BR><BR><BR><BR><BR><BR>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr align="center">
					<td>
						${adminName } ���� <B>${adminLevel }</B>������ ��� ���̽��ϴ�.<br>
						�۾��� ��ġ�ð� �α� �ƿ� �� �ֽʽÿ�.<br><br>
						ID : <FONT COLOR="#336699">${adminId }</FONT><br>
						��ġ : ${adminIp }<br>
						������ġ(server_name) : www.kctvjeju.com<br>
						������ġ(HTTP_HOST) : www.kctvjeju.com<br>
					</td>
				</tr>
			</table>
			<BR><BR><BR><BR><BR><BR><BR><BR>
			<!-- ���� -->
		</td>
	</tr>
</table>
<jsp:include page="/include/admin_footer.asp"/>