<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="program_banner">
	<img src="../images/program/topimg.gif" width="670" height="78"/>
</div>
<div id="program_title">
	<img src="../images/program/c_title235.gif" width="225" height="18"/>
</div>
<div id="program_schedule">
	<div id="schedule_notice">
	☞ 이 편성표는 방송사의 사정에 따라 변경 될 수 있습니다
	</div>
	<div id="schedule_week">
		<ul>
			<c:forEach items="${listDay }" var="item">
			${item }
			</c:forEach>
		</ul>
	</div>
	<c:choose>
	<c:when test="${totalSchedule>0 }">
	<div id="schedule_head">
		<dl>
			<dt>시간</dt>
			<dd>프로그램명</dd>
		</dl>
	</div>
	<div id="schedule_body">
		<ul>
			<c:forEach items="${listSchedule }" var="item"> 
			<li>
				<dl>
					<dt>${item.pk_time }</dt>
					<dd>${item.program }</dd>
				</dl>
			</li>
			</c:forEach>
		</ul>
	</div>
	</c:when>
	<c:otherwise>
	<p>등록된 편성표가 없습니다.</p>
	</c:otherwise>
	</c:choose>
</div>
<div id="program_icon">
	<ul>
		<li>
			<dl>
				<dt><img src="${ctxRoot }images/program/schedule_ja.png"/></dt>
				<dd>자막방송</dd>
			</dl>
		</li>
	</ul>
</div>