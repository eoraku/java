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
			<img src="../images/news/icon_subtit.png" width="11" height="11" hspace="3" /> <strong class="font12">���� ����</strong>
		</div>
		<form name="report_form" method="post" target="exec_iframe" action="report_run.htm" enctype="multipart/form-data">
		<table id="report_table">
			<caption>KCTV ������ ���ε��� ������ ������ ��ٸ��� �ֽ��ϴ�.<br/>
�����е��� ������ �ѹ� �� ������ �ٰ����� ������ ���� �� �ֽ��ϴ�.<br/>
������ ������ ���� ������ ������ �����ϴ� KCTV ���ֹ���� �ǰڽ��ϴ�.<br/>
<span>��, �������� ���������� ö���� ����ǹǷ� �Ƚ��Ͻ� �� �ֽ��ϴ�.<br/>
<strong>��������</strong> TEL 064)741-7766 / FAX 064)741-7729</span></caption>
			<thead>
				<tr>
					<th colspan="2"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th><span>*</span> �� ��</th>
					<td><input type="text" name="name" id="name" value="${login_name }" maxlength="20" style="width:150px;"/></td>
				</tr>
				<tr>
					<th><span>*</span> ��ȭ��ȣ</th>
					<td><input type="text" name="tel" id="tel" value="" maxlength="20" style="width:150px;"/></td>
				</tr>
				<tr>
					<th><span>*</span> �̸����ּ�</th>
					<td><input type="text" name="email" id="email" value="${login_email }" maxlength="250" style="width:200px;"/></td>
				</tr>
				<tr>
					<th><span>*</span> �� ��</th>
					<td><input type="text" name="title" id="title" value="" maxlength="250" style="width:500px;"/></td>
				</tr>
				<tr>
					<th><span>*</span> �����з�</th>
					<td><select name="category" id="category">
						<option value="">- �����з� -</option>
						<c:forEach var="i" begin="1" end="8">
						<option value="${i }">${newsCategory[i] }</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>����÷��</th>
					<td><input type="file" name="file" id="file" value="" style="width:500px;"/></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2"><span>*</span> �� ��</th>
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
		
		if(!chkInputEmpty("#name","�̸��� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#tel","��ȭ��ȣ�� �Է����ּ���.")) return false;
		/* if(!chkInputEmpty("#email","�̸����� �Է����ּ���.")) return false; */
		if(!chkInputEmpty("#title","������ �Է����ּ���.")) return false;
		if($("#category").length>0)if(!chkInputEmpty("#category","ī�װ��� �������ּ���.")) return false;
		submitContents();
		if(!chkInputEmpty("#contents","������ �Է����ּ���.")) return false;
		return true;
	});
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>�̹����� ���� ������� �����մϴ�.<\/span>";
	oEditors.getById["contents"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["contents"].getIR();
	alert(sHTML);
}

function submitContents(elClickedObj) {
	oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// �������� ������ textarea�� ����˴ϴ�.
	
	// �������� ���뿡 ���� �� ������ �̰����� document.getElementById("contents").value�� �̿��ؼ� ó���ϸ� �˴ϴ�.
	
	/*try {
		elClickedObj.form.submit();
	} catch(e) {}*/
}

function setDefaultFont() {
	var sDefaultFont = '�ü�';
	var nFontSize = 24;
	oEditors.getById["contents"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
<jsp:include page="/include/news_footer.htm"/>