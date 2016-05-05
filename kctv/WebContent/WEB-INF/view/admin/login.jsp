<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript" src="../js/form_check.js"></script>
<SCRIPT type="text/javascript">
<!--
function LA_focusIt(){
	var f = document.forms[0];
	if(f.txt_adminId.value != ""){
		f.txt_passwd.focus();
	}else{
		f.txt_adminId.focus();
	}
}
//-->
</SCRIPT>
</head>
<body leftmargin="0" onLoad="LA_focusIt();">
<form method="post" action="login_run.asp" onsubmit="try{return LA_checkForm(this);}catch(e){alert(e);return false;}">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right" background="../images/admin/login_bg.gif"><img src="../images/admin/login_img01.gif" width="123" height="228"></td>
					<td width="435" align="center">
						<table width="400" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="78" align="center"><img src="../images/admin/login_title.gif"></td>
							</tr>
							<tr>
								<td height="6" align="center"></td>
							</tr>
							<tr>
								<td align="center">
									<table width="370" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="25"><img src="../images/admin/login_timg01.gif" width="25" height="100"></td>
											<td width="350" align="center" background="../images/admin/login_tbg.gif">
												<table width="90%" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td width="32%" height="30"><img src="../images/admin/login_text01.gif" width="88" height="14"></td>
														<td width="37%"><input name="txt_adminId" type="text" size="12" class="form_01" tabindex="1" req item="아이디"></td>
														<td width="31%" rowspan="2"><a href="main.asp"><input type="image" src="../images/admin/login_btn.gif" width="83" height="47" border="0" tabindex="3"></a></td>
													</tr>
													<tr>
														<td height="30"><img src="../images/admin/login_text02.gif" width="88" height="14"></td>
														<td><input name="txt_passwd" type="password" size="12" class="form_01" tabindex="2" req item="비밀번호"></td>
													</tr>
												</table>
											</td>
											<td width="25"><img src="../images/admin/login_timg02.gif" width="25" height="100"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="13" align="right"><img src="../images/admin/login_text03.gif" width="207" height="24"></td>
							</tr>
						</table>
					</td>
					<td background="../images/admin/login_bg.gif"><img src="../images/admin/login_img02.gif" width="123" height="228"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>