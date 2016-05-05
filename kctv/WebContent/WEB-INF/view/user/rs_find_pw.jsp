<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/common_header.htm"/>
<div id="info_top">
	<div>
		<a href="${homeUrl }"><img
			src="${ctxRoot }images/user/info_logo.png" width="260" height="60"
			alt="KCTV Ȩ����" /></a>
	</div>
	<dl>
		<dt>
			<img src="${ctxRoot }images/user/title_findpw.png" width="200"
				height="36" />
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/title_small_yourself.png" style="padding-top:2px;" />
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/arrow_on.png" style="padding-top:10px;"/>
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/title_small_viewid_on.png" style="padding-top:2px;" />
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/arrow_off.png" style="padding-top:10px;"/>
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/title_small_repwd.png" style="padding-top:2px;" />
		</dt>
	</dl>
</div>
<script type="text/javascript">
$(document).ready(function(){
	chkpwdFlag = 0;
});

function validateSubmit(){
	pwd = $("#passwd").val();
	if(pwd.length < 6){
		alert("��й�ȣ�� �ּ� 6�ڸ� �̻� �����ּ���.");
		return;
	}
	if(!chkpwdFlag){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		return;
	}
	repasswd = document.repasswd;
	repasswd.submit();
}

function check_password_size(){
	var pwd = $("#passwd").val();

	if(pwd.length < 6){
		$("#passwd_enter").text("��й�ȣ�� 6~12�� �Դϴ�.");
	}else{
		$("#passwd_enter").text("");
	}
}

function check_password_re(){
	var pwd = $("#passwd").val();
	var rePwd = $("#passwd_re").val();
	
	if(rePwd == ''){
		$("#re_enter").text("");
		chkpwdFlag = 0;
	}else if(pwd == rePwd){
		$("#re_enter").text("��й�ȣ�� ��ġ�մϴ�.");
		chkpwdFlag = 1;
	}else{
		$("#re_enter").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		chkpwdFlag = 0;
	}
}
</script>
<div id="common_main">
	<div id="findIdResultDiv" style="overflow:hidden; width:600px; float:inherit; margin:auto; padding:20px;">
		<dl id="findIdResultDl" style="border: 1px solid rgb(210,210,210);">
			<dt style="margin:20px;"><img width="100" height="32" src="/images/user/chkid.png"></dt>
			<c:choose>
				<c:when test="${userId != null}">
					<form id="repasswd" method="post" action="re_passwd.htm" name="repasswd">
					<dt style="margin:30px;">${realName }���� ���̵�</dt>
					<dd style="margin:30px;"><span style="margin-right:5px; color:blue; font-weight:bold;">${userId }</span>Ȯ�εǾ����ϴ�.</dd>
					<dt style="margin:30px;">�Ʒ��� ���Ͽ� ��й�ȣ�� �缳�� �Ͽ��ּ���.</dt>
					<dd style="margin:30px;">��й�ȣ �Է�<input type="password" id="passwd" name="passwd" onkeyup="check_password_size();" /><label id="passwd_enter" style="margin-left:10px;">��й�ȣ�� 6~12�� �Դϴ�.</label></dd>
					<dd style="margin:30px;">��й�ȣ Ȯ��<input type="password" id="passwd_re" name="passwd_re" onkeyup="check_password_re();" /><label id="re_enter" style="margin-left:10px;"></label></dd>
					<dt style="margin:30px;"><input type="button" value="��й�ȣ �缳��" style="border:1px solid #4988EE; color: #FFFFFF; background-color: #4D90FE; height:30px; width:120px; font-weight:bold;" onclick="validateSubmit()" /><input type="button" value="Ȩ����" style="border:1px solid #4988EE; color: #FFFFFF; background-color: #4D90FE; height:30px; width:120px; font-weight:bold; margin-left:10px;" onclick="javascript:location.replace('http://www.kctvjeju.com/')"/></dt>
					<input type="hidden" name="userId" value="${userId }" />
					<input type="hidden" name="realName" value="${realName }" />
					</form>
				</c:when>
				<c:otherwise>
					<dt style="margin:30px;">${realName }��</dt>
					<dd style="margin:30px;">�߸��� ���̵� �Է��ϼ̰ų� ȸ���� �ƴϽʴϴ�.</dd>
					<dt style="margin:20px; text-align:center;"><a href="${sslDomain }user/join1.htm"><img style="width:100px; height:32px; margin:10px;" src="/images/user/btn_join.png" alt="ȸ������"></a><a href="${homeUrl }"><img style="width:100px; height:32px; margin:10px;" src="/images/user/btn_gohome.png" alt="Ȩ����"></a></dt>
				</c:otherwise>
			</c:choose>
		</dl>
	</div>
</div>
<jsp:include page="/include/common_footer.htm"/>