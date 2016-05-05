<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<title>KCB 본인인증</title>
<head>
<script type="text/javascript" >
function fncOpenerSubmit() {
	result = "${resultCd}";
	if(result=="B000"){
		alert("본인인증에 성공하였습니다.");
		var f=opener.document.resultForm;
		
		f.authType.value = "ph";
		f.realName.value = "${realName}";
		f.sex.value = "${sex}";
		f.nationalInfo.value = "${nationalInfo}";
		f.birthDate.value = "${birthDate}";
		f.phoneCode.value = "${phoneCode}";
		f.phoneNumber.value="${phoneNumber}";
		
		if("${sessionScope.callType}" == "findID"){
			f.action="${sslDomain}user/rs_find_id.htm";
		}else if("${sessionScope.callType}" == "findPW"){
			f.action="${sslDomain}user/rs_find_pw.htm";
		}else{
			f.action="${sslDomain}user/join3.htm";
		}
		
		f.submit();
		self.close();
	}else{
		alert("본인인증에 실패하였습니다.");
		self.close();
	}
}
</script>
</head>
<body onload="javascript:fncOpenerSubmit();">
</body>
</html>