<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript">
$(document).ready(function(){
	$("form").submit(function(){
		if(!chkInputEmpty($("#title"),"'����'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty($("#imageFile"),"'�̹���'�� �Է����ּ���.")) return false;
		return true;
	});
});
function vodweek_delete(ldate){
	if(confirm(ldate+" �̹������� �����Ͻðڽ��ϱ�?")){
		location.href="deleteVodWeek.asp?ldate="+ldate;
	}
}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">��Ÿ����</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>VOD�ְ��� ����</b></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#CCCCCC">
	<tr bgcolor="#444444" align="center">
		<th>��¥</th>
		<th>����</th>
		<th>�̹���</th>
		<th>����</th>
	</tr>
	<c:forEach items="${listVodWeek }" var="item" varStatus="status">
	<tr onMouseOver="this.style.backgroundcolor='#EFEFEF'" onMouseOut="this.style.backgroundcolor=''" bgcolor="#FFFFFF">
		<td align="center">${item.ldate }</td>
		<td align="center">${item.title }</td>
		<td align="center"><a href="#" onclick="javascript:img_view_window('${ctxRoot }popup/viewImg.htm','${ctxRoot}upload/vodWeek/${item.image_url }',0,0);"><b>[view]</b></a></td>
		<td align="center"><a href="#" onclick="javascript:vodweek_delete('${item.ldate}');"><b>[X]</b></a></td>
	</tr>
	</c:forEach>
</table><br/>
<form name="vodWeek_new_form" method="post" enctype="multipart/form-data" action="insertVodWeek.asp">
<table width="100%" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td>&nbsp;&nbsp;</td>
		<th align="center" bgcolor="#444444">����</th>
		<td align="center"><input type="text" name="title" id="title" size="20"/></td>
		<th align="center" bgcolor="#444444">�̹���</th>
		<td align="center"><input type="file" name="imageFile" id="imageFile" size="40"/></td>
		<td align="center"><input type="submit" value="VOD�ְ������" class="button_1"></td>
		<td>&nbsp;&nbsp;</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>