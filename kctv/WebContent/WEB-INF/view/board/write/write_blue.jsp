<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="${ctxRoot }js/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctxRoot }js/board_write.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxRoot }se/js/HuskyEZCreator.js" charset="utf-8"></script>
<div id="div_board_main">
	<textarea id="contents_old" style="width:0px;height:0px;display:none;">${boardView.board_contents }</textarea>
	<form name="write_form" method="post" target="exec_iframe" action="${submitURL}" enctype="multipart/form-data">
	<input type="hidden" name="menu" value="${menu }"/>
	<input type="hidden" name="muid" value="${muid }"/>
	<input type="hidden" name="guid" value="${guid }"/>
	<input type="hidden" name="buid" value="${boardView.board_uid }"/>
	<c:if test="${isAdminPage }">
	<input type="hidden" name="isAdminPage" value="1"/>
	</c:if>
	<c:if test="${isReply }">
	<input type="hidden" name="fid" value="${boardView.board_fid }"/>
	<input type="hidden" name="step" value="${boardView.board_step }"/>
	<input type="hidden" name="depth" value="${boardView.board_depth }"/>
	<input type="hidden" name="category" value="${boardView.board_cate_uid }"/>
	</c:if>
	<table id="table_board_write">
		<caption></caption>
		<thead>
		<tr>
			<th colspan="2">${pageTitle }</th>
		</tr>
		</thead>
		<tbody>
		<c:if test="${boardConfig.cfg_is_category==1 }">
		<tr>
			<td class="td_col"><label for="category">카테고리</label></td>
			<td class="td_text">
				<select name="category" id="category"<c:if test="${isReply }"> disabled</c:if>>
					<option value="">카테고리</option>
					<c:forEach items="${cateList }" var="item">
					<option value="${item.cate_uid }"<c:if test="${boardView.board_cate_uid==item.cate_uid }"> selected="selected"</c:if>>${item.cate_name }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		</c:if>
		<c:choose>
		<c:when test="${isLogin }">
		<input type="hidden" name="name" id="name" maxlength="200" value="${login_name }"/>
		<tr>
			<td class="td_col"><label for="name">이름</label></td>
			<td class="td_text">${login_name }(${login_userid})</td>
		</tr>
		<tr>
			<td class="td_col"><label for="email">이메일</label></td>
			<td class="td_text">${login_email }</td>
		</tr>
		</c:when>
		<c:when test="${isAdmin }">
		<tr>
			<td class="td_col"><label for="name">이름</label></td>
			<td class="td_text"><input type="text" name="name" id="name" maxlength="200" value="${admin_name }"/></td>
		</tr>
		<tr>
			<td class="td_col"><label for="email">이메일</label></td>
			<td class="td_text"><input type="text" name="email" id="email" maxlength="200" value="${admin_email }"/></td>
		</tr>
		<c:if test="${isNotice }">
		<tr>
			<td class="td_col"><label for="isNotice">공지사항</label></td>
			<td class="td_text"><input type="checkbox" name="isNotice" id="isNotice" value="1"/></td>
		</tr>
		</c:if>
		</c:when>
		<c:otherwise>
		<tr>
			<td class="td_col"><label for="name">이름</label></td>
			<td class="td_text"><input type="text" name="name" id="name" maxlength="200" value="${boardView.board_name }"/></td>
		</tr>
		<tr>
			<td class="td_col"><label for="email">이메일</label></td>
			<td class="td_text"><input type="text" name="email" id="email" maxlength="200" value="${boardView.board_email }"/></td>
		</tr>
		</c:otherwise>
		</c:choose>
		<tr>
			<td class="td_col"><label for="title">제 목</label></td>
			<td class="td_text"><input type="text" name="title" id="title" size="50" maxlength="200" value="${boardView.board_title }"/></td>
		</tr>
		<c:if test="${isFile }">
		<tr>
			<td class="td_col"><label for="file1">첨부파일</label></td>
			<td class="td_text">
				<input type="file" name="file1" id="file1" class="input_file"/><span>(${maxFileMB }MB 이하)</span>
			</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2" style="padding:4px 2px 0px 2px;background-color:#D8E9FE;text-align:center;font-weight:bold;">내 용</td>
		</tr>
		<tr>
			<td colspan="2" style="padding:0px"><textarea name="contents" id="contents" rows="10" cols="100"></textarea></td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<td class="td_btm" colspan="2"></td>
		</tr>
		</tfoot>
	</table>
	<div id="board_btn">
		<ul>
			<li><a href="#" onclick="javascript:form_reset()"><img src="${ctxRoot }images/board/btn_esc.gif" width="61" height="22"/></a></li>
			<li><a href="${urlQuery }&pageNo=${pageNo}"><img src="${ctxRoot }images/board/btn_list.gif" width="61" height="22"/></a></li>
			<li><input type="image" src="${ctxRoot }images/board/btn_ok.gif" width="61" height="22"/></li>
		</ul>
	</div>
	</form>
</div>
<script type="text/javascript">
<c:if test="${isFile }">
var allowFile = "${allowFile}";
var maxFileMB = ${maxFileMB };
var maxFileSize = ${maxFileSize };
var fileCnt = 1;
var fileSum = 0;
</c:if>

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "contents",
	sSkinURI: "${ctxRoot}se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
		}
	}, //boolean
	fOnAppLoad : function(){
		oEditors.getById["contents"].exec("PASTE_HTML", [$("#contents_old").val()]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["contents"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["contents"].getIR();
	alert(sHTML);
}

function submitContents(elClickedObj) {
	oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("contents").value를 이용해서 처리하면 됩니다.
	
	/*try {
		elClickedObj.form.submit();
	} catch(e) {}*/
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["contents"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>