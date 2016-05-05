<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/common_header.htm"/>
<script type="text/javascript" src="${ctxRoot }js/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctxRoot }js/user_join.js" charset="utf-8"></script>
<div id="info_top">
	<div><a href="${homeUrl }"><img src="${ctxRoot }images/user/info_logo.png" width="260" height="60" alt="KCTV Ȩ����" /></a></div>
	<dl>
		<dt><a href="${ctxRoot }user/info.htm"><img src="${ctxRoot }images/user/info_home.png" width="200" height="36" alt="ȸ������ Ȩ" /></a></dt>
		<dd><a href="${ctxRoot }user/info_pw.htm"><img src="${ctxRoot }images/user/info_basic_over.png" width="120" height="36" alt="�⺻���� ����" /></a></dd>
		<dd><a href="${ctxRoot }user/info_edit_pw.htm"><img src="${ctxRoot }images/user/info_pw_out.png" width="130" height="36" alt="��й�ȣ ����" /></a></dd>
		<dd><a href="${ctxRoot }user/info_del.htm"><img src="${ctxRoot }images/user/info_del_out.png" width="120" height="36" alt="�¶��� ȸ�� Ż��" /></a></dd>
	</dl>
</div>

<div id="common_main">
	<jsp:include page="/user/info_side.htm"/>
	<div id="info_title">
		<img src="../images/user/modify_info.gif" width="84" height="16"/>
	</div>
	<div id="info_content">
		<ul style="float:left;">
			<li style="float:left;width:128px;height:20px;border-width:1px 1px 0px 1px;border-style:solid;border-color:#d5d5d5;text-align:center;padding-top:10px;font-size:10pt;font-weight:bold;">�⺻����</li>
			<li style="float:left;width:540px;height:30px;border-bottom:1px solid #d5d5d5"></li>
		</ul>
		<div style="float:left;margin-top:10px;padding:5px;line-height:140%">
			ȸ������ ���� �� ����� ������ �ִ� ���, �Ʒ����� �������ּ���.<br/> 
			ȸ�������� ����������޹�ħ�� ���� �����ϰ� ��ȣ�Ǹ�, ȸ������ ����� ���� ���� ���� �Ǵ� �� 3�ڿ���<br/> 
			�������� �ʽ��ϴ�. ����������޹�ħ
		</div>
		<form name="info_edit" method="post" target="exec_iframe" action="info_edit_basic.htm">
		<table id=info_table>
			<caption>�������� ��Ȯ�� �Է����ּ���. ǥ�� �ʼ��Է»���</caption>
			<tbody>
			<tr>
				<th class="left" scope="row"><label for="useridf">���̵�</label></th>
				<td class="right">${infoBasic.id } �ؾ��̵�� ���� �Ұ����մϴ�.</td>
			</tr>
			<tr>
				<th class="left" scope="row"><label for="name">�̸�</label></th>
				<td class="right">${infoBasic.name } �ذ������� �̸��� ����� ��� ��������(064-741-7777)�� ���� �ּ���.</td>
			</tr>
			<tr>
				<th class="left" scope="row"><label for="email">* �̸���</label></th>
				<td class="right">
					<dl>
						<dt><input type="text" name="email" id="email" value="${infoBasic.email }" maxlength="50" style="width:200px"/></dt>
						<dd>* �ָ���(hotmail.com)�� ���ϼ����� �ȵ� ���� �ֽ��ϴ�. �����ϸ� �ش� ���� �̿��� �ּҸ� �����ֽʽÿ�. (Ȯ�θ��� �߼���)</dd>
					</dl>
				</td>
			</tr>
			<tr>
				<th class="left" scope="row"><label for="address1">* �ּ�</label></th>
				<td class="right">
					<dl>
						<dt><span>�����ȣ : </span><input type="text" name="zipcode" id="zipcode" value="${infoBasic.zipcode }" maxlength="7" style="width:50px" readonly="readonly"/><a href="#" onclick="javascript:searchZipcode('info_edit');" style="margin-left:7px;"><img src="${ctxRoot }images/user/zipcode_btn.gif" width="87" height="22" alt="�����ȣ�˻�" /></a></dt>
						<dd><input type="text" name="address1" id="address1" value="${infoBasic.address1 }" maxlength="100" style="width:300px" readonly="readonly"/></dd>
						<dd><span>�������ּ� : </span><input type="text" name="address2" id="address2" value="${infoBasic.address2 }" maxlength="100" style="width:228px"/></dd>
					</dl>
				</td>
			</tr>
			<tr>
				<th class="left" scope="row"><label for="tel">* ��ȭ��ȣ</label></th>
				<td class="right">
					<dl>
						<dt><input type="text" name="tel" id="tel" value="${infoBasic.phone }" maxlength="20"/></dt>
						<dd>* �ݵ�� ������ ������ ����ó�� �����ּ���, ��ȭ��ȣ�� ��ȣ�� '-'�� �����մϴ�.</dd>
					</dl>
				</td>
			</tr>
			<tr>
				<th class="left" scope="row"><label for="phone">* �޴�����ȣ</label></th>
				<td class="right">
					<dl>
						<dt><input type="text" name="phone" id="phone" value="${infoBasic.cellphone }" maxlength="20"/></dt>
						<dd>* �ݵ�� ������ ������ ����ó�� �����ּ���, �޴�����ȣ�� ��ȣ�� '-'�� �����մϴ�.</dd>
					</dl>
				</td>
			</tr>
			<tr>
				<th class="left" scope="row"><label for="emailReceive">* ���� ���ſ���</label></th>
				<td class="emailCheck"><input type="checkbox" name="emailReceive" checked="checked"/> �̸����� �����ϰڽ��ϴ�.</td>
			</tr>
			<tr>
				<th class="btm" scope="row" colspan="2">
					<input type="image" src="../images/user/btn_ok.png" width="60" height="29" />
					<a href="info.htm"><img src="../images/user/btn_cancel.png" width="60" height="29" /></a>
				</th>
			</tr>
			</tbody>
		</table>
		</form>
	</div>
</div>
<jsp:include page="/include/common_footer.htm"/>