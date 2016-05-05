<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content_main" class="in_block">
	<div id="product_top">
		<div id="product_top_img">
			<img src="../images/product/block.gif" width="690" height="220"/>
		</div>
	</div>
	<div id="product_main">
		<c:choose>
		<c:when test="${guid==0}">
		<div style="float:left;width:610px;margin-top:10px;">
			<img src="../images/product/bl_int.gif" width="587" height="33" usemap="#ImageMap1">
		</div>
		<!-- <div style="float:left;width:80px;margin-top:10px;padding-top:5px;">
			<a href="/contents/?muid=128&pmuid=126&prot=1"><img src="../images/product/button3.gif" width="74" height="24"></a>
		</div> -->
		<div style="float:left;width:700px;margin-top:10px;">
			<img src="../images/product/word10.gif" width="687" height="480">
		</div>
		</c:when>
		<c:when test="${guid==1}">
		<div style="float:left;width:610px;margin-top:10px;">
			<img src="../images/product/bl_int2.gif" width="587" height="33" usemap="#ImageMap1">
		</div>
		<!-- <div style="float:left;width:80px;margin-top:10px;padding-top:5px;">
			<a href="/contents/?muid=128&pmuid=126&prot=1"><img src="../images/product/button3.gif" width="74" height="24"></a>
		</div> -->
		<div style="float:left;width:700px;margin-top:10px;">
			<img src="../images/product/price.gif" width="488" height="134">
		</div>
		</c:when>
		<c:when test="${guid==2}">
		<div style="float:left;width:610px;margin-top:10px;">
			<img src="../images/product/bl_int3.gif" width="587" height="33" usemap="#ImageMap1">
		</div>
		<div style="float:left;width:610px;margin-top:10px;">
			<img src="../images/product/word8.gif" width="260" height="21" border="0">
		</div>
		<div id="253_body" style="float:left;width:670px;">
			<br/><strong>KCTV유해차단플러스는 KCTV유해차단서비스 가입자께 드리는 무료 서비스입니다. (가입문의:741-7777)</strong><br/><br/>
			KCTV유해차단플러스는 고객님의 자녀들을 유해동영상으로부터 보호하고 올바른 인터넷 사용습관을 길러주는 자녀PC관리프로그램입니다.<br/>
			KCTV유해차단플러스는 다음과 같은 기능을 제공하고 있습니다.<br/>
			※KCTV홈페이지 가입여부 확인 후 부모인증을 통해 바로 설치 및 사용이 가능합니다.<br/><br/>
			<p align="center"><a href="?muid=253&guid=3"><img src="../images/product/button2.gif" width="92" height="30" alt="설치하기" /></a></p><br/>
			<p align="center"><img src="../images/product/word9.gif" width="690" height="194"/></p><br/>
			<strong style="font-size:11pt;">KCTV유해차단플러스 주요기능 설정방법</strong><br/><br/>
			<strong style="color:#0000ee;">◆유해동영상 차단/검색</strong><br/>
			KCTV유해차단플러스를 설치하시면 특별한 설정이 없어도 자녀모드에서는 유해동영상이 실기간으로 차단됩니다.<br/>
			또한 컴퓨터내에 있는 유해동영상을 검색하고 삭제하실 수 있습니다.<br/><br/>
			<p align="center"><img src="../images/product/plus1.gif" width="344" height="272"/></p><br/>
			<strong>유해동영상 차단</strong> : 자녀모드에서는 유해동영상을 실행하면 실시간으로 감지하여 차단됩니다<br/><br/>
			<p align="center"><img src="../images/product/plus2.gif" width="676" height="487"/></p><br/>
			<strong>유해동영상 검색</strong> :<br/>
			플러스 관리창에서 [유해동영상 검사]메뉴를 클릭합니다.<br/>
			(플러스 관리창은 화면 우측하단 플러스 아이콘을 마우스 우클릭 후 [플러스 관리창 보기]를 선택하시면<br/>
			됩니다) [설정]에서 검사대상 폴더를 지정하고 [검사시작]을 클릭하면 컴퓨터 내에 있는 유해동영상을<br/>
			검사합니다. 유해동영상이 검색되면 선택 후 삭제 할 수 있습니다.<br/><br/>
			<strong style="color:#0000ee;">◆인터넷 이용시간 관리</strong><br/>
			부모님의 설정한 시간에는 자녀들이 인터넷을 이용할 수 없도록 제한 합니다.<br/><br/>
			<p align="center"><img src="../images/product/plus4.gif" width="676" height="487"/></p><br/>
			제한된 시간에는 자녀모드에서는 인터넷 연결이 차단됩니다.<br/>
			(부모모드에서는 차단하지 않습니다)<br/><br/>
			<p align="center"><img src="../images/product/plus6.gif" width="310" height="181"/></p><br/>
			<strong style="color:#0000ee;">◆프로그램 차단</strong><br/>
			게임/P2P등의 프로그램을 시간대 별로 차단할 수 있습니다.<br/><br/>
			<p align="center"><img src="../images/product/plus3.gif" width="676" height="487"/></p><br/>
			차단 설정된 시간에는 자녀모드에서는 해당 프로그램이 차단됩니다.<br/>
			(부모모드에서는 차단하지 않습니다)<br/><br/>
			<p align="center"><img src="../images/product/plus5.gif" width="346" height="272"/></p><br/>
		</div>
		</c:when>
		<c:when test="${guid==3}">
		<!-- <div style="float:left;width:610px;margin-top:10px;">
			<img src="../images/product/bl_int3.gif" width="587" height="33" usemap="#ImageMap1">
		</div> -->
		<!-- <div style="float:left;width:80px;margin-top:10px;padding-top:5px;">
			<a href="/contents/?muid=128&pmuid=126&prot=1"><img src="../images/product/button3.gif" width="74" height="24"></a>
		</div> -->
		<div style="float:left;width:700px;margin-top:10px;">
			<iframe name="board_iframe" width="100%" height="500" src="http://cleani.kctvjeju.com/install.php" frameborder="0" scrolling="no" align="center" style="width:700px;height:400px;border-width:0px"></iframe>
		</div>
		</c:when>
		</c:choose>
	</div>
</div>
<map name="ImageMap1">
	<area shape="rect" coords="7, 2, 178, 30" href="product.htm?muid=253&guid=0">
	<area shape="rect" coords="184, 3, 310, 32" href="product.htm?muid=253&guid=1">
	<area shape="rect" coords="314, 3, 488, 32" href="product.htm?muid=253&guid=2">
</map>