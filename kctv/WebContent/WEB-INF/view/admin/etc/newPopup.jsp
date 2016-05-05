<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<script type="text/javascript">
$(document).ready(function(){
	setPopType();
	
	$("input[name=popType]").click(function(){
		setPopType();
	});
	
	$("form").submit(function(){
		f = document.popup_insert_form;
		if(!chkInputEmpty("#title","'제목'을 입력해주세요.")) return false;
		//if(!chkInputEmpty("#txt_top","'위치'를 입력해주세요.")) return false;
		//if(!chkInputEmpty("#txt_left","'위치'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#txt_width","'높이'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#txt_height","'넓이'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#dateStart","'활성화기간'을 입력해주세요.")) return false;
		if(!chkInputEmpty("#dateEnd","'활성화기간'을 입력해주세요.")) return false;
		var popType = $("input[name=popType]:checked").val();
		if(popType == 0){
			if(!chkInputEmpty("#filename","'이미지'를 선택해주세요.")) return false;
			if(!chkInputEmpty("#linkTarget","'타겟'을 입력해주세요.")) return false;
			if(!chkInputEmpty("#contents","'링크'를 입력해주세요.")) return false;
		}else if(popType == 2){
			if(!chkInputEmpty("#filename","'이미지'를 선택해주세요.")) return false;
			if(!chkInputEmpty("#contents","'이미지맵'을 입력해주세요.")) return false;
		}else if(popType == 1){
			if(!chkInputEmpty("#skinBackgroundColor","'배경색상'을 입력해주세요.")) return false;
			if(!chkInputEmpty("#contents","'내용'을 입력해주세요.")) return false;
		}
		return true;
	});
});

function setPopType(){
	var popType = $("input[name=popType]:checked").val();
	if(popType==0){
		$("#trSetFile").show();
		$("#spanTarget").show();
		$("#trSetHTML").hide();
	}else if(popType==2){
		$("#trSetFile").show();
		$("#spanTarget").hide();
		$("#trSetHTML").hide();
	}else if(popType==1){
		$("#trSetFile").hide();
		$("#spanTarget").hide();
		$("#trSetHTML").show();
	}
}

function submitForm(){
	f = document.popup_insert_form;
	if(!chkInputEmpty("#title","'제목'을 입력해주세요.")) return false;
	//if(!chkInputEmpty("#txt_top","'위치'를 입력해주세요.")) return false;
	//if(!chkInputEmpty("#txt_left","'위치'를 입력해주세요.")) return false;
	if(!chkInputEmpty("#txt_width","'높이'를 입력해주세요.")) return false;
	if(!chkInputEmpty("#txt_height","'넓이'를 입력해주세요.")) return false;
	if(!chkInputEmpty("#dateStart","'활성화기간'을 입력해주세요.")) return false;
	if(!chkInputEmpty("#dateEnd","'활성화기간'을 입력해주세요.")) return false;
	var popType = $("input[name=popType]:checked").val();
	if(popType == 0){
		if(!chkInputEmpty("#filename","'이미지'를 선택해주세요.")) return false;
		if(!chkInputEmpty("#linkTarget","'타겟'을 입력해주세요.")) return false;
		if(!chkInputEmpty("#contents","'링크'를 입력해주세요.")) return false;
	}else if(popType == 2){
		if(!chkInputEmpty("#filename","'이미지'를 선택해주세요.")) return false;
		if(!chkInputEmpty("#linkTarget","'타겟'을 입력해주세요.")) return false;
		if(!chkInputEmpty("#contents","'이미지맵'을 입력해주세요.")) return false;
	}else if(popType == 1){
		if(!chkInputEmpty("#skinBackgroundColor","'배경색상'을 입력해주세요.")) return false;
		if(!chkInputEmpty("#contents","'내용'을 입력해주세요.")) return false;
	}
	f.submit();
}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">기타관리</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>팝업창 등록</b></td>
	</tr>
</table>
<form method="post" name="popup_insert_form" enctype="multipart/form-data" action="insertPopup.asp" style="border:0;margin:0;">
<input type="hidden" name="mode" value="${mode }"/>
<input type="hidden" name="uid" value="${uid }"/>
<table width="700" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td style="padding:5px;">
			<!-- <font color="red">*</font> <font color="#0000cc">자동 팝업크기 설정</font>을 체크하시면 팝업창 크기가 자동으로 설정됩니다.<br>
			<font color="#ffffff">*</font> (팝업창이 크기가 원하는데로 설정이 안되면 직접 입력하세요~!!)<br>
			<font color="red">*</font> <font color="#0000cc">스킨파일사용</font>을 체크하시면 등록된 스킨파일을 바탕으로 텍스트를 입력하여 팝업창을 띄울 수 있습니다.<br>
			<font color="red">*</font> <font color="#0000cc">html사용</font>을 체크하시면 웹에디터 기반으로 html 태그를 사용하여 텍스트를 꾸밀 수 있습니다.<br> -->
			<font color="red">*</font> <font color="#0000cc">팝업창의 위치는 자동으로 정렬됩니다.<br>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table width="100%" cellpadding="5" cellspacing="1" border="0" bgcolor="#cccccc">
				<tr>
					<th bgcolor="#efefef" width="100"><b style="color:#990000">등록자</b></th>
					<td bgcolor="#ffffff">kctv (kctvjeju12)&nbsp;&nbsp;수정시 수정한 관리자가 등록됩니다.</td>
				</tr>
				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">Title</b></th>
					<td bgcolor="#ffffff">
						<input type="text" name="title" id="title" size="40" value="${item.pu_title }"/> (윈도우 Title bar에 표시 됩니다.)
					</td>
				</tr>
<%-- 				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">위치</b></th>
					<td bgcolor="#ffffff">
						<b>left</b>(출력할 좌측위치) : <input type="text" size="4" maxlength="4" name="txt_left" id="txt_left" value="${item.pu_left }" style="text-align:right;"/> px
						&nbsp;&nbsp;&nbsp;&nbsp;
						<b>top</b>(출력할 상단위치) : <input type="text" size="4" maxlength="4" name="txt_top" id="txt_top" value="${item.pu_top }" style="text-align:right;"/> px
					</td>
				</tr> --%>
				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">크기</b></th>
					<td bgcolor="#ffffff">
						<span id="spansize">
						<b>width</b>(넓이) : <input type="text" size="4" maxlength="4" name="txt_width" id="txt_width" value="${item.pu_width }" style="text-align:right;"/> px
						&nbsp;&nbsp;&nbsp;&nbsp;
						<b>height</b>(높이) : <input type="text" size="4" maxlength="4" name="txt_height" id="txt_height" value="${item.pu_height }" style="text-align:right;"/> px
						</span>
					</td>
				</tr>
				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">활성화</b></th>
					<td bgcolor="#ffffff">
						<c:choose>
						<c:when test="${item.pu_is_active==0 }">
						<input type="radio" name="isActive" value="1"> <font color="#0000cc">활성</font>
						<input type="radio" name="isActive" value="0" checked="checked"> <font color="#cc0000">비활성</font>
						</c:when>
						<c:otherwise>
						<input type="radio" name="isActive" value="1" checked="checked"> <font color="#0000cc">활성</font>
						<input type="radio" name="isActive" value="0"> <font color="#cc0000">비활성</font>
						</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">활성화기간</b></th>
					<td bgcolor="#ffffff">
						<table cellpadding="3" cellspacing="0" border="0">
							<tr>
								<td>
									<font color="red">+</font> 활성화기간에 비활성화로 체크되면 해당 팝업창은 비활성화됩니다.
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="dateStart" id="dateStart" size="10" value="${item.pu_start }" class="datePicker">
									~
									<input type="text" name="dateEnd" id="dateEnd" size="10" value="${item.pu_end }" class="datePicker">
									<input type="button" value="기간 초기화" class="button_1" onclick="this.form.dateStart.value='';this.form.dateEnd.value='';"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">팝업 형식</b></th>
					<td bgcolor="#ffffff">
						<font color="red">+</font> 이미지맵 이름 : <b style="color:#ff0000">Map</b><br>
						<c:choose>
						<c:when test="${item.pu_is_skin==2 }">
						<input type="radio" name="popType" value="0"/>&nbsp;<b>링크</b>&nbsp;
						<input type="radio" name="popType" value="2" checked="checked"/>&nbsp;<b>이미지맵</b>&nbsp;
						<input type="radio" name="popType" value="1"/>&nbsp;<b>Skin</b>&nbsp;
						</c:when>
						<c:when test="${item.pu_is_skin==1 }">
						<input type="radio" name="popType" value="0"/>&nbsp;<b>링크</b>&nbsp;
						<input type="radio" name="popType" value="2"/>&nbsp;<b>이미지맵</b>&nbsp;
						<input type="radio" name="popType" value="1" checked="checked"/>&nbsp;<b>Skin</b>&nbsp;
						</c:when>
						<c:otherwise>
						<input type="radio" name="popType" value="0" checked="checked"/>&nbsp;<b>링크</b>&nbsp;
						<input type="radio" name="popType" value="2"/>&nbsp;<b>이미지맵</b>&nbsp;
						<input type="radio" name="popType" value="1"/>&nbsp;<b>Skin</b>&nbsp;
						</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr id="trSetFile">
					<th bgcolor="#efefef"><b style="color:#990000;">이미지업로드</b></th>
					<td bgcolor="#ffffff">
						<input type="file" style="width:70%;" name="filename" id="filename"/>
						<span id="spanTarget"> | 타겟 : <input type="text" name="linkTarget" id="linkTarget" size="12" maxlength="20" value="_blank"/></span>
					</td>
				</tr>
				<tr id="trSetHTML" style="display:none;">
					<th bgcolor="#efefef"><b style="color:#990000;">HTML 사용여부</b></th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="isHtml" value="1"/>
						 | 배경 색상 : <input type="text" name="skinBackgroundColor" id="skinBackgroundColor" size="12" maxlength="20" value="#ffffff"/>
					</td>
				</tr>
				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">링크<br/>or<br/>이미지맵<br/>or<br/>내용</b></th>
					<td bgcolor="#ffffff">
						<font color="red">+</font> <b style="color:#ff0000">전체링크/이미지맵</b>의 경우 항상 <b style="color:#ff0000">새로 작성</b> 해야함<br>
						<textarea name="contents" id="contents" cols="80" rows="15">${item.pu_contents }</textarea>
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" align="center" colspan="2" height="50">
						<input type="submit" value="등    록" class="button_1">
						<input type="reset"  value="다시쓰기" class="button_1">
						<input type="button" value="취    소" class="button_1" onclick="location.href='listPopup.asp';">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>