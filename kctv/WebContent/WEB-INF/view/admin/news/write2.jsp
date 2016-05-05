<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript" src="${ctxRoot }se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
function deleteImg(){
	var f = document.frmWrite;
	f.mode.value="deleteImg";
	f.submit();
}
function isEmpty( data ) {
	for ( var i = 0 ; i < data.length ; i++ )
		if(data.substring( i, i+1 ) != " ")
			return false;
	return true;
}

function sendWrite() {
	submitContents();
	if ( isEmpty( frmWrite.title.value ) ) {
		alert( "������ �Է��� �ּ���." );
		frmWrite.title.focus();
	} else if ( isEmpty( frmWrite.name.value ) ) {
		alert( "�̸��� �Է��� �ּ���." );
		frmWrite.name.focus();
	} else if (isEmpty(frmWrite.contents.value) ) {
		alert("���������� �Է��� �ּ���.");
		frmWrite.contents.focus();
	} else {
		document.frmWrite.submit();
	}
}

//-->
</script>
</head>
<body>
<textarea id="contents_old" style="width:0px;height:0px;display:none;">${item.content_clob }</textarea>
<form method="post" name="frmWrite" enctype="multipart/form-data" action="insert2.asp">
<input type="hidden" name="mode" value="${mode }"/>
<input type="hidden" name="num" value="${item.num }"/>
<input type="hidden" name="s_year" value="${s_year}"/>
<input type="hidden" name="s_month" value="${s_month}"/>
<input type="hidden" name="s_day" value="${s_day}"/>
<input type="hidden" name="e_year" value="${e_year}"/>
<input type="hidden" name="e_month" value="${e_month}"/>
<input type="hidden" name="e_day" value="${e_day}"/>
<input type="hidden" name="schType" value="${schType}"/>
<input type="hidden" name="schText" value="${schText}"/>
<input type="hidden" name="pageNo" value="${pageNo}"/>
<input type="hidden" name="pageSize" value="${pageSize}"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr>
					<td height="10" colspan="2"></td>
				</tr>
				<tr>
					<th height="30" colspan="2" bgcolor="#599BB4"><font color="#FFFFFF">����ۼ�</font></th>
				</tr>
				<tr>
					<td width="13%" height="25" align="center" bgcolor="#F6F6F6"><font color="#666666"><strong>����</strong></font></td>
					<td><input type="text" style="width:98%;" name="title" value="${item.title }"/></td>
				</tr>
				<tr>
					<td height="5" colspan="2" background="images/dotline.gif"></td>
				</tr>
				<tr>
					<td width="13%" height="25" align="center" bgcolor="#F6F6F6"><font color="#666666"><strong>�̸�</strong></font></td>
					<td><input type="text" style="width:50%;" name="name" value="${item.name }"></td>
				</tr>
				<tr>
					<td height="5" colspan="2" background="images/dotline.gif"></td>
				</tr>
				<!-- <tr>
					<td width="13%" height="25" align="center" bgcolor="#F6F6F6"><font color="#666666"><strong>�̸���</strong></font></td>
					<td><input type="text" style="width:50%;" name=email value=""></td>
				</tr> -->
				<tr>
					<td width="13%" height="25" align="center" bgcolor="#F6F6F6"><font color="#666666"><strong>ī�װ�</strong></font></td>
					<td>
						<select name="groupFlag">
							<option value=""<c:if test="${item.group_flag=='' }"> selected="selected"</c:if>>��Ÿ</option>
							<option value="1"<c:if test="${item.group_flag=='1' }"> selected="selected"</c:if>>��ġ</option>
							<option value="2"<c:if test="${item.group_flag=='2' }"> selected="selected"</c:if>>����</option>
							<option value="3"<c:if test="${item.group_flag=='3' }"> selected="selected"</c:if>>��ȸ</option>
							<option value="4"<c:if test="${item.group_flag=='4' }"> selected="selected"</c:if>>��ȭ</option>
							<option value="5"<c:if test="${item.group_flag=='5' }"> selected="selected"</c:if>>����</option>
							<option value="6"<c:if test="${item.group_flag=='6' }"> selected="selected"</c:if>>����</option>
							<option value="7"<c:if test="${item.group_flag=='7' }"> selected="selected"</c:if>>����</option>
							<option value="8"<c:if test="${item.group_flag=='8' }"> selected="selected"</c:if>>ü��</option>
						</select>&nbsp;
						<c:choose>
						<c:when test="${item.eng=='1' }">
						<input type="radio" name="eng_chi" value=""/> ��������&nbsp;
						<input type="radio" name="eng_chi" value="eng" checked="checked"/> <strong>�����</strong>&nbsp;
						<input type="radio" name="eng_chi" value="chi"/> �߱����
						</c:when>
						<c:when test="${item.chi=='1' }">
						<input type="radio" name="eng_chi" value=""/> ��������&nbsp;
						<input type="radio" name="eng_chi" value="eng"/> �����&nbsp;
						<input type="radio" name="eng_chi" value="chi" checked="checked"/> <strong>�߱����</strong>
						</c:when>
						<c:otherwise>
						<input type="radio" name="eng_chi" value="" checked="checked"/> <strong>��������</strong>&nbsp;
						<input type="radio" name="eng_chi" value="eng"/> �����&nbsp;
						<input type="radio" name="eng_chi" value="chi"/> �߱����
						</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td height="5" colspan="2" background="images/dotline.gif"></td>
				</tr>
				<tr>
					<td height="25" align="center" bgcolor="#F6F6F6"><strong><font color="#666666">Ȩ������ ����</font></strong></td>
					<td>
						<input type="checkbox" name="web_view" value="1"${item.web_view }/>
					</td>
				</tr>
				<tr>
					<td height="5" colspan="2" background="images/dotline.gif"></td>
				</tr>
				<tr>
					<td height="25" align="center" bgcolor="#F6F6F6"><strong><font color="#666666">�÷��� ����</font></strong></td>
					<td>
						<c:choose>
						<c:when test="${isFlv }">
						<input type="checkbox" name="isFlv" value="1" checked="checked"/>
						</c:when>
						<c:otherwise>
						<input type="checkbox" name="isFlv" value="1"/>
						</c:otherwise>
						</c:choose>
						<select name="flvType">
							<option value="weather" selected="selected">����</option>
							<!-- <option value="report">����Ʈ</option> -->
						</select>
						<input type="text" name="flv" value="${item.flv }" size="20" maxlength="40"/>
					</td>
				</tr>
				<tr>
					<td height="5" colspan="2" background="images/dotline.gif"></td>
				</tr>
				<!-- <tr>
					<td width="13%" height="25" align="center" bgcolor="#F6F6F6"><font color="#666666"><strong>RUN_TIME</strong></font></td>
					<td>
						<input size=6 type=text name="runtime" value="" readonly  style="color:black; background-color:rgb(255,255,250); border-width:1; border-color:black; border-style:solid; height:20;" >&nbsp;��&nbsp;&nbsp;(
						<input size=4 type=text name="time_min" value="" readonly  style="color:black; background-color:rgb(255,255,250); border-width:0; border-color:black; border-style:solid; height:20;" >&nbsp;��<input  size=4 type=text name="time_sec" value="" readonly  style="color:black; background-color:rgb(255,255,250); border-width:0; border-color:black; border-style:solid; height:20;" >&nbsp;�� )						
					</td>
				</tr> -->
				<tr>
					<td height="25" align="center" bgcolor="#F6F6F6"><strong><font color="#666666">VCR/SOUND</font></strong></td>
					<td height="25">
						<select name="p_vcr">
							<option value="1"<c:if test="${item.vcr=='1' }"> selected="selected"</c:if>>&nbsp;�� ��</option>
							<option value="2"<c:if test="${item.vcr=='2' }"> selected="selected"</c:if>>&nbsp;�� ��</option>
							<option value="3"<c:if test="${item.vcr=='3' }"> selected="selected"</c:if>>&nbsp;6mm</option>
							<option value="4"<c:if test="${item.vcr=='4' }"> selected="selected"</c:if>>&nbsp;�� ��</option>
							<option value="5"<c:if test="${item.vcr=='5' }"> selected="selected"</c:if>>&nbsp; CG </option>
							<option value="6"<c:if test="${item.vcr=='6' }"> selected="selected"</c:if>>&nbsp;�׸�����</option>
							<option value="7"<c:if test="${item.vcr=='7' || item.vcr==null}"> selected="selected"</c:if>>&nbsp;�� Ÿ</option>
						</select> &nbsp;
						<select name="p_sound">
							<option value="1"<c:if test="${item.sound=='1' }"> selected="selected"</c:if>>&nbsp;CAM</option>
							<option value="2"<c:if test="${item.sound=='2' }"> selected="selected"</c:if>>&nbsp;VCR</option>
							<option value="3"<c:if test="${item.sound=='3' }"> selected="selected"</c:if>>&nbsp;VCR + VCR</option>
							<option value="4"<c:if test="${item.sound=='4' }"> selected="selected"</c:if>>&nbsp;CG</option>
							<option value="5"<c:if test="${item.sound=='5' }"> selected="selected"</c:if>>&nbsp;CG + CD</option>
							<option value="6"<c:if test="${item.sound=='6' || item.sound==null}"> selected="selected"</c:if>>&nbsp;�� Ÿ</option>
						</select>
					</td>
				</tr>
				<tr>
					<td height="5" colspan="2" background="images/dotline.gif"></td>
				</tr>
				<tr>
					<td height="25" align="center" bgcolor="#F6F6F6"><strong><font color="#666666">÷������</font></strong></td>
					<td>
						<c:if test="${item.svrfile2 != null && item.svrfile2!=''}">
						<img src="${ctxRoot }upload/news/${item.svrfile2 }"/> <a href="#" onclick="javascript:deleteImg()">[����]</a><br/>
						</c:if>
						<input type="file" style="width:50%;" name="filename">
					</td>
				</tr>
				<tr>
					<td height="2" colspan="2" bgcolor="#96BFCF"></td>
				</tr>
				<tr>
					<td height="80" align="center" bgcolor="#F6F6F6"><strong><font color="#666666">����</font></strong></td>
					<td height="80" valign="top">
						<table width="100%" height="100%" border="0" cellpadding="8" cellspacing="0">
							<tr>
								<td valign="top">
									<textarea rows="11" style="width:100%;" name="contents" id="contents"></textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="80" align="center" bgcolor="#F6F6F6"><strong><font color="#666666">�ۼ�����</font></strong></td>
					<td height="80" valign="top">
						<table width="100%" height="100%" border="0" cellpadding="8" cellspacing="0">
							<tr>
								<td valign="top"><textarea rows="4" style="width:100%;" name="news_goal">${item.news_goal }</textarea></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="3" colspan="2" align="center" bgcolor="#599BB4"></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<a href="javascript:sendWrite();"><img src="../../images/admin/btn_ok.gif" width="61" height="22" border=0 alt="���"></a>&nbsp;
			<a href="javascript:document.frmWrite.reset();"><img src="../../images/admin/btn_esc.gif" width="61" height="22" border=0 alt="���"></a>&nbsp;
			<a href="${url }"><img src="../../images/admin/btn_list.gif" width="61" height="22" border="0" alt="���"></a>
		</td>
	</tr>
</table>
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
<jsp:include page="/include/admin_footer.asp"/>