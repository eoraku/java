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
		<div><img src="../images/customer/c_title12.gif" width="225" height="18" alt="���̺�� ��뼳��" /></div>
		<c:choose>
		<c:when test="${guid==0 }">
		<dl>
			<dt>MNG-2300 ����</dt>
			<dd>
				<div><img src="../images/customer/2300_f.gif" width="628" height="198"/></div>
				<ul>
					<li><strong>PWR</strong> : ������ �ΰ��Ǹ� ����</li>
					<li><strong>pwr</strong> : ������ �ΰ��Ǹ� LED�� ����</li>
					<li><strong>usb</strong> : Usb ���̺��� �̿��Ͽ�, PC�� ����� ����</li>
					<li><strong>pc</strong> : MNG-2300 �� PC�� �̴��� ���̺�� ���� �Ǿ��� �� ����<br/>�̴��� ���̺��� ���� MNG-2300 �� DATA�� �����ϰų� ���� ���� ���� �Ÿ��ϴ�.</li>
					<li><strong>tx</strong> : �ʱ�ȭ ������ ��� �����ϸ�, �ַ� ������ �۽Ž� �����մϴ�.</li>
					<li><strong>rx</strong> : ������ ���Ž� ���� �մϴ�.</li>
					<li><strong>sync</strong> : ���̺� �� ���� �ΰ���, ���� ��ȣ�� ã�� �� �����ϸ�, ���� ��ȣ�� ã�� ��, ����</li>
					<li><strong>rdy</strong> : ���� ��ȣ�� ã�� ����, ���� ��ȣ�� ã�� ��, ���� �ϸ�, ���� ��ȣ�� ã�� �� ��, ����</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>MNG-2300 �ĸ�</dt>
			<dd>
				<div><img src="../images/customer/2300_b.gif" width="628" height="193"/></div>
				<ul>
					<li><strong>power</strong> : �������̺�� �����մϴ�.</li>
					<li><strong>enet</strong> : �̴��� ���̺��� ����Ͽ� �𵩰� ��ǻ�͸� �����մϴ�.</li>
					<li><strong>usb</strong> : USB ���̺��� ����Ͽ� �𵩰� ��ǻ�͸� �����մϴ�.</li>
					<li><strong>cable</strong> : ���̺��� ���̺�𵩿� ������ �� �̿��մϴ�.</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>�����۵�����</dt>
			<dd>
				<table class="customer_manual_table">
					<thead>
					<tr>
						<th>����</th>
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
			<dt>MNG-3300(VOIP) ����</dt>
			<dd>
				<div><img src="../images/customer/3300_F.gif" width="618" height="210"/></div>
				<ul>
					<li><strong>PWR</strong> : ������ �ΰ��Ǹ� ����</li>
					<li><strong>PC</strong> : ���̺� �𵩰� LAN ���̺��� PC�� ����� ����</li>
					<li><strong>SEND</strong> : ���̺� ���� ������ ���۽� ����</li>
					<li><strong>RECV</strong> : ���̺� ���� ������ ���Ž� ����</li>
					<li><strong>SYNC</strong> : ���̺� ���� ���� ���ļ� �˻��� �Ϸ� �Ͽ��� �� ����</li>
					<li><strong>READY</strong> : ���̺� ���� ���� ��� �Ǿ��� �� ����</li>
					<li><strong>VOIP</strong> : ���̺� ���� ��ȭ���ɻ����Ͻ� ����</li>
					<li><strong>LINE1</strong> : ���̺� �𵩿� ����� ��ȭ���� ��ȭ�⸦ ����� �� ����</li>
					<li><strong>PSTN</strong> : PSTN���� ��ü�� ����</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>MNG-3300(VOIP) �ĸ�</dt>
			<dd>
				<div><img src="../images/customer/3300_B.gif" width="627" height="217"/></div>
				<ul>
					<li><strong>PWR</strong> : �������̺�� �����մϴ�.</li>
					<li><strong>PSTN</strong> : ������ ������� �Ϲ� ��ȭ���� �����մϴ�.(������ �������� �ʾƵ� ����)</li>
					<li><strong>LINE1 </strong>: ���̺� �𵩰� ��ȭ�⸦ �����մϴ�.</li>
					<li><strong>ENET</strong> : ���̺� �𵩰� LAN ���̺��� �̿��Ͽ� PC�� �����մϴ�.</li>
					<li><strong>CABLE</strong> : ���� ���̺��� ���̺�𵩿� ������ �� �̿��մϴ�.</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>�����۵�����</dt>
			<dd>
				<table class="customer_manual_table">
					<thead>
					<tr>
						<th>����</th>
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
			<dt>MNG-3500(VOIP) ����</dt>
			<dd>
				<div><img src="../images/customer/3500_F.gif" width="611" height="204"/></div>
				<ul>
					<li><strong>LINE1</strong> : ���̺� �𵩿� ����� ��ȭ���� ��ȭ�⸦ �� ���¸� ��Ÿ��</li>
					<li><strong>VOIP</strong> : ��ȭ ����� �غ�Ǿ����� �˷��ݴϴ�. (��ȭ���϶��� ����)</li>
					<li><strong>PC</strong> : ���̺� �𵩰� pc�� �̴��� ���̺�� ����Ǿ��� �� ���� (������ ��/���� ���� ����)</li>
					<li><strong>ONLINE</strong> : ���̺� ���� �ʱ�ȭ ������ ��� ������ ������ �ۼ��� �غ� �Ǿ������� ��Ÿ��</li>
					<li><strong>SEND</strong> : ���̺� ���� ������ �۽� ���� �� ����</li>
					<li><strong>RECV</strong> : ���̺� ���� ������ ���� ���� �� ����</li>
					<li><strong>PWR</strong> : ���̺� �𵩿� ������ �ΰ� �Ǿ��� �� ����</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>MNG-3500(VOIP) �ĸ�</dt>
			<dd>
				<div><img src="../images/customer/3500_B.gif" width="567" height="215"/></div>
				<ul>
					<li><strong>Power</strong> : �������̺�� �����մϴ�.</li>
					<li><strong>Line1</strong> : ���̺� �𵩰� ��ȭ�⸦ �����մϴ�.</li>
					<li><strong>Ethernet</strong> : ���̺� �𵩰� LAN ���̺��� �̿��Ͽ� PC�� �����մϴ�.</li>
					<li><strong>Cable</strong> : ���� ���̺��� ���̺�𵩿� ������ �� �̿��մϴ�.</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>�����۵�����</dt>
			<dd>
				<table class="customer_manual_table">
					<thead>
					<tr>
						<th>����</th>
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
			<dt>DPC-2100 ����</dt>
			<dd>
				<div><img src="../images/customer/2100_F.gif" width="562" height="219"/></div>
				<ul>
					<li><strong>PC</strong> : ���̺� �𵩰� pc�� �̴��� ���̺�� ����Ǿ��� �� ���� (������ ��/���� ���� ����)</li>
					<li><strong>CABLE</strong> : ���̺� ���� �ʱ�ȭ ������ ��� ������ ������ �ۼ��� �غ� �Ǿ������� ��Ÿ��</li>
					<li><strong>SEND</strong> : ���̺� ���� ������ �۽� ���� �� ����</li>
					<li><strong>RECEIVE</strong> : ���̺� ���� ������ ���� ���� �� ����</li>
					<li><strong>POWER</strong> : ���̺� �𵩿� ������ �ΰ� �Ǿ��� �� ����</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>DPC-2100 �ĸ�</dt>
			<dd>
				<div><img src="../images/customer/2100_B.gif" width="561" height="221"/></div>
				<ul>
					<li><strong>12 VDC</strong> : ���� ���̺�� �����մϴ�.</li>
					<li><strong>RST</strong> : ���� �ʱ�ȭ ���°� �����մϴ�.</li>
					<li><strong>MAC</strong> : ���̺� ���� ������ȣ�� MAC Address�� ǥ���մϴ�.</li>
					<li><strong>ETHERNET</strong> : PC�� LAN ���̺��� �����մϴ�.</li>
					<li><strong>USB</strong> : USB ��Ʈ</li>
					<li><strong>CABLE</strong> : �������̺�� �����մϴ�.</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>�����۵�����</dt>
			<dd>
				<table class="customer_manual_table">
					<thead>
					<tr>
						<th>����</th>
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