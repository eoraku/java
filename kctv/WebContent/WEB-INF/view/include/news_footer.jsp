<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="common_btm">
	<div id="bottom_left" style="float:left;width:110px;height;40px;">
		<a href="${ctxRoot }"><img src="${ctxRoot }images/common/btm_logo.png" width="96" height="20" style="margin-left:24px;margin-top:40px;"></a>
	</div>
	<div id="bottom_right" style="float:right;width:820px;height:80px;margin-top:15px;">
		<div style="float:left;width:820px;height:27px;">
			<ul style="margin-left:10px;margin-top:10px;">
				<li class="btm_link"><a href="${ctxRoot }contents/company.htm?muid=143">회사소개</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="${ctxRoot }contents/member.htm?muid=163">인터넷 이용약관</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="${ctxRoot }contents/member.htm?muid=164">케이블TV 이용약관</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="${ctxRoot }contents/member.htm?muid=234">인터넷전화 이용약관</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="${ctxRoot }contents/member.htm?muid=357">전용회선서비스 이용약관</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="${ctxRoot }contents/member.htm?muid=201">개인정보 취급방침</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="javascript:newWindow('${ctxRoot }html/popup/email_refusal.html','newWindow',350,200,false);">이메일무단수집거부</a></li>
				<li class="btm_vertical">|</li>
				<li class="btm_link"><a href="${ctxRoot }contents/product.htm?muid=28">광고문의</a></li>
			</ul>
		</div>
		<div style="float:left;width:630px;height:50px;">
			<ul style="margin-left:10px;">
				<li>㈜KCTV제주방송(690-786) 제주특별자치도 제주시 아연로2(연동 422) / 사업자등록번호 : 616-81-11863</li>
				<li>통신판매업신고번호 : 220111-0013888 / 대표이사 : 공성용, 김귀진 / 개인정보관리책임자 : 김상백(<a href="mailto:sbkim@kctvjeju.com">sbkim@kctvjeju.com</a>)</li>
				<li style="margin-top:3px;"><img src="${ctxRoot }images/common/btm_copyright.gif" width="223" height="5"/></li>
			</ul>
		</div>
		<div style="float:left;width:190px;height:50px;">
			<ul>
				<li><a href="/contents/?muid=202&pmuid=126"><img src="${ctxRoot }images/common/btm_customer.png" width="168" height="19" alt="고객센터"/></a></li>
				<li style="margin-top:4px;">
					<select size="1" OnChange="goto_byselect(this, 'blank')">
						<option selected>관련사이트 바로기기</option>
						<option value="http://www.kbc.go.kr/index.jsp">방송위원회</option>
						<option value="http://www.kcta.or.kr">한국케이블TV방송협회</option>
						<option value="http://www.fbc.or.kr/">방송문화진흥회</option>
						<option value="http://www.journalist.or.kr">한국기자협회</option>
						<option value="http://www.mic.go.kr/user.tdf?a=user.index.IndexApp&c=1001">정보통신부</option>
						<option value="http://www.klabs.re.kr">한국디지털케이블연구원</option>
						<option value="http://www.kobaco.co.kr">한국방송광고공사</option>
						<option value="http://www.kbi.re.kr/main/index.jsp">한국방송영상산업진흥</option>
						<option value="http://www.lotteimall.com/main/Index.jsp">롯데홈쇼핑</option>
						<option value="http://www.webclean21.org/">유해사이트차단</option>
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
/********** s:구글 통계 **********/
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-32905528-1']);
_gaq.push(['_trackPageview']);

(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
/********** e:구글 통계 **********/
// -->
</script>
</c:if>
</body>
</html>