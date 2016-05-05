<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript">
function popup_delete(num){
	if(confirm(num+"번 팝업을 삭제하시겠습니까?")){
		location.href="deletePopup.asp?num="+num;
	}
}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">기타관리</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>팝업창 관리</b></td>
	</tr>
</table>
<form name="popup_list_form" method="post" style="margin:0;border:0;">
<input type="hidden" name="listSize" value="${listSize }"/>
<table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#CCCCCC">
	<caption style="text-align:left;">&nbsp;&nbsp;<b><font face="Arial" size="1">(<font color="red">${pageNo}</font>/${listPaging.pageMax}) Pages&nbsp;&nbsp;|&nbsp;&nbsp;Total:${listTotal }</font></b></caption>
	<tr bgcolor="#444444" align="center">
		<th>번호</th>
		<th>TITLE</th>
		<th>기간</th>
		<th>활성화</th>
		<th>형식</th>
		<th>등록일</th>
		<th>미리보기</th>
		<th>삭제</th>
	</tr>
	<c:choose>
	<c:when test="${listTotal>0 }">
	<c:forEach items="${listPopup }" var="item" varStatus="status">
	<input type="hidden" name="chk_val_${status.index }" value="${item.pu_uid }"/>
	<tr onMouseOver="this.style.backgroundcolor='#EFEFEF'" onMouseOut="this.style.backgroundcolor=''" bgcolor="#FFFFFF">
		<td align="center"><nobr>${item.pu_uid }</nobr></td>
		<td><a href="newPopup.asp?mode=edit&uid=${item.pu_uid}">${item.pu_title }</a></td>
		<td align="center">${item.pu_start } ~ ${item.pu_end }</td>
		<c:choose>
		<c:when test="${item.pu_is_active=='1' }">
		<td align="center"><b><font color="#0000CC">O</font></b></td>
		</c:when>
		<c:otherwise>
		<td align="center"><b><font color="#0000CC">X</font></b></td>
		</c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${item.pu_is_skin=='1' }">
		<td align="center"><b>Skin</b></td>
		</c:when>
		<c:when test="${item.pu_is_skin=='2' }">
		<td align="center"><b>이미지맵</b></td>
		</c:when>
		<c:otherwise>
		<td align="center"><b>전체링크</b></td>
		</c:otherwise>
		</c:choose>
		<td align="center">${item.pu_regdate }</td>
		<td align="center"><a href="#" onclick="javascript:popup_window('${ctxRoot }popup/index.htm',${item.pu_uid },${item.pu_width },${item.pu_height });"><b>[view]</b></a></td>
		<td align="center"><a href="#" onclick="javascript:popup_delete(${item.pu_uid});"><b>[X]</b></a></td>
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
<table width="100%" border="0" cellspacing="0" cellpadding="10">
	<tr>
		<td align="left">
			<form name="popup_sch_form" method="post" action="listPopup.asp" style="margin:0;border:0;">
			<select name="schType">
				<option value="title">제목</option>
				<option value="name">이름</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="schText" size="15" maxlength="20" value="">
			<img src="../../images/admin/btn_search.gif" border="0" alt="검색" align="absmiddle" onclick="FindForm();" style="cursor:hand">
			</form>
		</td>
		<td align="right">
			<input type="button" value="팝업등록" onclick="location.href='newPopup.asp';" class="button_1">
		</td>
	</tr>
</table>
<jsp:include page="/include/admin_footer.asp"/>