<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="common_btm">
	<div id="bottom_left" style="float:left;width:110px;height;40px;">
		<a href="${ctxRoot }"><img src="${ctxRoot }images/common/btm_logo.png" width="96" height="20" style="margin-left:24px;margin-top:40px;"></a>
	</div>
	<div id="bottom_right" style="float:right;width:820px;height:80px;margin-top:15px;">
		<div style="float:left;width:820px;height:27px;">
			<ul style="margin-left:10px;margin-top:10px;">
				<li class="btm_link"><a href="${ctxRoot }contents/company.htm?muid=143">ȸ��Ұ�</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="${ctxRoot }contents/member.htm?muid=163">���ͳ� �̿���</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="${ctxRoot }contents/member.htm?muid=164">���̺�TV �̿���</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="${ctxRoot }contents/member.htm?muid=234">���ͳ���ȭ �̿���</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="${ctxRoot }contents/member.htm?muid=357">����ȸ������ �̿���</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="${ctxRoot }contents/member.htm?muid=201">�������� ��޹�ħ</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="javascript:newWindow('${ctxRoot }html/popup/email_refusal.html','newWindow',350,200,false);">�̸��Ϲ��ܼ����ź�</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="${ctxRoot }contents/product.htm?muid=28">������</a></li>
			</ul>
		</div>
		<div style="float:left;width:630px;height:50px;">
			<ul style="margin-left:10px;">
				<li>��KCTV���ֹ��(690-786) ����Ư����ġ�� ���ֽ� �ƿ���2(���� 422) / ����ڵ�Ϲ�ȣ : 616-81-11863</li>
				<li>����Ǹž��Ű��ȣ : 220111-0013888 / ��ǥ�̻� : ������, ����� / ������������å���� : ����(<a href="mailto:sbkim@kctvjeju.com">sbkim@kctvjeju.com</a>)</li>
				<li style="margin-top:3px;"><img src="${ctxRoot }images/common/btm_copyright.gif" width="223" height="5"/></li>
			</ul>
		</div>
		<div style="float:left;width:190px;height:50px;">
			<ul>
				<li><a href="/contents/?muid=202&pmuid=126"><img src="${ctxRoot }images/common/btm_customer.png" width="168" height="19" alt="������"/></a></li>
				<li style="margin-top:4px;">
					<select size="1" OnChange="goto_byselect(this, 'blank')">
						<option selected>���û���Ʈ �ٷα��</option>
						<option value="http://www.kbc.go.kr/index.jsp">�������ȸ</option>
						<option value="http://www.kcta.or.kr">�ѱ����̺�TV�����ȸ</option>
						<option value="http://www.fbc.or.kr/">��۹�ȭ����ȸ</option>
						<option value="http://www.journalist.or.kr">�ѱ�������ȸ</option>
						<option value="http://www.mic.go.kr/user.tdf?a=user.index.IndexApp&c=1001">������ź�</option>
						<option value="http://www.klabs.re.kr">�ѱ����������̺�����</option>
						<option value="http://www.kobaco.co.kr">�ѱ���۱������</option>
						<option value="http://www.kbi.re.kr/main/index.jsp">�ѱ���ۿ���������</option>
						<option value="http://www.lotteimall.com/main/Index.jsp">�Ե�Ȩ����</option>
						<option value="http://www.webclean21.org/">���ػ���Ʈ����</option>
					</select>
				</li>
			</ul>
		</div>
	</div>
</div>
<div id="hidden_iframe"><iframe id="exec_iframe" name="exec_iframe" src="about:blank"></iframe></div>
<c:if test="${serverType=='real' }">
<script type="text/javascript">
<!-- Hide from old browsers
/********** s:���� ��� **********/
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-32905528-1']);
_gaq.push(['_trackPageview']);

(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
/********** e:���� ��� **********/
// -->
</script>
</c:if>
</body>
</html>