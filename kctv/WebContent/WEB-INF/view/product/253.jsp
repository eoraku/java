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
			<br/><strong>KCTV���������÷����� KCTV�������ܼ��� �����ڲ� �帮�� ���� �����Դϴ�. (���Թ���:741-7777)</strong><br/><br/>
			KCTV���������÷����� ������ �ڳ���� ���ص��������κ��� ��ȣ�ϰ� �ùٸ� ���ͳ� �������� �淯�ִ� �ڳ�PC�������α׷��Դϴ�.<br/>
			KCTV���������÷����� ������ ���� ����� �����ϰ� �ֽ��ϴ�.<br/>
			��KCTVȨ������ ���Կ��� Ȯ�� �� �θ������� ���� �ٷ� ��ġ �� ����� �����մϴ�.<br/><br/>
			<p align="center"><a href="?muid=253&guid=3"><img src="../images/product/button2.gif" width="92" height="30" alt="��ġ�ϱ�" /></a></p><br/>
			<p align="center"><img src="../images/product/word9.gif" width="690" height="194"/></p><br/>
			<strong style="font-size:11pt;">KCTV���������÷��� �ֿ��� �������</strong><br/><br/>
			<strong style="color:#0000ee;">�����ص����� ����/�˻�</strong><br/>
			KCTV���������÷����� ��ġ�Ͻø� Ư���� ������ ��� �ڳ��忡���� ���ص������� �ǱⰣ���� ���ܵ˴ϴ�.<br/>
			���� ��ǻ�ͳ��� �ִ� ���ص������� �˻��ϰ� �����Ͻ� �� �ֽ��ϴ�.<br/><br/>
			<p align="center"><img src="../images/product/plus1.gif" width="344" height="272"/></p><br/>
			<strong>���ص����� ����</strong> : �ڳ��忡���� ���ص������� �����ϸ� �ǽð����� �����Ͽ� ���ܵ˴ϴ�<br/><br/>
			<p align="center"><img src="../images/product/plus2.gif" width="676" height="487"/></p><br/>
			<strong>���ص����� �˻�</strong> :<br/>
			�÷��� ����â���� [���ص����� �˻�]�޴��� Ŭ���մϴ�.<br/>
			(�÷��� ����â�� ȭ�� �����ϴ� �÷��� �������� ���콺 ��Ŭ�� �� [�÷��� ����â ����]�� �����Ͻø�<br/>
			�˴ϴ�) [����]���� �˻��� ������ �����ϰ� [�˻����]�� Ŭ���ϸ� ��ǻ�� ���� �ִ� ���ص�������<br/>
			�˻��մϴ�. ���ص������� �˻��Ǹ� ���� �� ���� �� �� �ֽ��ϴ�.<br/><br/>
			<strong style="color:#0000ee;">�����ͳ� �̿�ð� ����</strong><br/>
			�θ���� ������ �ð����� �ڳ���� ���ͳ��� �̿��� �� ������ ���� �մϴ�.<br/><br/>
			<p align="center"><img src="../images/product/plus4.gif" width="676" height="487"/></p><br/>
			���ѵ� �ð����� �ڳ��忡���� ���ͳ� ������ ���ܵ˴ϴ�.<br/>
			(�θ��忡���� �������� �ʽ��ϴ�)<br/><br/>
			<p align="center"><img src="../images/product/plus6.gif" width="310" height="181"/></p><br/>
			<strong style="color:#0000ee;">�����α׷� ����</strong><br/>
			����/P2P���� ���α׷��� �ð��� ���� ������ �� �ֽ��ϴ�.<br/><br/>
			<p align="center"><img src="../images/product/plus3.gif" width="676" height="487"/></p><br/>
			���� ������ �ð����� �ڳ��忡���� �ش� ���α׷��� ���ܵ˴ϴ�.<br/>
			(�θ��忡���� �������� �ʽ��ϴ�)<br/><br/>
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