<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content_top">
	<ul>
		<li class="content_title"><img src="../images/cPublic/title.gif"></li>
		<li class="content_route"><a class="navi" href="${ctxRoot }">Home</a> &gt; <a class="navi" href="${ctxRoot }contents/cPublic.htm?muid=256">사이버홍보</a></li>
		<li class="content_menu"><dl><dt><img src="../images/common/dot_big.gif" width="18" height="18"/></dt><dd>${menuName }</dd></dl></li>
	</ul>
</div>
<div id="public_top">
	<img src="../images/cPublic/topimg.gif" width="670" height="115">
</div>
<c:if test="${muid==534 }">
<style>
#mecenat{width:740px;margin-top:10px;}
#mecenat > li:first-child{height:320px;margin-top:0px;}
#mecenat > li{float:left;width:740px;margin-top:10px;}
#mecenat dt{float:left;text-align:left;}
#mecenat dd{float:left;margin-left:10px;}
#mecenat dd ul{list-style:circle;margin-left:10px;}
#mecenat dd ul li:first-child{list-style:none;margin-top:5px;margin-bottom:5px;font-weight:bold;font-size:12pt;color:#990000;}
#mecenat dd ul li{}
.marginTop5 li{margin-top:5px;}
.marginTop10 li{margin-top:10px;}
</style>
<div id="content_main">
<ul id="mecenat">
	<li style="width:740px;height:320px;"><img src="/images/cPublic/mecenat3/photo_malo.png" usemap="#Map"/></li>
</ul>
</div>
<map name="Map" id="Map">
	<!-- <area shape="rect" coords="20,256,105,290" href="/contents/cPublic.htm?muid=537" /> -->
	<area shape="rect" coords="463,205,618,240" href="/contents/cPublic.htm?muid=534"/>
</map>
</c:if>