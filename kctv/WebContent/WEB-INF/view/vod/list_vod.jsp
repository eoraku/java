<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${ctxRoot }js/datePicker/jquery-ui.css" />
<script type="text/javascript" src="${ctxRoot }js/datePicker/jquery-ui-1.8.18.custom.min.js"></script>
<div id="program_search">
	<form id="vodSchForm" name="vodSchForm" method="get" action="program.htm">
	<input type="hidden" name="muid" value="${muid }"/>
	<input type="hidden" name="subPage" value="${subPage }"/>
	<input type="hidden" name="guid" value="${guid }"/>
	<c:if test="${muid==113 }">
	<ul class="search_cd">
		<li class="search_cd_title">대분류:</li>
		<li class="search_cd_value">
			<select id="maincd" name="maincd" onchange="setVodCode(1)">
				<option value="0">전체</option>
				<c:forEach items="${listMainCd }" var="item">
				<option value="${item.code_number }"<c:if test="${item.code_number==maincd }"> selected="selected"</c:if>>${item.code_name }</option>
				</c:forEach>
			</select>
		</li>
		<li class="search_cd_title">소분류:</li>
		<li class="search_cd_value">
			<select id="subcd" name="subcd" onchange="setVodCode(0)">
				<option value="0">전체</option>
				<c:forEach items="${listSubCd }" var="item">
				<option value="${item.code_number }"<c:if test="${item.code_number==subcd }"> selected="selected"</c:if>>${item.code_name }</option>
				</c:forEach>
			</select>
		</li>
	</ul>
	</c:if>
	<ul class="search_val">
		<li id="search_type">
			<select id="schType" name="schType">
				<c:choose>
				<c:when test="${schType=='title' }">
				<option value="title" selected="selected">제목</option>
				<option value="date">방송일</option>
				</c:when>
				<c:when test="${schType=='date' }">
				<option value="title">제목</option>
				<option value="date" selected="selected">방송일</option>
				</c:when>
				<c:otherwise>
				<option value="title" selected="selected">제목</option>
				<option value="date">방송일</option>
				</c:otherwise>
				</c:choose>
			</select>
		</li>
		<li id="search_text">
			<input id="schText" name="schText" type="text" maxlength="20" value="${schText }"/>
			<input id="schDate" name="schDate" type="text" maxlength="20" value="${schText }"/>
		</li>
		<li id="search_btn"><input type="image" src="../images/common/search_vod.png" width="41" height="19" alt="검색"/></li>
	</ul>
	</form>
</div>
<div id="program_vod_table">
	<table id="table_vod_list">
		<tbody>
		<c:choose>
		<c:when test="${vodTotal=='0' }">
		<tr>
			<c:choose>
			<c:when test="${schText=='' }">
			<td class="td_none">다시보기가 없습니다.</td>
			</c:when>
			<c:otherwise>
			<td class="td_none"><b>${schText }</b> 에 대한 검색결과가 없습니다.</td>
			</c:otherwise>
			</c:choose>
		</tr>
		</c:when>
		<c:otherwise>
		<c:forEach items="${vodList }" var="item">
		<tr>
			<td class="td_img"><a href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });"><img src="${item.photo_url }" width="120" height="68"/></a></td>
			<td class="td_content">
				<ul class="ul_content">
					<li class="li_title"><a href="#" onclick="javascript:vod_wmv('${ctxRoot }',${item.num });">${item.title }</a> <span>[${item.code_name }]</span></li>
					<li class="li_firstdt">방송일 : ${item.firstdt }</li>
					<li class="li_viewcnt">조회수 : ${item.view_cnt }건</li>
				</ul>
			</td>
		</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="2"></td>
		</tr>
		</tfoot>
	</table>
	<table id="table_vod_pages">
		<tr>
			<c:if test="${vodPaging.prev!='' }">
			<td><a class="page_prev" href="${urlQuery }${vodPaging.prev }">이전페이지</a></td>
			</c:if>
			<c:forEach items="${vodPaging.pages }" var="item">
			<c:choose>
			<c:when test="${item.isCurrent }">
			<td><div class="page_curr">${item.pageNo }</div></td>
			</c:when>
			<c:otherwise>
			<td><a class="page_link" href="${urlQuery }${item.pageLink }">${item.pageNo }</a></td>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${vodPaging.next!='' }">
			<td><a class="page_next" href="${urlQuery }${vodPaging.next }">다음페이지</a></td>
			</c:if>
		</tr>
	</table>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#vodSchForm").submit(function(){
		setSchType();
		
		if($("#schText").val()=="" || $("#schText").length<1){
			if($("#schType option:selected").val()=="date"){
				alert("검색 날짜를 입력해주세요.");
				$("#schDate").focus();
			}
			else{
				alert("검색어를 입력해주세요.");
				$("#schText").focus();
			}
			return false;
		}
	});
	
	$("#schType").change(function(){
		setSchType();
	});
	
	$("#schDate").datepicker({ 
		dateFormat: 'yy-mm-dd',
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		weekHeader: 'Wk',
		changeMonth: true, //월변경가능
		changeYear: true, //년변경가능
		yearRange:'2008:+0', // 연도 셀렉트 박스 범위(현재와 같으면 1988~현재년)
		showMonthAfterYear: true, //년 뒤에 월 표시
		//buttonImageOnly: true, //이미지표시  
		//buttonText: '날짜를 선택하세요', 
		autoSize: false //오토리사이즈(body등 상위태그의 설정에 따른다)
		//buttonImage: '/wtm/images/egovframework/wtm2/sub/bull_calendar.gif', //이미지주소 /wtm/images/egovframework/wtm2/sub/bull_calendar.gif
		//showOn: "both" //엘리먼트와 이미지 동시 사용
	});
	
	setSchType();
});

function setSchType(){
	if($("#schType option:selected").val()=="date"){
		$("#schText").hide();
		$("#schDate").show();
		$("#schText").val($("#schDate").val());
	}else{
		$("#schText").show();
		$("#schDate").hide();
		$("#schDate").val($("#schText").val());
	}
};
</script>