<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/common_header.htm"/>
<script type="text/javascript" src="${ctxRoot }js/jquery/jquery.validate.min.js"></script>
<div id="info_top">
	<div><a href="${homeUrl }"><img src="${ctxRoot }images/user/info_logo.png" width="260" height="60" alt="KCTV 홈으로" /></a></div>
	<dl>
		<dt><a href="${ctxRoot }user/info.htm"><img src="${ctxRoot }images/user/info_home.png" width="200" height="36" alt="회원정보 홈" /></a></dt>
		<dd><a href="${ctxRoot }user/info_pw.htm"><img src="${ctxRoot }images/user/info_basic_out.png" width="120" height="36" alt="기본정보 변경" /></a></dd>
		<dd><a href="${ctxRoot }user/info_edit_pw.htm"><img src="${ctxRoot }images/user/info_pw_over.png" width="130" height="36" alt="비밀번호 변경" /></a></dd>
		<dd><a href="${ctxRoot }user/info_del.htm"><img src="${ctxRoot }images/user/info_del_out.png" width="120" height="36" alt="온라인 회원 탈퇴" /></a></dd>
	</dl>
</div>

<div id="common_main">
	<jsp:include page="/user/info_side.htm"/>
	<div id="info_title">
		<img src="../images/user/modify_pw.gif" width="84" height="16"/>
	</div>
	<div id="info_content">
		<form name="edit_pw" method="post" target="exec_iframe" action="edit_pw.htm">
		<div id="edit_pw_form">
			<div id="form_inner">
				<div id="form_input">
					<dl>
						<dt><img src="../images/user/dt_pw_old.gif" width="73" height="13"/></dt>
						<dd><input type="password" name="userpw0" id="userpw0" class="inputPW" maxlength="12"/></dd>
					</dl>
					<div></div>
					<dl>
						<dt><img src="../images/user/dt_pw_new1.gif" width="61" height="13"/></dt>
						<dd><input type="password" name="userpw1" id="userpw1" class="inputPW" maxlength="12"/></dd>
					</dl>
					<dl>
						<dt><img src="../images/user/dt_pw_new2.gif" width="87" height="13"/></dt>
						<dd><input type="password" name="userpw2" id="userpw2" class="inputPW" maxlength="12"/></dd>
					</dl>
					<div></div>
					<ul>
						<li><input type="image" src="../images/user/btn_ok.png" width="60" height="29" value="확인"/></li>
						<li><img id="btn_reset" src="../images/user/btn_reset.png" width="67" height="29" style="cursor:pointer"/></li>
					</ul>
				</div>
				<div id="form_hori"></div>
				<div id="form_message">
					<ul>
						<li>- 6~16자의 영문 대소문자, 숫자, 특수문자를 조합하여 사용하실 수 있습니다.</li>
						<li>- 생년월일, 전화번호 등 개인정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해 주세요.</li>
						<li>- 이전에 사용했던 비밀번호나 타 사이트와는 다른 비밀번호를 사용하고, 비밀번호는 주기적으로 변경해주세요.</li>
					</ul>
				</div>
				
			</div>
		</div>
		</form>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#btn_reset").click(function(){
		$("form").each(function(){this.reset();});
	});
	$(".inputPW").focus(function(){
		$(this).css("border-color","#5FBD20");
	});
	$(".inputPW").blur(function(){
		$(this).css("border-color","#c5c5c5");
	});
	$("form").submit(function(){
		if($("#userpw0").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userpw0").focus();
			return false;
		}
		if($("#userpw1").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userpw1").focus();
			return false;
		}
		if($("#userpw1").val().length<4){
			alert("비밀번호는 4자이상 12자 이하로 해주세요.");
			$("#userpw1").focus();
			return false;
		}
		if($("#userpw2").val()==""){
			alert("비밀번호 확인을 입력해주세요.");
			$("#userpw2").focus();
			return false;
		}
		if($("#userpw1").val()!=$("#userpw2").val()){
			alert("비밀번호와 같지 않습니다.");
			$("#userpw2").focus();
			return false;
		}
		if($("#userpw0").val()==$("#userpw1").val()){
			alert("이전 비밀번호와 같습니다.");
			$("#userpw1").focus();
			return false;
		}
		return true;
	});
});
</script>
<jsp:include page="/include/common_footer.htm"/>