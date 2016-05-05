<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript" src="${ctxRoot}/js/controler.js"></script>
<script type="text/javascript" src="${ctxRoot}/js/dom.js"></script>
<script type="text/javascript" src="${ctxRoot}/js/utils.js"></script>
<script type="text/javascript">

function init() {
	setFrame(0, 0, 720, 480);
	setMainPage("${ctxRoot}/menu.do");
	setLoading("${ctxRoot}/images/common/loading.png");
}
</script>
</head>
<body style="background-color: transparent;">
</body>
</html>