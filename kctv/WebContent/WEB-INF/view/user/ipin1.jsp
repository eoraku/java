<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>  
<html>
<title>KCB 아이핀인증</title>
<head>
<script type="text/javascript">
function certKCBIpin(){
	//var popupWindow = window.open( "", "kcbPop", "left=200, top=100, status=0, width=450, height=550" );
	//document.kcbInForm.target = "kcbPop";
	//KCB 테스트서버를 호출할 경우
	//document.kcbInForm.action = "https://tipin.ok-name.co.kr:8443/tis/ti/POTI01A_LoginRP.jsp";

	//KCB 운영서버를 호출할 경우
	document.kcbInForm.action = "https://ipin.ok-name.co.kr/tis/ti/POTI01A_LoginRP.jsp";

	document.kcbInForm.submit();
	//popupWindow.focus();
	return;
}
</script>

<%--
**************************************************************************************
* 자바스크립트 끝
**************************************************************************************
--%>
</head>
<body>
<form name="kcbInForm" method="post" >
	<input type="hidden" name="IDPCODE" value="${idpCode}" />
	<input type="hidden" name="IDPURL" value="${idpUrl }" />
	<input type="hidden" name="CPCODE" value="${cpCode}" />	
	<input type="hidden" name="CPREQUESTNUM" value="${curtime}" />
	<input type="hidden" name="RETURNURL" value="${returnUrl }" />
	<input type="hidden" name="WEBPUBKEY" value="${pubkey}" />
	<input type="hidden" name="WEBSIGNATURE" value="${sig}" />
</form>
<form name="kcbOutForm" method="post">
	<input type="hidden" name="encPsnlInfo" />
	<input type="hidden" name="virtualno" />
	<input type="hidden" name="dupinfo" />
	<input type="hidden" name="realname" />
	<input type="hidden" name="cprequestnumber" />
	<input type="hidden" name="age" />
	<input type="hidden" name="sex" />
	<input type="hidden" name="nationalinfo" />
	<input type="hidden" name="birthdate" />
	<input type="hidden" name="coinfo1" />
	<input type="hidden" name="coinfo2" />
	<input type="hidden" name="ciupdate" />
	<input type="hidden" name="cpcode" />
	<input type="hidden" name="authinfo" />
</form>
<script type="text/javascript">
<!--
certKCBIpin();
//-->
</script>
</body>
</html>