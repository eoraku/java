<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="impd_top">
	<img src="../images/program/solbit/sol_top.jpg" width="720" height="361"/>
</div>
<div id="impd_menu">
	<ul>
		<li><img src="../images/program/solbit/sol_00.jpg" width="42" height="44"/></li>
		<c:choose>
		<c:when test="${guid==529 }">
		<li><a href="${ctxRoot}contents/program.htm?muid=529&guid=529"><img src="../images/program/solbit/sol_11.jpg" width="98" height="44" alt="솔빛별 가족"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=529&guid=530"><img src="../images/program/solbit/sol_20.jpg" width="140" height="44" alt="산티아고 가는 길"/></a></li>
		</c:when>
		<c:otherwise>
		<li><a href="${ctxRoot}contents/program.htm?muid=529&guid=529"><img src="../images/program/solbit/sol_10.jpg" width="98" height="44" alt="솔빛별 가족"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=529&guid=530"><img src="../images/program/solbit/sol_21.jpg" width="140" height="44" alt="산티아고 가는 길"/></a></li>
		</c:otherwise>
		</c:choose>
		<li><a href="${ctxRoot}contents/program.htm?muid=529&guid=531"><img src="../images/program/solbit/sol_30.jpg" width="117" height="44" alt="방송다시보기"/></a></li>
		<li><a href="${ctxRoot}contents/program.htm?muid=529&guid=532"><img src="../images/program/solbit/sol_40.jpg" width="110" height="44" alt="시청자 게시판"/></a></li>
		<li><img src="../images/program/solbit/sol_50.jpg" width="213" height="44"/></li>
	</ul>
</div>
<div id="program_intro" style="padding:20px;line-height:160%;">
<c:choose>
<c:when test="${guid==529 }">
<P><BR><STRONG><SPAN style="COLOR: #ff6c00; FONT-SIZE: 18pt">솔빛별 가족</SPAN></STRONG></P><BR>
<P>누구나 한번쯤 꿈꾸게 되는 세계일주 여행! <BR>
여기, 다니던 직장과 학교를 그만두고 훌쩍 세계일주를 갔다 온 별난 가족이 있다.<BR>
1997년과 2002년...&nbsp; 두 차례에 걸쳐 전세계 40여 개국을 여행한 솔빛별 가족...<BR>
‘미래는 즐겁게 도전하는 사람의 것이다’라는 가훈대로<BR>
세상을 향해 멋진 도전을 해온 그들이다.</P>
<img style="margin-top:10px;margin-bottom:10px;" src="../images/program/solbit/solbit1.jpg" width="480" height="270"/>
<P>그로부터 10년 후...<BR>
남들과는 다른 선택을 하며 독특한 삶을 살아 화제를 일으켰던 그들은<BR>
푸른 섬 제주에 보금자리를 틀고 자연을 벗삼아 자유롭게 살고 있다.<BR>
신문기자와 방송 일로 한때 치열한 삶을 살던 아빠 조영호씨는<BR>
한라산 기슭에서 녹차밭을 일구는 평범한 농부로...<BR>
30여년 세월, 시노래 작곡을 하는 엄마 노명희씨는<BR>
좋은 음악을 만들겠다는 일념으로 여전히 곡을 쓰고 있다.<BR>
그 사이 훌쩍 자란 조예솔, 조한빛, 조한별 세 딸은<BR>
미국으로 건너가 영화와 마케팅, 철학 분야 등을 전공!<BR>
올 봄, 빛나는 졸업장과 함께 다시 한국으로 돌아왔다.<BR><BR>
막막하고 불투명한 미래를 앞에 두고 그들이 선택한 것은,<BR>
취업 스펙 쌓기가 아니라 바로 산티아고 순례길을 걷는 것!<BR>
프랑스 시골마을에서 출발해 스페인의 산티아고 대성당까지<BR>
하루 25km를 걷는 총 40일간의 순례여행을 시작하려고 하는데....</P>
<img style="margin-top:10px;margin-bottom:10px;" src="../images/program/solbit/solbit2.jpg" width="480" height="270"/>
<P style="color:#dd6c00;font-size:12pt;font-weight:bold;">세계여행 10년 후... <BR>
그들은 왜 이 길을 선택해 걸으려고 하는지,<BR>
그리고 이들 가족 앞에 놓인 인생의 길은 어떤 모습인지...<BR>
영혼의 길, ‘산티아고 순례 40일의 기록’을 지금 소개한다!</P>
</c:when>
<c:otherwise>
<P><BR><STRONG><SPAN style="COLOR: #ff6c00; FONT-SIZE: 18pt">산티아고 가는 길</SPAN></STRONG></P>
<P><STRONG><SPAN style="COLOR: #ff6c00; FONT-SIZE: 18pt"></SPAN></STRONG><BR>산티아고 가는 길(Camino de Santiago)</P>
<img style="margin-top:10px;margin-bottom:10px;" src="../images/program/solbit/santi1.jpg" width="480" height="270"/>
<P>카미노의 전설은 예수님의 열두 제자 중 한명인 성 야고보로부터 탄생했다.<BR>
땅끝까지 복음을 전파하기 위해 예루살렘에서<BR>
스페인 북부 산티아고까지 걸었던 야고보.<BR>
천신만고 끝에 임무를 완수하고 다시 예루살렘으로 돌아오지만<BR>
안타깝게도 헤롯왕에 의해 순교를 당하고 만다.<BR>
그의 시신은 돌로 만든 배로 옮겨져서 바다에 띄웠는데,<BR>
그 배가 놀랍게도 산티아고 부근에 도착,<BR>
그를 추종하는 이들의 헌신적인 노력에 의해 유해는 산티아고에 묻혔다고 전해진다.<BR><BR>
그로부터 800년 후, 야고보의 무덤이 발견돼 세상에 알려졌고<BR>
이 무덤 위에 지금의 산티아고 대성당이 세워졌다.<BR>
그 후 수많은 사람들이 그의 무덤을 참배하기 위해<BR>
산티아고 대성당으로 향했고,<BR>
800km에 이르는 이 먼 여정을 걸어온 이들을 ‘순례자’라 부르고 있다.<BR><BR>
본래 종교적인 의미에서 시작된 길이지만<BR>
지금은 세계인들의 사랑을 받는 유명한 트레일 코스가 된 산티아고...<BR>
&lt;연금술사&gt;로 유명한 소설가 파울로 코엘료 등<BR>
명사들이 카미노에서 체험한 영적 깨달음, 삶의 변화를 고백하면서<BR>
이 길은 널리 알려졌다.</P>
<img style="margin-top:10px;margin-bottom:10px;" src="../images/program/solbit/santi2.jpg" width="480" height="270"/>
</c:otherwise>
</c:choose>
</div>