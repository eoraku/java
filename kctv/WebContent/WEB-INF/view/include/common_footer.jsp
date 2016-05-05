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
				<li><a href="/contents/customer.htm?muid=202"><img src="${ctxRoot }images/common/btm_customer.png" width="168" height="19" alt="고객센터"/></a></li>
				<li style="margin-top:4px;">
					<select size="1" OnChange="goto_byselect(this, 'blank')">
						<option selected>관련사이트 바로기기</option>
						<option value="http://www.kcc.go.kr/">방송통신위원회</option>
						<option value="http://www.kcta.or.kr">한국케이블TV방송협회</option>
						<option value="http://www.fbc.or.kr/">방송문화진흥회</option>
						<option value="http://www.journalist.or.kr">한국기자협회</option>
						<option value="http://www.klabs.re.kr">한국디지털케이블연구원</option>
						<option value="http://www.kobaco.co.kr">한국방송광고공사</option>
						<option value="http://www.kocca.kr/">한국콘텐츠진흥원</option>
					</select>
				</li>
			</ul>
		</div>
	</div>
</div>
<c:choose>
<c:when test="${serverType=='real' && isAdmin!=true}">
<div id="hidden_iframe"><iframe id="exec_iframe" name="exec_iframe"></iframe></div>
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
</c:when>
<c:otherwise>
<div id="view_iframe"><iframe id="exec_iframe" name="exec_iframe"></iframe></div>
</c:otherwise>
</c:choose>
</body>
</html>