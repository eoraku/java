<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript" src="${ctxRoot }se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
function edit_submit(){
	document.liseNews_form.submit();
}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">자막뉴스</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>자막뉴스 수정하기</b></td>
	</tr>
</table>
<textarea id="contents_old" style="width:0px;height:0px;display:none;">${content }</textarea>
<form name="liseNews_form" method="post" action="update.asp">
<div style="width:750px;">
	<div style="float:left;width:730px;height:115px;margin:10px;text-align:center;">
		<img src="../../images/cPublic/topimg.gif" width="670" height="115" />
	</div>
	<div style="float:left;width:730px;margin:10px;">
		<textarea name="contents" id="contents" rows="30" cols="88"></textarea>
	</div>
	<div style="float:left;width:730px;margin:10px;text-align:center;">
		<a href="#" onclick="javascript:submitContents();"><img src="../../images/admin/btn_modify.gif" width="61" height="22" border="0"/></a>&nbsp;
		<a href="javascript:history.back();"><img src="../../images/admin/btn_esc.gif" width="61" height="22" border=0 alt="취소"></a>
	</div>
</div>
</form>
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
	document.liseNews_form.submit();
	
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
<jsp:include page="/include/admin_footer.asp"/>