<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<title>KCB 안심본인인증</title>
<head>
<script type="text/javascript">
function openPop(){
	document.form1.action = "http://${serverDomain}/CommonSvl";
	document.form1.method = "post";
	document.form1.submit();
}
</script>
</head>

<body>
<form name="form1">
<!-- POP-UP 요청 정보정보 -->
<!--// 필수 항목 -->
<input type="hidden" name="tc" value="kcb.oknm.online.safehscert.popup.cmd.P901_CertChoiceCmd">	<!-- 변경불가-->
<input type="hidden" name="rqst_data" value="${e_rqstData}">									<!-- 요청데이터 -->
<input type="hidden" name="target_id" value="${targetId}">										<!-- 타겟ID --> 
<!-- 필수 항목 //-->
</form>
<form name="kcbResultForm" method="post" >
	<input type="hidden" name="idcf_mbr_com_cd" 		value="" />
	<input type="hidden" name="hs_cert_svc_tx_seqno" 	value="" />
	<input type="hidden" name="hs_cert_msr_cd" 			value="" />
	<input type="hidden" name="hs_cert_rqst_caus_cd" 	value="" />
	<input type="hidden" name="result_cd" 				value="" />
	<input type="hidden" name="result_msg" 				value="" />
</form>
</body>
<c:choose>
	<c:when test="${retcode == 'B000' }">
	<script type="text/javascript">
	openPop();
	</script>
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
	alert("${retcode}");
	window.history.back();
	</script>
	</c:otherwise>
</c:choose>
</html>