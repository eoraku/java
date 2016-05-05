<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content_main">
	<div id="customer_title">
		<img src="../images/customer/topimg.jpg" width="670" height="115"/>
	</div>
	<div id="customer_manual_tab">
		<c:choose>
		<c:when test="${guid==0 }">
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=166&guid=0"><strong>������</strong></a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=166&guid=1">������</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		</c:when>
		<c:when test="${guid==1 }">
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=166&guid=0">������</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=166&guid=1"><strong>������</strong></a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		</c:when>
		</c:choose>
	</div>
	<div id="customer_manual">
		<div><img src="../images/customer/c_title11.gif" width="225" height="18" alt="���̺��� ��뼳��" /></div>
		<c:choose>
		<c:when test="${guid==0 }">
		<dl>
			<dt>�������� ����</dt>
			<dd>
				1. �������� ������ 110V/220V, 60Hz�Դϴ�.(��,CTC-9620 ��220V�����Դϴ�.)<br/>
				&nbsp;&nbsp;&nbsp;�ݵ�� ������ Ȯ���Ͻ��� ����Ͻñ� �ٶ��ϴ�.<br/>
				2. ���� �÷��׸� �����Ͻø�, �������� �ո鿡 ���������� ���� ǥ�õ˴ϴ�.<br/>
				<div><img src="../images/customer/convert_img01.gif" width="254" height="70"/></div>
				�� ��۱����� ������ �����͸� ��Ͻ�Ų �� ���� �ð��� ������ ���, �������� �ո��� �ð��� ǥ�õ˴ϴ�.<br/>
				&nbsp;&nbsp;&nbsp;(������� ���¿���)
				<div><img src="../images/customer/convert_img02.gif" width="408" height="70"/></div>
			</dd>
		</dl>
		<dl>
			<dt>�������� ����</dt>
			<dd>
				1. ������(����������)�Ǵ� ��ü���鿡 �մ� "����"��ư�� �����ϴ�.<br/>
				2. ���ϴ� ä���� �����ϼ���. �������� �ո鿡 ä���� ǥ�õ˴ϴ�.<br/>
				<div><img src="../images/customer/convert_img03.gif" width="408" height="70"/></div>
				�� �����Ϳ� TV�� ������¸� ���߼���.<br/>
				- TV�� ����, ���� �Է� ���ڷ� ����� ���¿����� TV�� "���� ���"�� ���߼ž� �մϴ�.<br/>
				- TV�� VHF�Է´���(RF �Է�)�� ����� ���¿�����, TV�� ä�� 3(�Ǵ� 4)���� �������� ����Ͻʽÿ�.<br/>
				&nbsp;&nbsp;&nbsp;(������ �޸� ����� ä�� 3(�Ǵ� 4)���� �� ���)
			</dd>
		</dl>
		</c:when>
		<c:when test="${guid==1 }">
		<dl>
			<dt>������ ��뼳��</dt>
			<dd><div><img src="../images/customer/convert_img04.gif" width="494" height="402" alt="������ ��뼳��" /></div></dd>
		</dl>
		</c:when>
		</c:choose>
	</div>
</div>