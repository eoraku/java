<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="common_btm">
	<div id="bottom_left" style="float:left;width:110px;height;40px;">
		<a href="${ctxRoot }"><img src="${ctxRoot }images/common/btm_logo.png" width="96" height="20" style="margin-left:24px;margin-top:40px;"></a>
	</div>
	<div id="bottom_right" style="float:right;width:820px;height:80px;margin-top:15px;">
		<div style="float:left;width:740px;height:50px;margin-left:30px;margin-top:12px;">
			<img src="${ctxRoot }images/news/chi_btm_text.png" width="710" height="50" usemap="#Mapbtm"/>
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
<map name="Mapbtm" id="Mapbtm">
	<area shape="rect" coords="388,19,534,35" href="mailto:sbkim@kctvjeju.com" />
</map>
</body>
</html>