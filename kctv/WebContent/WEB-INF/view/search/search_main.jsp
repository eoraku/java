<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${termView }">
<div id="search_terms" class="div_search_category">
	<div class="div_category_title">이용약관 다운로드</div>
	<div class="div_category_content">
		<dl>
			<dd><a href="/board/w_sc/download.htm?buid=185" target="exec_iframe">* 개인정보 취급방침</a></dd>
			<dd><a href="/board/w_sc/download.htm?buid=186" target="exec_iframe">* 인터넷 이용약관</a></dd>
			<dd><a href="/board/w_sc/download.htm?buid=187" target="exec_iframe">* 케이블TV 이용약관</a></dd>
			<dd><a href="/board/w_sc/download.htm?buid=188" target="exec_iframe">* 인터넷전화 이용약관</a></dd>
			<dd><a href="/board/w_sc/download.htm?buid=189" target="exec_iframe">* 전용회선서비스 이용약관</a></dd>
			<dd><a href="/board/w_sc/download.htm?buid=190" target="exec_iframe">* 홈페이지 이용약관</a></dd>
		</dl>
	</div>
</div>
</c:if>
<c:if test="${programTotal>0 }">
<div id="search_program" class="div_search_category">
	<div class="div_category_title">프로그램</div>
	<div class="div_category_content">
		<ul>
			<c:forEach items="${programList }" var="item">
			<li class="li_vods">
				<div class="vod_img"><a href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });"><img src="${item.photo_url}" width="120" height="68" /></a></div>
				<div class="vod_name"><a class="a_content" href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });">[${item.code_name}]</a></div>
				<div class="vod_title"><a class="a_title" href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });">${item.vodname }</a></div>
				<div class="vod_date">${item.firstdt }</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	<div class="div_category_more"><a href="${ctxRoot }search/search.htm?schText=${enSchText }&subMenu=program">프로그램 더보기 ▶</a></div>
</div>
</c:if>
<c:if test="${newsTotal>0 }">
<div id="search_news" class="div_search_category">
	<div class="div_category_title">뉴스</div>
	<div class="div_category_content">
		<ul>
			<li class="li_border"></li>
			<c:forEach items="${newsList }" var="item" varStatus="status">
			<li class="li_news">
				<c:choose>
				<c:when test="${item.svrfile2=='' }">
				<div class="news_category">[${item.maincd}]</div>
				<div class="news_title"><a class="a_title" href="${ctxRoot }news/view.htm?guid=${item.subcd}&nuid=${item.num}">${item.title}</a></div>
				<div class="news_name">${item.name} 기자</div>
				<div class="news_date">${item.ldate}</div>
				<div class="news_content"><a class="a_content" href="${ctxRoot }news/view.htm?guid=${item.subcd}&nuid=${item.num}">${item.content}</a></div>
				</c:when>
				<c:otherwise>
				<div class="news_img"><a href="${ctxRoot }news/view.htm?guid=${item.subcd}&nuid=${item.num}"><img src="${item.svrfile2}" width="90" height="60" /></a></div>
				<div class="news_img_body">
					<div class="news_category">[${item.maincd}]</div>
					<div class="news_title_img"><a class="a_title" href="${ctxRoot }news/view.htm?guid=${item.subcd}&nuid=${item.num}">${item.title}</a></div>
					<div class="news_name">${item.name} 기자</div>
					<div class="news_date">${item.ldate}</div>
					<div class="news_content_img"><a class="a_content" href="${ctxRoot }news/view.htm?guid=${item.subcd}&nuid=${item.num}">${item.content}</a></div>
				</div>
				</c:otherwise>
				</c:choose>
			</li>
			<c:if test="${!status.last }">
			<li class="li_news_hori"></li>
			</c:if>
			</c:forEach>
			<li class="li_border"></li>
		</ul>
	</div>
	<div class="div_category_more"><a href="${ctxRoot }search/search.htm?schText=${enSchText }&subMenu=news">뉴스 더보기 ▶</a></div>
</div>
</c:if>
<c:if test="${vodTotal>0 }">
<div id="search_vod" class="div_search_category">
	<div class="div_category_title">동영상</div>
	<div class="div_category_content">
		<ul>
			<c:forEach items="${vodList }" var="item">
			<li class="li_vods">
				<div class="vod_img"><a href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });"><img src="${item.photo_url}"/></a></div>
				<div class="vod_name"><a class="a_content" href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });">[${item.code_name}]</a></div>
				<div class="vod_title"><a class="a_title" href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });">${item.vodname}</a></div>
				<div class="vod_date">${item.firstdt}</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	<div class="div_category_more"><a href="${ctxRoot }search/search.htm?schText=${enSchText }&subMenu=vod">동영상 더보기 ▶</a></div>
</div>
</c:if>
<c:if test="${boardTotal[0]>0 }">
<div id="search_board" class="div_search_category">
	<div class="div_category_title">게시판</div>
	<div class="div_category_content">
		<c:if test="${boardTotal[1]>0 }">
		<ul>
			<li class="li_board_title">${boardName[1]}</li>
			<li class="li_border"></li>
			<c:forEach items="${boardList1 }" var="item" varStatus="status">
			<li class="li_board">
				<div class="board_title_long"><a class="a_title" href="${item.viewHref }" target="_new">${item.board_title}</a></div>
				<div class="board_name">${item.board_name}</div>
				<div class="board_date">${item.board_regdate}</div>
				<c:choose>
				<c:when test="${item.board_is_html=='1' }">
				<div class="board_content"><a class="a_content" href="${item.viewHref }" target="_new">HTML 형식의 글은 본문을 참고해주세요.</a></div>
				</c:when>
				<c:otherwise>
				<div class="board_content"><a class="a_content" href="${item.viewHref }" target="_new">${item.board_contents}</a></div>
				</c:otherwise>
				</c:choose>
			</li>
			<c:if test="${!status.last }">
			<li class="li_board_hori"></li>
			</c:if>
			</c:forEach>
			<li class="li_board_more"><a href="search.htm?schText=${enSchText}&subMenu=board&board=1">${boardName[1]} 더보기 ▶</a></li>
		</ul>
		</c:if>
		<c:if test="${boardTotal[2]>0 }">
		<ul>
			<li class="li_board_title">${boardName[2]}</li>
			<li class="li_border"></li>
			<c:forEach items="${boardList2 }" var="item" varStatus="status">
			<li class="li_board">
				<div class="board_title_long"><a class="a_title" href="${item.viewHref }" target="_new">${item.board_title}</a></div>
				<div class="board_name">${item.board_name}</div>
				<div class="board_date">${item.board_regdate}</div>
				<c:choose>
				<c:when test="${item.board_is_html=='1' }">
				<div class="board_content"><a class="a_content" href="${item.viewHref }" target="_new">HTML 형식의 글은 본문을 참고해주세요.</a></div>
				</c:when>
				<c:otherwise>
				<div class="board_content"><a class="a_content" href="${item.viewHref }" target="_new">${item.board_contents}</a></div>
				</c:otherwise>
				</c:choose>
			</li>
			<c:if test="${!status.last }">
			<li class="li_board_hori"></li>
			</c:if>
			</c:forEach>
			<li class="li_board_more"><a href="search.htm?schText=${enSchText}&subMenu=board&board=2">${boardName[2]} 더보기 ▶</a></li>
		</ul>
		</c:if>
		<c:if test="${boardTotal[3]>0 }">
		<ul>
			<li class="li_board_title">${boardName[3]}</li>
			<li class="li_border"></li>
			<c:forEach items="${boardList3 }" var="item" varStatus="status">
			<li class="li_board">
				<div class="board_title_long"><a class="a_content" href="${ctxRoot }contents/program.htm?muid=${item.board_cate_uid}">[${item.cate_name}]</a> <a class="a_title" href="${item.viewHref }" target="_new">${item.board_title}</a></div>
				<div class="board_name">${item.board_name}</div>
				<div class="board_date">${item.board_regdate}</div>
				<c:choose>
				<c:when test="${item.board_is_html=='1' }">
				<div class="board_content"><a class="a_content" href="${item.viewHref }" target="_new">HTML 형식의 글은 본문을 참고해주세요.</a></div>
				</c:when>
				<c:otherwise>
				<div class="board_content"><a class="a_content" href="${item.viewHref }" target="_new">${item.board_contents}</a></div>
				</c:otherwise>
				</c:choose>
			</li>
			<c:if test="${!status.last }">
			<li class="li_board_hori"></li>
			</c:if>
			</c:forEach>
			<li class="li_board_more"><a href="search.htm?schText=${enSchText}&subMenu=board&board=3">${boardName[3]} 더보기 ▶</a></li>
		</ul>
		</c:if>
		<c:if test="${boardTotal[4]>0 }">
		<ul>
			<li class="li_board_title">${boardName[4]}</li>
			<li class="li_border"></li>
			<c:forEach items="${boardList4 }" var="item" varStatus="status">
			<li class="li_board">
				<div class="board_title_long"><strong>[${item.cate_name }]</strong> <a class="a_title" href="${item.viewHref }" target="_new">${item.board_title}</a></div>
				<div class="board_name">${item.board_name}</div>
				<div class="board_date">${item.board_regdate}</div>
				<c:choose>
				<c:when test="${item.board_is_html=='1' }">
				<div class="board_content"><a class="a_content" href="${item.viewHref }" target="_new">HTML 형식의 글은 본문을 참고해주세요.</a></div>
				</c:when>
				<c:otherwise>
				<div class="board_content"><a class="a_content" href="${item.viewHref }" target="_new">${item.board_contents}</a></div>
				</c:otherwise>
				</c:choose>
			</li>
			<c:if test="${!status.last }">
			<li class="li_board_hori"></li>
			</c:if>
			</c:forEach>
			<li class="li_board_more"><a href="search.htm?schText=${enSchText}&subMenu=board&board=4">${boardName[4]} 더보기 ▶</a></li>
		</ul>
		</c:if>
		<c:if test="${boardTotal[5]>0 }">
		<ul>
			<li class="li_board_title">${boardName[5]}</li>
			<li class="li_border"></li>
			<c:forEach items="${boardList5 }" var="item" varStatus="status">
			<li class="li_board">
				<div class="board_title_long"><strong>[${item.cate_name }]</strong> <a class="a_title" href="${item.viewHref }" target="_new">${item.board_title}</a></div>
				<div class="board_name">${item.board_name}</div>
				<div class="board_date">${item.board_regdate}</div>
				<c:choose>
				<c:when test="${item.board_is_html=='1' }">
				<div class="board_content"><a class="a_content" href="${item.viewHref }" target="_new">HTML 형식의 글은 본문을 참고해주세요.</a></div>
				</c:when>
				<c:otherwise>
				<div class="board_content"><a class="a_content" href="${item.viewHref }" target="_new">${item.board_contents}</a></div>
				</c:otherwise>
				</c:choose>
			</li>
			<c:if test="${!status.last }">
			<li class="li_board_hori"></li>
			</c:if>
			</c:forEach>
			<li class="li_board_more"><a href="search.htm?schText=${enSchText}&subMenu=board&board=5">${boardName[5]} 더보기 ▶</a></li>
		</ul>
		</c:if>
		<c:if test="${boardTotal[6]>0 }">
		<ul>
			<li class="li_board_title">${boardName[6]}</li>
			<li class="li_border"></li>
			<c:forEach items="${boardList6 }" var="item" varStatus="status">
			<li class="li_board">
				<div class="board_title_long"><strong>[${item.cate_name }]</strong> <img src="../images/board/q.gif" width="16" height="15"> <a class="a_title" href="${item.viewHref }" target="_new">${item.board_title}</a></div>
				<div class="board_name">${item.board_name}</div>
				<div class="board_date">${item.board_regdate}</div>
				<c:choose>
				<c:when test="${item.board_is_html=='1' }">
				<div class="board_content"><a class="a_content" href="${item.viewHref }" target="_new">HTML 형식의 글은 본문을 참고해주세요.</a></div>
				</c:when>
				<c:otherwise>
				<div class="board_content"><a class="a_content" href="${item.viewHref }" target="_new">${item.board_contents}</a></div>
				</c:otherwise>
				</c:choose>
			</li>
			<c:if test="${!status.last }">
			<li class="li_board_hori"></li>
			</c:if>
			</c:forEach>
			<li class="li_board_more"><a href="search.htm?schText=${enSchText}&subMenu=board&board=6">${boardName[6]} 더보기 ▶</a></li>
		</ul>
		</c:if>
	</div>
</div>
</c:if>
<c:if test="${blogTotal>0 }">
<div id="search_blog" class="div_search_category">
	<div class="div_blog_title">블로그</div>
	<div class="div_blog_OpenAPI"><a href="http://dev.naver.com/openapi" target="_blank"><img src="${ctxRoot }images/search/logo07_1.gif" width="135" height="5" alt="NAVER OpenAPI"/></a></div>
	<div class="div_category_content">
		<ul>
			<li class="li_border"></li>
			<c:forEach items="${blogList }" var="item" varStatus="status">
			<li class="li_blogs">
				<div class="blog_title"><a class="a_title" href="" target="_new">${item.title }</a></div>
				<div class="blog_desc"><a class="a_content" href="${item.link }" target="_new">${item.desc }</a></div>
				<div class="blog_link"><a class="a_blog" href="${item.bloggerlink }" target="_new">[${item.bloggername }]</a></div>
			</li>
			<c:if test="${!status.last }">
			<li class="li_blogs_hori"></li>
			</c:if>
			</c:forEach>
			<li class="li_border"></li>
		</ul>
	</div>
	<div class="div_category_more"><a href="search.htm?schText=${enSchText}&subMenu=blog">블로그 더보기 ▶</a></div>
</div>
</c:if>
<c:if test="${webTotal>0 }">
<div id="search_web" class="div_search_category">
	<div class="div_web_title">웹문서</div>
	<div class="div_web_OpenAPI"><a href="http://dev.naver.com/openapi" target="_blank"><img src="${ctxRoot }images/search/logo07_1.gif" width="135" height="5" alt="NAVER OpenAPI"/></a></div>
	<div class="div_category_content">
		<ul>
			<li class="li_border"></li>
			<c:forEach items="${webList }" var="item" varStatus="status">
			<li class="li_webs">
				<div class="web_title"><a class="a_title" href="${item.link }" target="_new">${item.title }</a></div>
				<div class="web_desc"><a class="a_content" href="${item.link }" target="_new">${item.desc }</a></div>
			</li>
			<c:if test="${!status.last }">
			<li class="li_webs_hori"></li>
			</c:if>
			</c:forEach>
			<li class="li_border"></li>
		</ul>
	</div>
	<div class="div_category_more"><a href="search.htm?schText=${enSchText}&subMenu=web">웹문서 더보기 ▶</a></div>
</div>
</c:if>