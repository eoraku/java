<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content_main">
	<div style="float:left;width:700px;height:115px;margin:10px;">
		<img src="../images/customer/topimg.jpg" width="670" height="115"/>
	</div>
	<div style="float:left;width:700px;height:20px;margin:10px;">
		<img src="../images/customer/c_title02.gif" width="225" height="18"/>
	</div>
	<form name="service_new_form" method="post" target="exec_iframe" action="${ctxRoot }customer/smsRequest.htm">
	<input type="hidden" name="mode" value="new"/>
	<input type="hidden" name="mjcd" value="AS"/>
	<table class="service_new_table">
		<caption><img src="../images/customer/member.gif" width="118" height="33"/></caption>
		<thead>
		<tr>
			<th colspan="2"></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<th>��û�� �̸�</th>
			<td><input type="text" name="name" id="name" value="${login_name }"/></td>
		</tr>
		<tr>
			<th>��û�� ��ȭ��ȣ</th>
			<td><input type="text" class="form_03" style="width:50px" name="htrg"   id="htrg"   maxlength=3 value="064"/> - 
				<input type="text" class="form_03" style="width:50px" name="htel_1" id="htel_1" maxlength=4 value=""/> - 
				<input type="text" class="form_03" style="width:50px" name="htel_2" id="htel_2" maxlength=4 value=""/></td>
		</tr>
		<tr>
			<th>�������ɹ�ȣ</th>
			<td><input type="text" class="form_03" style="width:50px" name="mtrg"   id="mtrg"   maxlength=3 value=""> - 
				<input type="text" class="form_03" style="width:50px" name="mtel_1" id="mtel_1" maxlength=4> - 
				<input type="text" class="form_03" style="width:50px" name="mtel_2" id="mtel_2" maxlength=4></td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<th colspan="2"></th>
		</tr>
		</tfoot>
	</table>
	<table class="service_new_table">
		<caption><img src="../images/customer/as.gif" width="118" height="33"/></caption>
		<thead>
		<tr>
			<th colspan="2"></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<th>�������</th>
			<td>
				<input type="radio" name="tigb_1" value="CARD" onclick="select_tigb(this)" checked="checked"/> <font color="blue">ī����ü</font>
				<input type="radio" name="tigb_1" value="AUTO" onclick="select_tigb(this)"/> <font color="blue">�ڵ���ü</font>
			</td>
		</tr>
		<tr id="tr_tigb_1">
			<th>ī���ȣ</th>
			<td>
				<input type="number" name="cnum1" value=""  MaxLength=4/> -
				<input type="number" name="cnum2" value=""  MaxLength=4/> - 
				<input type="number" name="cnum3" value=""  MaxLength=4/> -
				<input type="number" name="cnum4" value=""  MaxLength=4/>
			</td>
		</tr>
		<tr id="tr_tigb_2" style="display:none;">
			<th>��ȿ����</th>
			<td>��/��		
			    <select name="p_month" tabindex="2">
					<c:forEach var="i" begin="01" end="12">
					<option value="${i }"<c:if test="${month==i }"> selected="selected"</c:if>>${i }</option>
					</c:forEach>
				   </select>
				/<select name="p_year" tabindex="1">
					<c:forEach var="i" begin="${year }" end="${year+1 }">
					<option value="${i }"<c:if test="${year==i }"> selected="selected"</c:if>>${i }</option>
					</c:forEach>
				</select> 
			</td>
		</tr>
		<tr id="tr_tigb_3" style="display:none;">
			<th>�����ڼ���</th>
			<td>
				<td>��/��<input type="text" name="cnum1" value="" MaxLength=2/>/<input type="number" name="cnum1" value="" MaxLength=2/>
			</td>
		</tr>
		<tr>
			<th>AS��û����</th>
			<td><textarea name="memo" id="memo" class="form_03" maxlength="2000"></textarea></td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<th colspan="2"></th>
		</tr>
		</tfoot>
	</table>
	<div class="service_new_btn">
		<ul>
			<li><input type="image" src="../images/customer/ok_btn.gif" width="55" height="21"/></li>
			<li><a href="#" onclick="document.service_new_form.reset();"><img src="../images/customer/esc_btn.gif" width="55" height="21"/></a></li>
		</ul>
	</div>
	</form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("form").submit(function(){
		if(!chkInputEmpty("#name","'��û���̸�'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#htrg","'��ġ�� ��ȭ��ȣ'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#htel_1","'��ġ�� ��ȭ��ȣ'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#htel_2","'��ġ�� ��ȭ��ȣ'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#mtrg","'�������ɹ�ȣ'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#mtel_1","'�������ɹ�ȣ'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#mtel_2","'�������ɹ�ȣ'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#zipcode","'��ġ�ּ�'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#address1","'��ġ�ּ�'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#address2","'�������ּ�'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#memo","'AS��û����'�� �Է����ּ���.")) return false;
		return true;
	});
});

function select_tigb(obj)
{
	var f = document.service_new_form;
	if( obj.value == "TV") {
		document.all["tr_tigb_1"].style.display = "block";
		document.all["tr_tigb_2"].style.display = "none"; 
		document.all["tr_tigb_3"].style.display = "none"; 
	}else if( obj.value == "ISP"){
		document.all["tr_tigb_1"].style.display = "none"; 
		document.all["tr_tigb_2"].style.display = "block";
		document.all["tr_tigb_3"].style.display = "none";
	}else if( obj.value == "SUMM"){
		document.all["tr_tigb_1"].style.display = "none"; 
		document.all["tr_tigb_2"].style.display = "none"; 
		document.all["tr_tigb_3"].style.display = "block";
	}else if( obj.value == "PRO"){
		document.all["tr_tigb_1"].style.display = "none";
		document.all["tr_tigb_2"].style.display = "none"; 
		document.all["tr_tigb_3"].style.display = "none"; 
	}

	f.tigb_1.value = obj.value;
}
</script>