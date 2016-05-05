<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/common_header.htm"/>
<div id="info_top">
	<div>
		<a href="${homeUrl }"><img
			src="${ctxRoot }images/user/info_logo.png" width="260" height="60"
			alt="KCTV Ȩ����" /></a>
	</div>
	<dl>
		<dt>
			<img src="${ctxRoot }images/user/title_findid.png" width="200"
				height="36" />
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/title_small_yourself_on.png" style="padding-top:2px;" />
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/arrow_off.png" style="padding-top:10px;"/>
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/title_small_viewid.png" style="padding-top:2px;" />
		</dt>
	</dl>
</div>
<div id="common_main">
	<div id="join_step2">
		<form name="form1" action="" target="auth_popup" method="post">
		<dl id="join_step2_text">
			<dt><img src="${ctxRoot }images/user/realname.gif" width="81" height="32"/></dt>
			<dd>KCTV ���ֹ���� Ÿ�ο� ���� ���� ȸ�������� �����ϱ� ���Ͽ� ȸ������Ȯ�������� �����ϰ� �ֽ��ϴ�.</dd>
			<dd>�Ʒ��� �޴��� ����Ȯ�� �Ǵ� ������ �� �ϳ��� �����Ͽ� KCTV ���̵� ã�⸦ �����Ͽ� �ֽñ� �ٶ��ϴ�.</dd>
			<dd>�Է��Ͻ� ������ ���������� ȸ������ ���� ���� ���� �Ǵ� ��3�ڿ��� �������� �ʽ��ϴ�.</dd>
			<dd>�������� ��� ����� �����Դϴ�.</dd>
		</dl>
		<ul id="join_step2_box">
			<li class="join_step2_hori"></li>
			<li>
				<dl class="join_way">
					<dt><a href="#" onclick="javascript:realCheck(1);"><img src="${ctxRoot }images/user/real_icon1.png" width="50" height="55"></a></dt>
					<dd class="join_way_info">���θ����� �޴������� ������ȣ��<br/>
						���۹޾� ����Ȯ���� �� �� �ֽ��ϴ�.<br/>
						(�����Ϸ�� �޴��� ��ȣ�� ȸ������ �˻��� ���Ǹ�, ������� �ʽ��ϴ�.)</dd>
					<dd class="join_way_btn"><a href="#" onclick="javascript:realCheck(1);" class="a_join_setp2_btn realname_btn">�޴��� �����ϱ�</a></dd>
				</dl>
				<dl class="join_or">
					<dd><img src="${ctxRoot }images/user/real_icon_or.png" width="25" height="14"/></dd>
				</dl>
				<dl class="join_way">
					<dt><a href="#" onclick="javascript:realCheck(2);"><img src="${ctxRoot }images/user/real_icon2.png" width="50" height="55"></a></dt>
					<dd class="join_way_info">�������� �ֹε�Ϲ�ȣ�� ��ü�Ͽ�<br/>
						�¶��λ󿡼� �ſ��� Ȯ���ϴ�<br/>
						�����Դϴ�.</dd>
					<dd class="join_way_btn"><a href="#" onclick="javascript:realCheck(2);" class="a_join_setp2_btn realname_btn">������ �����ϱ�</a></dd>
				</dl>
			</li>
			<li class="join_step2_hori"></li>
			<li>
				<dl class="join_ipin">
					<dt><a href="http://i-pin.kisa.or.kr/kor/main.jsp" target="_new"><img src="${ctxRoot }images/user/real_icon_ipin.png" width="144" height="44"/></a></dt>
					<dd>�� ������(I-PIN)�� �ű� �߱� �ްų�, �����ɿ� ���� ���ǰ� �ʿ��Ͻø�<br/>
						<a href="http://i-pin.kisa.or.kr/kor/main.jsp" target="_new">�ѱ����ͳ������</a>�� ������ �̿�ȳ� �������� ���� �Ͻñ� �ٶ��ϴ�.</dd>
				</dl>
			</li>
		</ul>
		</form>
	</div>
</div>
<form name="resultForm" action="" method="post">
<input type="hidden" name="authType" value=""/>
<input type="hidden" name="realName" value=""/>
<input type="hidden" name="sex" value=""/>
<input type="hidden" name="nationalInfo" value=""/>
<input type="hidden" name="birthDate" value=""/>
<input type="hidden" name="phoneCode" value=""/>
<input type="hidden" name="phoneNumber" value=""/>
</form>
<script>
<!--
function realCheck(type){
	var form1 = document.form1;
	if(type==1){
		form1.action = "auth_phone1.htm";
		window.open("", "auth_popup", "width=432,height=588,scrollbar=yes");
		form1.target = "auth_popup";
	}
	else{
		form1.action = "auth_ipin1.htm";
		window.open("", "auth_popup", "width=445,height=551,scrollbar=yes");
		form1.target = "auth_popup";
	}

	form1.submit();
}
//-->
</script>
<jsp:include page="/include/common_footer.htm"/>