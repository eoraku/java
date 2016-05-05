<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/admin_header.asp"/>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">자막뉴스</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>자막뉴스 보기</b></td>
	</tr>
</table>
<div style="width:750px;">
	<div style="float:left;width:730px;height:115px;margin:10px;text-align:center;">
		<img src="../../images/cPublic/topimg.gif" width="670" height="115" />
	</div>
	<div style="float:left;width:730px;margin:10px;border:1px solid gray;">
		${content }
	</div>
	<div style="float:left;width:730px;margin:10px;text-align:center;">
		<a href="edit.asp"><img src="../../images/admin/btn_modify.gif" width="61" height="22" border="0"/></a>
	</div>
</div>
<jsp:include page="/include/admin_footer.asp"/>