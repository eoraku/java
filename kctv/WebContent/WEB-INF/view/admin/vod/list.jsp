<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript">
function vod_confirm(){
	document.vod_list_form.mode.value = "confirm";
	document.vod_list_form.submit();
}

function vod_delete(){
	document.vod_list_form.mode.value = "delete";
	document.vod_list_form.submit();
}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">VOD관리(CH7)</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>VOD(CH7)등록</b></td>
	</tr>
</table>
<form method="get" name="vod_sch_form" style="border:0;margin:0;">
<table border="0" cellspacing="0" cellpadding="10">
	<tr>
		<td>
			대분류:
			<select id="maincd" name="maincd" onchange="this.form.submit();">
				<option value="0">전체</option>
				<c:forEach items="${listMainCd }" var="item">
				<option value="${item.code_number }"<c:if test="${item.code_number==maincd }"> selected="selected"</c:if>>${item.code_name }</option>
				</c:forEach>
			</select>
			소분류:
			<select id="subcd" name="subcd" onchange="this.form.submit();">
				<option value="0">전체</option>
				<c:forEach items="${listSubCd }" var="item">
				<option value="${item.code_number }"<c:if test="${item.code_number==subcd }"> selected="selected"</c:if>>${item.code_name }</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<select name="schType">
				<option value="name" >제목</option>
				<option value="date" >방송일</option>
			</select>
			<input name="schText" type="text" size="15" maxlength="20" value="${schText }" class="form_03">
			<input type="image" src="../../images/admin/btn_search.gif" alt="검색" align="absmiddle">
		</td>
	</tr>
</table>
</form>
<form method="get" name="vod_list_form" action="confirm.asp" style="border:0;margin:0;">
<input type="hidden" name="mode" value=""/>
<input type="hidden" name="listSize" value="${listSize }"/>
<input type="hidden" name="maincd" value="${maincd }"/>
<input type="hidden" name="subcd" value="${subcd }"/>
<input type="hidden" name="schType" value="${schType }"/>
<input type="hidden" name="schText" value="${schText }"/>
<table width="100%" border="0" cellpadding="5" cellspacing="0">
	<tr>
		<td height="2" colspan="9" align="center" bgcolor="#94BA73"></td>
	</tr>
	<tr>
		<td height="1" colspan="9" align="center" bgcolor="#FFFFFF"></td>
	</tr>
	<tr align="center" bgcolor="#599BB4">
		<th>No</th>
		<th>프로그램명</th>
		<th>제목</th>
		<th>보기</th>
		<th>방영일</th>
		<th>표시<br>여부</th>
		<th>FLV</th>
		<th>HOT<br>VOD</th>
		<th>삭제</th>
	</tr>
	<tr>
		<td height="5" colspan="9"></td>
	</tr>
	<c:choose>
	<c:when test="${listTotal>0 }">
	<c:forEach items="${listVod }" var="item" varStatus="status">
	<input type="hidden" name="chk_val_${status.index }" value="${item.num }"/>
	<tr bgcolor="#FFFFFF">
		<td height="25" align="center">${item.num }</td>
		<td align="center">${item.code_name }</td>
		<td align="left"><a href="new.asp?mode=edit&num=${item.num }">${item.title }</a></td>
		<td align="center"><a href="#"  onclick="javascript:">보기</a></td>
		<td align="center">${item.firstdt }</td>
		<td align="center"><input type="checkbox" name="chk_web_view_${status.index }" value="${item.num }"${item.web_view }></td>
		<td align="center"><input type="checkbox" name="chk_flv_${status.index }" value="${item.num }"${item.flv }></td>
		<td align="center"><input type="checkbox" name="chk_hotvod_${status.index }" value="${item.num }"${item.hotvod }></td>
		<td align="center"><input type="checkbox" name="chk_del_${status.index }" value="${item.num }"></td>
	</tr>
	<tr>
		<td height="1" colspan="9" align="center" bgcolor="#E7E7E7"></td>
	</tr>
	</c:forEach>
	</c:when>
	<c:otherwise>
	<tr>
		<td colspan="9" align="center">▒▒▒▒ 결과값이 없습니다.▒▒▒▒</td>
	</tr>
	</c:otherwise>
	</c:choose>
	<tr bgcolor="#548699">
		<td height="3" colspan="9" width="1123"></td>
	</tr>
</table>
</form>
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
<table width="100%" border="0" cellspacing="0" cellpadding="10">
	<tr>
		<td align="right">
			<a href="#" onclick="javascript:vod_confirm();"><img src="../../images/admin/btn_confirm.gif" width="61" height="22" hspace="5" border="0" alt="확정"></a>
			<a href="new.asp"><img src="../../images/admin/btn_write.gif" width="61" height="22" hspace="5" border="0" alt="등록"></a>
			<a href="#" onclick="javascript:vod_delete();"><img src="../../images/admin/btn_del.gif" border="0" alt="삭제"></a>
		</td>
	</tr>
</table>
<jsp:include page="/include/admin_footer.asp"/>