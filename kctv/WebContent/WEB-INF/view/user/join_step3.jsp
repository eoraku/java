<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/common_header.htm"/>
<script type="text/javascript" src="${ctxRoot }js/jquery/jquery.validate.min.js"></script>
<!-- <script type="text/javascript" src="${ctxRoot }js/user_join.js" charset="utf-8"></script> -->
<script type="text/javascript" charset="euc-kr">
$(document).ready(function(){
	$.validator.addMethod(
		"regex",
		function(value, element, regexp) {
			var re = new RegExp(regexp);
			return this.optional(element) || re.test(value);
		},
		"Please check your input"
	);
	
	$("form").validate({
		rules:{
			userid:{required:true,minlength:4,maxlength:16,regex:/^[a-zA-Z\d]*$/,remote:{url:"bln_userid.htm",type:"post"}},
			userpw1:{required:true,minlength:4,maxlength:12},
			userpw2:{required:true,equalTo:"#userpw1"},
			//name:{required:true,minlength:2,maxlength:10},
			email:{required:true,minlength:2,maxlength:50,email:true,remote:{url:"bln_email.htm",type:"post"}},
			zipcode:{required:true,maxlength:7,regex:/^\d{3}-\d{3}/},
			address1:{required:true,minlength:2,maxlength:100},
			tel:{required:true,minlength:9,maxlength:20,regex:/^[\d\-]*[\d]$/},
			phone:{required:true,minlength:10,maxlength:20,regex:/^[\d\-]*[\d]$/}
		},
		messages:{
			userid:{required:"아이디를 입력해주세요",minlength:"아이디는 최소 4자입니다",maxlength:"아이디는 최대 16자입니다",regex:"아이디는 영문과 숫자만 가능합니다",remote:"중복된 아이디가 있습니다"},
			userpw1:{required:"비밀번호를 입력해주세요",minlength:"비밀번호는 최소 4자입니다",maxlength:"비밀번호는 최대 12자입니다"},
			userpw2:{required:"비밀번호 확인을 입력해주세요",equalTo:"비밀번호와 같아야합니다"},
			//name:{required:"이름을 입력해주세요",minlength:"이름은 최소 2자입니다",maxlength:"이름은 최대 10자입니다"},
			email:{required:"이메일을 입력해주세요",minlength:"이메일은 최소 2자입니다",maxlength:"이메일은 최대 50자입니다",email:"이메일 형식이 아닙니다",remote:"중복된 이메일이 있습니다"},
			zipcode:{required:"우편번호를 입력해주세요",maxlength:"우편번호는 최대 7자입니다",regex:"우편번호 형식이 아닙니다"},
			address1:{required:"주소를 입력해주세요",minlength:"주소는 최소 2자입니다",maxlength:"주소는 최대 100자입니다"},
			tel:{required:"전화번호를 입력해주세요",minlength:"전화번호는 최소 9자입니다",maxlength:"전화번호는 최대 20자입니다",regex:"전화번호 형식이 아닙니다"},
			phone:{required:"휴대폰번호를 입력해주세요",minlength:"휴대폰번호는 최소 10자입니다",maxlength:"휴대폰번호는 최대 20자입니다",regex:"휴대폰번호 형식이 아닙니다"}
		},
		highlight: function(label) {
			$(label).css("border-color","red");
		},
		success: function(label) {
			label.addClass('valid').siblings('input').css("border-color","gray");
		}/*,
		submitHandler: function(form) {
		//유효성 검사에서 성공하였을 경우 호출되는 함수. 인자로 submit할 form이 전달된다.
		form.submit();
	},
	errorPlacement: function(error, element) {
		//유효성 검사에서 에러가 발생된 컨트롤들마다 해당 함수를 거친다. (4개 텍스트 박스가 에러라면 해당 함수 4번 호출)
		error.insertAfter(element);  //에러가 발생한 코드의 앞부분에 messages에서 정의한 텍스트를 출력함
	}*/
	});
});</script>
<div id="join_top_logo"><a href="${homeUrl }"><img src="${ctxRoot }images/user/join_logo.gif" width="260" height="59"/></a></div>
<div id="join_top_step"><img src="${ctxRoot }images/user/join_step3.gif" width="930" height="53"/></div>
<div id="common_main">
	<form name="join_form" method="post" target="exec_iframe" action="join_run.htm">
	<input type="hidden" name="authType" value="${authType }"/>
	<input type="hidden" name="sex" value="${sex }"/>
	<input type="hidden" name="nationalInfo" value="${nationalInfo }"/>
	<input type="hidden" name="birthDate" value="${birthDate }"/>
	<input type="hidden" name="phoneCode" value="${phoneCode }"/>
	<table id="join_step3">
		<caption>상세정보를 정확히 입력해주세요. 표시 필수입력사항</caption>
		<tbody>
		<tr>
			<th class="left" scope="row"><label for="useridf">* 아이디</label></th>
			<td class="right">
				<dl>
					<dt><input type="text" name="userid" id="userid" maxlength="16" value=""/></dt>
					<dd>* 첫글자는 영문으로 시작하고, 영문/숫자 조합으로 4~16자로 입력하세요.</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="userpw1">* 비밀번호</label></th>
			<td class="right">
				<dl>
					<dt><input type="password" name="userpw1" id="userpw1" maxlength="12"/></dt>
					<dd>* 4~12자로 입력하세요.(영문,숫자,영문/숫자 조합 가능)</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="userpw2">* 비밀번호 확인</label></th>
			<td class="right">
				<dl>
					<dt><input type="password" name="userpw2" id="userpw2" maxlength="12"/></dt>
					<dd>* 비밀번호를 한번 더 입력해주세요.</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="name">* 이름</label></th>
			<td class="right">
				<dl>
					<dt><input type="text" name="name" id="name" maxlength="10" value="${realName }" readonly="readonly"/></dt>
					<dd>* 이름은 공백없이 입력해주세요.</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="email">* 이메일</label></th>
			<td class="right">
				<dl>
					<dt><input type="text" name="email" id="email" maxlength="50" style="width:200px"/></dt>
					<dd>* 핫메일(hotmail.com)은 메일수신이 안될 수도 있습니다. 가능하면 해당 메일 이외의 주소를 적어주십시오. (확인메일 발송함)</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="address1">* 주소</label></th>
			<td class="right">
				<dl>
					<dt><span>우편번호 : </span><input type="text" name="zipcode" id="zipcode" maxlength="7" style="width:50px" readonly="readonly"/><a href="#" onclick="javascript:searchZipcode();"><img src="${ctxRoot }images/user/zipcode_btn.gif" width="87" height="22" alt="우편번호검색" /></a></dt>
					<dd><input type="text" name="address1" id="address1" maxlength="100" style="width:300px" readonly="readonly"/></dd>
					<dd><span>나머지주소 : </span><input type="text" name="address2" id="address2" maxlength="100" style="width:228px"/></dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="tel">* 전화번호</label></th>
			<td class="right">
				<dl>
					<dt><input type="text" name="tel" id="tel" maxlength="20"/></dt>
					<dd>* 반드시 연락이 가능한 연락처로 남겨주세요, 전화번호는 번호와 '-'만 가능합니다.</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="phone">* 휴대폰번호</label></th>
			<td class="right">
				<dl>
					<c:choose>
					<c:when test="${phoneNumber != null && phoneNumber !=''}">
					<dt><input type="text" name="phone" id="phone" maxlength="20" value="${phoneNumber }" readonly="readonly"/></dt>
					</c:when>
					<c:otherwise>
					<dt><input type="text" name="phone" id="phone" maxlength="20" value=""/></dt>
					</c:otherwise>
					</c:choose>
					<dd>* 반드시 연락이 가능한 연락처로 남겨주세요, 휴대폰번호는 번호와 '-'만 가능합니다.</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="emailReceive">* 메일 수신여부</label></th>
			<td class="emailCheck"><input type="checkbox" name="emailReceive" value="1" checked="checked"/> 이메일을 수신하겠습니다.</td>
		</tr>
		<tr>
			<th class="btm" scope="row" colspan="2">
				<input type="image" src="../images/user/btn2.gif" width="66" height="22" />
				<a href="http://www.kctvjeju.com"><img src="../images/user/btn_cl.gif" width="66" height="22" /></a>
			</th>
		</tr>
		</tbody>
	</table>
	</form>
</div>
<jsp:include page="/include/common_footer.htm"/>