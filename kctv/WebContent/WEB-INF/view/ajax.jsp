<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="divPhoneList">
<c:forEach items="${phoneList }" var="item">
		${item.model_name}
</c:forEach>
</div>