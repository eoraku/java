<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript"> 
function news_confirm() {
	document.news_list_form.mode.value="confirm";
	document.news_list_form.submit();
}

function news_delete() {
	document.news_list_form.mode.value="delete";
	document.news_list_form.submit();
}

function read_show(num,show){
	if(show)
		$("#read"+num).show();
	else
		$("#read"+num).hide();
	
}
</script>
</head>
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red" leftmargin="0" marginwidth="0" topmargin="0" marginheight="0">
<br/>
<table border="0" cellpadding="10" cellspacing="0">
	<tr>
		<td><a href="list1.asp"><strong>기사작성 1차(입력)</strong></a></td>
		<td>&gt;</td>
		<td><a href="list2.asp">기사작성 2차</a></td>
		<td><a href="bodo_xml.asp">&lt;보도정보시스템 기사 등록(XML)&gt;</a></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td>
			<form name="news_list_form" method="post" action="confirm1.asp">
			<input type="hidden" name="mode" value=""/>
			<input type="hidden" name="listSize" value="${listSize }"/>
			<table width="100%" border="0" cellpadding="5" cellspacing="0">
				<tr>
					<td height="2" colspan="7" align="center" bgcolor="#338BB0"></td>
				</tr>
				<tr bgcolor="#599BB4">
					<th width="40">No</th>
					<th>제 목</th>
					<th width="30">통과</th>
					<th width="50">이름</th>
					<th width="60">그룹</th>
					<th width="140">작성일시</th>
					<th width="30">삭제</th>
				</tr>
				<tr>
					<td height="5" colspan="7"></td>
				</tr>
				<c:choose>
				<c:when test="${listSize>0}">
				<c:forEach items="${listNews }" var="item" varStatus="status">
				<input type="hidden" name="chk_val_${status.index }" value="${item.num }"/>
				<tr onmouseover="this.style.backgroundColor='#fffcb0'" onmouseout="this.style.backgroundColor='#ffffff'">
					<td height="25" align="center">${item.num}</td>
					<td><a href="write1.asp?mode=edit&num=${item.num}" onmouseover="read_show(${item.num},true)" onmouseout="read_show(${item.num} ,false)">${item.title}</a></td>
					<td align="center"><input name="check" value="${item.num}" type="checkbox" checked="checked"></td>
					<td align="center">${item.name}(${item.userid })</td>
					<td align="center">${item.group_flag}</td>
					<td align="center">${item.sendtime}&nbsp;${item.receivetime}</td>
					<td align="center"><input type="checkbox" name="chk_del_${status.index }" value="${item.num }"></td>
				</tr>
				<tr>
					<td height="1" colspan="7" align="center" bgcolor="#E7E7E7"></td>
				</tr>
				<tr>
					<td colspan="7">
						<div id="read${item.num}" style="display:none; position:absolute; z-index:200; left:60; top:javascript:event.y+10" align="center">
						<table border="0" cellspacing="1" width="520" style="border:1 dashed rgb(0,64,128)" bgcolor="#ffffff">
							<tr>
								<td style="padding-left: 20; padding-right: 20; padding-top: 15; padding-bottom: 15">
									<font face="돋움" size=2 color=navy>${item.content}</font> 
								</td>
							</tr>
						</table>
						</div>	
					</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
					<td colspan="7" align="center" height="30" bgcolor="#FFFFFF">▒▒▒▒ 결과값이 없습니다.▒▒▒▒</td>
				</tr>
				</c:otherwise>
				</c:choose>
				<tr bgcolor="#338BB0">
					<td height="2" colspan="7"></td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
	<tr>
		<td>
			<form name="news_sch_form" method="post" action="list1.asp" style="margin:0;border:0;">
			<table width="100%" border="0" cellspacing="0" cellpadding="10">
				<tr>
					<!-- <td align="left">
						<select name="schType">
							<option value="title">제목</option>
							<option value="name">이름</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="schText" size="15" maxlength="20" value="">
						<img src="../../images/admin/btn_search.gif" border="0" alt="검색" align="absmiddle" onclick="FindForm();" style="cursor:hand">
					</td> -->
					<td align="right">
						<a href="write1.asp"><img src="../../images/admin/btn_write.gif" border="0" alt="쓰기"></a>
						<a href="javascript:news_confirm();"><img src="../../images/admin/btn_confirm.gif" border="0" alt="확정"></a>
						<a href="javascript:news_delete();"><img src="../../images/admin/btn_del.gif" border="0" alt="삭제"></a>
					</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
</table>
<jsp:include page="/include/admin_footer.asp"/>