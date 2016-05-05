<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/common_header.htm"/>
<div id="info_top">
	<div><a href="${homeUrl }"><img src="${ctxRoot }images/user/info_logo.png" width="260" height="60" alt="KCTV Ȩ����" /></a></div>
	<dl>
		<dt><a href="${ctxRoot }user/info.htm"><img src="${ctxRoot }images/user/info_home.png" width="200" height="36" alt="ȸ������ Ȩ" /></a></dt>
		<dd><a href="${ctxRoot }user/info_pw.htm"><img src="${ctxRoot }images/user/info_basic_out.png" width="120" height="36" alt="�⺻���� ����" /></a></dd>
		<dd><a href="${ctxRoot }user/info_edit_pw.htm"><img src="${ctxRoot }images/user/info_pw_out.png" width="130" height="36" alt="��й�ȣ ����" /></a></dd>
		<dd><a href="${ctxRoot }user/info_del.htm"><img src="${ctxRoot }images/user/info_del_over.png" width="120" height="36" alt="�¶��� ȸ�� Ż��" /></a></dd>
	</dl>
</div>
<div id="common_main">
	<jsp:include page="/user/info_side.htm"/>
	<div id="info_title">
		<img src="../images/user/del_info.gif" width="84" height="16"/>
	</div>
	<div id="info_content">
		<form name="chk_pw" method="post" target="exec_iframe" action="chk_pw_del.htm">
		<div id="info_pw_form">
			<div id="form_inner">
				<div id="form_input">
					<dl>
						<dt style="width:40px"><img src="../images/user/dt_id.gif" width="35" height="13"/></dt>
						<dd style="width:120px;margin-top:3px;font-size:11pt;font-weight:bold;color:#339900">${userid }</dd>
						<dt style="width:50px"><img src="../images/user/dt_pw.gif" width="46" height="13"/></dt>
						<dd style="width:250px"><input type="password" name="userpw" id="userpw" maxlength="12"/></dd>
					</dl>
				</div>
				<div id="form_vertical"></div>
				<div id="form_message"><br/>
					ȸ��Ż�� �� <span style="font-weight:bold;color:#339900">${userid }</span>���� ������ Ȯ���ϱ� ���� ��й�ȣ�� �ٽ� �� �� Ȯ�� �մϴ�.<br/>
					�׻� ��й�ȣ�� Ÿ�ο��� ������� �ʵ��� ������ �ּ���.
				</div>
			</div>
		</div>
		<div id="info_pw_btn">
			<input type="image" src="../images/user/btn_ok.png" width="60" height="29" value="Ȯ��"/>
		</div>
		</form>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#userpw").focus(function(){
		$(this).css("border-color","#5FBD20");
	});
	$("#userpw").blur(function(){
		$(this).css("border-color","#c5c5c5");
	});
	$("form").submit(function(){
		if($("#userpw").val()==""){
			alert("��й�ȣ�� �Է����ּ���.");
			$("#userpw").focus();
			return false;
		}
		if(confirm("ȸ�� Ż�� ��� �����Ͻðڽ��ϱ�?")){
			return true; 
		}
		return false;
	});
});

</script>
<jsp:include page="/include/common_footer.htm"/>