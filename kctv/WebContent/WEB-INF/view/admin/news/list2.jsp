<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript">
function selectPageSize(){
	news_sch_form.submit();
}

function searchText(){
	news_sch_form.submit();
}

function news_confirm(){
	news_list_form.mode.value="confirm";
	news_list_form.submit();
}

function news_delete(){
	news_list_form.mode.value="delete";
	news_list_form.submit();
}
</script>
</head>
<body>
<br/>
<table border="0" cellpadding="10" cellspacing="0">
	<tr>
		<td><a href="list1.asp">기사작성 1차(입력)</a></td>
		<td>&gt;</td> 
		<td><a href="list2.asp"><strong>기사작성 2차</strong></a></td>
	</tr>
</table>
<form name="news_sch_form" method="get" action="list2.asp" style="border:0;margin:0;">
<table border="0" cellpadding="5" cellspacing="0">
	<tr>
		<td height="20" colspan="2">&nbsp;
			<select name="s_year" tabindex="1">
				<c:forEach var="i" begin="2008" end="${max_year }">
				<option value="${i }"<c:if test="${s_year==i }"> selected="selected"</c:if>>${i }</option>
				</c:forEach>
			</select> 년
			<select name="s_month" tabindex="2">
				<c:forEach var="i" begin="1" end="12">
				<option value="${i }"<c:if test="${s_month==i }"> selected="selected"</c:if>>${i }</option>
				</c:forEach>
			</select> 월
			<select name="s_day" tabindex="3">
				<c:forEach var="i" begin="1" end="31">
				<option value="${i }"<c:if test="${s_day==i }"> selected="selected"</c:if>>${i }</option>
				</c:forEach>
			</select> 일 ~
			<select name="e_year" tabindex="4">
				<c:forEach var="i" begin="2008" end="${max_year }">
				<option value="${i }"<c:if test="${e_year==i }"> selected="selected"</c:if>>${i }</option>
				</c:forEach>
			</select> 년
			<select name="e_month" tabindex="5">
				<c:forEach var="i" begin="1" end="12">
				<option value="${i }"<c:if test="${e_month==i }"> selected="selected"</c:if>>${i }</option>
				</c:forEach>
			</select> 월
			<select name="e_day" tabindex="6">
				<c:forEach var="i" begin="1" end="31">
				<option value="${i }"<c:if test="${e_day==i }"> selected="selected"</c:if>>${i }</option>
				</c:forEach>
			</select> 일
		</td>
		<td>
			<select name="guid" tabindex="8">
				<c:forEach items="${newsCategory}" var="item" varStatus="status">
					<option value="${status.index }"<c:if test="${status.index == guid }"> selected="selected"</c:if>>${item }</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<input type="checkbox" name="eng" value="1"<c:if test="${eng==1 }"> checked="checked"</c:if>/>영어
			<input type="checkbox" name="chi" value="1"<c:if test="${chi==1 }"> checked="checked"</c:if>/>중국어
		</td>
		<td>
			<select name="schType" tabindex="11">
				<option value="title"<c:if test="${schType=='title' || schType==''}"> selected="selected"</c:if>>제목</option>
				<option value="name"<c:if test="${schType=='name' }"> selected="selected"</c:if>>이름</option>
				<option value="content"<c:if test="${schType=='content' }"> selected="selected"</c:if>>내용</option>
			</select>
			<input type="text" name="schText" tabindex="9" size="15" maxlength="20" value="${schText }">
		</td>
		<td>
			<a href="javascript:searchText();"><img src="../../images/admin/btn_search.gif" width="76" height="22" border="0" alt="검색"/></a>
		</td>
	</tr>
</table>
</form>
<table width="100%" border="0" cellpadding="5" cellspacing="0">
	<tr>
		<td>&nbsp;(<strong style="color:red;">${pageNo }</strong>/${listPaging.pageMax}) Pages&nbsp;&nbsp;|&nbsp;&nbsp;Total: ${listTotal }</td>
		<td align="right">&bull; 게시물 출력 수 : 
			<select name="pageSize" tabindex="7" onchange="javascript:selectPageSize();">
				<option value="10"<c:if test="${pageSize==10 }"> selected="selected"</c:if>>10</option>
				<option value="20"<c:if test="${pageSize==20 }"> selected="selected"</c:if>>20</option>
				<option value="30"<c:if test="${pageSize==30 }"> selected="selected"</c:if>>30</option>
				<option value="50"<c:if test="${pageSize==50 }"> selected="selected"</c:if>>50</option>
				<option value="100"<c:if test="${pageSize==100 }"> selected="selected"</c:if>>100</option>
			</select>
		</td>
	</tr>
</table>
<form name="news_list_form" method="post" action="confirm2.asp">
<input type="hidden" name="mode" value=""/>
<input type="hidden" name="listSize" value="${listSize }"/>
<input type="hidden" name="s_year" value="${s_year }"/>
<input type="hidden" name="s_month" value="${s_month }"/>
<input type="hidden" name="s_day" value="${s_day }"/>
<input type="hidden" name="e_year" value="${e_year }"/>
<input type="hidden" name="e_month" value="${e_month }"/>
<input type="hidden" name="e_day" value="${e_day }"/>
<input type="hidden" name="schType" value="${schType }"/>
<input type="hidden" name="schText" value="${schText }"/>

<table width="100%" border="0" cellspacing="0" cellpadding="5">
	<tr bgcolor="#599BB4" height="40">
		<th width="50">No</th>
		<th width="50">작성자</th>
		<th>제목</th>
		<th width="40">교정<br/>방영</th>
		<th width="30">WEB</th>
		<th width="60">그룹</th>
		<th width="30">HOT</th>
		<th width="30">영어</th>
		<th width="30">중어</th>
		<th width="30">FLV</th>
		<th width="80">작성일</th>
		<th width="30">삭제</th>
	</tr>
	<tr>
		<td height="5" colspan="12"></td>
	</tr>
	<c:choose>
	<c:when test="${listTotal>0 }">
	<c:forEach items="${listNews }" var="item" varStatus="status">
	<input type="hidden" name="chk_val_${status.index }" value="${item.num }"/>
	<tr onmouseover="this.style.backgroundColor='#fffcb0'" onmouseout="this.style.backgroundColor='#ffffff'">
		<td align="center">${item.num }</td>
		<td align="center">${item.name }</td>
		<td><a href="write2.asp${urlQuery }&pageNo=${pageNo }&mode=edit&num=${item.num }">${item.title }</a></td>
		<c:choose>
		<c:when test="${item.modify2=='1' }">
		<td align="center">교정끝</td>
		</c:when>
		<c:otherwise>
		<td align="center">진행중</td>
		</c:otherwise>
		</c:choose>
		<td align="center"><input type="checkbox" name="chk_web_view_${status.index }" value="${item.num }"${item.web_view }></td>
		<td align="center">
			<select name="group_${item.num }">
				<option value=""<c:if test="${item.group_flag=='0' || item.group_flag==''}"> selected="selected"</c:if>>미정</option>
				<option value="1"<c:if test="${item.group_flag=='1' }"> selected="selected"</c:if>>정치</option>
				<option value="2"<c:if test="${item.group_flag=='2' }"> selected="selected"</c:if>>경제</option>
				<option value="3"<c:if test="${item.group_flag=='3' }"> selected="selected"</c:if>>사회</option>
				<option value="4"<c:if test="${item.group_flag=='4' }"> selected="selected"</c:if>>문화</option>
				<option value="5"<c:if test="${item.group_flag=='5' }"> selected="selected"</c:if>>행정</option>
				<option value="6"<c:if test="${item.group_flag=='6' }"> selected="selected"</c:if>>관광</option>
				<option value="7"<c:if test="${item.group_flag=='7' }"> selected="selected"</c:if>>교육</option>
				<option value="8"<c:if test="${item.group_flag=='8' }"> selected="selected"</c:if>>체육</option>
			</select>
		<td align="center"><input type="checkbox" name="chk_hot_flag_${status.index }" value="${item.num }"${item.hot_flag }></td>
		<td align="center"><input type="checkbox" name="chk_eng_${status.index }" value="${item.num }"${item.eng }></td>
		<td align="center"><input type="checkbox" name="chk_chi_${status.index }" value="${item.num }"${item.chi }></td>
		<td align="center"><input type="checkbox" disabled="disabled"${item.flv }/></td>
		<td align="center">${item.ldate }</td>
		<td align="center"><input type="checkbox" name="chk_del_${status.index }" value="${item.num }"></td>
	</tr>
	<tr>
		<td height="1" colspan="12" align="center" bgcolor="#E7E7E7"></td>
	</tr>
	</c:forEach>
	</c:when>
	<c:otherwise>
	<tr>
		<td align="center" colspan="12"><br/><font size="2">등록되어 있는 기사가 없습니다</font><br/><br/></td>
	</tr>
	</c:otherwise>
	</c:choose>
	<tr bgcolor="#338BB0">
		<td height="2" colspan="12"></td>
	</tr>
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
		</td>
		<td align="right">
			<a href="#" onclick="javascript:news_confirm();"><img src="../../images/admin/btn_confirm.gif" border="0" alt="확정"></a>
			<a href="#" onclick="javascript:news_delete();"><img src="../../images/admin/btn_del.gif" border="0" alt="삭제"></a>
		</td>
	</tr>
</table>
<jsp:include page="/include/admin_footer.asp"/>