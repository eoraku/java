<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/news_header.htm"/>
<jsp:include page="/include/news_top.htm"/>
<jsp:include page="/include/news_top_menu.htm"/>
<div id="common_main">
	<div id="common_left2">
	<jsp:include page="/news/leftmenu.htm"/>
	</div>
	<div id="common_right3">
		<div id="weather_title">
			<img src="../images/weather/weather_title.png" width="97" height="24"/>
		</div>
		<div id="weather_content">
			<div id="weather_tab">
				<ul>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div id="weather_map">
				<div id="location_01">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[0].w3_pty }${listArea[0].w3_sky }.png"/></dt>
						<dd><strong>서울</strong><br/><span>${listArea[0].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_02">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[1].w3_pty }${listArea[1].w3_sky }.png"/></dt>
						<dd><strong>인천</strong><br/><span>${listArea[1].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_03">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[2].w3_pty }${listArea[2].w3_sky }.png"/></dt>
						<dd><strong>청주</strong><br/><span>${listArea[2].wl_t1h }℃</span></dd>
					</dl>
				</div>
				
				<div id="location_04">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[3].w3_pty }${listArea[3].w3_sky }.png"/></dt>
						<dd><strong>강릉</strong><br/><span>${listArea[3].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_05">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[4].w3_pty }${listArea[4].w3_sky }.png"/></dt>
						<dd><strong>울릉도</strong><br/><span>${listArea[4].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_06">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[5].w3_pty }${listArea[5].w3_sky }.png"/></dt>
						<dd><strong>여수</strong><br/><span>${listArea[5].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_07">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[6].w3_pty }${listArea[6].w3_sky }.png"/></dt>
						<dd><strong>광주</strong><br/><span>${listArea[6].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_09">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[8].w3_pty }${listArea[8].w3_sky }.png"/></dt>
						<dd><strong>포항</strong><br/><span>${listArea[8].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_10">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[9].w3_pty }${listArea[9].w3_sky }.png"/></dt>
						<dd><strong>대구</strong><br/><span>${listArea[9].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_11">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[10].w3_pty }${listArea[10].w3_sky }.png"/></dt>
						<dd><strong>부산</strong><br/><span>${listArea[10].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_12">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[11].w3_pty }${listArea[11].w3_sky }.png"/></dt>
						<dd><strong>목포</strong><br/><span>${listArea[11].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_13">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[12].w3_pty }${listArea[12].w3_sky }.png"/></dt>
						<dd><strong>춘천</strong><br/><span>${listArea[12].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_14">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[13].w3_pty }${listArea[13].w3_sky }.png"/></dt>
						<dd><strong>전주</strong><br/><span>${listArea[13].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_15">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[14].w3_pty }${listArea[14].w3_sky }.png"/></dt>
						<dd><strong>대전</strong><br/><span>${listArea[14].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_21">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[15].w3_pty }${listArea[15].w3_sky }.png"/></dt>
						<dd><strong>제주서부</strong><br/><span>${listArea[15].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_22">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[16].w3_pty }${listArea[16].w3_sky }.png"/></dt>
						<dd><strong>제주</strong><br/><span>${listArea[16].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_23">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[17].w3_pty }${listArea[17].w3_sky }.png"/></dt>
						<dd><strong>제주동부</strong><br/><span>${listArea[17].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_24">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[18].w3_pty }${listArea[18].w3_sky }.png"/></dt>
						<dd><strong>성판악</strong><br/><span>${listArea[18].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_25">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[19].w3_pty }${listArea[19].w3_sky }.png"/></dt>
						<dd><strong>서귀포서부</strong><br/><span>${listArea[19].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_26">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[20].w3_pty }${listArea[20].w3_sky }.png"/></dt>
						<dd><strong>서귀포</strong><br/><span>${listArea[20].wl_t1h }℃</span></dd>
					</dl>
				</div>
				<div id="location_27">
					<dl>
						<dt><img src="../images/weather/small_icon_${listArea[21].w3_pty }${listArea[21].w3_sky }.png"/></dt>
						<dd><strong>서귀포동부</strong><br/><span>${listArea[21].wl_t1h }℃</span></dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/include/news_footer.htm"/>