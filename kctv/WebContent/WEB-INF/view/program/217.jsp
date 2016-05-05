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
		<li id="btn1" class="on" onclick="visibleDivTab(id, 'program_now');"><a>방영
				프로그램</a></li>
		<li id="btn2" onclick="visibleDivTab(id, 'program_special');"><a>특집
				프로그램</a></li>
		<li id="btn3" onclick="visibleDivTab(id, 'program_end');"><a>종영
				프로그램</a></li>
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
					<li class="right_title">KCTV뉴스</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">10~40분</li>
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
					<li class="right_title">6.4지방선거 즉문즉답</li>
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
					<li class="right_title">챌린지퀴즈챔프</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 현동협<br />AD : 진봉준<br />작가 : 이도연
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
					<li class="right_title">인사이드 제주</li>
					<!-- <li class="left"><img src="../images/program/program_time.gif" width="56" height="17" border="0"></li>
				<li class="right">10 ~ 20분</li> -->
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 이태민, 임명순<br />작가 : 강소영
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
					<li class="right_title">톡톡TV닥터</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 현동협<br />작가 : 김현주
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
					<li class="right_title">스페셜피싱</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">(화) 09:00,18:00</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 부강언</li>
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
					<li class="right_title">삼춘어디감수과</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">40분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 김정혁</li>
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
					<li class="right_title">나는 골목의 CEO다</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">20분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 양상현, 현승헌</li>
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
					<li class="right_title">추천! VOD가 좋다</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">40분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 차민규</li>
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
					<li class="right_title">불턱에서 골아봅주</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 김정혁<br />작가 : 김효선
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
					<li class="right_title">KCTV경마</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 김정혁</li>
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
					<li class="right_title">KCTV초대석</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 최형석</li>
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
					<li class="right_title">열린TV광장</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50분</li>
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
					<li class="right_title">KCTV스포츠</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30분 ~ 1시간</li>
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
					<li class="right_title">영어뉴스</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">20분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">부혜선</li>
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
					<li class="right_title">중국어뉴스</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">10분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">김미수</li>
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
					<li class="right_title">JDC글로벌아카데미</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 이태민</li>
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
					<li class="right">10분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">현동협</li>
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
					<li class="right_title">곤니찌와제주</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">10분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">현동협</li>
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
					<li class="right_title">니하오제주</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">10분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">현동협</li>
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
					<li class="right_title">자전거식객</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 이태민<br />작가 : 조경아
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
					<li class="right_title" style="line-height: 110%;">솔빛별 가족의<br />산티아고
						가는 길
					</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 임명순<br />작가 : 조경아
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
					<li class="right_title" style="line-height: 110%;">제주의<br />
						슬픈 보석 가시리
					</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 이태민<br /></li>
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
					<li class="right_title">KCTV 특집 다큐</li>
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
					<li class="right_title">KCTV특별방송</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30분 ~ 1시간</li>
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
					<li class="right_title">평화기 태권도 대회</li>
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
					<li class="right_title">김유정의 돌 이야기</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 이태민</li>
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
					<li class="right_title">다문화 나눔프로젝트</li>
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
					<li class="right_title">임PD의 제주 공감</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">20분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 임명순<br />작가 : 조경아
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
					<li class="right_title">바람의 길 제주올레</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 현승헌</li>
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
					<li class="right_title">시사토크7</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50분</li>
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
					<li class="right_title">러브케이블 데이</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">40분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 김정혁</li>
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
					<li class="right_title">시사인 제주</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">20분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 고문수, 이정훈</li>
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
					<li class="right_title">Scuba리포트</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 한경엽</li>
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
					<li class="right_title">동호회 골프최강전</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 김정혁</li>
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
					<li class="right_title">웰빙스토리 3色제주</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 현승헌, 이태민</li>
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
					<li class="right_title">6mm시청자세상</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">정승원</li>
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
					<li class="right_title">우리 아파트로 오세요</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">30분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 이태민</li>
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
					<li class="right_title">래인보우제주</li>
					<li class="left"><img src="../images/program/program_time.gif"
						width="56" height="17" border="0"></li>
					<li class="right">50분</li>
					<li class="left"><img src="../images/program/program_per.gif"
						width="56" height="17" border="0"></li>
					<li class="right">PD : 이태민</li>
				</ul>
			</div>
		</div>
	</div>
</div>