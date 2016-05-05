<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/include/common_header.htm" />
<jsp:include page="/include/common_top.htm" />
<jsp:include page="/include/common_top_menu.htm" />
<script type="text/javascript" src="js/jquery/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/main_roll.js"></script>
<script type="text/javascript"> 
//배너 타이머
<c:if test="${IE6}">
alert("인터넷익스플로러6를 사용하고 계십니다.\n일부 기능 및 페이지가 제대로 보이지 않을 수가 있습니다.\n원활한 인터넷 사용과 보안을 위하여\n브라우저를 업그레이드해 주세요.");
</c:if>
$(document).ready(function() {
	mainBanner.on(0);
	mainBanner.setRolling();
});
</script>
<div id="common_main">
	<div id="mainBanner">
		<div class="imgBanner">
			<a href="news/index.htm"><img
				src="images/banner/banner_main_1.jpg" alt="KCTV 종합뉴스"></a>
			<div id="divBannerNews">
				<c:forEach items="${listIndexNews }" var="item">
					<a href="#"
						onclick="javascript:vod_wmv('${ctxRoot }',${item.num });">${item.title
						}</a>
					<br />
				</c:forEach>
			</div>
			<div class="divBanner"
				style="background: url(images/banner/bg_main_banner_1.png);">
				<a href="news/index.htm">신속, 정확, 유익한 뉴스!</a>
			</div>
		</div>
		<div class="imgBanner" style="display: none">
			<a><img
				src="images/index/title_drama.png" alt="KCTV 편성 드라마"></a>
		</div>
		<div class="imgBanner" style="display: none">
			<a href="contents/program.htm?muid=54"><img
				src="images/banner/banner_main_3.jpg" alt="삼춘 어디감수과"></a>
			<%-- <ul id="ulBannerSam">
				<li><a style="margin-right:24px;" href="/contents/index2.asp?muid=55&pmuid=50">${listIndexSam[0].title } (${listIndexSam[0].firstdt })</a></li>
				<li><a style="margin-right:32px;" href="/contents/index2.asp?muid=55&pmuid=50">${listIndexSam[1].title } (${listIndexSam[1].firstdt })</a></li>
				<li><a style="margin-right:37px;" href="/contents/index2.asp?muid=55&pmuid=50">${listIndexSam[2].title } (${listIndexSam[2].firstdt })</a></li>
				<li><a style="margin-right:39px;" href="/contents/index2.asp?muid=55&pmuid=50">${listIndexSam[3].title } (${listIndexSam[3].firstdt })</a></li>
				<li><a style="margin-right:39px;" href="/contents/index2.asp?muid=55&pmuid=50">${listIndexSam[4].title } (${listIndexSam[4].firstdt })</a></li>
			</ul> --%>
			<div class="divBanner"
				style="background: url(images/banner/bg_main_banner_3.png);">
				<a href="/contents/program.htm?muid=54&guid=55">구수한 제주어로 풀어내는
					삼춘들의 희노애락<!-- 삼춘들의 희노애락을 가감없이 보여줍니다! -->
				</a>
			</div>
		</div>
		<div class="imgBanner" style="display: none">
			<a href="contents/program.htm?muid=82"><img
				src="images/banner/banner_main_7.jpg" alt="Talk Talk TV닥터"></a>
			<!-- <div id="divBannerDoc">
				<div id="divBannerDocBrain">
					<a href="contents/program.htm?muid=82&subid=82">뇌출혈</a><br/>
				</div>
				<div id="divBannerDocNeck">
					<a href="contents/program.htm?muid=82&subid=82">목디스크</a>
				</div>
				<div id="divBannerDocShoulder">
					<a href="contents/program.htm?muid=82&subid=82">어깨통증</a><br/>
				</div>
				<div id="divBannerDocBack">
					<a href="contents/program.htm?muid=82&subid=82">척추 질환</a><br/>
				</div>
				<div id="divBannerDocHeart">
					<a href="contents/program.htm?muid=82&subid=82">심장 질환</a><br/>
				</div>
			</div> -->
		</div>
		<div class="imgBanner" style="display: none">
			<a href="contents/program.htm?muid=330"><img
				src="images/banner/banner_main_8.jpg" alt="추천! VOD가 좋다"></a>
			<ul id="ulBannerVod">
				<li><a style="margin-right: 24px;"
					href="/contents/program.htm?muid=330&guid=330">추천! VOD가 좋다 다시보기</a></li>
				<li><a style="margin-right: 32px;"
					href="/contents/product.htm?muid=340&subid=3">신작 VOD</a></li>
				<li><a style="margin-right: 37px;"
					href="/contents/product.htm?muid=340&subid=6">Top 10 VOD 프로그램</a></li>
			</ul>
		</div>
	</div>
	<div id="mainBannerTab">
		<ul>
			<li><a href="#" id="mainBannerLink0"
				onmouseover="javascript:mainBanner.on('0');mainBanner.over();"><img
					src="images/index/scroll_circle_on.png" width="17" height="17" /></a></li>
			<li><a href="#" id="mainBannerLink1"
				onmouseover="javascript:mainBanner.on('1');mainBanner.over();"><img
					src="images/index/scroll_circle_off.png" width="17" height="17" /></a></li>
			<li><a href="#" id="mainBannerLink2"
				onmouseover="javascript:mainBanner.on('2');mainBanner.over();"><img
					src="images/index/scroll_circle_off.png" width="17" height="17" /></a></li>
			<li><a href="#" id="mainBannerLink3"
				onmouseover="javascript:mainBanner.on('3');mainBanner.over();"><img
					src="images/index/scroll_circle_off.png" width="17" height="17" /></a></li>
			<li><a href="#" id="mainBannerLink4"
				onmouseover="javascript:mainBanner.on('4');mainBanner.over();"><img
					src="images/index/scroll_circle_off.png" width="17" height="17" /></a></li>
		</ul>
	</div>
	<div id="main_left">
		<div id="div_banner_left">
			<!-- <a href="#" onclick="javascript:vod_wmv('/',24902);"><img src="images/index/banner_index_left_intro.png" width="221" height="90"/></a> -->
			<!-- <a href="/contents/cPublic.htm?muid=359"><img src="images/banner/banner_dreamharmony.png" width="221" height="125"/></a> -->
			<!-- <a href="/contents/cPublic.htm?muid=535"><img src="images/banner/banner_main_131014.jpg" width="221" height="110"/></a> -->
		</div>
		<div id="div_notice">
			<div id="notice_top">
				<div id="notice_top_title">
					<a href="contents/company.htm?muid=117"><img
						src="images/index/left_notice.gif" width="67" height="16"></a>
				</div>
				<div id="notice_top_more">
					<a href="contents/company.htm?muid=117"><img
						src="images/common/more02.gif" width="36" height="11"></a>
				</div>
			</div>
			<div id="notice_body">
				<ul>
					<c:forEach items="${listNotice }" var="item">
						<li><a
							href="contents/company.htm?muid=117&mode=view&buid=${item.board_uid }">${item.board_title
								}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="div_schedule">
			<div id="schedule_top">
				<div id="schedule_top_title">
					<a href="contents/program.htm?muid=235"><img
						src="images/index/left_schedule.gif" width="92" height="16"
						border="0"></a>
				</div>
				<div id="schedule_top_more">
					<a href="contents/program.htm?muid=235"><img
						src="images/common/more02.gif" width="36" height="11" border="0"></a>
				</div>
			</div>
			<ul id="schedule_body">
				<c:choose>
					<c:when test="${sch_begin>0 }">
						<li class="schedule_now"><a href="#" onclick="Switch2()">${listSchedule[sch_begin].pk_time
								} ${listSchedule[sch_begin].program }</a></li>
						<c:forEach var="i" begin="${sch_begin+1 }" end="${sch_end }">
							<li class="schedule_list"><span>${listSchedule[i].pk_time
									} ${listSchedule[i].program }</span></li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li class="schedule_list">등록된 편성표가 없습니다.</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div id="div_hotMovie">
			<div id="hotMovie_top">
				<div id="hotMovie_top_title">
					<img src="images/index/left_hotMovie.gif" width="130" height="16">
				</div>
			</div>
			<ul id="hotMovie_body">
				<c:forEach items="${listHotVod }" var="item">
					<li>
						<div class="hotMovie_body_image">
							<a href="#"
								onclick="javascript:vod_wmv('${ctxRoot }',${item.num });"><img
								src="${item.photo_url }" width="104" height="60"
								alt="${item.title }"></a>
						</div>
						<div class="hotMovie_body_text">
							<a href="#"
								onclick="javascript:vod_wmv('${ctxRoot }',${item.num });">${item.title
								}</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div id="socialService">
			<div id="socialServiceTop">
				<div id="socialServiceTitle">
					<img src="images/index/left_socialservice.gif" width="130"
						height="16">
				</div>
			</div>
			<div id="socialServiceBody">
				<div id="socialServiceIcon">
					<div class="socialServiceImage">
						<a href="http://www.facebook.com/kctvjeju" target="_blank"><img
							src="images/index/btn_facebook.png" width="50" height="50"
							alt="페이스북 바로가기" />페이스북</a>
					</div>
					<div class="socialServiceImage">
						<a href="http://www.twitter.com/kctvjeju7" target="_blank"><img
							src="images/index/btn_twitter.png" width="50" height="50"
							alt="트위터 바로가기" />트위터</a>
					</div>
					<div class="socialServiceImage">
						<a href="http://blog.kctvjeju.com" target="_blank"><img
							src="images/index/btn_blog.png" width="50" height="50"
							alt="블로그 바로가기" />블로그</a>
					</div>
					<div class="socialServiceImage">
						<a href="http://www.youtube.com/kctvjeju7" target="_blank"><img
							src="images/index/btn_youtube.png" width="50" height="50"
							alt="유투브 바로가기" />유투브</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="main_center">
		<div id="div_news_latest">
			<div id="news_latest_top">
				<div id="news_latest_top_title">
					<a href="/news/list.htm?guid=0"><img
						src="images/index/btn_latest_news.png" width="80" height="20"
						alt="KCTV 최신 뉴스"></a>
				</div>
				<div id="news_latest_top_tab">
					<ul>
						<li style="width: 55px;" href="news/list.htm?guid=1"></li>
						<li style="width: 55px;" href="news/list.htm?guid=2"></li>
						<li style="width: 55px;" href="news/list.htm?guid=3"></li>
						<li style="width: 55px;" href="news/list.htm?guid=4"></li>
						<li style="width: 53px;" href="eng/"></li>
						<li style="width: 61px;" href="cn/"></li>
					</ul>
				</div>
			</div>
			<div id="news_latest_list">
				<div id="news_latest_0" class="news_latest">
					<div class="news_latest_list_top">
						<div class="latest_news_image">
							<a href="news/view.htm?guid=1&nuid=${listNews1_img.num }"><img
								src="upload/news/${listNews1_img.svrfile2 }" width="126"
								height="69"></a>
						</div>
						<div class="latest_news_text">
							<a href="news/view.htm?guid=1&nuid=${listNews1_img.num }">${listNews1_img.title
								}</a>
						</div>
					</div>
					<div class="news_latest_list_body">
						<ul>
							<c:forEach items="${listNews1 }" var="item">
								<li><a href="news/view.htm?guid=1&nuid=${item.num }">${item.title
										}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div id="news_latest_1" class="news_latest">
					<div class="news_latest_list_top">
						<div class="latest_news_image">
							<a href="news/view.htm?guid=2&nuid=${listNews2_img.num }"><img
								src="upload/news/${listNews2_img.svrfile2 }" width="126"
								height="69"></a>
						</div>
						<div class="latest_news_text">
							<a href="news/view.htm?guid=2&nuid=${listNews2_img.num }">${listNews2_img.title
								}</a>
						</div>
					</div>
					<div class="news_latest_list_body">
						<ul>
							<c:forEach items="${listNews2 }" var="item">
								<li><a href="news/view.htm?guid=2&nuid=${item.num }">${item.title
										}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div id="news_latest_2" class="news_latest">
					<div class="news_latest_list_top">
						<div class="latest_news_image">
							<a href="news/view.htm?guid=3&nuid=${listNews3_img.num }"><img
								src="upload/news/${listNews3_img.svrfile2 }" width="126"
								height="69"></a>
						</div>
						<div class="latest_news_text">
							<a href="news/view.htm?guid=3&nuid=${listNews3_img.num }">${listNews3_img.title
								}</a>
						</div>
					</div>
					<div class="news_latest_list_body">
						<ul>
							<c:forEach items="${listNews3 }" var="item">
								<li><a href="news/view.htm?guid=3&nuid=${item.num }">${item.title
										}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div id="news_latest_3" class="news_latest">
					<div class="news_latest_list_top">
						<div class="latest_news_image">
							<a href="news/view.htm?guid=4&nuid=${listNews4_img.num }"><img
								src="upload/news/${listNews4_img.svrfile2 }" width="126"
								height="69"></a>
						</div>
						<div class="latest_news_text">
							<a href="news/view.htm?guid=4&nuid=${listNews4_img.num }">${listNews4_img.title
								}</a>
						</div>
					</div>
					<div class="news_latest_list_body">
						<ul>
							<c:forEach items="${listNews4 }" var="item">
								<li><a href="news/view.htm?guid=4&nuid=${item.num }">${item.title
										}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div id="news_latest_4" class="news_latest">
					<div class="news_latest_list_top">
						<div class="latest_news_image">
							<a href="eng/view.htm?guid=9&nuid=${listNews5_img.num }"><img
								src="upload/news/${listNews5_img.svrfile2 }" width="126"
								height="69"></a>
						</div>
						<div class="latest_news_text">
							<a href="eng/view.htm?guid=9&nuid=${listNews5_img.num }">${listNews5_img.title
								}</a>
						</div>
					</div>
					<div class="news_latest_list_body">
						<ul>
							<c:forEach items="${listNews5 }" var="item">
								<li><a href="eng/view.htm?guid=9&nuid=${item.num }">${item.title
										}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div id="news_latest_5" class="news_latest">
					<div class="news_latest_list_top">
						<div class="latest_news_image">
							<a href="cn/view.htm?guid=10&nuid=${listNews6_img.num }"><img
								src="upload/news/${listNews6_img.svrfile2 }" width="126"
								height="69"></a>
						</div>
						<div class="latest_news_text">
							<a href="cn/view.htm?guid=10&nuid=${listNews6_img.num }">${listNews6_img.title
								}</a>
						</div>
					</div>
					<div class="news_latest_list_body">
						<ul>
							<c:forEach items="${listNews6 }" var="item">
								<li><a href="cn/view.htm?guid=10&nuid=${item.num }">${item.title
										}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- <div id="div_ch7_vod">
			<div id="ch7_vod_top">
				<div id="ch7_vod_top_title">
					<a href="/contents/index2.asp?muid=351&pmuid=50"><img src="images/index/title_ch7_vod.gif" width="80" height="16"></a>
				</div>
				<div id="ch7_vod_top_search">
					<form name="fVodSearch" action="javascript:VodSearch()">
					<input type ="hidden" name="v_search" value="1">
					<input type ="hidden" name="VOD" value="1">
					<ul>
						<li><input name="KWT" type="text" size="19"></li>
						<li><a href="javascript:VodSearch();"><img src="images/common/search_vod.png" width="44" height="19" border="0"></a></li>
					</ul>
				</div>
				<div id="ch7_vod_top_more">
					<a href="/contents/index2.asp?muid=351&pmuid=50"><img src="images/common/more02.gif" width="36" height="11"></a>
				</div>
			</div>
			<div id="ch7_vod_tab">
				<ul>
					<li style="width:32px;" top="0" cate=1></li>
					<li style="width:32px;" top="19" cate=2></li>
					<li style="width:51px;" top="38" cate=3></li>
					<li style="width:51px;" top="57" cate=4></li>
					<li style="width:75px;" top="76" cate=5></li>
					<li style="width:65px;" top="95" cate=6></li>
					<li style="width:68px;" top="114" cate=7></li>
					<li style="width:32px;" top="133" cate=8></li>
				</ul>
			</div>
			<div id="ch7_vod_body">
			</div>
		</div> -->
		<div id="div_foreigner_zone">
			<div id="foreigner_zone_top">
				<div id="foreigner_zone_top_title">
					<img src="images/index/title_foreigner_zone.gif" width="68"
						height="16">
				</div>
			</div>
			<div id="foreigner_zone_body">
				<ul>
					<li><a href="eng/"><img src="images/index/fore_eng.jpg"
							width="85" height="60"><br />English News</a></li>
					<li><a href="cn/"><img src="images/index/fore_chi.gif"
							width="85" height="60"><br />中文新&#38395;</a></li>
					<li><a href="contents/program.htm?muid=103"><img
							src="images/index/fore_hi.gif" width="85" height="60"><br />하이제주</a></li>
					<li><a href="contents/program.htm?muid=111"><img
							src="images/index/fore_jap.gif" width="85" height="60"><br />곤니찌와제주</a></li>
					<li><a href="contents/program.htm?muid=107"><img
							src="images/index/fore_chi2.gif" width="85" height="60"><br />니하오제주</a></li>
				</ul>
			</div>
		</div>
		<div id="div_latest_vod">
			<div id="latest_vod_top">
				<div id="latest_vod_top_title">
					<a href="contents/product.htm?muid=340&subid=3"><img
						src="images/index/title_latest_vod.gif" width="54" height="16"></a>
				</div>
				<div id="latest_vod_top_more">
					<a href="contents/product.htm?muid=340&subid=3"><img
						src="images/common/more02.gif" width="36" height="11"></a>
				</div>
			</div>
			<div id="latest_vod_body">
				<ul>
					<c:forEach items="${listVodNew }" var="item">
						<li><a href="contents/product.htm?muid=340&subid=3"><img
								src="http://www.hchoice.co.kr/data/${item.file }" width="80"
								height="100" alt="${item.title }"></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="div_top_vod">
			<div id="top_vod_top">
				<div id="top_vod_top_title">
					<a href="contents/product.htm?muid=340&subid=5"><img
						src="images/index/title_top_vod.gif" width="66" height="16"></a>
				</div>
				<div id="top_vod_top_more">
					<a href="contents/product.htm?muid=340&subid=5"><img
						src="images/common/more02.gif" width="36" height="11"></a>
				</div>
			</div>
			<div id="top_vod_body">
				<ul>
					<c:forEach items="${listVodTop }" var="item">
						<li><a href="contents/product.htm?muid=340&subid=5"><img
								src="http://www.hchoice.co.kr/data/${item.file }" width="80"
								height="100" alt="${item.title }"></a>
						<div class="top_vod_rank">
								<img src="images/index/vod_rank_${item.id }.png" width="29"
									height="29" />
							</div></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="div_event_notice">
			<div id="event_notice_top">
				<div id="event_notice_top_title">
					<a href="contents/cPublic.htm?muid=256"><img
						src="images/index/title_event_notice.gif" width="80" height="16"></a>
				</div>
				<div id="event_notice_top_more">
					<a href="contents/cPublic.htm?muid=256"><img
						src="images/common/more02.gif" width="36" height="11"></a>
				</div>
			</div>
			<div id="event_notice_body">
				<iframe src="event/notice.htm" frameborder="0" bordercolor="white"
					marginwidth="0" marginheight="0" scrolling="no" name="ifrm1"></iframe>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function swf(src,w,h){
		//id, name 파라미터 추가
		var html = '';
		html += '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,124,0" width="' + w + '" height="' + h + '" id="main" align="middle">';
		html += '<param name="allowScriptAccess" value="sameDomain">';
		html += '<param name="always" name="allowScriptAccess">';
		html += '<param name="movie" value="' + src + '">';
		html += '<param name="quality" value="high">';
		html += '<param name="salign" value="l">';
		html += '<param name="wmode" value="transparent">';
		html += '<param name="bgcolor" value="#ffffff">';
		html += '<embed src="' + src + '" width="' + w + '" height="' + h + '" quality="high" salign="l" bgcolor="#ffffff" allowscriptaccess="always" quality="high" wmode="transparent" src="http://adimg.daumcdn.net/www4/3D8s/dGGZ/skin_top_general_430x105_130903ae.swf" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="main">';
		html += '</object>';
		document.write(html);
	} 
	</script>
	<div id="main_right_banner">
		<!-- 
		<ul id="main_right_list">
			<li><a href="http://www.relief.or.kr/" target="_blank"><img src="/images/banner/link_20131120.jpg"/></a></li>
		</ul>
	-->
		<ul id="main_right_list">
			<!-- 
			<li><a href="contents/product.htm?muid=539"><img src="/images/banner/mvno_banner.png"/></a></li>
			 -->
			<script type=text/javascript>swf('/images/type01_banner.swf','236','100');</script> 
		</ul>
		<ul id="main_right_banner_list">
			<li><a href="contents/program.htm?muid=217"><img
					src="images/banner/banner_index_ch7.png" width="236" height="100"
					alt="선명한 화질! 다양한 컨텐츠 CH7 HD"></a></li>
			<li><a href="contents/kctvn.htm?muid=327"><img
					src="images/banner/banner_index_ch20.png" width="236" height="100"
					alt="내고장 정보채널 CH20 N"></a></li>
		</ul>
		<ul id="main_right_banner_arrow">
			<li><img id="main_right_banner_prev"
				src="images/index/index_banner_prev.gif" width="16" height="14"></li>
			<li><img id="main_right_banner_next"
				src="images/index/index_banner_next.gif" width="16" height="14"></li>
		</ul>
	</div>
	<div id="main_right">
		<dl>
			<dt>
				<img src="images/index/products_title.png" width="60" height="14"
					alt="KCTV 상품">
			</dt>
			<dd>
				<img src="images/index/product_list.png" width="215" height="200"
					usemap="#product">
				<map name="product">
					<area shape="rect" coords="18, 10, 98, 86"
						href="${ctxRoot }contents/product.htm?muid=293" alt="DV온">
					<area shape="rect" coords="115, 10, 196, 86"
						href="${ctxRoot }contents/product.htm?muid=300" alt="DV인">
					<area shape="rect" coords="18, 110, 98, 182"
						href="${ctxRoot }contents/product.htm?muid=297" alt="DV폰">
					<area shape="rect" coords="115 110, 196 182"
						href="${ctxRoot }contents/product.htm?muid=275" alt="DV아이">
				</map>
			</dd>
			<!-- <dd><a href="/contents/?muid=117&pmuid=116&boardUrl=%2Fboard%2Fread%2Easp%3Fuid%3D281%26board%5Fid%3Dnotice"><img src="images/banner/banner_vod_event.png" width="224" height="86"></a></dd>
			<dd><a href="/contents/?muid=359&pmuid=116"><img src="img/banner_right_120711.jpg" width="224" height="86"></a></dd> 
			-->
			<!-- 
			<dd>
				<a href="${ctxRoot }contents/cPublic.htm?muid=322"><img
					src="images/index/banner_right_1.png" width="214" height="60"
					alt="KCTV를 스마트폰으로 보자"></a>
			</dd>
			-->
			<dd>
				<a href="http://122.202.129.156" target="_new"><img
					src="images/index/banner_right_2.png" width="214" height="65"
					alt="인터넷 속도측정"></a>
			</dd>
			<dd>
				<a href="contents/product.htm?muid=253"><img
					src="images/index/banner_right_3.png" width="214" height="65"
					alt="KCTV유해차단서비스"></a>
			</dd>
			<dd>
				<a href="http://www.sovill.com/cabledr/index.asp?so_idx=701"
					target="_new"><img src="images/index/banner_right_4.png"
					width="214" height="65" alt="다되는 무료백신 Cable Doctor"></a>
			</dd>
			<dd>
				<img src="images/index/right_customer.png" width="222" height="110"
					usemap="#ImageMap1">
				<map name="ImageMap1">
					<area shape="rect" coords="8, 7, 70, 72"
						href="${ctxRoot }contents/customer.htm?muid=259" alt="응급조치요령">
					<area shape="rect" coords="81, 8, 143, 72"
						href="${ctxRoot }contents/customer.htm?muid=202" alt="고객의소리">
					<area shape="rect" coords="151, 6, 209, 72"
						href="${ctxRoot }contents/customer.htm?muid=128" alt="서비스신청">
				</map>
			</dd>
			<dd>
				<a href="http://www.kait-tvrefund.kr/" target="_new"><img
					src="images/index/return_price.jpg" width="216" height="40"
					alt="유료방송비환급액 정보조회서비스"></a>
			</dd>
			<dd>
				<a href="http://www.greeninet.or.kr/" target="_new"><img
					src="images/index/greeninet.gif" width="216" height="45"
					alt="그린i-Net"></a>
			</dd>
		</dl>
	</div>
</div>
<c:if test="${totalPopup>0 }">
	<script type="text/javascript">
	<c:forEach items="${listPopup}" var="item" varStatus="status">
	popup_window('${ctxRoot }popup/index.htm',${item.pu_uid },${item.pu_width },${item.pu_height },${status.index},${totalPopup});
	</c:forEach>
</script>
</c:if>
<jsp:include page="/include/common_footer.htm" />