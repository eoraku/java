<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content_main">
	<div style="float:left;width:700px;height:115px;margin:10px;">
		<img src="../images/customer/topimg.jpg" width="670" height="115"/>
	</div>
	<div style="float:left;width:700px;height:20px;margin:10px;">
		<img src="../images/customer/c_title2222.gif" width="225" height="18"/>
	</div>
	<form name="service_new_form" method="post" target="exec_iframe" action="">
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
		<caption><img src="../images/customer/approve02.gif" width="118" height="33"/></caption>
		<thead>
		<tr>
			<th colspan="2"></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<th>�������</th>
			<td>
				<input type="radio" name="tiga_1" value="CARD" onclick="select_tiga(this)" checked="checked"> <font color="blue">ī����ü</font>
				<input type="radio" name="tiga_1" value="AUTO" onclick="select_tigb(this)"> <font color="blue">�ڵ���ü</font>

			</td>
		</tr>
		<tr id="tr_tigb_1">
			<th>ī���</th>
			<td>
					<SELECT style="WIDTH: 120px" name=BANKCODE dmsg="ī��縦 �������ּ���." required="y">
					<OPTION selected value=039>��ī��</OPTION>
					<OPTION value=034>�Ե�ī��</OPTION>
					<OPTION value=004>�Ｚī��</OPTION>
					<OPTION value=003>����ī��</OPTION>
					<OPTION value=011>����ī��</OPTION>
					<OPTION value=031>KB����ī��</OPTION>
					<OPTION value=055>�ϳ�SKī��</OPTION>
					<OPTION value=060>�츮ī��</OPTION>
					<OPTION value=020>��ȯī��</OPTION>
					<OPTION value=043>����ī��</OPTION>
					</SELECT>
			</td>
		</tr>				
		<tr id="tr_tigb_2">
			<th>ī���ȣ</th>
			<td>
				<input type="text" name="cnum1" value="" size=4 maxlength="4"/> -
				<input type="text" name="cnum2" value="" size=4  maxlength="4"/> - 
				<input type="text" name="cnum3" value="" size=4 maxlength="4"/> -
				<input type="text" name="cnum4" value="" size=4 maxlength="4"/>
			</td>
		</tr>
		<tr id="tr_tigb_3">
			<th>��ȿ����</th>
			<td>��/��		
			    <select name="p_month" tabindex="2">
					
					<option value="1">01</option>
					
					<option value="2">02</option>
					
					<option value="3">03</option>
					
					<option value="4">04</option>
					
					<option value="5">05</option>
					
					<option value="6">06</option>
					
					<option value="7">07</option>
					
					<option value="8">08</option>
					
					<option value="9">09</option>
					
					<option value="10">10</option>
					
					<option value="11" selected="selected">11</option>
					
					<option value="12">12</option>
					
				   </select>
				/<select name="p_year" tabindex="1">
					
					<option value="2013" selected="selected">2013</option>
					
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>
					
				</select> 
			</td>
		</tr>
		<tr id="tr_tigb_4">
			<th>�����ڼ���</th>
			<td>
				<input type="text" name="name1" value="" maxlength="5"/>
			</td>
		</tr>
		<tr id="tr_tigb_5">
			<th>���</th>
			<td>
				�����ſ���� �ſ� 25�� �ڵ� ���� �˴ϴ�.
			</td>
		</tr>		
		<tr id="tr_tiga_1" style="display:none;">
			<th>�����</th>
			<td>
					<SELECT style="WIDTH: 120px" name=BANKCODE dmsg="������ �������ּ���." required="y">
					<OPTION value=039>�泲����</OPTION>
					<OPTION value=034>��������</OPTION>
					<OPTION value=004>��������</OPTION>
					<OPTION value=003>�������</OPTION>
					<OPTION value=011>��������</OPTION>
					<OPTION value=031>�뱸����</OPTION>
					<OPTION value=055>����ġ����</OPTION>
					<OPTION value=060>��ũ����Ƹ޸�ī</OPTION>
					<OPTION value=032>�λ�����</OPTION>
					<OPTION value=064>�긲����</OPTION>
					<OPTION value=002>�������</OPTION>
					<OPTION value=050>��ȣ��������</OPTION>
					<OPTION value=045>�������ݰ�</OPTION>
					<OPTION value=007>����</OPTION>
					<OPTION value=088>��������</OPTION>
					<OPTION value=048>����</OPTION><
					<OPTION value=005>��ȯ����</OPTION>
					<OPTION value=020>�츮����</OPTION>
					<OPTION value=071>��ü��</OPTION>
					<OPTION value=037>��������</OPTION>
					<OPTION selected value=035>��������</OPTION>
					<OPTION value=012>��������</OPTION>
					<OPTION value=081>�ϳ�����</OPTION>
					<OPTION value=027>�ѱ���Ƽ����</OPTION>
					<OPTION value=054>ȫ������</OPTION>
					<OPTION value=057>JP��ü�̽�</OPTION>
					<OPTION value=023>SC����</OPTION>
					<OPTION value=261>��������</OPTION>
					<OPTION value=267>�������</OPTION>
					<OPTION value=238>�������</OPTION>
					<OPTION value=279>��������</OPTION>
					<OPTION value=209>��������</OPTION>
					<OPTION value=287>�޸�������</OPTION>
					<OPTION value=230>�̷���������</OPTION>
					<OPTION value=290>�α�����</OPTION>
					<OPTION value=240>�Ｚ����</OPTION>
					<OPTION value=268>�ַθ���������</OPTION>
					<OPTION value=291>�ſ�����</OPTION>
					<OPTION value=278>���ѱ�������</OPTION>
					<OPTION value=247>�츮��������</OPTION>
					<OPTION value=280>������������</OPTION>
					<OPTION value=265>��Ʈ���̵�����</OPTION>
					<OPTION value=264>Ű������</OPTION>
					<OPTION value=270>�ϳ���������</OPTION>
					<OPTION value=262>������������</OPTION>
					<OPTION value=243>�ѱ���������</OPTION>
					<OPTION value=269>��ȭ����</OPTION>
					<OPTION value=218>��������</OPTION>
					<OPTION value=263>HMC��������</OPTION>
					<OPTION value=292>LIG��������</OPTION>
					<OPTION value=289>NH��������</OPTION>
					<OPTION value=266>SK����</OPTION>
					</SELECT>
			</td>
		</tr>		
		<tr id="tr_tiga_2" style="display:none;">
			<th>���¹�ȣ</th>
			<td>
				<input type="text" name="cnuma1" value="" size=20 maxlength="20"/> 
			</td>
		</tr>		
		<tr id="tr_tiga_3" style="display:none;">
			<th>�ֹε�Ϲ�ȣ</th>
			<td>
				<input type="text" name="cnuma2" value="" size=6 maxlength="6"/>- <input type="password" name="cnuma3" value="" size=7 maxlength="7"/>
			</td>
		</tr>	
		<tr id="tr_tiga_4" style="display:none;">
			<th>�̸�</th>
			<td>
				<input type="text" name="name22" value="" maxlength="5"/>
			</td>
		</tr>			
		<tr>
			<th>��û����</th>
			<td><textarea name="memo" id="memo" class="form_03" maxlength="2000"></textarea></td>
		</tr>

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
		//if(!chkInputEmpty("#zipcode","'��ġ�ּ�'�� �Է����ּ���.")) return false;
		//if(!chkInputEmpty("#address1","'��ġ�ּ�'�� �Է����ּ���.")) return false;
		//if(!chkInputEmpty("#address2","'�������ּ�'�� �Է����ּ���.")) return false;
		if(!chkInputEmpty("#memo","'��û����'�� �Է����ּ���.")) return false;
		return true;
	});
});

function select_tiga(obj)
{
		document.all["tr_tigb_1"].style.display = "";
		document.all["tr_tigb_2"].style.display = ""; 
		document.all["tr_tigb_3"].style.display = ""; 
		document.all["tr_tigb_4"].style.display = "";
		document.all["tr_tigb_5"].style.display = "";
		document.all["tr_tiga_1"].style.display = "none";
		document.all["tr_tiga_2"].style.display = "none"; 
		document.all["tr_tiga_3"].style.display = "none"; 	
		document.all["tr_tiga_4"].style.display = "none";	
 
}
function select_tigb(obj)
{
		document.all["tr_tigb_1"].style.display = "none";
		document.all["tr_tigb_2"].style.display = "none"; 
		document.all["tr_tigb_3"].style.display = "none"; 
		document.all["tr_tigb_4"].style.display = "none"; 
		document.all["tr_tigb_5"].style.display = "none"; 
		document.all["tr_tiga_1"].style.display = "";
		document.all["tr_tiga_2"].style.display = ""; 
		document.all["tr_tiga_3"].style.display = ""; 
		document.all["tr_tiga_4"].style.display = "";			
}

</script>