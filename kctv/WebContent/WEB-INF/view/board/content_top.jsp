<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
<c:when test="${menu=='company'}">
<div id="topimgDiv" style="width:763px;padding-top:10px;text-align:center;">
	<img src="../images/company/topimg.gif" width="670" height="115"/>
</div>
</c:when>
<c:when test="${menu=='customer'}">
<div style="width:763px;padding-top:10px;text-align:center;">
	<img src="../images/customer/topimg.jpg" width="670" height="115"/>
</div>
</c:when>
</c:choose>