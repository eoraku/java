<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/eng_news_header.htm"/>
<div id="print_view">
	<div id="view_function">
		<dl>
			<dt><img src="${ctxRoot }images/news/print_eng_kctv_logo.gif" width="415" height="25"/></dt>
			<dd><a href="#" onclick="javascript:window.print();"><img src="${ctxRoot }images/news/eng_icon_print.png" width="75" height="19" alt="Print" /></a></dd>
		</dl>
	</div>
	<div id="view_info">
		<div id="view_title">
			${viewNews.title }
		</div>
		<div id="view_name_date">
			Date : ${viewNews.ldate }
		</div>
	</div>
	<div id="view_content">
		<c:if test="${viewNews.svrfile2!='0' }">
		<img id="newsImg" src="${ctxRoot }upload/news/${viewNews.svrfile2}"/>
		</c:if>
		${viewNews.content_clob }
	</div>
	<div id="view_content_btm">This transcript may not be in its final form, and it may be updated.<br/>The English translation has been edited for clarity.</div>
	<div id="view_btm">
		<ul>
			<li><a href="#" onclick="javascript:window.print();"><img src="${ctxRoot }images/news/eng_icon_print.png" width="75" height="19" alt="Print" /></a></li>
		</ul>
	</div>
</div>
<script type="text/javascript">
var newsImg=$("#newsImg");
var maxWidth=460;
var imgWidth=newsImg.width();
var imgHeight=newsImg.height();
newsImg.load(function(){
	if( imgWidth > maxWidth )
		newsImg.width(maxWidth+"px");
	newsImg.show();
});
</script>
</body>
</html>