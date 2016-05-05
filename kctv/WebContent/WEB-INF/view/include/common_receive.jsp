<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<script type="text/javascript">
var msg="${msg}";
var url="${go_url}";
var frame="${frame}";
if(msg!="")
	alert(msg);
if(url!="")
	if(frame=="")
		parent.location.href=url;
	else
		parent.frames[frame].location.href=url;
</script>
</body>
</html>