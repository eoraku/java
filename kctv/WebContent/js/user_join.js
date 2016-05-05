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
});