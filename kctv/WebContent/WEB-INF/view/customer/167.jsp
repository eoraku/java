<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content_main">
	<div id="customer_title">
		<img src="../images/customer/topimg.jpg" width="670" height="115"/>
	</div>
	<div class="customer_manual_device"><img src="../images/customer/title1.gif" width="132" height="35" alt="NET&SYS" /></div>
	<div id="customer_manual_tab">
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<c:choose>
			<c:when test="${guid==0 }">
			<li class="manual_tab_menu"><a href="?muid=167&guid=0"><strong>MNG-2300</strong></a></li>
			</c:when>
			<c:otherwise>
			<li class="manual_tab_menu"><a href="?muid=167&guid=0">MNG-2300</a></li>
			</c:otherwise>
			</c:choose>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<c:choose>
			<c:when test="${guid==1 }">
			<li class="manual_tab_menu"><a href="?muid=167&guid=1"><strong>MNG-3300(VOIP)</strong></a></li>
			</c:when>
			<c:otherwise>
			<li class="manual_tab_menu"><a href="?muid=167&guid=1">MNG-3300(VOIP)</a></li>
			</c:otherwise>
			</c:choose>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<c:choose>
			<c:when test="${guid==2 }">
			<li class="manual_tab_menu"><a href="?muid=167&guid=2"><strong>MNG-3500(VOIP)</strong></a></li>
			</c:when>
			<c:otherwise>
			<li class="manual_tab_menu"><a href="?muid=167&guid=2">MNG-3500(VOIP)</a></li>
			</c:otherwise>
			</c:choose>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
	</div>
	<div class="customer_manual_device"><img src="../images/customer/title2.gif" width="132" height="35" alt="WebSTAR" /></div>
	<div id="customer_manual_tab">
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<c:choose>
			<c:when test="${guid==3 }">
			<li class="manual_tab_menu"><a href="?muid=167&guid=3"><strong>DPC-2100</strong></a></li>
			</c:when>
			<c:otherwise>
			<li class="manual_tab_menu"><a href="?muid=167&guid=3">DPC-2100</a></li>
			</c:otherwise>
			</c:choose>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
	</div>
	<div id="customer_manual">
		<div><img src="../images/customer/c_title12.gif" width="225" height="18" alt="케이블넷 사용설명서" /></div>
		<c:choose>
		<c:when test="${guid==0 }">
		<dl>
			<dt>MNG-2300 전면</dt>
			<dd>
				<div><img src="../images/customer/2300_f.gif" width="628" height="198"/></div>
				<ul>
					<li><strong>PWR</strong> : 전원이 인가되면 점등</li>
					<li><strong>pwr</strong> : 전원이 인가되면 LED가 점등</li>
					<li><strong>usb</strong> : Usb 케이블을 이용하여, PC와 연결시 점등</li>
					<li><strong>pc</strong> : MNG-2300 과 PC가 이더넷 케이블로 연결 되었을 때 점등<br/>이더넷 케이블을 통해 MNG-2300 이 DATA를 전송하거나 받을 때도 깜빡 거립니다.</li>
					<li><strong>tx</strong> : 초기화 과정때 잠시 점멸하며, 주로 데이터 송신시 점멸합니다.</li>
					<li><strong>rx</strong> : 데이터 수신시 점멸 합니다.</li>
					<li><strong>sync</strong> : 케이블 모뎀 전원 인가후, 하향 신호를 찾을 때 점멸하며, 하향 신호를 찾은 후, 점등</li>
					<li><strong>rdy</strong> : 하향 신호를 찾은 다음, 상향 신호를 찾을 때, 점멸 하며, 상향 신호를 찾고 난 후, 점등</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>MNG-2300 후면</dt>
			<dd>
				<div><img src="../images/customer/2300_b.gif" width="628" height="193"/></div>
				<ul>
					<li><strong>power</strong> : 전원케이블과 연결합니다.</li>
					<li><strong>enet</strong> : 이더넷 케이블을 사용하여 모뎀과 컴퓨터를 연결합니다.</li>
					<li><strong>usb</strong> : USB 케이블을 사용하여 모뎀과 컴퓨터를 연결합니다.</li>
					<li><strong>cable</strong> : 케이블을 케이블모뎀에 연결할 때 이용합니다.</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>정상작동상태</dt>
			<dd>
				<table class="customer_manual_table">
					<thead>
					<tr>
						<th>구분</th>
						<th>OK</th>
						<th>ACT</th>
						<th>CATV</th>
						<th>CATV</th>
						<th>DS</th>
						<th>US</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>ON/OFF</td>
						<td>ON</td>
						<td>ON/Blinking</td>
						<td>OFF/Blinking</td>
						<td>OFF/Blinking</td>
						<td>ON</td>
						<td>ON</td>
					</tr>
					</tbody>
				</table>
			</dd>
		</dl>
		</c:when>
		<c:when test="${guid==1 }">
		<dl>
			<dt>MNG-3300(VOIP) 전면</dt>
			<dd>
				<div><img src="../images/customer/3300_F.gif" width="618" height="210"/></div>
				<ul>
					<li><strong>PWR</strong> : 전원이 인가되면 점등</li>
					<li><strong>PC</strong> : 케이블 모뎀과 LAN 케이블을 PC와 연결시 점등</li>
					<li><strong>SEND</strong> : 케이블 모뎀이 데이터 전송시 점멸</li>
					<li><strong>RECV</strong> : 케이블 모뎀이 데이터 수신시 점멸</li>
					<li><strong>SYNC</strong> : 케이블 모뎀이 하향 주파수 검색을 완료 하였을 때 점등</li>
					<li><strong>READY</strong> : 케이블 모뎀이 정상 등록 되었을 때 점등</li>
					<li><strong>VOIP</strong> : 케이블 모뎀이 전화가능상태일시 점등</li>
					<li><strong>LINE1</strong> : 케이블 모뎀에 연결된 전화기의 수화기를 들었을 때 점등</li>
					<li><strong>PSTN</strong> : PSTN으로 절체시 점등</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>MNG-3300(VOIP) 후면</dt>
			<dd>
				<div><img src="../images/customer/3300_B.gif" width="627" height="217"/></div>
				<ul>
					<li><strong>PWR</strong> : 전원케이블과 연결합니다.</li>
					<li><strong>PSTN</strong> : 기존에 사용중인 일반 전화선과 연결합니다.(없으면 연결하지 않아도 가능)</li>
					<li><strong>LINE1 </strong>: 케이블 모뎀과 전화기를 연결합니다.</li>
					<li><strong>ENET</strong> : 케이블 모뎀과 LAN 케이블을 이용하여 PC와 연결합니다.</li>
					<li><strong>CABLE</strong> : 동축 케이블을 케이블모뎀에 연결할 때 이용합니다.</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>정상작동상태</dt>
			<dd>
				<table class="customer_manual_table">
					<thead>
					<tr>
						<th>구분</th>
						<th>PWR</th>
						<th>PC</th>
						<th>SEND</th>
						<th>RECV</th>
						<th>SYNC</th>
						<th>READY</th>
						<th>VOIP</th>
						<th>LINE1</th>
						<th>PSTN</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>ON/OFF</td>
						<td>ON</td>
						<td>ON/Blinking</td>
						<td>OFF/Blinking</td>
						<td>OFF/Blinking</td>
						<td>ON</td>
						<td>ON</td>
						<td>ON</td>
						<td>OFF</td>
						<td>OFF</td>
					</tr>
					</tbody>
				</table>
			</dd>
		</dl>
		</c:when>
		<c:when test="${guid==2 }">
		<dl>
			<dt>MNG-3500(VOIP) 전면</dt>
			<dd>
				<div><img src="../images/customer/3500_F.gif" width="611" height="204"/></div>
				<ul>
					<li><strong>LINE1</strong> : 케이블 모뎀에 연결된 전화기의 수화기를 든 상태를 나타냄</li>
					<li><strong>VOIP</strong> : 전화 기능이 준비되었음을 알려줍니다. (통화중일때는 점멸)</li>
					<li><strong>PC</strong> : 케이블 모뎀과 pc가 이더넷 케이블로 연결되었을 때 점등 (데이터 송/수신 중은 점멸)</li>
					<li><strong>ONLINE</strong> : 케이블 모뎀이 초기화 과정을 모두 끝내고 데이터 송수신 준비가 되어있음을 나타냄</li>
					<li><strong>SEND</strong> : 케이블 모뎀이 데이터 송신 중일 때 점멸</li>
					<li><strong>RECV</strong> : 케이블 모뎀이 데이터 수신 중일 때 점멸</li>
					<li><strong>PWR</strong> : 케이블 모뎀에 전원이 인가 되었을 때 점등</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>MNG-3500(VOIP) 후면</dt>
			<dd>
				<div><img src="../images/customer/3500_B.gif" width="567" height="215"/></div>
				<ul>
					<li><strong>Power</strong> : 전원케이블과 연결합니다.</li>
					<li><strong>Line1</strong> : 케이블 모뎀과 전화기를 연결합니다.</li>
					<li><strong>Ethernet</strong> : 케이블 모뎀과 LAN 케이블을 이용하여 PC와 연결합니다.</li>
					<li><strong>Cable</strong> : 동축 케이블을 케이블모뎀에 연결할 때 이용합니다.</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>정상작동상태</dt>
			<dd>
				<table class="customer_manual_table">
					<thead>
					<tr>
						<th>구분</th>
						<th>LINE1</th>
						<th>VOIP</th>
						<th>PC</th>
						<th>ONLINE</th>
						<th>SEND</th>
						<th>RECV</th>
						<th>PWR</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>ON/OFF</td>
						<td>OFF</td>
						<td>ON/Blinking</td>
						<td>ON/Blinking</td>
						<td>ON</td>
						<td>OFF/Blinking</td>
						<td>OFF/Blinking</td>
						<td>ON</td>
					</tr>
					</tbody>
				</table>
			</dd>
		</dl>
		</c:when>
		<c:when test="${guid==3 }">
		<dl>
			<dt>DPC-2100 전면</dt>
			<dd>
				<div><img src="../images/customer/2100_F.gif" width="562" height="219"/></div>
				<ul>
					<li><strong>PC</strong> : 케이블 모뎀과 pc가 이더넷 케이블로 연결되었을 때 점등 (데이터 송/수신 중은 점멸)</li>
					<li><strong>CABLE</strong> : 케이블 모뎀이 초기화 과정을 모두 끝내고 데이터 송수신 준비가 되어있음을 나타냄</li>
					<li><strong>SEND</strong> : 케이블 모뎀이 데이터 송신 중일 때 점멸</li>
					<li><strong>RECEIVE</strong> : 케이블 모뎀이 데이터 수신 중일 때 점멸</li>
					<li><strong>POWER</strong> : 케이블 모뎀에 전원이 인가 되었을 때 점등</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>DPC-2100 후면</dt>
			<dd>
				<div><img src="../images/customer/2100_B.gif" width="561" height="221"/></div>
				<ul>
					<li><strong>12 VDC</strong> : 전원 케이블과 연결합니다.</li>
					<li><strong>RST</strong> : 공장 초기화 상태고 변경합니다.</li>
					<li><strong>MAC</strong> : 케이블 모뎀의 고유번호인 MAC Address를 표기합니다.</li>
					<li><strong>ETHERNET</strong> : PC와 LAN 케이블을 연결합니다.</li>
					<li><strong>USB</strong> : USB 포트</li>
					<li><strong>CABLE</strong> : 동축케이블과 연결합니다.</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>정상작동상태</dt>
			<dd>
				<table class="customer_manual_table">
					<thead>
					<tr>
						<th>구분</th>
						<th>PC</th>
						<th>CABLE</th>
						<th>SEND</th>
						<th>RECEIVE</th>
						<th>POWER</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>ON/OFF</td>
						<td>ON/Blinking</td>
						<td>ON</td>
						<td>OFF/Blinking</td>
						<td>OFF/Blinking</td>
						<td>ON</td>
					</tr>
					</tbody>
				</table>
			</dd>
		</dl>
		</c:when>
		</c:choose>
	</div>
</div>