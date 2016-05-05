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
			<li class="manual_tab_menu"><a href="?muid=166&guid=0"><strong>컨버터</strong></a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=166&guid=1">리모콘</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		</c:when>
		<c:when test="${guid==1 }">
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=166&guid=0">컨버터</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=166&guid=1"><strong>리모콘</strong></a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		</c:when>
		</c:choose>
	</div>
	<div id="customer_manual">
		<div><img src="../images/customer/c_title11.gif" width="225" height="18" alt="케이블방송 사용설명서" /></div>
		<c:choose>
		<c:when test="${guid==0 }">
		<dl>
			<dt>컨버터의 전원</dt>
			<dd>
				1. 컨버터의 전원을 110V/220V, 60Hz입니다.(단,CTC-9620 모델220V전용입니다.)<br/>
				&nbsp;&nbsp;&nbsp;반드시 전원을 확인하신후 사용하시기 바랍니다.<br/>
				2. 전원 플러그를 연결하시면, 컨버터의 앞면에 전원상태의 불이 표시됩니다.<br/>
				<div><img src="../images/customer/convert_img01.gif" width="254" height="70"/></div>
				※ 방송국에서 가입자 컨버터를 등록시킨 후 현재 시간을 송출할 경우, 컨버터의 앞면은 시간이 표시됩니다.<br/>
				&nbsp;&nbsp;&nbsp;(전원대기 상태에서)
				<div><img src="../images/customer/convert_img02.gif" width="408" height="70"/></div>
			</dd>
		</dl>
		<dl>
			<dt>컨버터의 동작</dt>
			<dd>
				1. 리모콘(원격조정기)또는 본체전면에 잇는 "전원"버튼을 누릅니다.<br/>
				2. 원하는 채널을 선택하세요. 컨버터의 앞면에 채널이 표시됩니다.<br/>
				<div><img src="../images/customer/convert_img03.gif" width="408" height="70"/></div>
				※ 컨버터와 TV의 연결상태를 맞추세요.<br/>
				- TV가 영상, 음성 입력 단자로 연결된 상태에서는 TV를 "비디오 모드"로 맞추셔야 합니다.<br/>
				- TV가 VHF입력단자(RF 입력)로 연결된 상태에서는, TV를 채널 3(또는 4)으로 고정시켜 사용하십시오.<br/>
				&nbsp;&nbsp;&nbsp;(컨버터 뒷면 출력을 채널 3(또는 4)으로 한 경우)
			</dd>
		</dl>
		</c:when>
		<c:when test="${guid==1 }">
		<dl>
			<dt>리모콘 사용설명</dt>
			<dd><div><img src="../images/customer/convert_img04.gif" width="494" height="402" alt="리모콘 사용설명" /></div></dd>
		</dl>
		</c:when>
		</c:choose>
	</div>
</div>