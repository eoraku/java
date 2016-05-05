<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/admin_header.asp"/>
</head>
<body>
<br/><br/>
<form name="search"  action="bodo_xml_insert.asp"  method="post">
<input type="hidden" name="re_load" value="sh">
<table border="0" width="282" align="center">
	<tr>
		<td width="170">
			<p><input type="text" name="search_date" value="${curDate }"></p>
		</td>
		<td width="102">
			<p><input type="submit" name="검색" value="검 색"></p>
		</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>