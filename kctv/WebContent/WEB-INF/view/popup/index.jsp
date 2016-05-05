<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${item.pu_title}</title>
<link href="${ctxRoot }css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctxRoot }js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxRoot }js/common.js" charset="utf-8"></script>
</head>

<body>
<div id="popup_main" style="width:${item.pu_width}px;height:${item.pu_height }px;">
	${item.pu_contents }
</div>
<div id="popup_btm" style="width:${item.pu_width}px;height:24px;">
	<ul>
		<li><input type="checkbox" id="chk_isCookie"/></li>
		<li><div>오늘 하루 이창을 열지 않습니다.</div></li>
		<li><a href="" onclick="javascript:closeWin(${item.pu_uid});"><img src="${ctxRoot }images/popup/btn_close.gif"></a></li>
	</ul>
</div>
<script type="text/javascript">
function closeWin(uid){
	if(document.getElementById("chk_isCookie").checked)
		setCookie("popup_cookie_"+uid, 1 , 1);
	window.close();
}

function setCookie( name, value, expiredays ){
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
}
</script>
</body>
</html>