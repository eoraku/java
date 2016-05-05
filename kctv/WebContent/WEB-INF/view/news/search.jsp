<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="news_search_title">
	<img src="../images/news/icon_subtit.png" width="11" height="11" hspace="3" /> �����˻�
</div>
<div id="news_search_head">
	<form name="searchNews">
	<ul>
		<li>
			<dl>
				<dt><img src="../images/news/search_tit02.gif" width="63" height="14" /></dt>
				<dd>
					<input type="radio" name="guid" value="0"<c:if test="${guid==0 }"> checked="checked"</c:if>/> ��ü
					<input type="radio" name="guid" value="1"<c:if test="${guid==1 }"> checked="checked"</c:if>/> ��ġ/����
					<input type="radio" name="guid" value="2"<c:if test="${guid==2 }"> checked="checked"</c:if>/> ����/����
					<input type="radio" name="guid" value="3"<c:if test="${guid==3 }"> checked="checked"</c:if>/> ��ȸ/����
					<input type="radio" name="guid" value="4"<c:if test="${guid==4 }"> checked="checked"</c:if>/> ��ȭ/ü��
				</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt><img src="../images/news/search_tit01.gif" width="63" height="14" /></dt>
				<dd>
					<input type="radio" name="schType" value="title"<c:if test="${schType=='title' || schType==''}"> checked="checked"</c:if>/> ����
					<input type="radio" name="schType" value="content"<c:if test="${schType=='content' }"> checked="checked"</c:if>/> ����
					<input type="radio" name="schType" value="name"<c:if test="${schType=='name' }"> checked="checked"</c:if>/> ����
				</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt><img src="../images/news/search_tit03.gif" width="63" height="14" /></dt>
				<dd>
					<input type="text" name="date1" class="datePicker" value="${date1 }"/> ~ 
					<input type="text" name="date2" class="datePicker" value="${date2 }"/>
				</dd>
			</dl>
		</li>
		<%-- <li>
			<dl>
				<dt><img src="../images/news/search_tit04.gif" width="62" height="14" /></dt>
				<dd>
					<input type="radio" name="order" value="desc"<c:if test="${order=='desc' }"> checked="checked"</c:if>/> �ֱ� ��������
					<input type="radio" name="order" value="asc"<c:if test="${order=='asc' }"> checked="checked"</c:if>/> ���� ��������
				</dd>
			</dl>
		</li> --%>
		<li>
			<dl>
				<dt><img src="../images/news/search_tit05.png" width="62" height="14" /></dt>
				<dd>
					<input type="text" name="schText" class="textInput" value="${schText }" />
					<input type="image" src="../images/news/btn_search2.png" width="55" height="21"/>
				</dd>
			</dl>
		</li>
	</ul>
	</form>
</div>
<div id="news_search_result_title">
	<img src="../images/news/icon_06.gif" width="28" height="24" /> �˻���� : ��(<fmt:formatNumber type="number" value="${listTotal }" />��)
</div>
<div id="news_search_result_list">
<c:choose>
<c:when test="${listTotal > 0}">
	<ul>
		<li class="li_news_border"></li>
		<c:forEach items="${listNews}" var="item">
		<c:choose>
		<c:when test="${item.svrfile2=='0' }">
		<li class="li_news_noimg">
			<div class="news_title">
				<dl>
					<dd>[${item.maincd }]</dd>
					<dt><a class="a_news_title" href="view.htm?guid=${guid }&nuid=${item.num }">${item.title }</a></dt>
					<dd><a class="a_news_name" href="list.htm?guid=${guid }&schType=name&schText=${item.name }">${item.name }</a></dd>
				</dl>
			</div>
			<div class="news_content"><a class="a_news_content" href="view.htm?guid=${guid }&nuid=${item.num }">${item.content }</a><span>${item.ldate }</span></div>
		</li>
		</c:when>
		<c:otherwise>
		<li class="li_news_img">
			<div class="news_img"><a href=""><img src="${item.svrfile2 }" width="100" height="60"/></a></div>
			<div class="news_title">
				<dl>
					<dd>[${item.maincd }]</dd>
					<dt><a class="a_news_title" href="view.htm?guid=${guid }&nuid=${item.num }">${item.title }</a></dt>
					<dd><a class="a_news_name" href="view.htm?guid=${guid }&nuid=${item.num }">${item.name }</a></dd>
				</dl>
			</div>
			<div class="news_content"><a class="a_news_content" href="view.htm?guid=${guid }&nuid=${item.num }">${item.content }</a><span>${item.ldate }</span></div>
		</li>
		</c:otherwise>
		</c:choose>
		</c:forEach>
	</ul>
</c:when>
<c:otherwise>
	<ul>
		<li class="li_news_border"></li>
		<li class="li_result_none">�ƢƢƢ� �˻��� ������ �����ϴ�. �ƢƢƢ�</li>
	</ul>
</c:otherwise>
</c:choose>
</div>
<c:if test="${listTotal > 0}">
<div id="news_btm_pages">
	<table id="ul_news_pages">
		<tr>
			<c:if test="${newsPaging.prev!='' }">
			<td><a class="page_prev" href="${urlQuery }${newsPaging.prev }">����������</a></td>
			</c:if>
			<c:forEach items="${newsPaging.pages }" var="item">
			<c:choose>
			<c:when test="${item.isCurrent }">
			<td><div class="page_curr">${item.pageNo }</div></td>
			</c:when>
			<c:otherwise>
			<td><a class="page_link" href="${urlQuery }${item.pageLink }">${item.pageNo }</a></td>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${newsPaging.next!='' }">
			<td><a class="page_next" href="${urlQuery }${newsPaging.next }">����������</a></td>
			</c:if>
		</tr>
	</table>
</div>
</c:if>
<script type="text/javascript">
$(document).ready(function(){
	$(".datePicker").datepicker({ 
		dateFormat: 'yy-mm-dd',
		monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
		dayNamesMin: ['��','��','ȭ','��','��','��','��'],
		weekHeader: 'Wk',
		changeMonth: true, //�����氡��
		changeYear: true, //�⺯�氡��
		yearRange:'2008:+0', // ���� ����Ʈ �ڽ� ����(����� ������ 1988~�����)
		showMonthAfterYear: true, //�� �ڿ� �� ǥ��
		//buttonImageOnly: true, //�̹���ǥ��  
		//buttonText: '��¥�� �����ϼ���', 
		autoSize: false, //���丮������(body�� �����±��� ������ ������)
		//buttonImage: '/wtm/images/egovframework/wtm2/sub/bull_calendar.gif', //�̹����ּ� /wtm/images/egovframework/wtm2/sub/bull_calendar.gif
		//showOn: "both" //������Ʈ�� �̹��� ���� ���
	});
});
</script>