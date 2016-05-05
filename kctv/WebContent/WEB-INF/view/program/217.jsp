<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div
	style="float: left; display: inline; width: 100%; height: 78px; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;">
	<img src="../images/program/topimg.gif" width="670" height="78" />
</div>
<link href="../css/template.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	function visibleDivTab(tabId, divId) {
		tabMenuHighlight(tabId);
		var contentsDiv = document.getElementById('tab_contents');
		for ( var i = 0; i < contentsDiv.children.length; i++) {
			contentsDiv.children[i].style.display = 'none';
		}
		var visibleDiv = document.getElementById(divId);
		visibleDiv.style.display = 'block';
	}

	function tabMenuHighlight(item) {
		var li = document.getElementById(item);
		for ( var i = 0; i < li.parentNode.children.length; i++) {
			li.parentNode.children[i].className = "";
		}
		li.className = "on";
	}
</script>
<div id="head_category">
	<ul>
		<li id="btn1" class="on" onclick="visibleDivTab(id, 'program_now');"><a>�濵
				���α׷�</a></li>
		<li id="btn2" onclick="visibleDivTab(id, 'program_special');"><a>Ư��
				���α׷�</a></li>
		<li id="btn3" onclick="visibleDivTab(id, 'program_end');"><a>����
				���α׷�</a></li>
	</ul>
</div>
<div id="tab_contents">
	<div class="program_boxes" id="program_now" style="display: block;">
		<div class="program_box">
			<div class="program_image">
				<a href="../news/vod.htm"><img
					src="../images/program/title2/news.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">KCTV����</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">10~40��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">KCTV</li>
				</ul>
			</div>
		</div>
		<!-- 
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot }contents/program.htm?muid=113&maincd=0010&subcd=1060"><img
					src="../images/program/title2/64ask.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">6.4���漱�� �﹮���</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">KCTV</li>
				</ul>
			</div>
		</div>
		 -->
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=214"><img
					src="../images/program/title2/chall.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">ç��������è��</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ������<br />AD : ������<br />�۰� : �̵���
					</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=372"><img
					src="../images/program/title2/inside_jeju.jpg" width="171"
					height="93" border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�λ��̵� ����</li>
					<!-- <li class="left"><img src="../images/program/program_time.gif" width="56" height="17" border="0"></li>
				<li class="right">10 ~ 20��</li> -->
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ���¹�, �Ӹ��<br />�۰� : ���ҿ�
					</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=82"><img
					src="../images/program/title2/cli_doctor.gif" width="171"
					height="93" border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">����TV����</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ������<br />�۰� : ������
					</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=73"><img
					src="../images/program/title2/fishing.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">������ǽ�</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">(ȭ) 09:00,18:00</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : �ΰ���</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=54"><img
					src="../images/program/title2/sam.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�����𰨼���</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">40��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ������</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a
					href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=1020"><img
					src="../images/program/title2/naceo.png" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">���� ����� CEO��</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">20��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : �����, ������</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=330"><img
					src="../images/program/title2/vod_program.jpg" width="171"
					height="93" border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">��õ! VOD�� ����</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">40��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ���α�</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=525"><img
					src="../images/program/title2/booltuk1.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">���ο��� ��ƺ���</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ������<br />�۰� : ��ȿ��
					</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=59"><img
					src="../images/program/title2/yeong.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">KCTV�渶</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ������</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="/news/vod.htm?guid=18"><img
					src="../images/program/title2/inv.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">KCTV�ʴ뼮</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ������</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=87"><img
					src="../images/program/title2/culture2.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">����TV����</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">KCTV</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=265"><img
					src="../images/program/title2/sport.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">KCTV������</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30�� ~ 1�ð�</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">KCTV</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=238"><img
					src="../images/program/title2/english.png" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�����</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">20��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">������</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=312"><img
					src="../images/program/title2/chi_main.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�߱����</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">10��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">��̼�</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=515"><img
					src="../images/program/title2/glo.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">JDC�۷ι���ī����</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ���¹�</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=103"><img
					src="../images/program/title2/hi.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">Hi jeju</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">10��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">������</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=111"><img
					src="../images/program/title2/jap.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">����������</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">10��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">������</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=106"><img
					src="../images/program/title2/chi.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">���Ͽ�����</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">10��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">������</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="program_boxes" id="program_special" style="display: none;">
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=365&subPage=intro"><img
					src="../images/program/title2/bicycle_thumb.png" width="171"
					height="93" border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�����Žİ�</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ���¹�<br />�۰� : �����
					</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=529"><img
					src="../images/program/title2/title_solbit1.jpg" width="171"
					height="93" border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title" style="line-height: 110%;">�ֺ��� ������<br />��Ƽ�ư�
						���� ��
					</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : �Ӹ��<br />�۰� : �����
					</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a
					href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=1030"><img
					src="../images/program/title2/gasiri.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title" style="line-height: 110%;">������<br />
						���� ���� ���ø�
					</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ���¹�<br /></li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a
					href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=1040"><img
					src="../images/program/title2/docu.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">KCTV Ư�� ��ť</li>
					<!-- 
				<li class="left"><img src="../images/program/program_per.gif" width="56" height="17" border="0"></li>
				<li class="right"><br/></li>
				 -->
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}news/vod.htm?guid=19"><img
					src="../images/program/title2/special.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">KCTVƯ�����</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30�� ~ 1�ð�</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">KCTV</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=113&maincd=0006&subcd=888"><img
					src="../images/program/title2/taekwon.png" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">��ȭ�� �±ǵ� ��ȸ</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">KCTV
					</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a
					href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=1009"><img
					src="../images/program/title2/kimdol.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�������� �� �̾߱�</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ���¹�</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a
					href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=1050"><img
					src="../images/program/title2/nanum.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�ٹ�ȭ ����������Ʈ</li>
					<!-- 
				<li class="left"><img src="../images/program/program_per.gif" width="56" height="17" border="0"></li>
				<li class="right"><br/></li>
				 -->
				</ul>
			</div>
		</div>
	</div>
	<div class="program_boxes" id="program_end" style="display: none;">
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=517"><img
					src="../images/program/title2/title_impd1.jpg" width="171"
					height="93" border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">��PD�� ���� ����</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">20��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : �Ӹ��<br />�۰� : �����
					</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=296"><img
					src="../images/program/title2/olle.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�ٶ��� �� ���ֿ÷�</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ������</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=521"><img
					src="../images/program/title2/sisa7.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�û���ũ7</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">KCTV</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=375"><img
					src="../images/program/title2/lovecable.png" width="171"
					height="93" border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�������̺� ����</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">40��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ������</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=287"><img
					src="../images/program/title2/sisa.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�û��� ����</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">20��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ����, ������</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=69"><img
					src="../images/program/title2/scu.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">Scuba����Ʈ</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : �Ѱ濱</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=284"><img
					src="../images/program/title2/golf.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">��ȣȸ �����ְ���</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ������</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=270"><img
					src="../images/program/title2/tree.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�������丮 3������</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ������, ���¹�</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=100"><img
					src="../images/program/title2/mm.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">6mm��û�ڼ���</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">���¿�</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=268"><img
					src="../images/program/title2/apt.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">�츮 ����Ʈ�� ������</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ���¹�</li>
				</ul>
			</div>
		</div>
		<div class="program_box">
			<div class="program_image">
				<a href="${ctxRoot}contents/program.htm?muid=354"><img
					src="../images/program/title2/rain.jpg" width="171" height="93"
					border="0"></a>
			</div>
			<div class="program_infos">
				<ul>
					<li class="left"><img src="../images/program/program_name.gif"
						width="56" height="17" border="0"></li>
					<li class="right_title">���κ�������</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50��</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : ���¹�</li>
				</ul>
			</div>
		</div>
	</div>
</div>