<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Error</title>
</head>
<body>
<script type="text/javascript">
var error="${exception.message}";
var err_arr=error.split("|");

alert(err_arr[0]);

if(err_arr.length==2){
	parent.location.href=err_arr[1];
}else if(err_arr.length==3){
	parent.document.frames[err_arr[2]].location.href=err_arr[1];
}
</script>
</body>
</html>