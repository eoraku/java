<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="common_top_menu">
	<dl id="dl_top_menu">
		<dd class="top_menu_side">
			<a href="#"><img src="${ctxRoot}images/common/main_menu01_out.png" width="68" height="32" alt="On Air"/></a>
			<div id="top_menu_sub_1" class="div_top_menu_sub">
				<div class="top_sub_body">
					<dl>
						<dd><a href="#" onclick="javascript:vod_live('${ctxRoot}',7);">����ä�� CH7</a></dd>
						<dd><a href="#" onclick="javascript:vod_live('${ctxRoot}',20);">����ä�� CH20</a></dd>
					</dl>
				</div>
			</div>
		</dd>
		<dd class="top_menu_side">
			<a href="${ctxRoot}contents/chGuide.htm?muid=31"><img src="${ctxRoot}images/common/main_menu02.png" width="84" height="32" alt="ä�ΰ��̵�"/></a>
			<div id="top_menu_sub_2" class="div_top_menu_sub">
				<div class="top_sub_body">
					<dl>
						<dd><a href="${ctxRoot}contents/chGuide.htm?muid=31">ä�� ��ǥ</a></dd>
						<dd><a href="${ctxRoot}contents/chGuide.htm?muid=32">���̶���Ʈ</a></dd>
					</dl>
				</div>
			</div>
		</dd>
		<dd class="top_menu_center">
			<a href="${ctxRoot}news/index.htm"><img src="${ctxRoot}images/common/main_menu03.png" width="59" height="32" alt="����"/></a>
			<div id="top_menu_sub_3" class="div_top_menu_sub">
				<div class="top_sub_title">
					<dl>
						<dt><a href="${ctxRoot}news/index.htm"><img src="${ctxRoot}images/common/btn_sub3.png" width="107" height="27" alt="KCTV News"/></a></dt>
						<dd><a href="${ctxRoot}news/vod.htm"><img src="${ctxRoot}images/common/txt_sub_3_01.png" width="72" height="16" alt="���� �ٽú���"/></a></dd>
						<dd><a href="${ctxRoot}news/schedule.htm"><img src="${ctxRoot}images/common/txt_sub_3_02.png" width="61" height="16" alt="���� ��ǥ"/></a></dd>
					</dl>
				</div>
				<div class="top_sub_body">
					<div>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_3_03.png" width="47" height="16" alt="�ֽŴ���"/></dt>
							<dd><a href="${ctxRoot }news/list.htm?guid=0">��ü���</a></dd>
							<dd><a href="${ctxRoot }news/list.htm?guid=1">��ġ/����</a></dd>
							<dd><a href="${ctxRoot }news/list.htm?guid=2">����/����</a></dd>
							<dd><a href="${ctxRoot }news/list.htm?guid=3">��ȸ/����</a></dd>
							<dd><a href="${ctxRoot }news/list.htm?guid=4">��ȭ/ü��</a></dd>
						</dl>
					</div>
					<div>
						<dl>
							<dt><a href="${ctxRoot }eng/"><img src="${ctxRoot}images/common/txt_sub_3_04.png" width="120" height="16" alt="�����"/></a></dt>
						</dl>
						<dl>
							<dt><a href="${ctxRoot }cn/"><img src="${ctxRoot}images/common/txt_sub_3_05.png" width="110" height="16" alt="�߱����"/></a></dt>
						</dl>
						<%-- <dl>
							<dt><a href="${ctxRoot }news/hotmovie.asp"><img src="${ctxRoot}images/common/txt_sub_3_06.png" width="57" height="16" alt="KCTV����"/></a></dt>
						</dl> --%>
					</div>
					<div>
						<dl>
							<dt><a href="${ctxRoot }news/search.htm"><img src="${ctxRoot}images/common/txt_sub_3_07.png" width="47" height="16" alt="�����˻�"/></a></dt>
						</dl>
						<dl>
							<dt><a href="${ctxRoot }news/report.htm"><img src="${ctxRoot}images/common/txt_sub_3_08.png" width="47" height="16" alt="��������"/></a></dt>
						</dl>
						<dl>
							<dt><a href="${ctxRoot }news/profile.htm"><img src="${ctxRoot}images/common/txt_sub_3_09.png" width="47" height="16" alt="���ڼҰ�"/></a></dt>
						</dl>
					</div>
				</div>
			</div>
		</dd>
		<dd class="top_menu_center">
			<a href="${ctxRoot}contents/program.htm?muid=217"><img src="${ctxRoot}images/common/main_menu04.png" width="84" height="32" alt="���α׷�"/></a>
			<div id="top_menu_sub_4" class="div_top_menu_sub">
				<div class="top_sub_title">
					<dl>
						<dt><a href="${ctxRoot}contents/program.htm?muid=217"><img src="${ctxRoot}images/common/btn_sub4.png" width="107" height="27" alt="CH7 ���α׷�"/></a></dt>
						<%-- <dd><a href="${ctxRoot}contents/program.htm?muid=217"><img src="${ctxRoot}images/common/txt_sub_4_01.png" width="72" height="16" alt="���α׷� ���"/></a></dd> --%>
						<dd><a href="${ctxRoot}contents/program.htm?muid=113"><img src="${ctxRoot}images/common/txt_sub_4_02.png" width="76" height="16" alt="VOD �ٽú���"/></a></dd>
						<dd><a href="${ctxRoot}contents/program.htm?muid=235"><img src="${ctxRoot}images/common/txt_sub_4_03.png" width="64" height="16" alt="CH7 ��ǥ"/></a></dd>
						<dd><a href="${ctxRoot}contents/program.htm?muid=115"><img src="${ctxRoot}images/common/txt_sub_4_14.png" width="73" height="16" alt="�Ƴ�� �Ұ�"/></a></dd>
					</dl>
				</div>
				<div class="top_sub_body">
					<div>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_4_04.png" width="28" height="16" alt="����"/></dt>
							<dd><a href="${ctxRoot}news/">����</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=238">�����</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=312">�߱����</a></dd>
						</dl>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_4_06.png" width="54" height="16" alt="�û硤����"/></dt>
							<dd><a href="${ctxRoot}contents/program.htm?muid=515">JDC�۷ι���ī����</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=87">���� TV����</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=521">�û���ũ7</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=113&maincd=0005&subcd=0516">���ּ����ī����</a></dd>
							<dd><a href="${ctxRoot}news/vod.htm?guid=18">KCTV�ʴ뼮</a></dd>
						</dl>
					</div>
					<div>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_4_08.png" width="54" height="16" alt="����������"/></dt>
							<!-- <dd><a href="${ctxRoot}contents/program.htm?muid=517">��PD�� ���� ����</a></dd> -->
							<!-- <dd><a href="${ctxRoot}contents/program.htm?muid=330">��õ! VOD�� ����</a></dd> -->
							<dd><a href="${ctxRoot}contents/program.htm?muid=54">���� ��𰨼���</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=372">�λ��̵�����</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=365">�����Žİ�</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=529">��Ƽ�ư� ���� ��</a></dd>
						</dl>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_4_09.png" width="77" height="16" alt="KCTVƯ����ȹ"/></dt>
							
							<dd><a href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=1040">Ư����ť</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=1001">Ư�����α׷�</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=258">��硤�������޼���</a></dd>
							<!-- <dd><a href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=1006">�߰���</a></dd> -->
						</dl>
					</div>
					<div>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_4_10.png" width="54" height="16" alt="�������ǰ�"/></dt>
							<dd><a href="${ctxRoot}contents/program.htm?muid=214">ç��������è��</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=82">����TV����</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=103">��Ȱ����</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=111">��Ȱ�Ϻ���</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=107">��Ȱ�߱���</a></dd>
						</dl>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_4_07.png" width="63" height="16" alt="������������"/></dt>
							<dd><a href="${ctxRoot}contents/program.htm?muid=73">������ǽ�</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=59">KCTV�渶</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=265">KCTV������</a></dd>
						</dl>
					</div>
				</div>
			</div>
		</dd>
		<dd class="top_menu_center">
			<a href="${ctxRoot}contents/product.htm?muid=293"><img src="${ctxRoot}images/common/main_menu05.png" width="84" height="32" alt="��ǰ�ȳ�"/></a>
			<div id="top_menu_sub_5" class="div_top_menu_sub">
				<div class="top_sub_body">
					<dl>
						<dd><a href="${ctxRoot}contents/product.htm?muid=539">KCTV �˶���</a></dd>
						<dd><a href="${ctxRoot}contents/product.htm?muid=293">DV ��</a></dd>
						<dd><a href="${ctxRoot}contents/product.htm?muid=300">DV ��</a></dd>
						<dd><a href="${ctxRoot}contents/product.htm?muid=297">DV ��</a></dd>
						<dd><a href="${ctxRoot}contents/product.htm?muid=275">DV����</a></dd>
						<dd><a href="${ctxRoot}contents/product.htm?muid=310">DV SET(���ջ�ǰ)</a></dd>
						<dd><a href="${ctxRoot}contents/product.htm?muid=27">����ȳ�</a></dd>
					</dl>
				</div>
			</div>
		</dd>
		<dt class="top_menu_center"><a href="${ctxRoot}contents/program.htm?muid=173"><img src="${ctxRoot}images/common/main_menu06.png" width="97" height="32" alt="��û���ǰ�"/></a></dt>
		<dd class="top_menu_center">
			<a href="${ctxRoot}contents/customer.htm?muid=203"><img src="${ctxRoot}images/common/main_menu07.png" width="96" height="32" alt="��������"/></a>
			<div id="top_menu_sub_7" class="div_top_menu_sub">
				<div class="top_sub_body">
					<dl>
						<c:choose>
						<c:when test="${isLogin }">
						<dd><a href="${ctxRoot}contents/customer.htm?muid=128">���񽺽�û</a></dd>
						</c:when>
						<c:otherwise>
						<dd><a href="#" onclick="javascript:loginAlert();">���񽺽�û</a></dd>
						</c:otherwise>
						</c:choose>
						<dd><a href="${ctxRoot}contents/customer.htm?muid=139">ARS�̿�ȳ�</a></dd>
						<dd><a href="${ctxRoot}contents/customer.htm?muid=165">��뼳��</a></dd>
						<dd><a href="${ctxRoot}contents/customer.htm?muid=129">AS��û</a></dd>
						<dd><a href="${ctxRoot}contents/customer.htm?muid=202">���ǼҸ�</a></dd>
						<dd><strong><a href="${ctxRoot}contents/customer.htm?muid=203">���ֹ�������</a></strong></dd>
						<dd><strong><a href="${ctxRoot}contents/customer.htm?muid=259">������ġ���</a></strong></dd>
					</dl>
				</div>
			</div>
		</dd>
		<dd class="top_menu_side">
			<a href="${ctxRoot}contents/company.htm?muid=143"><img src="${ctxRoot}images/common/main_menu08.png" width="59" height="32" alt="ȸ��Ұ�"/></a>
			<div id="top_menu_sub_8" class="div_top_menu_sub">
				<div class="top_sub_body">
					<dl>
						<dd><a href="${ctxRoot}contents/company.htm?muid=143">CEO�λ縻</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=204">ȸ�翬��</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=360">����</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=361">��ȸ����</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=362">�����濵</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=363">�λ�/��������</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=146">������</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=196">ȸ��CI</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=147">ã�ƿ��ô±�</a></dd>
						<dd><a href="#" onclick="javascript:vod_wmv('/',24902);">KCTV ȫ������</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=117">��������</a></dd>
					</dl>
				</div>
			</div>
		</dd>
		<c:choose>
		<c:when test="${isLogin }">
		<dt class="top_menu_side"><a href="${ctxRoot}contents/customer.htm?muid=128"><img src="${ctxRoot}images/common/main_menu09.png" width="135" height="32" alt="�¶��� ���Խ�û/����"/></a></dt>
		</c:when>
		<c:otherwise>
		<dt class="top_menu_side"><a href="#" onclick="javascript:loginAlert();"><img src="${ctxRoot}images/common/main_menu09.png" width="135" height="32" alt="�¶��� ���Խ�û/����"/></a></dt>
		</c:otherwise>
		</c:choose>
	</dl>
</div>