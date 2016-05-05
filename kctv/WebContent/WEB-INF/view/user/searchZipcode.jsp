<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>▒ 주소찾기 ▒</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style>
.font_01 {
	FONT-SIZE: 11px;
	color:#666666;
	font-family: "굴림,굴림체";
}
.font_04 {
	FONT-SIZE: 11px;
	color:#7D7D7D;
	font-family: "돋움";
}
.form2 {
	BORDER-RIGHT: #D2D6DF 1px solid;
	BORDER-TOP: #D2D6DF 1px solid;
	FONT-SIZE: 12px;
	BORDER-LEFT: #D2D6DF 1px solid;
	COLOR: #5D5D5D;
	BORDER-BOTTOM: #D2D6DF 1px solid;
	background-color:#F5F7FB;
}
</style>
<script type="text/javascript">
<!--
function LA_resize(){
	window.resizeTo(360,300);

	var obj = document.body;
	var bodyWidth	=	obj.scrollWidth + (obj.offsetWidth - obj.clientWidth)+6;
	var bodyHeight	=	obj.scrollHeight + (obj.offsetHeight - obj.clientHeight)+55;
	
	//alert(obj.scrollHeight +'/'+obj.offsetHeight+'/'+obj.clientHeight);
	
	if(bodyHeight>600){	
		bodyHeight	= 600;
		bodyWidth	+= 16;
		obj.scroll = 'yes';
	} else {
		//bodyWidth	= 350;
		obj.scroll = 'no';
	}

	window.resizeTo(bodyWidth,bodyHeight);
	
}

function LA_setAddress(zipcode,address){
	var f = opener.document.${formName};
	f.${formZipcode}.value = zipcode;
	f.${formAddress1}.value = address;
	f.${formAddress2}.focus();
	self.close();
}
//-->
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="javascript:LA_resize();document.forms[0].KW.focus();">
<form method="get" action="searchZipcode.htm" style="margin:0;border:0;">
<input type="hidden" name="formName" value="${formName}"/>
<input type="hidden" name="formZipcode" value="${formZipcode}"/>
<input type="hidden" name="formAddress1" value="${formAddress1}"/>
<input type="hidden" name="formAddress2" value="${formAddress2}"/>
<table width="360" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td><img src="../images/user/zipcode/top.gif" width="360" height="54"></td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" align="center" valign="top">
			<table width="320" border="0" cellspacing="0" cellpadding="5">
				<tr> 
					<td align="center" height="2" bgcolor="#eeeeee"></td>
				</tr>
				<tr>
					<td align="center" height="30" bgcolor="#f6f6f6"><font color="#FF6600" class="font_01">&#8226; 동명(읍명)을 입력하세요</font></td>
				</tr>
				<tr>
					<td align="center" height="50" bgcolor="#f6f6f6">
						<table width="304" border="0" cellspacing="0" cellpadding="0" align="center">
							<tr>
								<td><img src="../images/user/zipcode/box_top.gif" width="304" height="8"></td>
							</tr>
							<tr>
								<td background="../images/user/zipcode/box_bg.gif" align="center">
									<table width="280" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="54" class="font_04"><b><font color="#000000">&#8226; 동네명</font></b></td>
											<td width="161">
												<input type="text" name="KW" value="${kw}" class="form2" style="width:160px">
											</td>
											<td width="65" align="center"><input type="image" src="../images/user/zipcode/button_search.gif" width="56" height="20"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td><img src="../images/user/zipcode/box_bottom.gif" width="304" height="8"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center" height="2" bgcolor="#eeeeee"></td>
				</tr>
			</table>
		</td>
	</tr>
	<c:if test="${kw!=null && kw!=''}">
	<tr>
		<td bgcolor="#FFFFFF" height="30" valign="middle" align="center">
			<table width="320" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td height="30"><img src="../images/user/zipcode/img_01.gif" width="77" height="20"></td>
				</tr>
				<tr>
					<td align="center" height="50">
						<table width="300" border="0" cellspacing="1" cellpadding="2">
							<tr>
								<td colspan="3" height="1" bgcolor="#BECDA7"></td>
							</tr>
							<c:choose>
							<c:when test="${totalZipcode>0 }">
							<c:forEach items="${listZipcode }" var="item">
							<tr>
								<td width="51" align="center" class="font_01"><font color="#FF6600">[${item.zp_zipcode}]</font></td>
								<td width="201" bgcolor="#f6f6f6" class="font_04">${item.address1}</td>
								<td width="44" align="center"><A HREF="javascript:LA_setAddress('${item.zp_zipcode}','${item.address2}');"><img src="../images/user/zipcode/button_choice.gif" width="30" height="20" border="0"></A></td>
							</tr>
							<tr>
								<td colspan="3" height="1" bgcolor="#BECDA7"></td>
							</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<td colspan="3" align=center class="font_01">::::::::::::::: 검색결과가 없습니다. :::::::::::::::</td>
							</tr>
							<tr> 
								<td colspan="3" height="1" bgcolor="#BECDA7"></td>
							</tr>
							</c:otherwise>
							</c:choose>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	</c:if>
	<tr>
		<td bgcolor="#FFFFFF" height="30" valign="middle" align="center"><A HREF="javascript:self.close();"><img src="../images/user/zipcode/button_close.gif" width="31" height="20" border="0"></A></td>
	</tr>
	<tr>
		<td bgcolor="#E4E0D2" height="5" valign="middle" align="center"></td>
	</tr>
</table>
</form>
</body>
</html>