<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content_main">
	<div style="float:left;width:700px;height:115px;margin:10px;">
		<img src="../images/customer/topimg.jpg" width="670" height="115"/>
	</div>
	<div style="float:left;width:700px;height:20px;margin:10px;">
		<img src="../images/customer/c_title04.gif" width="225" height="18"/>
	</div>
	<c:choose>
	<c:when test="${listTotal>0 }">
	<c:forEach items="${listSms }" var="item">
	<table class="service_list_table">
		<thead>
		<tr>
			<th colspan="4"></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<th>��û�� �̸�</th>
			<td>
				<dl>
					<dt style="float:left;padding:3px;">${item.WEBSVRNAME }</dt>
					<%-- <dd style="float:left;"><a href="customer.htm?muid=131&detail=${item.WEBSVRSRNO }"><img src="${ctxRoot }images/customer/detail_btn.gif" width="74" height="22" alt="�ڼ�������" /></a></dd> --%>
				</dl>
			</td>
			<th>�ּ�</th>
			<td>${item.WEBSVRAADR }, ${item.WEBSVRADDR }</td>
		</tr>
		<tr>
			<th>��ȭ��ȣ</th>
			<td>${item.WEBSVRHTRG }-${item.WEBSVRHTEL }</td>
			<th>��û����</th>
			<td>${item.requestInfo }</td>
		</tr>
		<tr>
			<th>�������ɹ�ȣ</th>
			<td>${item.WEBSVRMTRG }-${item.WEBSVRMTEL }</td>
			<th>�����¥</th>
			<td>${item.WEBSVRRQDT } / <strong>[ ${item.status } ]</strong></td>
		</tr>
		<tr>
			<th>��Ÿ��û����</th>
			<td colspan="3">${item.WEBSVRRCOM }</td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<th colspan="4"></th>
		</tr>
		</tfoot>
	</table>
	</c:forEach>
	</c:when>
	<c:otherwise>
	<div class="service_list_none">�ƢƢƢƢ� ��û������ �����ϴ�. �ƢƢƢƢ�</div>
	</c:otherwise>
	</c:choose>
</div>