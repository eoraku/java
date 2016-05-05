<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>KCB 아이핀인증</title>
<script type="text/javascript">
function fncOpenerSubmit() {
	/*opener.document.kcbOutForm.encPsnlInfo.value 		= document.dForm.encPsnlInfo.value;
	opener.document.kcbOutForm.dupinfo.value 			= document.dForm.dupinfo.value;
	opener.document.kcbOutForm.coinfo1.value            = document.dForm.coinfo1.value;
	opener.document.kcbOutForm.coinfo2.value            = document.dForm.coinfo2.value;
	opener.document.kcbOutForm.ciupdate.value           = document.dForm.ciupdate.value;
	opener.document.kcbOutForm.virtualno.value 			= document.dForm.virtualno.value;
	opener.document.kcbOutForm.cpcode.value             = document.dForm.cpcode.value;
	opener.document.kcbOutForm.realname.value 			= document.dForm.realname.value;
	opener.document.kcbOutForm.cprequestnumber.value 	= document.dForm.cprequestnumber.value;
	opener.document.kcbOutForm.age.value 				= document.dForm.age.value;
	opener.document.kcbOutForm.sex.value 				= document.dForm.sex.value;
	opener.document.kcbOutForm.nationalinfo.value 		= document.dForm.nationalinfo.value;
	opener.document.kcbOutForm.birthdate.value 			= document.dForm.birthdate.value;
	opener.document.kcbOutForm.authinfo.value           = document.dForm.authinfo.value;
	opener.document.kcbOutForm.action = "ipin3.jsp";
	opener.document.kcbOutForm.submit();
	self.close();*/
	
	var f=opener.document.resultForm;

	f.authType.value = "ipin";
	f.realName.value = "${realName}";
	f.sex.value = "${sex}";
	f.nationalInfo.value = "${nationalInfo}";
	f.birthDate.value = "${birthdate}";
	
	if("${sessionScope.callType}" == "findID"){
		f.action="${sslDomain}user/rs_find_id.htm";
	}else if("${sessionScope.callType}" == "findPW"){
		f.action="${sslDomain}user/rs_find_pw.htm";
	}else{
		f.action="${sslDomain}user/join3.htm";
	}
	
	f.submit();
	self.close();
}
</script>
</head>
<body onload="javascript:fncOpenerSubmit();">
</body>
</html>