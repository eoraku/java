<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
function comment_del(uid){
	var f = document.comment_form;
	f.mode.value = "del";
	f.cuid.value = uid;
	if(confirm("댓글을 삭제하시겠습니까?"))
		f.submit();
}

$(document).ready(function() {
	if('${boardView.board_title}'){
		var str = '${boardView.board_title}';
		var regex = /(상시\s?채용|사원\s?모집|채용\s?공고)/;
		if(str.search(regex) != -1){
			var row = "<img src='../images/company/topimg_recruit.png' width='670' height='115'/>";
			row += "<div style='position:relative; z-index:1; margin-bottom:-15px; left:300px; bottom:90px; font-size:14pt; font-weight:bold; font-family:gothic; color:#55BB66; text-align:left; text-shadow: 4px 4px 5px #55BB66;'>" + str + "</div>";
			$("#topimgDiv").empty();
			$("#topimgDiv").append(row);
		}
	}
});
</script>
<div id="div_board_main">
	<table id="table_board_view">
		<caption></caption>
		<thead>
		<tr>
			<th colspan="4">(${boardView.board_uid })${categoryName} ${boardView.board_title }</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td class="td_col">작성자</td>
			<td class="td_text">${boardView.board_name }<c:if test="${boardView.board_userid != null }">(${boardView.board_userid })</c:if></td>
			<td class="td_col">작성일시</td>
			<td class="td_text">${boardView.board_regdate }</td>
		</tr>
		<tr>
			<td class="td_col">조회수</td>
			<td class="td_text">${boardView.board_hit }</td>
			<td class="td_col">수정일시</td>
			<td class="td_text">${boardView.board_modifydate }</td>
		</tr>
		<c:if test="${isFile }">
		<tr>
			<td class="td_col">첨부파일</td>
			<td class="td_text"><a href="${ctxRoot }board/${boardId}/download.htm?buid=${boardView.board_uid }" target="exec_iframe">${pds.pds_file_name2 }</a></td>
			<td class="td_col">다운로드횟수</td>
			<td class="td_text">${pds.pds_hit }</td>
		</tr>
		</c:if>
		</tbody>
		<tfoot>
		<tr>
			<td class="td_content" colspan="4">${boardView.board_contents }</td>
		</tr>
		<tr>
			<td class="td_btm" colspan="4"></td>
		</tr>
		<c:if test="${isComment }">
		<tr>
			<td class="td_comment" colspan="4">
				<form name="comment_form" method="post" target="exec_iframe" action="${submitURL}">
				<input type="hidden" name="mode" value="new"/>
				<input type="hidden" name="menu" value="${menu }"/>
				<input type="hidden" name="muid" value="${muid }"/>
				<input type="hidden" name="guid" value="${guid }"/>
				<input type="hidden" name="buid" value="${boardView.board_uid }"/>
				<input type="hidden" name="cuid" value=""/>
				<input type="hidden" name="userid" value="${login_userid }"/>
				<table id="comment_list">
					<tbody>
					<c:forEach items="${listComment }" var="item">
					<tr>
						<td class="comment_name"><img src="${ctxRoot}images/board/bul03.gif" width="11" height="12"/> ${item.comment_name }</td>
						<td class="comment_content">${item.comment_contents }<span>(${item.comment_regdate })</span></td>
						<td class="comment_button"><c:if test="${item.viewDel }"><a href="#" onclick="javascript:comment_del(${item.comment_uid })"><img src="${ctxRoot}images/board/comment_del.bmp" width="24" height="13"/></a></c:if></td>
					</tr>
					</c:forEach>
					</tbody>
					<tfoot>
					<c:choose>
					<c:when test="${isAdmin || isLogin }">
					<tr id="comment_form">
						<c:choose>
						<c:when test="${isAdmin }">
						<td class="comment_name"><img src="${ctxRoot}images/board/bul03.gif" width="11" height="12"/> ${admin_name }</td>
						</c:when>
						<c:otherwise>
						<td class="comment_name"><img src="${ctxRoot}images/board/bul03.gif" width="11" height="12"/> ${login_name }</td>
						</c:otherwise>
						</c:choose>
						<td class="comment_textarea"><textarea id="contents" name="contents" maxlength="400"></textarea></td>
						<td class="comment_button"><input type="image" src="${ctxRoot }images/board/comment_in.bmp" width="35" height="16"/></td>
					</tr>
					</c:when>
					<c:otherwise>
					<tr>
						<td colspan="3" class="comment_msg">댓글을 달기위해선 <strong>로그인</strong>이 필요합니다.</td>
					</tr>
					</c:otherwise>
					</c:choose>
					</tfoot>
				</table>
				</form>
			</td>
		</tr>
		</c:if>
		<tr>
			<td class="td_btn" colspan="4">
				<div style="float:left">
					<a href="${urlQuery }&pageNo=${pageNo}"><img src="${ctxRoot }images/board/btn_list.gif" width="61" height="22"/></a>
					<!-- <a href=""><img src="${ctxRoot }images/board/btn_prev.gif" width="61" height="22"/></a>
					<a href=""><img src="${ctxRoot }images/board/btn_next.gif" width="61" height="22"/></a> -->
					<c:if test="${boardParameter.viewBtnReply }">
					<a href="${urlQuery }&pageNo=${pageNo}&mode=reply&buid=${boardParameter.buid}"><img src="${ctxRoot }images/board/btn_reply.gif" width="61" height="22"/></a>
					</c:if>
				</div>
				<div style="float:right">
					<c:if test="${boardParameter.viewBtnEdit }">
					<a href="${urlQuery }&pageNo=${pageNo}&mode=edit&buid=${boardParameter.buid}"><img src="${ctxRoot }images/board/btn_edit.gif" width="61" height="22"/></a>
					</c:if>
					<c:if test="${boardParameter.viewBtnDel }">
					<a href="${urlQuery }&pageNo=${pageNo}&mode=del&buid=${boardParameter.buid}&menu=${menu}" target="exec_iframe"><img src="${ctxRoot }images/board/btn_del.gif" width="61" height="22"/></a>
					</c:if>
				</div>
			</td>
		</tr>
		</tfoot>
	</table>
</div>
<c:if test="${isComment }">
<script type="text/javascript">
$(document).ready(function(){
	$("form").submit(function(){
		if(!chkInputEmpty("#contents","내용을 입력해주세요.")) return false;
		return true;
	});
});
</script>
</c:if>