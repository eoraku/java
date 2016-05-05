<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="div_board_title">
	<img src="${ctxRoot }images/board/c_title_${boardId }.gif" width="225" height="18"/>
</div>
<c:if test="${muid==173 || muid==202 }">
<div id="div_board_rule">
	<ul style="width:680px;height:50px;padding:10px;background-color:#F7F7B8;">
		<li style="width:680px;text-align:center;"><img src="${ctxRoot }images/board/notice4.gif" width="555" height="25"/></li>
		<li style="width:610px;text-align:right;"><a href="${ctxRoot }contents/cPublic.htm?muid=314">게시물 삭제기준 및 처벌규정 바로가기</a></li>
	</ul>
</div>
</c:if>
<div id="div_board_main">
	<table id="table_board_list">
		<caption></caption>
		<thead>
		<c:if test="${boardConfig.isCategory() }">
		<tr>
			<td class="td_category" colspan="6">
				<select name="category" id="category" onchange="setBoardCategory(this)">
					<option value="">전체</option>
					<c:forEach items="${cateList }" var="item">
					<option value="${item.cate_uid }"<c:if test="${boardParameter.cuid==item.cate_uid }"> selected="selected"</c:if>>${item.cate_name }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		</c:if>
		<tr>
			<th class="td_no">No</th>
			<c:if test="${boardConfig.isCategory() }">
			<th></th>
			</c:if>
			<th class="td_title">제 목</th>
			<th class="td_name2">글쓴이</th>
			<th class="td_date">등록일</th>
			<th class="td_hit">조회</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${boardList }" var="item">
		<tr class="tr_list">
			<td class="td_no">${item.board_uid }</td>
			<c:if test="${boardConfig.isCategory() }">
			<td class="td_cate2">[${item.cate_name }]</td>
			</c:if>
			<td class="td_title"${item.leftSpace }><a href="${item.viewHref }">${item.board_title }${item.comments }</a>${item.fileLink }${item.new_icon}</td>
			<td class="td_name2">${item.board_name }</td>
			<td class="td_date">${item.board_regdate }</td>
			<td class="td_hit">${item.board_hit }</td>
		</tr>
		</c:forEach>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="6"></td>
		</tr>
		</tfoot>
	</table>
</div>
<div id="div_board_btm">
	<div id="board_btm_init">
		<c:if test="${boardParameter.viewBtnInit }">
		<a href="?muid=${muid }"><img src="${ctxRoot }images/board/btn_list.gif" width="61" height="22"/></a>
		</c:if>
	</div>
	<div id="board_btm_pages">
		<table id="ul_board_pages">
			<tr>
				<c:if test="${boardPaging.prev!='' }">
				<td><a class="page_prev" href="${urlQuery }${boardPaging.prev }">이전페이지</a></td>
				</c:if>
				<c:forEach items="${boardPaging.pages }" var="item">
				<c:choose>
				<c:when test="${item.isCurrent }">
				<td><div class="page_curr">${item.pageNo }</div></td>
				</c:when>
				<c:otherwise>
				<td><a class="page_link" href="${urlQuery }${item.pageLink }">${item.pageNo }</a></td>
				</c:otherwise>
				</c:choose>
				</c:forEach>
				<c:if test="${boardPaging.next!='' }">
				<td><a class="page_next" href="${urlQuery }${boardPaging.next }">다음페이지</a></td>
				</c:if>
			</tr>
		</table>
	</div>
	<div id="board_btm_write">
		<c:if test="${boardParameter.viewBtnWrite}">
		<a href="${urlQuery }&pageNo=${pageNo }&mode=write"><img src="${ctxRoot }images/board/btn_write.gif" width="61" height="22"/></a>
		</c:if>
	</div>
	<form name="sch_form" method="get">
	<input type="hidden" name="muid" value="${muid }"/>
	<ul id="board_btm_search">
		<li>
			<select name="schType" id="schType">
				<option value="title"<c:if test="${boardParameter.schType=='title' }"> selected="selected"</c:if>>제목</option>
				<option value="contents"<c:if test="${boardParameter.schType=='contents' }"> selected="selected"</c:if>>내용</option>
				<option value="name"<c:if test="${boardParameter.schType=='name' }"> selected="selected"</c:if>>작성자</option>
			</select>
		</li>
		<li><input class="sch_text" type="text" name="schText" id="schText" value="${boardParameter.schText }"/></li>
		<li><input class="sch_btn" type="image" src="${ctxRoot }images/board/btn_search.gif" width="76" height="22" alt="검색"/></li>
	</ul>
	</form>
</div>
<script type="text/javascript">
function msgView(msg){
	if(msg=="view")
		alert("글을 보기 위해서는 로그인이 필요합니다.");
}
</script>