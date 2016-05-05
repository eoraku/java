<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/admin_header.asp"/>
<style type="text/css">
th, td{font-size:9pt;font-family:"����";}
th{background-color:#EFEFEF;color:#990000;}
.td01_d1{text-align:left;padding-left:20px;}}
.td01_d2{text-align:left;padding-left:40px;}
.td01_d3{text-align:left;padding-left:60px;}
.td01_d4{text-align:left;padding-left:80px;}
.td02{width:50px;text-align:center;}
.td03{width:50px;text-align:center;}
.td_current{color:#0000ff;text-decoration:underline;}
.notUse{color:red;margin-left:20px;}
</style>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">�޴�/����������</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>�޴�/����������</b></td>
	</tr>
</table>
<div style="padding-left:20px;">
<span style="color:red;">+</span> �޴� ��ġ�� <span style="color:red;">����/����</span>�ϸ� �ش� �����з��� �ڵ������� <span style="color:red;">����/����</span> �˴ϴ�!!<br/>
<span style="color:red;">+</span> ���� �޴� ������ �ش� �޴� ������ �� �޴� �߰��ϼ���!<br/>
<span style="color:red;">+ (X)</span> ǥ�ô� �ش� �޴��� ����Ʈ�� ǥ������ �ʽ��ϴ�! <br/>
</div>
<table width="90%" border="1" cellspacing="0" cellpadding="3" style="margin:20px;">
	<tr>
		<c:choose>
		<c:when test="${cmme_uid == 0}">
		<td colspan="3">+ <a href="list.asp?cmme_uid=0"><strong class="td_current">root</strong></a></td>
		</c:when>
		<c:otherwise>
		<td colspan="3">+ <a href="list.asp?cmme_uid=0"><strong>root</strong></a></td>
		</c:otherwise>
		</c:choose>
	</tr>
	<c:forEach items="${listMenu }" var="item">
	<tr>
		<td class="td01_d${item.cmme_depth }">
			+ <a href="list.asp?cmme_uid=${item.cmme_uid }"> 
			<c:choose>
			<c:when test="${item.cmme_uid == cmme_uid }"><strong class="td_current">${item.cmme_name }</strong></c:when>
			<c:otherwise><strong>${item.cmme_name }</strong></c:otherwise>
			</c:choose>
			</a> (muid:${item.cmme_uid })
			<c:if test="${item.cmme_is_view==0 }"><span class="notUse">(X)</span></c:if>
		</td>
		<td class="td02"><a href="list.asp?cmme_uid=${item.cmme_uid }">[����]</a></td>
		<td class="td03"><a href="javascript:menu_del(${item.cmme_uid })">[����]</a></td>
	</tr>
		
	</c:forEach>
</table>
<form name="code_form" method="post" action="insert.asp">
<input type="hidden" name="cmme_uid" value="${menu.cmme_uid }"/>
<input type="hidden" name="cmme_depth" value="${menu.cmme_depth }"/>
<input type="hidden" name="cmme_parent" value="${menu.cmme_parent }"/>
<input type="hidden" name="cmme_d1" value="${menu.cmme_d1 }"/>
<input type="hidden" name="cmme_d2" value="${menu.cmme_d2 }"/>
<input type="hidden" name="cmme_d3" value="${menu.cmme_d3 }"/>
<input type="hidden" name="cmme_d4" value="${menu.cmme_d4 }"/>
<input type="hidden" name="cmme_d5" value="${menu.cmme_d5 }"/>
<table width="90%" border="1" cellspacing="0" cellpadding="3" style="margin:20px;">
	<c:if test="${menu != null }">
	<tr>
		<th>�����޴�</th>
		<td>${menu.cmme_name }</td>
	</tr>
	</c:if>
	<tr>
		<th>�޴���</th>
		<td><input type="text" name="cmme_name" value=""/></td>
	</tr>
	<tr>
		<th>��¿���</th>
		<td><input type="radio" name="cmme_is_view" value="1" checked="checked"/>��� <input type="radio" name="cmme_is_view" value="0"/>�����</td>
	</tr>
	<tr>
		<th>�ٷΰ���</th>
		<td>
			<span style="color:red;">+</span> �޴���ȣ�� �ش� �޴� �ٷΰ���, �޴���ũ�� �ش� �ּҷ� �ٷΰ���<br/>
			<span style="color:red;">+</span> ��â���� ���� Ÿ�� : <span style="color:red;">_blank</span><br/>
			<input type="radio" name="radio_uidOrlink" value="uid" checked="checked"/>�޴���ȣ <input type="radio" name="radio_numberOrlink" value="link"/>�޴���ũ<br/>
			<div id="menuUid"><span style="color:red;">+</span> �޴���ȣ:<input type="text" name="cmme_direct_uid" value="" size="10" maxlength="10"/></div>
			<div id="menuLink"><span style="color:red;">+</span> ��ũ:<input type="text" name="cmme_lick" value="" size="60" maxlength="100"/></div>
			<span style="color:red;">+</span> Ÿ��:<input type="text" name="cmme_link_target" value="" size="10" maxlength="10"/>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="�� ��" class="button_1">
			<input type="reset" value="�� ��" class="button_1">
		</th>
	</tr>
</table>
</form>
<br/>
<jsp:include page="/include/admin_footer.asp"/>