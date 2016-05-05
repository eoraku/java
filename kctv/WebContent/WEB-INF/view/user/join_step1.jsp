<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/common_header.htm"/>
<div id="join_top_logo"><a href="${homeUrl }"><img src="${ctxRoot }images/user/join_logo.gif" width="260" height="59"/></a></div>
<div id="join_top_step"><img src="${ctxRoot }images/user/join_step1.gif" width="930" height="53"/></div>
<div id="common_main">
	<div id="join_step1">
		<form name="join_step1" method="post" action="join2.htm">
		<ul id="join_agree_usage">
			<li><img src="${ctxRoot }images/user/use.gif" width="82" height="22"></li>
			<li>
				<iframe class="scrollbox_content" src="${ctxRoot }html/terms/usage.html" frameborder="0"></iframe>
			</li>
			<li class="chk_join_agree"><input type="checkbox" name="usage" id="usage"/>�̿����� �����մϴ�. <a href="/board/w_sc/download.htm?buid=190" target="exec_iframe">�ٿ�ε�</a></li>
		</ul>
		<ul id="join_agree_private">
			<li><img src="${ctxRoot }images/user/person.gif" width="131" height="22"></li>
			<li>
				<iframe class="scrollbox_content" src="${ctxRoot }html/terms/privacy.html" frameborder="0"></iframe>
			</li>
			<li class="chk_join_agree"><input type="checkbox" name="privacy" id="privacy"/>����������޹�ħ�� �����մϴ�. <a href="/board/w_sc/download.htm?buid=185" target="exec_iframe">�ٿ�ε�</a></li>
		</ul>
		<div id="join_btn">
			<ul>
				<li id="btn_agree"><input type="image" name="submit" src="${ctxRoot }images/user/agree_btn.gif" width="55" height="21" /></li>
				<li id="btn_disagree"><a href="http://www.kctvjeju.com"><img src="${ctxRoot }images/user/disagree_btn.gif" width="55" height="21" /></a></li>
			</ul>
		</div>
		</form>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("form").submit(function(){
		if(!chkInputCheck("usage","'�̿���'�� �������ּ���.")) return false;
		if(!chkInputCheck("privacy","'����������޹�ħ'�� �������ּ���.")) return false;
		return true;
	});
});
</script>
<jsp:include page="/include/common_footer.htm"/>