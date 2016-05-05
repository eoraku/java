<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/common_header.htm"/>
<script type="text/javascript" src="${ctxRoot }js/jquery/jquery.validate.min.js"></script>
<!-- <script type="text/javascript" src="${ctxRoot }js/user_join.js" charset="utf-8"></script> -->
<script type="text/javascript" charset="euc-kr">
$(document).ready(function(){
	$.validator.addMethod(
		"regex",
		function(value, element, regexp) {
			var re = new RegExp(regexp);
			return this.optional(element) || re.test(value);
		},
		"Please check your input"
	);
	
	$("form").validate({
		rules:{
			userid:{required:true,minlength:4,maxlength:16,regex:/^[a-zA-Z\d]*$/,remote:{url:"bln_userid.htm",type:"post"}},
			userpw1:{required:true,minlength:4,maxlength:12},
			userpw2:{required:true,equalTo:"#userpw1"},
			//name:{required:true,minlength:2,maxlength:10},
			email:{required:true,minlength:2,maxlength:50,email:true,remote:{url:"bln_email.htm",type:"post"}},
			zipcode:{required:true,maxlength:7,regex:/^\d{3}-\d{3}/},
			address1:{required:true,minlength:2,maxlength:100},
			tel:{required:true,minlength:9,maxlength:20,regex:/^[\d\-]*[\d]$/},
			phone:{required:true,minlength:10,maxlength:20,regex:/^[\d\-]*[\d]$/}
		},
		messages:{
			userid:{required:"���̵� �Է����ּ���",minlength:"���̵�� �ּ� 4���Դϴ�",maxlength:"���̵�� �ִ� 16���Դϴ�",regex:"���̵�� ������ ���ڸ� �����մϴ�",remote:"�ߺ��� ���̵� �ֽ��ϴ�"},
			userpw1:{required:"��й�ȣ�� �Է����ּ���",minlength:"��й�ȣ�� �ּ� 4���Դϴ�",maxlength:"��й�ȣ�� �ִ� 12���Դϴ�"},
			userpw2:{required:"��й�ȣ Ȯ���� �Է����ּ���",equalTo:"��й�ȣ�� ���ƾ��մϴ�"},
			//name:{required:"�̸��� �Է����ּ���",minlength:"�̸��� �ּ� 2���Դϴ�",maxlength:"�̸��� �ִ� 10���Դϴ�"},
			email:{required:"�̸����� �Է����ּ���",minlength:"�̸����� �ּ� 2���Դϴ�",maxlength:"�̸����� �ִ� 50���Դϴ�",email:"�̸��� ������ �ƴմϴ�",remote:"�ߺ��� �̸����� �ֽ��ϴ�"},
			zipcode:{required:"�����ȣ�� �Է����ּ���",maxlength:"�����ȣ�� �ִ� 7���Դϴ�",regex:"�����ȣ ������ �ƴմϴ�"},
			address1:{required:"�ּҸ� �Է����ּ���",minlength:"�ּҴ� �ּ� 2���Դϴ�",maxlength:"�ּҴ� �ִ� 100���Դϴ�"},
			tel:{required:"��ȭ��ȣ�� �Է����ּ���",minlength:"��ȭ��ȣ�� �ּ� 9���Դϴ�",maxlength:"��ȭ��ȣ�� �ִ� 20���Դϴ�",regex:"��ȭ��ȣ ������ �ƴմϴ�"},
			phone:{required:"�޴�����ȣ�� �Է����ּ���",minlength:"�޴�����ȣ�� �ּ� 10���Դϴ�",maxlength:"�޴�����ȣ�� �ִ� 20���Դϴ�",regex:"�޴�����ȣ ������ �ƴմϴ�"}
		},
		highlight: function(label) {
			$(label).css("border-color","red");
		},
		success: function(label) {
			label.addClass('valid').siblings('input').css("border-color","gray");
		}/*,
		submitHandler: function(form) {
		//��ȿ�� �˻翡�� �����Ͽ��� ��� ȣ��Ǵ� �Լ�. ���ڷ� submit�� form�� ���޵ȴ�.
		form.submit();
	},
	errorPlacement: function(error, element) {
		//��ȿ�� �˻翡�� ������ �߻��� ��Ʈ�ѵ鸶�� �ش� �Լ��� ��ģ��. (4�� �ؽ�Ʈ �ڽ��� ������� �ش� �Լ� 4�� ȣ��)
		error.insertAfter(element);  //������ �߻��� �ڵ��� �պκп� messages���� ������ �ؽ�Ʈ�� �����
	}*/
	});
});</script>
<div id="join_top_logo"><a href="${homeUrl }"><img src="${ctxRoot }images/user/join_logo.gif" width="260" height="59"/></a></div>
<div id="join_top_step"><img src="${ctxRoot }images/user/join_step3.gif" width="930" height="53"/></div>
<div id="common_main">
	<form name="join_form" method="post" target="exec_iframe" action="join_run.htm">
	<input type="hidden" name="authType" value="${authType }"/>
	<input type="hidden" name="sex" value="${sex }"/>
	<input type="hidden" name="nationalInfo" value="${nationalInfo }"/>
	<input type="hidden" name="birthDate" value="${birthDate }"/>
	<input type="hidden" name="phoneCode" value="${phoneCode }"/>
	<table id="join_step3">
		<caption>�������� ��Ȯ�� �Է����ּ���. ǥ�� �ʼ��Է»���</caption>
		<tbody>
		<tr>
			<th class="left" scope="row"><label for="useridf">* ���̵�</label></th>
			<td class="right">
				<dl>
					<dt><input type="text" name="userid" id="userid" maxlength="16" value=""/></dt>
					<dd>* ù���ڴ� �������� �����ϰ�, ����/���� �������� 4~16�ڷ� �Է��ϼ���.</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="userpw1">* ��й�ȣ</label></th>
			<td class="right">
				<dl>
					<dt><input type="password" name="userpw1" id="userpw1" maxlength="12"/></dt>
					<dd>* 4~12�ڷ� �Է��ϼ���.(����,����,����/���� ���� ����)</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="userpw2">* ��й�ȣ Ȯ��</label></th>
			<td class="right">
				<dl>
					<dt><input type="password" name="userpw2" id="userpw2" maxlength="12"/></dt>
					<dd>* ��й�ȣ�� �ѹ� �� �Է����ּ���.</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="name">* �̸�</label></th>
			<td class="right">
				<dl>
					<dt><input type="text" name="name" id="name" maxlength="10" value="${realName }" readonly="readonly"/></dt>
					<dd>* �̸��� ������� �Է����ּ���.</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="email">* �̸���</label></th>
			<td class="right">
				<dl>
					<dt><input type="text" name="email" id="email" maxlength="50" style="width:200px"/></dt>
					<dd>* �ָ���(hotmail.com)�� ���ϼ����� �ȵ� ���� �ֽ��ϴ�. �����ϸ� �ش� ���� �̿��� �ּҸ� �����ֽʽÿ�. (Ȯ�θ��� �߼���)</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="address1">* �ּ�</label></th>
			<td class="right">
				<dl>
					<dt><span>�����ȣ : </span><input type="text" name="zipcode" id="zipcode" maxlength="7" style="width:50px" readonly="readonly"/><a href="#" onclick="javascript:searchZipcode();"><img src="${ctxRoot }images/user/zipcode_btn.gif" width="87" height="22" alt="�����ȣ�˻�" /></a></dt>
					<dd><input type="text" name="address1" id="address1" maxlength="100" style="width:300px" readonly="readonly"/></dd>
					<dd><span>�������ּ� : </span><input type="text" name="address2" id="address2" maxlength="100" style="width:228px"/></dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="tel">* ��ȭ��ȣ</label></th>
			<td class="right">
				<dl>
					<dt><input type="text" name="tel" id="tel" maxlength="20"/></dt>
					<dd>* �ݵ�� ������ ������ ����ó�� �����ּ���, ��ȭ��ȣ�� ��ȣ�� '-'�� �����մϴ�.</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="phone">* �޴�����ȣ</label></th>
			<td class="right">
				<dl>
					<c:choose>
					<c:when test="${phoneNumber != null && phoneNumber !=''}">
					<dt><input type="text" name="phone" id="phone" maxlength="20" value="${phoneNumber }" readonly="readonly"/></dt>
					</c:when>
					<c:otherwise>
					<dt><input type="text" name="phone" id="phone" maxlength="20" value=""/></dt>
					</c:otherwise>
					</c:choose>
					<dd>* �ݵ�� ������ ������ ����ó�� �����ּ���, �޴�����ȣ�� ��ȣ�� '-'�� �����մϴ�.</dd>
				</dl>
			</td>
		</tr>
		<tr>
			<th class="left" scope="row"><label for="emailReceive">* ���� ���ſ���</label></th>
			<td class="emailCheck"><input type="checkbox" name="emailReceive" value="1" checked="checked"/> �̸����� �����ϰڽ��ϴ�.</td>
		</tr>
		<tr>
			<th class="btm" scope="row" colspan="2">
				<input type="image" src="../images/user/btn2.gif" width="66" height="22" />
				<a href="http://www.kctvjeju.com"><img src="../images/user/btn_cl.gif" width="66" height="22" /></a>
			</th>
		</tr>
		</tbody>
	</table>
	</form>
</div>
<jsp:include page="/include/common_footer.htm"/>