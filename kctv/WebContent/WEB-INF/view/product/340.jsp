<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content_main" class="digital_vod">
	<div id="product_top">
		<div id="product_top_img">
			<img src="../images/product/vod/vod_img.jpg" width="661" height="140"/>
		</div>
		<div id="product_top_menu" style="background:url(../images/product/vod/menu_back.gif) no-repeat">
			<ul>
				<li><a<c:if test="${subid==1 }"> class="over"</c:if> href="product.htm?muid=340&subid=1">이용안내</a></li>
				<li><a<c:if test="${subid==2 }"> class="over"</c:if> href="product.htm?muid=340&subid=2">VOD소식지</a></li>
				<li><a<c:if test="${subid==3 }"> class="over"</c:if> href="product.htm?muid=340&subid=3">신작VOD</a></li>
				<li><a<c:if test="${subid==4 }"> class="over"</c:if> href="product.htm?muid=340&subid=4">추천타이틀</a></li>
				<li><a<c:if test="${subid==5 }"> class="over"</c:if> href="product.htm?muid=340&subid=5">TOP10 무비</a></li>
				<li><a<c:if test="${subid==6 }"> class="over"</c:if> href="product.htm?muid=340&subid=6">TOP10 프로그램</a></li>
				<li style="padding:0px 0px 0px 7px;"><a href="program.htm?muid=330"><img src="../images/product/vod/recom.gif" width="121" height="22"></a></li>
			</ul>
		</div>
	</div>
	<div id="product_main">
		<c:choose>
		<c:when test="${subid==1 }">
		<div style="float:left;padding:8px;">
			<img src="../images/product/vod/Vod_Intro2.gif" width="663" height="796"/>
		</div>
		</c:when>
		<c:when test="${subid==2 }">
		<div style="float:left;width:660px;height:27px;padding:5px;text-align:right;">
		<select id="selWeekImg" onchange="javascript:chgWeekImg()">
			<c:forEach items="${listVodWeek }" var="item" varStatus="status">
			<c:choose>
			<c:when test="${status.first }">
			<option value="${item.image_url }" selected="selected">${item.title }</option>
			</c:when>
			<c:otherwise>
			<option value="${item.image_url }">${item.title }</option>
			</c:otherwise>
			</c:choose>
			</c:forEach>
		</select>
		</div>
		<div style="float:left;width:720px;">
			<img id="weekImg" src="${latestImage }">
		</div>
		</c:when>
		<c:when test="${subid==3 }">
		<dl>
			<dt>
				<img src="../images/product/vod/korea.jpg" width="103" height="21" alt="한국영화">
			</dt>
			<dd>
				<c:forEach items="${listVodKOR }" var="item">
				<div class="vod_poster">
					<div class="vod_image"><img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150"></div>
					<div class="vod_title">${item.title }</div>
				</div>
				</c:forEach>
			</dd>
		</dl>
		<dl>
			<dt>
				<img src="../images/product/vod/broad.jpg" width="103" height="21" alt="해외영화">
			</dt>
			<dd>
				<c:forEach items="${listVodFOR }" var="item">
				<div class="vod_poster">
					<div class="vod_image"><img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150"></div>
					<div class="vod_title">${item.title }</div>
				</div>
				</c:forEach>
			</dd>
		</dl>
		</c:when>
		<c:when test="${subid==4 }">
		<dl>
			<dt>
				<img src="../images/product/vod/title2_1.jpg" width="103" height="21" alt="드라마">
			</dt>
			<dd>
				<c:forEach items="${listVodRec1 }" var="item">
				<div class="vod_poster">
					<div class="vod_image"><img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150"></div>
					<div class="vod_title">${item.title }</div>
					<div class="vod_detail">
						<div class="vod_detail_img">
							<img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150">
						</div>
						<div class="vod_detail_info">
							<ul>
								<li>
									<dl>
										<dt style="width:285px;" class="vod_defail_title">${item.title }</dt>
										<dd style="width:20px;height:20px;" class="vod_defail_close"><img src="../images/product/vod/close2.gif" width="20" height="20"/></dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_01.gif" width="63" height="20"/></dt>
										<dd>${item.director }</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_02.gif" width="63" height="20"/></dt>
										<dd>${item.talent1 } ${item.talent2 }</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_03.gif" width="63" height="20"/></dt>
										<dd>${item.synopsis }</dd>
									</dl>
								</li>
							</ul>
						</div>
					</div>
				</div>
				</c:forEach>
			</dd>
		</dl>
		<dl>
			<dt>
				<img src="../images/product/vod/title2_2.jpg" width="103" height="21" alt="애니메이션/키즈">
			</dt>
			<dd>
				<c:forEach items="${listVodRec2 }" var="item">
				<div class="vod_poster">
					<div class="vod_image"><img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150"></div>
					<div class="vod_title">${item.title }</div>
					<div class="vod_detail">
						<div class="vod_detail_img">
							<img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150">
						</div>
						<div class="vod_detail_info">
							<ul>
								<li>
									<dl>
										<dt style="width:285px;" class="vod_defail_title">${item.title }</dt>
										<dd style="width:20px;height:20px;" class="vod_defail_close"><img src="../images/product/vod/close2.gif" width="20" height="20"/></dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_01.gif" width="63" height="20"/></dt>
										<dd>${item.director }</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_02.gif" width="63" height="20"/></dt>
										<dd>${item.talent1 } ${item.talent2 }</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_03.gif" width="63" height="20"/></dt>
										<dd>${item.synopsis }</dd>
									</dl>
								</li>
							</ul>
						</div>
					</div>
				</div>
				</c:forEach>
			</dd>
		</dl>
		<dl>
			<dt>
				<img src="../images/product/vod/title2_3.jpg" width="103" height="21" alt="지상파">
			</dt>
			<dd>
				<c:forEach items="${listVodRec3 }" var="item">
				<div class="vod_poster">
					<div class="vod_image"><img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150"></div>
					<div class="vod_title">${item.title }</div>
					<div class="vod_detail">
						<div class="vod_detail_img">
							<img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150">
						</div>
						<div class="vod_detail_info">
							<ul>
								<li>
									<dl>
										<dt style="width:285px;" class="vod_defail_title">${item.title }</dt>
										<dd style="width:20px;height:20px;" class="vod_defail_close"><img src="../images/product/vod/close2.gif" width="20" height="20"/></dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_01.gif" width="63" height="20"/></dt>
										<dd>${item.director }</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_02.gif" width="63" height="20"/></dt>
										<dd>${item.talent1 } ${item.talent2 }</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_03.gif" width="63" height="20"/></dt>
										<dd>${item.synopsis }</dd>
									</dl>
								</li>
							</ul>
						</div>
					</div>
				</div>
				</c:forEach>
			</dd>
		</dl>
		<dl>
			<dt>
				<img src="../images/product/vod/title2_4.jpg" width="103" height="21" alt="교육">
			</dt>
			<dd>
				<c:forEach items="${listVodRec4 }" var="item">
				<div class="vod_poster">
					<div class="vod_image"><img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150"></div>
					<div class="vod_title">${item.title }</div>
					<div class="vod_detail">
						<div class="vod_detail_img">
							<img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150">
						</div>
						<div class="vod_detail_info">
							<ul>
								<li>
									<dl>
										<dt style="width:285px;" class="vod_defail_title">${item.title }</dt>
										<dd style="width:20px;height:20px;" class="vod_defail_close"><img src="../images/product/vod/close2.gif" width="20" height="20"/></dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_01.gif" width="63" height="20"/></dt>
										<dd>${item.director }</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_02.gif" width="63" height="20"/></dt>
										<dd>${item.talent1 } ${item.talent2 }</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_03.gif" width="63" height="20"/></dt>
										<dd>${item.synopsis }</dd>
									</dl>
								</li>
							</ul>
						</div>
					</div>
				</div>
				</c:forEach>
			</dd>
		</dl>
		<dl>
			<dt>
				<img src="../images/product/vod/title2_5.jpg" width="103" height="21" alt="오락/스포츠">
			</dt>
			<dd>
				<c:forEach items="${listVodRec5 }" var="item">
				<div class="vod_poster">
					<div class="vod_image"><img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150"></div>
					<div class="vod_title">${item.title }</div>
					<div class="vod_detail">
						<div class="vod_detail_img">
							<img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150">
						</div>
						<div class="vod_detail_info">
							<ul>
								<li>
									<dl>
										<dt style="width:285px;" class="vod_defail_title">${item.title }</dt>
										<dd style="width:20px;height:20px;" class="vod_defail_close"><img src="../images/product/vod/close2.gif" width="20" height="20"/></dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_01.gif" width="63" height="20"/></dt>
										<dd>${item.director }</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_02.gif" width="63" height="20"/></dt>
										<dd>${item.talent1 } ${item.talent2 }</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_03.gif" width="63" height="20"/></dt>
										<dd>${item.synopsis }</dd>
									</dl>
								</li>
							</ul>
						</div>
					</div>
				</div>
				</c:forEach>
			</dd>
		</dl>
		<dl style="margin-bottom:10px;">
			<dt>
				<img src="../images/product/vod/title2_6.jpg" width="103" height="21" alt="생활다큐">
			</dt>
			<dd>
				<c:forEach items="${listVodRec6 }" var="item">
				<div class="vod_poster">
					<div class="vod_image"><img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150"></div>
					<div class="vod_title">${item.title }</div>
					<div class="vod_detail">
						<div class="vod_detail_img">
							<img src="http://www.hchoice.co.kr/data/${item.file }" width="107" height="150">
						</div>
						<div class="vod_detail_info">
							<ul>
								<li>
									<dl>
										<dt style="width:285px;" class="vod_defail_title">${item.title }</dt>
										<dd style="width:20px;height:20px;" class="vod_defail_close"><img src="../images/product/vod/close2.gif" width="20" height="20"/></dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_01.gif" width="63" height="20"/></dt>
										<dd>${item.director }</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_02.gif" width="63" height="20"/></dt>
										<dd>${item.talent1 } ${item.talent2 }</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt><img src="../images/product/vod/vod_ti_03.gif" width="63" height="20"/></dt>
										<dd>${item.synopsis }</dd>
									</dl>
								</li>
							</ul>
						</div>
					</div>
				</div>
				</c:forEach>
			</dd>
		</dl>
		</c:when>
		<c:when test="${subid==5 }">
		<div style="padding:10px;">
			<ul>
				<c:forEach items="${listVod10Mov }" var="item" varStatus="status">
				<li class="top_vod_detail">
					<div class="top_vod_detail_img">
						<img src="http://www.hchoice.co.kr/data/${item.file }" width="120" height="170">
					</div>
					<div class="top_vod_detail_info">
						<ul>
							<li>
								<dl>
									<dt style="width:450px;padding-top:5px;" class="top_vod_defail_title">${item.title }</dt>
									<dd style="width:45px;height:26px;"><img src="../images/product/vod/num${status.count }.jpg" width="45" height="26"/></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><img src="../images/product/vod/vod_ti_01.gif" width="63" height="20"/></dt>
									<dd>${item.director }</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><img src="../images/product/vod/vod_ti_02.gif" width="63" height="20"/></dt>
									<dd>${item.talent1 } ${item.talent2 }</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><img src="../images/product/vod/vod_ti_03.gif" width="63" height="20"/></dt>
									<dd>${item.synopsis }</dd>
								</dl>
							</li>
						</ul>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		</c:when>
		<c:when test="${subid==6 }">
		<div style="padding:10px;">
			<ul>
				<c:forEach items="${listVod10Pro }" var="item" varStatus="status">
				<li class="top_vod_detail">
					<div class="top_vod_detail_img">
						<img src="http://www.hchoice.co.kr/data/${item.file }" width="120" height="170">
					</div>
					<div class="top_vod_detail_info">
						<ul>
							<li>
								<dl>
									<dt style="width:450px;padding-top:5px;" class="top_vod_defail_title">${item.title }</dt>
									<dd style="width:45px;height:26px;"><img src="../images/product/vod/num${status.count }.jpg" width="45" height="26"/></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><img src="../images/product/vod/vod_ti_01.gif" width="63" height="20"/></dt>
									<dd>${item.director }</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><img src="../images/product/vod/vod_ti_02.gif" width="63" height="20"/></dt>
									<dd>${item.talent1 } ${item.talent2 }</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt><img src="../images/product/vod/vod_ti_03.gif" width="63" height="20"/></dt>
									<dd>${item.synopsis }</dd>
								</dl>
							</li>
						</ul>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		</c:when>
		</c:choose>
	</div>
</div>
