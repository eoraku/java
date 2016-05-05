<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/common_header.htm"/>
<div id="info_top">
	<div><a href="${homeUrl }"><img src="${ctxRoot }images/user/info_logo.png" width="260" height="60" alt="KCTV 홈으로" /></a></div>
	<dl>
		<dt><a href="${ctxRoot }user/info.htm"><img src="${ctxRoot }images/user/info_home.png" width="200" height="36" alt="회원정보 홈" /></a></dt>
		<dd><a href="${ctxRoot }user/info_pw.htm"><img src="${ctxRoot }images/user/info_basic_out.png" width="120" height="36" alt="기본정보 변경" /></a></dd>
		<dd><a href="${ctxRoot }user/info_edit_pw.htm"><img src="${ctxRoot }images/user/info_pw_out.png" width="130" height="36" alt="비밀번호 변경" /></a></dd>
		<dd><a href="${ctxRoot }user/info_del.htm"><img src="${ctxRoot }images/user/info_del_over.png" width="120" height="36" alt="온라인 회원 탈퇴" /></a></dd>
	</dl>
</div>
<div id="common_main">
	<jsp:include page="/user/info_side.htm"/>
	<div id="info_title">
		<img src="../images/user/del_info.gif" width="84" height="16"/>
	</div>
	<div id="info_content">
		<form name="chk_pw" method="post" target="exec_iframe" action="chk_pw_del.htm">
		<div id="info_pw_form">
			<div id="form_inner">
				<div id="form_input">
					<dl>
						<dt style="width:40px"><img src="../images/user/dt_id.gif" width="35" height="13"/></dt>
						<dd style="width:120px;margin-top:3px;font-size:11pt;font-weight:bold;color:#339900">${userid }</dd>
						<dt style="width:50px"><img src="../images/user/dt_pw.gif" width="46" height="13"/></dt>
						<dd style="width:250px"><input type="password" name="userpw" id="userpw" maxlength="12"/></dd>
					</dl>
				</div>
				<div id="form_vertical"></div>
				<div id="form_message"><br/>
					회원탈퇴 전 <span style="font-weight:bold;color:#339900">${userid }</span>님의 정보를 확인하기 위해 비밀번호를 다시 한 번 확인 합니다.<br/>
					항상 비밀번호는 타인에게 노출되지 않도록 주의해 주세요.
				</div>
			</div>
		</div>
		<div id="info_pw_btn">
			<input type="image" src="../images/user/btn_ok.png" width="60" height="29" value="확인"/>
		</div>
		</form>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#userpw").focus(function(){
		$(this).css("border-color","#5FBD20");
	});
	$("#userpw").blur(function(){
		$(this).css("border-color","#c5c5c5");
	});
	$("form").submit(function(){
		if($("#userpw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userpw").focus();
			return false;
		}
		if(confirm("회원 탈퇴를 계속 진행하시겠습니까?")){
			return true; 
		}
		return false;
	});
});

</script>
<jsp:include page="/include/common_footer.htm"/>