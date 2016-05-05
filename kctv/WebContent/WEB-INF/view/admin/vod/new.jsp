<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript">
function checkFormSubmit(){
	var f = document.vod_new_form;
	
	if(!chkInputEmpty("input[name=writer]","'담당자'를 입력해주세요.")) return false;
	if(!chkInputEmpty("input[name=title]","'제목'을 입력해주세요.")) return false;
	
	f.method = "post";
	f.action = "insert.asp";
	f.encoding = "multipart/form-data";
	f.submit();
}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong style="font-size:15;color:336699;">VOD관리(CH7)</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td height="35" style="padding-left:5;" valign="bottom"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>VOD(CH7)등록</b></td>
	</tr>
</table>
<form method="get" name="vod_new_form" style="border:0;margin:0;">
<input type="hidden" name="mode" value="${mode }"/>
<input type="hidden" name="num" value="${num }"/>
<table width="100%" border="0" cellspacing="0" cellpadding="10">
	<tr>
		<td align="center">
			<table cellpadding="3" width="96%" cellspacing="1" bgcolor="#333333" align="center">
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">기본사항</td>
				</tr>
				<tr height="30">
					<td width="20%" style="background-color:#666666;color:#ffffff;font-weight:bold;"> * 담당자</td>
					<td bgcolor="#ffffff" width="80%">
						<input type="text" name="writer" maxlength="20" value="${writer }" tabindex="1"/>
					</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * RUN_TIME</td>
					<td bgcolor="#FFFFFF">
						<input type="text" name="runTime" maxlength="7" size="7" value="${runTime }" tabindex="2"/>
					</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * 제목</td>
					<td bgcolor="#FFFFFF">
						<input type="text" name="title" size="40" value="${title }" tabindex="3"/>
					</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * 분류</td>
					<td bgcolor="#FFFFFF">
						대분류: <select id="maincd" name="maincd" onchange="this.form.submit();" tabindex="4">
							<option value="0">전체</option>
							<c:forEach items="${listMainCd }" var="item">
							<option value="${item.code_number }"<c:if test="${item.code_number==maincd }"> selected="selected"</c:if>>${item.code_name }</option>
							</c:forEach>
						</select>
						소분류: <select id="subcd" name="subcd" onchange="this.form.submit();" tabindex="5">
							<option value="0">전체</option>
							<c:forEach items="${listSubCd }" var="item">
							<option value="${item.code_number }"<c:if test="${item.code_number==subcd }"> selected="selected"</c:if>>${item.code_name }</option>
							</c:forEach>
						</select>
						<c:if test="${maincd == '0001' && subcd=='0101' }">
						<span>
						뉴스구분: <select id="newsType" name="newsType" onchange="this.form.submit();">
							<option value="1"<c:if test="${newsType=='1' }"> selected="selected"</c:if>>아침</option>
							<option value="2"<c:if test="${newsType=='2' }"> selected="selected"</c:if>>낮</option>
							<option value="4"<c:if test="${newsType=='4' }"> selected="selected"</c:if>>5시</option>
							<option value="3"<c:if test="${newsType=='3' }"> selected="selected"</c:if>>종합</option>
							<option value="0"<c:if test="${newsType=='0' }"> selected="selected"</c:if>>주말</option>
						</select>
						</span>
						</c:if>
					</td>
				</tr>
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">파일</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * 그림파일(URL)</td>
					<td bgcolor="#FFFFFF">
						<input type="file" style="width:50%;" name="file1" onchange="LA_addFile(this)" tabindex="6"/><br>
						(예: http://www.kctvjeju.com/upload/vod/default.gif)
					</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * 동영상파일(URL)</td>
					<td bgcolor="#FFFFFF">
						<input type="text" name="vodFile" size="50" value="${vodFile }" tabindex="7"/><br>
						(예: http://www.kctvjeju.com/a/200609/제주뉴스.asx)
					</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * SPEED</td>
					<td bgcolor="#FFFFFF">
						<select name="speed1" tabindex="8">
							<option value=350K selected>350KB</option>
								<option value="56K">56KB</option>
								<option value="100K">100KB</option>
								<option value="300K">300KB</option>
								<option value="350K">350KB</option>
								<option value="500K">500KB</option>
								<option value="1M">1MB</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">내용</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * 최초방영</td>
					<td bgcolor="#FFFFFF">
						<select name="year" tabindex="9">
							<c:forEach var="i" begin="2008" end="${max_year }">
							<option value="${i }"<c:if test="${year==i }"> selected="selected"</c:if>>${i }</option>
							</c:forEach>
						</select>년
						<select name="month" tabindex="10">
							<c:forEach var="i" begin="1" end="12">
							<option value="${i }"<c:if test="${month==i }"> selected="selected"</c:if>>${i }</option>
							</c:forEach>
						</select>월
						<select name="day" tabindex="11">
							<c:forEach var="i" begin="1" end="31">
							<option value="${i }"<c:if test="${day==i }"> selected="selected"</c:if>>${i }</option>
							</c:forEach>
						</select>일
						<input type="checkbox" name="web_view" value="1"<c:if test="${web_view=='1' }"> checked="checked"</c:if>/> 홈페이지 노출
						<input type="checkbox" name="flv" value="1"<c:if test="${flv=='1' }"> checked="checked"</c:if>/> FLV
					</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * M C</td>
					<td bgcolor="#FFFFFF">
						<input type="text" name="character" size="50" value="${character }" tabindex="12"/>
					</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * 기획의도</td>
					<td bgcolor="#FFFFFF">
						<textarea name="goal" rows="5" cols="70%" tabindex="13">${goal }</textarea>
					</td>
				</tr>
				<tr height="30">
					<td style="background-color:#666666;color:#ffffff;font-weight:bold;"> * 내용</td>
					<td bgcolor="#FFFFFF">
						<textarea  name="content" rows="11" cols="70%" tabindex="14">${content }</textarea>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center"> 
			<input type="button" value="설정완료" onclick="checkFormSubmit();" class="button_1">
			<input type="button" value="취    소" onclick="history.back();" class="button_1">
		</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>