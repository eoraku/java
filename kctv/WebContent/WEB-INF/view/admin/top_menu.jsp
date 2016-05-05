<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/admin_header.asp"/>
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="80" colspan="2" background="../images/admin/top_bg.gif">
			<!--top 부분 시작 -->
			<table width="905" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="368"><img src="../images/admin/top_title.gif"></td>
					<td align="right" style="padding-bottom:5;"> 
						<!-- 권한, 부서 및 이름 테이블 시작 -->
						<table width="85%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="7" height="30"><img src="../images/admin/text_bgimg01.gif" width="7" height="30"></td>
								<td background="../images/admin/text_bg.gif"><nobr>
									<strong><font color="#109B05">ㆍ</font><font color="#003366">레벨 </font></strong><font color="#003366">: ${adminLevel }</font>
									<strong><font color="#109B05">ㆍ</font><font color="#003366">부서 </font></strong><font color="#003366">: ${adminName }</font>
									<strong><font color="#109B05">ㆍ</font><font color="#003366">이름 </font></strong><font color="#003366">: ${adminName }(${adminId })</font>
								</nobr></td>
								<td width="65" align="right" background="../images/admin/text_bg.gif"><a href="login.asp" target="_top"><img src="../images/admin/logout.gif" width="60" height="11" border="0" align="absmiddle"></a></td>
								<td width="7"><img src="../images/admin/text_bgimg02.gif" width="7" height="30"></td>
							</tr>
						</table>
						<!-- 권한, 부서 및 이름 테이블 끝 -->
					</td>
				</tr>
			</table>
			<!-- top 부분 끝 -->
		</td>
	</tr>
</table>
<jsp:include page="/include/admin_footer.asp"/>