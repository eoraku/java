<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/news_header.htm"/>
<div id="print_view">
	<div id="view_function">
		<dl>
			<dt><img src="${ctxRoot }images/news/print_news_logo.png" width="350" height="25"/></dt>
			<dd><a href="#" onclick="javascript:window.print();"><img src="${ctxRoot }images/news/btn_print.gif" width="77" height="19" alt="프린트하기" /></a></dd>
		</dl>
	</div>
	<div id="view_info">
		<div id="view_title">
			${viewNews.title }
		</div>
		<div id="view_name_date">
			작성자 : <a class="a_news_name" href="${ctxRoot }news/search.htm?schType=name&schText=${viewNews.name }">${viewNews.name }</a> | 날짜 : ${viewNews.ldate }
		</div>
	</div>
	<div id="view_content">
		<c:choose>
		<c:when test="${viewNews.viewFlv() }">
		<object id="player" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" name="player" width="470" height="263">
		<param name="movie" value="${ctxRoot }images/flash/player.swf" />
		<param name="allowfullscreen" value="true" />
		<param name="allowscriptaccess" value="always" />
		<param name="showShareWidget" value="false" />
		<param name="flashvars" value="showShareWidget=false&src=http://media1.kctvjeju.com/${viewNews.flv }&poster=${viewNews.svrfile2 }" />
		<embed type="application/x-shockwave-flash" id="player2" name="player2" src="${ctxRoot }images/flash/player.swf" 
			width="470" height="263" allowscriptaccess="always" showShareWidget="false" allowfullscreen="true" 
			flashvars="showShareWidget=false&src=http://media1.kctvjeju.com/${viewNews.flv }&poster=${viewNews.svrfile2 }" />
		</object><br/>
		</c:when>
		<c:when test="${viewNews.svrfile2!='0' }">
		<img id="newsImg" src="${ctxRoot }upload/news/${viewNews.svrfile2}"/>
		</c:when>
		</c:choose>
		${viewNews.content_clob }
	</div>
	<div id="view_btm">
		<ul>
			<li><a href="#" onclick="javascript:window.print();"><img src="${ctxRoot }images/news/btn_print.gif" width="77" height="19" alt="프린트하기" /></a></li>
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