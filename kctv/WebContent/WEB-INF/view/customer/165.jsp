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
			<li class="manual_tab_menu"><a href="?muid=165&guid=0"><strong>����ڽ�</strong></a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=1">����Ʈī��/POD</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=2">������</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		</c:when>
		<c:when test="${guid==1 }">
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=0">����ڽ�</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=1"><strong>����Ʈī��/POD</strong></a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=2">������</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		</c:when>
		<c:when test="${guid==2 }">
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=0">����ڽ�</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=1">����Ʈī��/POD</a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		<ul>
			<li class="manual_tab_left"><img src="../images/customer/tab_left_r.gif" width="3" height="27" /></li>
			<li class="manual_tab_menu"><a href="?muid=165&guid=2"><strong>������</strong></a></li>
			<li class="manual_tab_right"><img src="../images/customer/tab_right_r.gif" width="5" height="27" /></li>
		</ul>
		</c:when>
		</c:choose>
	</div>
	<div id="customer_manual">
		<div><img src="../images/customer/c_title11.gif" width="225" height="18" alt="�����й�� ��뼳��" /></div>
		<c:choose>
		<c:when test="${guid==0 }">
		<dl>
			<dt>STB(Digital Set-top Box)</dt>
			<dd>
				����ڽ��� TV���� ���̴� �ڽ���� �ǹ��̴�.<br/>
				��۱����� ������ ������ ��ȣ.������ �޾� ���� �� �����ȣ�� ��ȯ ���ڵ��ϴ� ����� ���Ѵ�.<br/>
				���̺�TV, ������, ���� ���� ��۽�ȣ�� �ʰ������̳� ��ȭ���� ���� ������ ��� ������ ���� �� �ִ�.
			</dd>
		</dl>
		<dl>
			<dt>�� �κ��� ��Ī�� ���</dt>
			<dd>
				<ul>
					<li>
						<strong>��ü �ո�</strong>
						<div><img src="../images/customer/settop_hd.gif" width="550" height="250" alt="��ü �ո�" /></div>
						<div>
							<table class="customer_manual_table">
								<thead>
								<tr>
									<th>��ȣ</th>
									<th>��Ī</th>
									<th>���</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td>1</td>
									<td>������ư</td>
									<td>������ ��� ���ű⸦ ��� ����, �Ǵ� ���� ���·� �����մϴ�.<br/>�۵� ������ ��� �Ķ������� �����ϴ�.</td>
								</tr>
								<tr>
									<td>2</td>
									<td>�ð�/ä�� ǥ�� </td>
									<td>- ��� ���� : ���� �ð� ǥ��<br/>- �۵� ���� : ä�� ��ȣ ǥ��</td>
								</tr>
								<tr>
									<td>3</td>
									<td>���� ��ư</td>
									<td>�޴� ȭ�鿡�� �޴�, �Ǵ� �׸��� �����մϴ�.</td>
								</tr>
								<tr>
									<td>4</td>
									<td>ä��/���� ��ư</td>
									<td>[��][��] : �޴� �̵�, ä�� ����<br/>[��][��] : �޴��̵�, ���� ����</td>
								</tr>
								<tr>
									<td>5</td>
									<td>�޴� ��ư</td>
									<td>ä�� �޴� ȭ������ �̵��մϴ�.</td>
								</tr>
								<tr>
									<td>6</td>
									<td>���� ȭ�� ��ư</td>
									<td>����ȭ������ ���ư��ϴ�.</td>
								</tr>
								<tr>
									<td>7</td>
									<td>�ػ� ��ư</td>
									<td>���� �� ���� 480i/480P/720P/1080i�� �ػ󵵰� ����˴ϴ�.</td>
								</tr>
								<tr>
									<td>8</td>
									<td>USB ��Ʈ</td>
									<td>USB2.0 &nbsp;���� ��Ʈ�Դϴ�.(���� ��� ���� ����)</td>
								</tr>
								<tr>
									<td>9</td>
									<td>���̺� ī�� ����</td>
									<td>���̺� ī�带 �����ϴ� �����Դϴ�.</td>
								</tr>
								<tr>
									<td>10</td>
									<td>������/POD LED</td>
									<td>- ������ ���� : �������� ��ư�� ���� ��<br/>- �ʷϻ� ���� : ���̺� ī�尡 ���ԵǾ� ���� ��</td>
								</tr>
								<tr>
									<td>11</td>
									<td>���̺� �� LED</td>
									<td>�ʷϻ� ���� : ���̺� ���� �۵� ����</td>
								</tr>
								<tr>
									<td>12</td>
									<td>
									<P>�̴��� LED</P></td>
									<td>�ʷϻ� ���� : ��Ʈ��ũ ���� ����</td>
								</tr>
								<tr>
									<td>13</td>
									<td>��� ���� LED</td>
									<td>�ʷϻ� ���� : ��� ������ ������ ä���� ��</td>
								</tr>
								<tr>
									<td>14</td>
									<td>������ ���ź�</td>
									<td>������ ����� �����մϴ�.</td>
								</tr>
								</tbody>
							</table>
						</div>
					</li>
					<li>
						<strong>��ü �޸�</strong>
						<div><img src="../images/customer/settop_hd2.gif" width="550" height="461" alt="��ü �޸�" /></div>
					</li>
				</ul>
			</dd>
		</dl>
		</c:when>
		<c:when test="${guid==1 }">
		<dl>
			<dt>Smart Card</dt>
			<dd>
				����ȸ��(IC)�����ڸ� �����Ͽ� ��뷮�� ������ ���� �� �ִ� �̷��� ����ī��� ���뿵���� �پ��� ���̺�TV��<br/>
 				�־�� ���ᰡ���ڿ� ������ �������� �����ϴµ� Ȱ��. 
			</dd>
		</dl>
		<dl>
			<dt>POD (Point Of Deployment) ��������ī��</dt>
			<dd>
				���̺�TV ������ ������ ��� ������ �����ڷμ� Ȯ�ε� ��쿡 ���� ���̺�TV�� �������� �� �� �ְ� �ϴ�<br/>
				��������ī��(�ϸ�:���̺�TV ī��)�̴�. ������ ������ ���� ����Ʈī��� �Բ� PCMCIAī�� ���·� �����Ǿ� ������<br/>
				���̺�TV��ۻ���ڰ� �����ڿ��� �߱������μ� ����ڽ��� �Ⱦ� ������ �Ѵ�.<br/><br/>
				
				������ Ȯ���� ��ģ ���ᰡ���ڿ� ���ؼ��� ��ȣȭ�� ��ȣ�� Ǯ�� TV�� ��û�� �� �ְ� �Ѵ�. �̿� �Բ� POD�� SO��<br/>
				����ý��ۿ� ���� ���� �� ������ ������ ���������μ� ���Ἥ���� �پ��� ������ �����ϰ� �Ѵ�.<br/>
				���̺� ī��� ����ڽ��� �и��� �̷� ����� "���� ���̺�" �̶�� �Ѵ�.<br/>
			</dd>
		</dl>
		</c:when>
		<c:when test="${guid==2 }">
		<dl>
			<dt>������ ��뼳��</dt>
			<dd><div><img src="../images/customer/remote_img01.gif" width="605" height="457" alt="������ ��뼳��" /></div></dd>
		</dl>
		</c:when>
		</c:choose>
	</div>
</div>