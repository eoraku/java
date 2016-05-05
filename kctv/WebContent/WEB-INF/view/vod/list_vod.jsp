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
		<li class="search_cd_title">��з�:</li>
		<li class="search_cd_value">
			<select id="maincd" name="maincd" onchange="setVodCode(1)">
				<option value="0">��ü</option>
				<c:forEach items="${listMainCd }" var="item">
				<option value="${item.code_number }"<c:if test="${item.code_number==maincd }"> selected="selected"</c:if>>${item.code_name }</option>
				</c:forEach>
			</select>
		</li>
		<li class="search_cd_title">�Һз�:</li>
		<li class="search_cd_value">
			<select id="subcd" name="subcd" onchange="setVodCode(0)">
				<option value="0">��ü</option>
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
				<option value="title" selected="selected">����</option>
				<option value="date">�����</option>
				</c:when>
				<c:when test="${schType=='date' }">
				<option value="title">����</option>
				<option value="date" selected="selected">�����</option>
				</c:when>
				<c:otherwise>
				<option value="title" selected="selected">����</option>
				<option value="date">�����</option>
				</c:otherwise>
				</c:choose>
			</select>
		</li>
		<li id="search_text">
			<input id="schText" name="schText" type="text" maxlength="20" value="${schText }"/>
			<input id="schDate" name="schDate" type="text" maxlength="20" value="${schText }"/>
		</li>
		<li id="search_btn"><input type="image" src="../images/common/search_vod.png" width="41" height="19" alt="�˻�"/></li>
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
			<td class="td_none">�ٽú��Ⱑ �����ϴ�.</td>
			</c:when>
			<c:otherwise>
			<td class="td_none"><b>${schText }</b> �� ���� �˻������ �����ϴ�.</td>
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
					<li class="li_firstdt">����� : ${item.firstdt }</li>
					<li class="li_viewcnt">��ȸ�� : ${item.view_cnt }��</li>
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
			<td><a class="page_prev" href="${urlQuery }${vodPaging.prev }">����������</a></td>
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
			<td><a class="page_next" href="${urlQuery }${vodPaging.next }">����������</a></td>
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
				alert("�˻� ��¥�� �Է����ּ���.");
				$("#schDate").focus();
			}
			else{
				alert("�˻�� �Է����ּ���.");
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
		monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
		dayNamesMin: ['��','��','ȭ','��','��','��','��'],
		weekHeader: 'Wk',
		changeMonth: true, //�����氡��
		changeYear: true, //�⺯�氡��
		yearRange:'2008:+0', // ���� ����Ʈ �ڽ� ����(����� ������ 1988~�����)
		showMonthAfterYear: true, //�� �ڿ� �� ǥ��
		//buttonImageOnly: true, //�̹���ǥ��  
		//buttonText: '��¥�� �����ϼ���', 
		autoSize: false //���丮������(body�� �����±��� ������ ������)
		//buttonImage: '/wtm/images/egovframework/wtm2/sub/bull_calendar.gif', //�̹����ּ� /wtm/images/egovframework/wtm2/sub/bull_calendar.gif
		//showOn: "both" //������Ʈ�� �̹��� ���� ���
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