<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
</head>

<body leftmargin="0" topmargin="0" bgcolor="#F5F5F5">
<!-- �����޴� ���̺� ���� -->
<table width="180" height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td valign="top" height="100%"> 
			<table width="178" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="3" colspan="3"></td>
				</tr>
				<tr>
					<td width="4"><img src="../images/admin/title_img01.gif" width="4" height="48"></td>
					<td width="170" align="center" background="../images/admin/title_bg.gif"><b class="font04" style="color:#FFFFFF;font-size:13;">�����ڸ��</b></td>
					<td width="4"><img src="../images/admin/title_img02.gif" width="4" height="48"></td>
				</tr>
				<tr>
					<td colspan="3" style="padding-left:10;">
						<table width="100%" border="0" cellspacing="0" cellpadding="3">
							<tr>
								<td height="7"></TD>
							</tr>
							<c:if test="${menuAD }">
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>�����ڰ���</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_0"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/admin/view.asp" target="admin_main">�ڱ���������</a></td>
										</tr>
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/admin/list.asp" target="admin_main">�����ڸ���Ʈ</a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr id="line_0">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							</c:if>
							<c:if test="${menuMM }">
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>ȸ������</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_1"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/member/list.asp" target="admin_main">ȸ������Ʈ</a></td>
										</tr>
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/member/listSecede.asp" target="admin_main">Ż��ȸ������Ʈ</a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr id="line_1">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							</c:if>
							<c:if test="${menuCD }">
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>�ڵ����</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_2"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/code/list.asp" target="admin_main">�ڵ����</a></td>
										</tr>
										<%-- <tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/code/product_code_list.asp?AMCode=CD02" target="admin_main">��ǰ�ڵ����</a></td>
										</tr>
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/code/vod_code_list.asp?AMCode=CD03" target="admin_main">������VOD�ڵ����</a></td>
										</tr> --%>
									</table>
								</td>
							</tr>
							<tr id="line_2">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="line_7">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							</c:if>
							<c:if test="${menuCM }">
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>�޴�/����������</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_8"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/cms/list.asp" target="admin_main">�޴�/����������</a></td>
										</tr>
									</table>
								</td>
							</tr>
							</c:if>
							<c:if test="${menuNE }">
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>KCTV ����</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_3"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/news/list1.asp" target="admin_main">��������Ʈ</a></td>
										</tr>
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/news/listReport.asp" target="admin_main">��������</a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr id="line_3">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							</c:if>
							<c:if test="${menuVO }">
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>VOD����(CH7)</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_4"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/vod/list.asp" target="admin_main">VOD(CH7)���</a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr id="line_4">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							</c:if>
							<c:if test="${menuBD }">
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>�Խ��ǰ���</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_5"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/board/list.asp" target="admin_main">�Խ��Ǹ��</a></td>
										</tr>
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/board/new.asp" target="admin_main">�Խ��ǵ��</a></td>
										</tr>
									</table>
								</td>
							</tr>
							<!-- <tr id="line_5">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>���̺�����������</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_6"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/cabledic/list.asp?AMCode=CA01" target="admin_main">���̺������� ����</a></td>
										</tr>
									</table>
								</td>
							</tr> -->
							<!-- <tr id="line_6">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>��ȣȸ����</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_7"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/club/club_list.asp?AMCode=CL01" target="admin_main">��ȣȸ ����</a></td>
										</tr>
									</table>
								</td>
							</tr> -->
							<!-- <tr id="line_8">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>���Ϲ߼�</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_9"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/mail/mail_form.asp?AMCode=MA01" target="admin_main">���Ϲ߼�</a></td>
										</tr>
									</table>
								</td>
							</tr> -->
							<%-- <tr id="line_9">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>�����ǰ���</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_10"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/cyber/advertise.asp?AMCode=CF01" target="admin_main">������</a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr id="line_10">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr> --%>
							<%-- <tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>������</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_11"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/log/user_log.asp?AMCode=LG01" target="admin_main">����������</a></td>
										</tr>
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/log/ch5_log.asp?AMCode=LG02" target="admin_main">CH7���α׷����</a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr id="line_11">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr> --%>
							</c:if>
							<c:if test="${menuET }">
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>��Ÿ����</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_12"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/etc/listPopup.asp" target="admin_main">�˾�â����</a></td>
										</tr>
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/etc/listVodWeek.asp" target="admin_main">VOD�ְ�������</a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr id="line_12">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							</c:if>
							<c:if test="${menuCA }">
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>��ǥ</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_13"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/schedule/list.asp" target="admin_main">CH7��ǥ</a></td>
										</tr>
									</table>
								</td>
							</tr>
							<!-- <tr id="line_13">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>������VOD</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_14"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/dv/dv_list.asp?AMCode=DV01" target="admin_main">������VOD</a></td>
										</tr>
									</table>
								</td>
							</tr> -->
							<tr id="line_14">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							</c:if>
							<c:if test="${menuJA }">
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>�ڸ�����</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_15"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/lineNews/view.asp" target="admin_main">�ڸ�����</a></td>
										</tr>
									</table>
								</td>
							</tr>
							<!-- <tr id="line_15">
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr>
								<td height="24"><img src="../images/admin/bul01.gif" width="10" height="11" hspace="3" vspace="3" align="absmiddle"><strong>Ƽ���Ǹ�</strong></td>
							</tr>
							<tr>
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							<tr id="menu_16"> 
								<td bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="3">
										<tr>
											<td><img src="../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><a href="${ctxRoot}admin/reservation/TK.asp?AMCode=TK01" target="admin_main">Ƽ���Ǹ�</a></td>
										</tr>
									</table>
								</td>
							</tr> -->
							<tr id="line_16"> 
								<td height="1" background="../images/admin/dot.gif"></td>
							</tr>
							</c:if>
						</table>
						<!-- <a href="./admin/visit_update_run.asp">[�湮�ڼ� ������Ʈ]</a> -->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- �����޴� ���̺� �� -->
<jsp:include page="/include/admin_footer.asp"/>