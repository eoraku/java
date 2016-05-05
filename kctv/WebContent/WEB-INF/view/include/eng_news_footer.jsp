<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="common_btm">
	<div id="bottom_left" style="float:left;width:110px;height;40px;">
		<a href="${ctxRoot }"><img src="${ctxRoot }images/common/btm_logo.png" width="96" height="20" style="margin-left:24px;margin-top:40px;"></a>
	</div>
	<div id="bottom_right" style="float:right;width:820px;height:80px;margin-top:15px;">
		<div style="float:left;width:650px;height:50px;margin-top:5px;">
			<ul style="margin-left:30px;">
				<li>KCTV Jeju, Zip Code : 690-786, Ayeon-ro 2, Jeju-si, Jeju Province / Business License Number : 616-81-11863</li>
				<li>Chairman : Kong Seong-yong, CEO : Kim Gwi-jin, <br/>Director in charge of Privacy Policy : Kim Sang-baek(<a href="mailto:sbkim@kctvjeju.com">sbkim@kctvjeju.com</a>)</li>
				<li>Copyright⒞ 2013 kctvjeju.com. All Rights Reserved.</li>
			</ul>
		</div>
		<div style="float:left;width:150px;height:50px;padding-left:20px;padding-top:10px;">
			<a href="${ctxRoot }contents/customer.htm?muid=202"><img src="${ctxRoot }images/news/eng_btm_customer.png" width="118" height="37" alt="Customer Service"/></a>
		</div>
	</div>
</div>
<div id="hidden_iframe"><iframe id="exec_iframe" name="exec_iframe"></iframe></div>
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