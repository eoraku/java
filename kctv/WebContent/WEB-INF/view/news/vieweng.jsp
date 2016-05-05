<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="news_view">
	<div id="view_function">
		<ul>
			<li><a href="#" onclick="javascript:printView(${viewNews.num });"><img src="${ctxRoot }images/news/eng_icon_print.png" width="75" height="19" alt="Print this document" /></a></li>
			<li><a href="#" onclick="javascript:history.go(-1);"><img src="${ctxRoot }images/news/eng_icon_prev.png" width="75" height="19" alt="Previous page" /></a></li>
		</ul>
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
</div>
<script type="text/javascript">
var newsImg=$("#newsImg");
var maxWidth=590;
var imgWidth=newsImg.width();
var imgHeight=newsImg.height();
newsImg.load(function(){
	if( imgWidth > maxWidth )
		newsImg.width(maxWidth+"px");
	newsImg.show();
});
</script>
<div id="div_print_area"><iframe id="print_iframe" name="print_iframe" src="print_iframe.htm"></iframe></div>