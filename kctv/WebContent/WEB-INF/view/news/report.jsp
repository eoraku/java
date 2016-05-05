<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/news_header.htm"/>
<jsp:include page="/include/news_top.htm"/>
<jsp:include page="/include/news_top_menu.htm"/>
<script type="text/javascript" src="${ctxRoot }js/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctxRoot }se/js/HuskyEZCreator.js" charset="utf-8"></script>
<div id="common_main">
	<div id="common_left2">
	<jsp:include page="/news/leftmenu.htm"/>
	</div>
	<div id="common_right3">
		<div id="news_menu_title">
			<img src="../images/news/icon_subtit.png" width="11" height="11" hspace="3" /> <strong class="font12">뉴스 제보</strong>
		</div>
		<form name="report_form" method="post" target="exec_iframe" action="report_run.htm" enctype="multipart/form-data">
		<table id="report_table">
			<caption>KCTV 뉴스는 도민들의 생생한 제보를 기다리고 있습니다.<br/>
여러분들의 제보는 한발 더 가까이 다가서는 뉴스를 만들 수 있습니다.<br/>
언제나 도민을 위한 공정한 뉴스를 보도하는 KCTV 제주방송이 되겠습니다.<br/>
<span>단, 제보자의 개인정보는 철저히 보장되므로 안심하실 수 있습니다.<br/>
<strong>뉴스제보</strong> TEL 064)741-7766 / FAX 064)741-7729</span></caption>
			<thead>
				<tr>
					<th colspan="2"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th><span>*</span> 이 름</th>
					<td><input type="text" name="name" id="name" value="${login_name }" maxlength="20" style="width:150px;"/></td>
				</tr>
				<tr>
					<th><span>*</span> 전화번호</th>
					<td><input type="text" name="tel" id="tel" value="" maxlength="20" style="width:150px;"/></td>
				</tr>
				<tr>
					<th><span>*</span> 이메일주소</th>
					<td><input type="text" name="email" id="email" value="${login_email }" maxlength="250" style="width:200px;"/></td>
				</tr>
				<tr>
					<th><span>*</span> 제 목</th>
					<td><input type="text" name="title" id="title" value="" maxlength="250" style="width:500px;"/></td>
				</tr>
				<tr>
					<th><span>*</span> 제보분류</th>
					<td><select name="category" id="category">
						<option value="">- 제보분류 -</option>
						<c:forEach var="i" begin="1" end="8">
						<option value="${i }">${newsCategory[i] }</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>사진첨부</th>
					<td><input type="file" name="file" id="file" value="" style="width:500px;"/></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2"><span>*</span> 내 용</th>
				</tr>
				<tr>
					<td colspan="2"><textarea name="contents" id="contents"></textarea></td>
				</tr>
			</tfoot>
		</table>
		<div id="report_btn">
			<ul>
				<li><input type="image" src="../images/news/btn_ok.png" width="52" height="25"/></li>
				<li><a href="#" onclick="javascript:history.back();"><img src="../images/news/btn_cancel.png" width="52" height="25"/></a></li>
			</ul>
		</div>
		</form>
	</div>
</div>
<script type="text/javascript">
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
		//oEditors.getById["contents"].exec("PASTE_HTML", [$("#contents_old").val()]);
	},
	fCreator: "createSEditor2"
});

$(document).ready(function(){
	$("form").submit(function(){
		
		if(!chkInputEmpty("#name","이름을 입력해주세요.")) return false;
		if(!chkInputEmpty("#tel","전화번호를 입력해주세요.")) return false;
		/* if(!chkInputEmpty("#email","이메일을 입력해주세요.")) return false; */
		if(!chkInputEmpty("#title","제목을 입력해주세요.")) return false;
		if($("#category").length>0)if(!chkInputEmpty("#category","카테고리를 선택해주세요.")) return false;
		submitContents();
		if(!chkInputEmpty("#contents","내용을 입력해주세요.")) return false;
		return true;
	});
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
<jsp:include page="/include/news_footer.htm"/>