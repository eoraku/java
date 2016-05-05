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
		if(!chkInputEmpty("#title","'����'�� �Է����ּ���.")) return false;
		//if(!chkInputEmpty("#txt_top","'��ġ'�� �Է����ּ���.")) return false;
		//if(!chkInputEmpty("#txt_left","'��ġ'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#txt_width","'����'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#txt_height","'����'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#dateStart","'Ȱ��ȭ�Ⱓ'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#dateEnd","'Ȱ��ȭ�Ⱓ'�� �Է����ּ���.")) return false;
		var popType = $("input[name=popType]:checked").val();
		if(popType == 0){
			if(!chkInputEmpty("#filename","'�̹���'�� �������ּ���.")) return false;
			if(!chkInputEmpty("#linkTarget","'Ÿ��'�� �Է����ּ���.")) return false;
			if(!chkInputEmpty("#contents","'��ũ'�� �Է����ּ���.")) return false;
		}else if(popType == 2){
			if(!chkInputEmpty("#filename","'�̹���'�� �������ּ���.")) return false;
			if(!chkInputEmpty("#contents","'�̹�����'�� �Է����ּ���.")) return false;
		}else if(popType == 1){
			if(!chkInputEmpty("#skinBackgroundColor","'������'�� �Է����ּ���.")) return false;
			if(!chkInputEmpty("#contents","'����'�� �Է����ּ���.")) return false;
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
	if(!chkInputEmpty("#title","'����'�� �Է����ּ���.")) return false;
	//if(!chkInputEmpty("#txt_top","'��ġ'�� �Է����ּ���.")) return false;
	//if(!chkInputEmpty("#txt_left","'��ġ'�� �Է����ּ���.")) return false;
	if(!chkInputEmpty("#txt_width","'����'�� �Է����ּ���.")) return false;
	if(!chkInputEmpty("#txt_height","'����'�� �Է����ּ���.")) return false;
	if(!chkInputEmpty("#dateStart","'Ȱ��ȭ�Ⱓ'�� �Է����ּ���.")) return false;
	if(!chkInputEmpty("#dateEnd","'Ȱ��ȭ�Ⱓ'�� �Է����ּ���.")) return false;
	var popType = $("input[name=popType]:checked").val();
	if(popType == 0){
		if(!chkInputEmpty("#filename","'�̹���'�� �������ּ���.")) return false;
		if(!chkInputEmpty("#linkTarget","'Ÿ��'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#contents","'��ũ'�� �Է����ּ���.")) return false;
	}else if(popType == 2){
		if(!chkInputEmpty("#filename","'�̹���'�� �������ּ���.")) return false;
		if(!chkInputEmpty("#linkTarget","'Ÿ��'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#contents","'�̹�����'�� �Է����ּ���.")) return false;
	}else if(popType == 1){
		if(!chkInputEmpty("#skinBackgroundColor","'������'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#contents","'����'�� �Է����ּ���.")) return false;
	}
	f.submit();
}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">��Ÿ����</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>�˾�â ���</b></td>
	</tr>
</table>
<form method="post" name="popup_insert_form" enctype="multipart/form-data" action="insertPopup.asp" style="border:0;margin:0;">
<input type="hidden" name="mode" value="${mode }"/>
<input type="hidden" name="uid" value="${uid }"/>
<table width="700" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td style="padding:5px;">
			<!-- <font color="red">*</font> <font color="#0000cc">�ڵ� �˾�ũ�� ����</font>�� üũ�Ͻø� �˾�â ũ�Ⱑ �ڵ����� �����˴ϴ�.<br>
			<font color="#ffffff">*</font> (�˾�â�� ũ�Ⱑ ���ϴµ��� ������ �ȵǸ� ���� �Է��ϼ���~!!)<br>
			<font color="red">*</font> <font color="#0000cc">��Ų���ϻ��</font>�� üũ�Ͻø� ��ϵ� ��Ų������ �������� �ؽ�Ʈ�� �Է��Ͽ� �˾�â�� ��� �� �ֽ��ϴ�.<br>
			<font color="red">*</font> <font color="#0000cc">html���</font>�� üũ�Ͻø� �������� ������� html �±׸� ����Ͽ� �ؽ�Ʈ�� �ٹ� �� �ֽ��ϴ�.<br> -->
			<font color="red">*</font> <font color="#0000cc">�˾�â�� ��ġ�� �ڵ����� ���ĵ˴ϴ�.<br>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table width="100%" cellpadding="5" cellspacing="1" border="0" bgcolor="#cccccc">
				<tr>
					<th bgcolor="#efefef" width="100"><b style="color:#990000">�����</b></th>
					<td bgcolor="#ffffff">kctv (kctvjeju12)&nbsp;&nbsp;������ ������ �����ڰ� ��ϵ˴ϴ�.</td>
				</tr>
				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">Title</b></th>
					<td bgcolor="#ffffff">
						<input type="text" name="title" id="title" size="40" value="${item.pu_title }"/> (������ Title bar�� ǥ�� �˴ϴ�.)
					</td>
				</tr>
<%-- 				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">��ġ</b></th>
					<td bgcolor="#ffffff">
						<b>left</b>(����� ������ġ) : <input type="text" size="4" maxlength="4" name="txt_left" id="txt_left" value="${item.pu_left }" style="text-align:right;"/> px
						&nbsp;&nbsp;&nbsp;&nbsp;
						<b>top</b>(����� �����ġ) : <input type="text" size="4" maxlength="4" name="txt_top" id="txt_top" value="${item.pu_top }" style="text-align:right;"/> px
					</td>
				</tr> --%>
				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">ũ��</b></th>
					<td bgcolor="#ffffff">
						<span id="spansize">
						<b>width</b>(����) : <input type="text" size="4" maxlength="4" name="txt_width" id="txt_width" value="${item.pu_width }" style="text-align:right;"/> px
						&nbsp;&nbsp;&nbsp;&nbsp;
						<b>height</b>(����) : <input type="text" size="4" maxlength="4" name="txt_height" id="txt_height" value="${item.pu_height }" style="text-align:right;"/> px
						</span>
					</td>
				</tr>
				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">Ȱ��ȭ</b></th>
					<td bgcolor="#ffffff">
						<c:choose>
						<c:when test="${item.pu_is_active==0 }">
						<input type="radio" name="isActive" value="1"> <font color="#0000cc">Ȱ��</font>
						<input type="radio" name="isActive" value="0" checked="checked"> <font color="#cc0000">��Ȱ��</font>
						</c:when>
						<c:otherwise>
						<input type="radio" name="isActive" value="1" checked="checked"> <font color="#0000cc">Ȱ��</font>
						<input type="radio" name="isActive" value="0"> <font color="#cc0000">��Ȱ��</font>
						</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">Ȱ��ȭ�Ⱓ</b></th>
					<td bgcolor="#ffffff">
						<table cellpadding="3" cellspacing="0" border="0">
							<tr>
								<td>
									<font color="red">+</font> Ȱ��ȭ�Ⱓ�� ��Ȱ��ȭ�� üũ�Ǹ� �ش� �˾�â�� ��Ȱ��ȭ�˴ϴ�.
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="dateStart" id="dateStart" size="10" value="${item.pu_start }" class="datePicker">
									~
									<input type="text" name="dateEnd" id="dateEnd" size="10" value="${item.pu_end }" class="datePicker">
									<input type="button" value="�Ⱓ �ʱ�ȭ" class="button_1" onclick="this.form.dateStart.value='';this.form.dateEnd.value='';"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">�˾� ����</b></th>
					<td bgcolor="#ffffff">
						<font color="red">+</font> �̹����� �̸� : <b style="color:#ff0000">Map</b><br>
						<c:choose>
						<c:when test="${item.pu_is_skin==2 }">
						<input type="radio" name="popType" value="0"/>&nbsp;<b>��ũ</b>&nbsp;
						<input type="radio" name="popType" value="2" checked="checked"/>&nbsp;<b>�̹�����</b>&nbsp;
						<input type="radio" name="popType" value="1"/>&nbsp;<b>Skin</b>&nbsp;
						</c:when>
						<c:when test="${item.pu_is_skin==1 }">
						<input type="radio" name="popType" value="0"/>&nbsp;<b>��ũ</b>&nbsp;
						<input type="radio" name="popType" value="2"/>&nbsp;<b>�̹�����</b>&nbsp;
						<input type="radio" name="popType" value="1" checked="checked"/>&nbsp;<b>Skin</b>&nbsp;
						</c:when>
						<c:otherwise>
						<input type="radio" name="popType" value="0" checked="checked"/>&nbsp;<b>��ũ</b>&nbsp;
						<input type="radio" name="popType" value="2"/>&nbsp;<b>�̹�����</b>&nbsp;
						<input type="radio" name="popType" value="1"/>&nbsp;<b>Skin</b>&nbsp;
						</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr id="trSetFile">
					<th bgcolor="#efefef"><b style="color:#990000;">�̹������ε�</b></th>
					<td bgcolor="#ffffff">
						<input type="file" style="width:70%;" name="filename" id="filename"/>
						<span id="spanTarget"> | Ÿ�� : <input type="text" name="linkTarget" id="linkTarget" size="12" maxlength="20" value="_blank"/></span>
					</td>
				</tr>
				<tr id="trSetHTML" style="display:none;">
					<th bgcolor="#efefef"><b style="color:#990000;">HTML ��뿩��</b></th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="isHtml" value="1"/>
						 | ��� ���� : <input type="text" name="skinBackgroundColor" id="skinBackgroundColor" size="12" maxlength="20" value="#ffffff"/>
					</td>
				</tr>
				<tr>
					<th bgcolor="#efefef"><b style="color:#990000;">��ũ<br/>or<br/>�̹�����<br/>or<br/>����</b></th>
					<td bgcolor="#ffffff">
						<font color="red">+</font> <b style="color:#ff0000">��ü��ũ/�̹�����</b>�� ��� �׻� <b style="color:#ff0000">���� �ۼ�</b> �ؾ���<br>
						<textarea name="contents" id="contents" cols="80" rows="15">${item.pu_contents }</textarea>
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" align="center" colspan="2" height="50">
						<input type="submit" value="��    ��" class="button_1">
						<input type="reset"  value="�ٽþ���" class="button_1">
						<input type="button" value="��    ��" class="button_1" onclick="location.href='listPopup.asp';">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>