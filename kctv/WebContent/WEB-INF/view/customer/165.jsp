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
			<li class="manual_tab_menu"><a href="?muid=165&guid=0"><strong>셋톱박스</strong></a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=1">스마트카드/POD</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=2">리모콘</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		</c:when>
		<c:when test="${guid==1 }">
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=0">셋톱박스</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=1"><strong>스마트카드/POD</strong></a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=2">리모콘</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		</c:when>
		<c:when test="${guid==2 }">
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=0">셋톱박스</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=1">스마트카드/POD</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=2"><strong>리모콘</strong></a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		</c:when>
		</c:choose>
	</div>
	<div id="customer_manual">
		<div><img src="../images/customer/c_title11.gif" width="225" height="18" alt="디지털방송 사용설명서" /></div>
		<c:choose>
		<c:when test="${guid==0 }">
		<dl>
			<dt>STB(Digital Set-top Box)</dt>
			<dd>
				셋톱박스란 TV위에 놓이는 박스라는 의미이다.<br/>
				방송국에서 보내는 디지털 신호.정보를 받아 음성 및 영상신호로 변환 디코딩하는 기능을 말한다.<br/>
				케이블TV, 지상파, 위성 등의 방송신호와 초고속통신이나 전화망을 통해 들어오는 모든 정보를 받을 수 있다.
			</dd>
		</dl>
		<dl>
			<dt>각 부분의 명칭과 기능</dt>
			<dd>
				<ul>
					<li>
						<strong>본체 앞면</strong>
						<div><img src="../images/customer/settop_hd.gif" width="550" height="250" alt="본체 앞면" /></div>
						<div>
							<table class="customer_manual_table">
								<thead>
								<tr>
									<th>번호</th>
									<th>명칭</th>
									<th>기능</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td>1</td>
									<td>전원버튼</td>
									<td>디지털 방송 수신기를 대기 상태, 또는 동작 상태로 변경합니다.<br/>작동 상태인 경우 파란색으로 켜집니다.</td>
								</tr>
								<tr>
									<td>2</td>
									<td>시각/채널 표시 </td>
									<td>- 대기 상태 : 현재 시각 표시<br/>- 작동 상태 : 채널 번호 표시</td>
								</tr>
								<tr>
									<td>3</td>
									<td>선택 버튼</td>
									<td>메뉴 화면에서 메뉴, 또는 항목을 선택합니다.</td>
								</tr>
								<tr>
									<td>4</td>
									<td>채널/음량 버튼</td>
									<td>[△][▽] : 메뉴 이동, 채널 선택<br/>[◁][▷] : 메뉴이동, 음량 선택</td>
								</tr>
								<tr>
									<td>5</td>
									<td>메뉴 버튼</td>
									<td>채널 메뉴 화면으로 이동합니다.</td>
								</tr>
								<tr>
									<td>6</td>
									<td>이전 화면 버튼</td>
									<td>이전화면으로 돌아갑니다.</td>
								</tr>
								<tr>
									<td>7</td>
									<td>해상도 버튼</td>
									<td>누를 때 마다 480i/480P/720P/1080i로 해상도가 변경됩니다.</td>
								</tr>
								<tr>
									<td>8</td>
									<td>USB 포트</td>
									<td>USB2.0 &nbsp;연결 포트입니다.(향후 기능 제공 예정)</td>
								</tr>
								<tr>
									<td>9</td>
									<td>케이블 카드 슬롯</td>
									<td>케이블 카드를 삽입하는 슬롯입니다.</td>
								</tr>
								<tr>
									<td>10</td>
									<td>리모컨/POD LED</td>
									<td>- 빨간색 켜짐 : 리모컨의 버튼을 누를 때<br/>- 초록색 켜짐 : 케이블 카드가 삽입되어 있을 때</td>
								</tr>
								<tr>
									<td>11</td>
									<td>케이블 모뎀 LED</td>
									<td>초록색 켜짐 : 케이블 모뎀의 작동 상태</td>
								</tr>
								<tr>
									<td>12</td>
									<td>
									<P>이더넷 LED</P></td>
									<td>초록색 켜짐 : 네트워크 연결 상태</td>
								</tr>
								<tr>
									<td>13</td>
									<td>방송 수신 LED</td>
									<td>초록색 켜짐 : 방송 수신이 가능한 채널일 때</td>
								</tr>
								<tr>
									<td>14</td>
									<td>리모컨 수신부</td>
									<td>리모컨 명령을 수신합니다.</td>
								</tr>
								</tbody>
							</table>
						</div>
					</li>
					<li>
						<strong>본체 뒷면</strong>
						<div><img src="../images/customer/settop_hd2.gif" width="550" height="461" alt="본체 뒷면" /></div>
					</li>
				</ul>
			</dd>
		</dl>
		</c:when>
		<c:when test="${guid==1 }">
		<dl>
			<dt>Smart Card</dt>
			<dd>
				직접회로(IC)기억소자를 장착하여 대용량의 정보를 담을 수 있는 미래형 선불카드로 응용영역이 다양해 케이블TV에<br/>
 				있어서는 유료가입자에 선별적 콘텐츠를 제공하는데 활용. 
			</dd>
		</dl>
		<dl>
			<dt>POD (Point Of Deployment) 수신제한카드</dt>
			<dd>
				케이블TV 가입자 정보를 담고 있으며 가입자로서 확인된 경우에 한해 케이블TV의 유료방송을 볼 수 있게 하는<br/>
				수신제한카드(일명:케이블TV 카드)이다. 가입자 정보를 담은 스마트카드와 함께 PCMCIA카드 형태로 구성되어 있으며<br/>
				케이블TV방송사업자가 가입자에게 발급함으로서 셋톱박스에 꽂아 사용토록 한다.<br/><br/>
				
				가입자 확인을 거친 유료가입자에 한해서만 암호화된 신호를 풀어 TV를 시청할 수 있게 한다. 이와 함께 POD는 SO의<br/>
				송출시스템에 대해 과금 및 가입자 관리를 전송함으로서 유료서비스의 다양한 과금을 가능하게 한다.<br/>
				케이블 카드와 셋톱박스를 분리한 이런 방식을 "오픈 케이블" 이라고 한다.<br/>
			</dd>
		</dl>
		</c:when>
		<c:when test="${guid==2 }">
		<dl>
			<dt>리모콘 사용설명</dt>
			<dd><div><img src="../images/customer/remote_img01.gif" width="605" height="457" alt="리모콘 사용설명" /></div></dd>
		</dl>
		</c:when>
		</c:choose>
	</div>
</div>