<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="common_top_menu">
	<dl id="dl_top_menu">
		<dd class="top_menu_side">
			<a href="#"><img src="${ctxRoot}images/common/main_menu01_out.png" width="68" height="32" alt="On Air"/></a>
			<div id="top_menu_sub_1" class="div_top_menu_sub">
				<div class="top_sub_body">
					<dl>
						<dd><a href="#" onclick="javascript:vod_live('${ctxRoot}',7);">종합채널 CH7</a></dd>
						<dd><a href="#" onclick="javascript:vod_live('${ctxRoot}',20);">정보채널 CH20</a></dd>
					</dl>
				</div>
			</div>
		</dd>
		<dd class="top_menu_side">
			<a href="${ctxRoot}contents/chGuide.htm?muid=31"><img src="${ctxRoot}images/common/main_menu02.png" width="84" height="32" alt="채널가이드"/></a>
			<div id="top_menu_sub_2" class="div_top_menu_sub">
				<div class="top_sub_body">
					<dl>
						<dd><a href="${ctxRoot}contents/chGuide.htm?muid=31">채널 편성표</a></dd>
						<dd><a href="${ctxRoot}contents/chGuide.htm?muid=32">하이라이트</a></dd>
					</dl>
				</div>
			</div>
		</dd>
		<dd class="top_menu_center">
			<a href="${ctxRoot}news/index.htm"><img src="${ctxRoot}images/common/main_menu03.png" width="59" height="32" alt="뉴스"/></a>
			<div id="top_menu_sub_3" class="div_top_menu_sub">
				<div class="top_sub_title">
					<dl>
						<dt><a href="${ctxRoot}news/index.htm"><img src="${ctxRoot}images/common/btn_sub3.png" width="107" height="27" alt="KCTV News"/></a></dt>
						<dd><a href="${ctxRoot}news/vod.htm"><img src="${ctxRoot}images/common/txt_sub_3_01.png" width="72" height="16" alt="뉴스 다시보기"/></a></dd>
						<dd><a href="${ctxRoot}news/schedule.htm"><img src="${ctxRoot}images/common/txt_sub_3_02.png" width="61" height="16" alt="뉴스 편성표"/></a></dd>
					</dl>
				</div>
				<div class="top_sub_body">
					<div>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_3_03.png" width="47" height="16" alt="최신뉴스"/></dt>
							<dd><a href="${ctxRoot }news/list.htm?guid=0">전체기사</a></dd>
							<dd><a href="${ctxRoot }news/list.htm?guid=1">정치/행정</a></dd>
							<dd><a href="${ctxRoot }news/list.htm?guid=2">경제/관광</a></dd>
							<dd><a href="${ctxRoot }news/list.htm?guid=3">사회/교육</a></dd>
							<dd><a href="${ctxRoot }news/list.htm?guid=4">문화/체육</a></dd>
						</dl>
					</div>
					<div>
						<dl>
							<dt><a href="${ctxRoot }eng/"><img src="${ctxRoot}images/common/txt_sub_3_04.png" width="120" height="16" alt="영어뉴스"/></a></dt>
						</dl>
						<dl>
							<dt><a href="${ctxRoot }cn/"><img src="${ctxRoot}images/common/txt_sub_3_05.png" width="110" height="16" alt="중국어뉴스"/></a></dt>
						</dl>
						<%-- <dl>
							<dt><a href="${ctxRoot }news/hotmovie.asp"><img src="${ctxRoot}images/common/txt_sub_3_06.png" width="57" height="16" alt="KCTV영상"/></a></dt>
						</dl> --%>
					</div>
					<div>
						<dl>
							<dt><a href="${ctxRoot }news/search.htm"><img src="${ctxRoot}images/common/txt_sub_3_07.png" width="47" height="16" alt="뉴스검색"/></a></dt>
						</dl>
						<dl>
							<dt><a href="${ctxRoot }news/report.htm"><img src="${ctxRoot}images/common/txt_sub_3_08.png" width="47" height="16" alt="뉴스제보"/></a></dt>
						</dl>
						<dl>
							<dt><a href="${ctxRoot }news/profile.htm"><img src="${ctxRoot}images/common/txt_sub_3_09.png" width="47" height="16" alt="기자소개"/></a></dt>
						</dl>
					</div>
				</div>
			</div>
		</dd>
		<dd class="top_menu_center">
			<a href="${ctxRoot}contents/program.htm?muid=217"><img src="${ctxRoot}images/common/main_menu04.png" width="84" height="32" alt="프로그램"/></a>
			<div id="top_menu_sub_4" class="div_top_menu_sub">
				<div class="top_sub_title">
					<dl>
						<dt><a href="${ctxRoot}contents/program.htm?muid=217"><img src="${ctxRoot}images/common/btn_sub4.png" width="107" height="27" alt="CH7 프로그램"/></a></dt>
						<%-- <dd><a href="${ctxRoot}contents/program.htm?muid=217"><img src="${ctxRoot}images/common/txt_sub_4_01.png" width="72" height="16" alt="프로그램 목록"/></a></dd> --%>
						<dd><a href="${ctxRoot}contents/program.htm?muid=113"><img src="${ctxRoot}images/common/txt_sub_4_02.png" width="76" height="16" alt="VOD 다시보기"/></a></dd>
						<dd><a href="${ctxRoot}contents/program.htm?muid=235"><img src="${ctxRoot}images/common/txt_sub_4_03.png" width="64" height="16" alt="CH7 편성표"/></a></dd>
						<dd><a href="${ctxRoot}contents/program.htm?muid=115"><img src="${ctxRoot}images/common/txt_sub_4_14.png" width="73" height="16" alt="아나운서 소개"/></a></dd>
					</dl>
				</div>
				<div class="top_sub_body">
					<div>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_4_04.png" width="28" height="16" alt="뉴스"/></dt>
							<dd><a href="${ctxRoot}news/">뉴스</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=238">영어뉴스</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=312">중국어뉴스</a></dd>
						</dl>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_4_06.png" width="54" height="16" alt="시사·교양"/></dt>
							<dd><a href="${ctxRoot}contents/program.htm?muid=515">JDC글로벌아카데미</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=87">열린 TV광장</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=521">시사토크7</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=113&maincd=0005&subcd=0516">제주소통아카데미</a></dd>
							<dd><a href="${ctxRoot}news/vod.htm?guid=18">KCTV초대석</a></dd>
						</dl>
					</div>
					<div>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_4_08.png" width="54" height="16" alt="오락·정보"/></dt>
							<!-- <dd><a href="${ctxRoot}contents/program.htm?muid=517">임PD의 제주 공감</a></dd> -->
							<!-- <dd><a href="${ctxRoot}contents/program.htm?muid=330">추천! VOD가 좋다</a></dd> -->
							<dd><a href="${ctxRoot}contents/program.htm?muid=54">삼춘 어디감수과</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=372">인사이드제주</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=365">자전거식객</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=529">산티아고 가는 길</a></dd>
						</dl>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_4_09.png" width="77" height="16" alt="KCTV특별기획"/></dt>
							
							<dd><a href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=1040">특집다큐</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=1001">특집프로그램</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=258">행사·공연·메세나</a></dd>
							<!-- <dd><a href="${ctxRoot}contents/program.htm?muid=113&maincd=0010&subcd=1006">중계방송</a></dd> -->
						</dl>
					</div>
					<div>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_4_10.png" width="54" height="16" alt="교육·건강"/></dt>
							<dd><a href="${ctxRoot}contents/program.htm?muid=214">챌린지퀴즈챔프</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=82">톡톡TV닥터</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=103">생활영어</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=111">생활일본어</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=107">생활중국어</a></dd>
						</dl>
						<dl>
							<dt><img src="${ctxRoot}images/common/txt_sub_4_07.png" width="63" height="16" alt="스포츠·레저"/></dt>
							<dd><a href="${ctxRoot}contents/program.htm?muid=73">스페셜피싱</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=59">KCTV경마</a></dd>
							<dd><a href="${ctxRoot}contents/program.htm?muid=265">KCTV스포츠</a></dd>
						</dl>
					</div>
				</div>
			</div>
		</dd>
		<dd class="top_menu_center">
			<a href="${ctxRoot}contents/product.htm?muid=293"><img src="${ctxRoot}images/common/main_menu05.png" width="84" height="32" alt="상품안내"/></a>
			<div id="top_menu_sub_5" class="div_top_menu_sub">
				<div class="top_sub_body">
					<dl>
						<dd><a href="${ctxRoot}contents/product.htm?muid=539">KCTV 알뜰폰</a></dd>
						<dd><a href="${ctxRoot}contents/product.htm?muid=293">DV 온</a></dd>
						<dd><a href="${ctxRoot}contents/product.htm?muid=300">DV 인</a></dd>
						<dd><a href="${ctxRoot}contents/product.htm?muid=297">DV 폰</a></dd>
						<dd><a href="${ctxRoot}contents/product.htm?muid=275">DV아이</a></dd>
						<dd><a href="${ctxRoot}contents/product.htm?muid=310">DV SET(결합상품)</a></dd>
						<dd><a href="${ctxRoot}contents/product.htm?muid=27">광고안내</a></dd>
					</dl>
				</div>
			</div>
		</dd>
		<dt class="top_menu_center"><a href="${ctxRoot}contents/program.htm?muid=173"><img src="${ctxRoot}images/common/main_menu06.png" width="97" height="32" alt="시청자의견"/></a></dt>
		<dd class="top_menu_center">
			<a href="${ctxRoot}contents/customer.htm?muid=203"><img src="${ctxRoot}images/common/main_menu07.png" width="96" height="32" alt="고객감동실"/></a>
			<div id="top_menu_sub_7" class="div_top_menu_sub">
				<div class="top_sub_body">
					<dl>
						<c:choose>
						<c:when test="${isLogin }">
						<dd><a href="${ctxRoot}contents/customer.htm?muid=128">서비스신청</a></dd>
						</c:when>
						<c:otherwise>
						<dd><a href="#" onclick="javascript:loginAlert();">서비스신청</a></dd>
						</c:otherwise>
						</c:choose>
						<dd><a href="${ctxRoot}contents/customer.htm?muid=139">ARS이용안내</a></dd>
						<dd><a href="${ctxRoot}contents/customer.htm?muid=165">사용설명서</a></dd>
						<dd><a href="${ctxRoot}contents/customer.htm?muid=129">AS신청</a></dd>
						<dd><a href="${ctxRoot}contents/customer.htm?muid=202">고객의소리</a></dd>
						<dd><strong><a href="${ctxRoot}contents/customer.htm?muid=203">자주묻는질문</a></strong></dd>
						<dd><strong><a href="${ctxRoot}contents/customer.htm?muid=259">응급조치요령</a></strong></dd>
					</dl>
				</div>
			</div>
		</dd>
		<dd class="top_menu_side">
			<a href="${ctxRoot}contents/company.htm?muid=143"><img src="${ctxRoot}images/common/main_menu08.png" width="59" height="32" alt="회사소개"/></a>
			<div id="top_menu_sub_8" class="div_top_menu_sub">
				<div class="top_sub_body">
					<dl>
						<dd><a href="${ctxRoot}contents/company.htm?muid=143">CEO인사말</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=204">회사연혁</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=360">비젼</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=361">사회공헌</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=362">윤리경영</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=363">인사/조직관리</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=146">조직도</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=196">회사CI</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=147">찾아오시는길</a></dd>
						<dd><a href="#" onclick="javascript:vod_wmv('/',24902);">KCTV 홍보영상</a></dd>
						<dd><a href="${ctxRoot}contents/company.htm?muid=117">공지사항</a></dd>
					</dl>
				</div>
			</div>
		</dd>
		<c:choose>
		<c:when test="${isLogin }">
		<dt class="top_menu_side"><a href="${ctxRoot}contents/customer.htm?muid=128"><img src="${ctxRoot}images/common/main_menu09.png" width="135" height="32" alt="온라인 가입신청/해지"/></a></dt>
		</c:when>
		<c:otherwise>
		<dt class="top_menu_side"><a href="#" onclick="javascript:loginAlert();"><img src="${ctxRoot}images/common/main_menu09.png" width="135" height="32" alt="온라인 가입신청/해지"/></a></dt>
		</c:otherwise>
		</c:choose>
	</dl>
</div>