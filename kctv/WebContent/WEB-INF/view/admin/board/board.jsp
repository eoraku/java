<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/common_header.htm"/>
<jsp:include page="/board/${boardId }/${mode }.htm?isAdminPage=1"/>
<div id="hidden_iframe"><iframe id="exec_iframe" name="exec_iframe"></iframe></div>
</body>
</html>