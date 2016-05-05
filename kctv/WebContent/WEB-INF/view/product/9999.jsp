<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<link href="../css/template.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="../js/bslib.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<script type="text/javascript">
	$(document).ready(function() {
		if('${sessionScope.userid}'){
			alert('${sessionScope.name}' + "님 환영합니다.");
			
			doGetMvnoContact();
		}else{
			alert('로그인이 필요합니다.');
			location.href="https://www.kctvjeju.com/user/login.htm";
		}
	});
	
	function doGetMvnoContact(){
		$.ajax({
			url : "${pageContext.servletContext.contextPath }/doGetMvnocontact.json",
			type : "POST",
			data : param,
			dataType : "JSON",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(DATA) {
				if (typeof DATA.ERROR != "undefined"
						&& DATA.ERROR != "") {
					alert(DATA.ERROR);
					return;
				} else {
					if(DATA.result == 'noPermission'){
						alert('조회 권한이 없습니다.');
						return;
					}else if(DATA.result == 'ok'){
						$("#contactListTableTbody").empty();
						var row;
						if (DATA.list.length == 0) {
							row = "<tr><td colspan='8'>검색 결과가 없습니다.</td></tr>";
							$("#contactListTableTbody").append(row);
						} else {
							for(var i=0; i<DATA.list.length; i++){
								row = "<tr>";
									row += "<td>";
									row += i+1;
									row += "</td>";
									row += "<td>";
									row += DATA.list[i].reg_date.substr(0, DATA.list[i].reg_date.length-2);
									row += "</td>";
									row += "<td>";
									row += DATA.list[i].name;
									row += "</td>";
									row += "<td>";
									row += DATA.list[i].phone;
									row += "</td>";
									row += "<td>";
									switch(DATA.list[i].service){
										case 'usim':
											row += '유심'
											break;
										case 'feature':
											row += '피쳐폰'
											break;
										case 'smart':
											row += '스마트폰'
											break;
										case 'etc':
											row += '기타'
											break;
									}
									row += "</td>";
									row += "<td>";
									row += DATA.list[i].address;
									row += "</td>";
									row += "<td>";
									row += DATA.list[i].memo;
									row += "</td>";
									row += "<td>";
									row += "<input type='button' class='btn_search' value='완료' onclick='javascript:doFinishContact(" + DATA.list[i].seq + ")'/>";
									row += "<input type='button' class='btn_search' value='삭제' onclick='javascript:deleteContact(" + DATA.list[i].seq + ")'/>";
									row += "</td>";
								row += "</tr>";
								$("#contactListTableTbody").append(row);
							}
						}
						
						return;
					}
					
				}
			},
			error : function(xhr, code, errorMsg) {
				alert("신청자 조회 중 오류가 발생하였습니다. 상세코드 :" + errorMsg);
			},
			beforeSend : function() {
			},
			complete : function() {
			}
		});
	}
	
	function deleteContact(seq){
		var param;
			param = "seq=" + seq;
		$.ajax({
			url : "${pageContext.servletContext.contextPath }/doDeleteContact.json",
			type : "POST",
			data : param,
			dataType : "JSON",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(DATA) {
				if (typeof DATA.ERROR != "undefined"
						&& DATA.ERROR != "") {
					alert(DATA.ERROR);
					return;
				} else {
					if(DATA.result == 'noPermission'){
						alert('권한이 없습니다.');
						return;
					}else if(DATA.result == 'noSelect'){
						alert('잘못된 번호입니다.');
						return;
					}else if(DATA.result == 'ok'){
						alert('삭제되었습니다.');
						doGetMvnoContact();
						return;
					}
					
				}
			},
			error : function(xhr, code, errorMsg) {
				alert("데이터 삭제 중 오류가 발생하였습니다. 상세코드 :" + errorMsg);
			},
			beforeSend : function() {
			},
			complete : function() {
			}
		});
	}
	
	function doFinishContact(seq){
		var param;
			param = "seq=" + seq;
		$.ajax({
			url : "${pageContext.servletContext.contextPath }/doFinishContact.json",
			type : "POST",
			data : param,
			dataType : "JSON",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(DATA) {
				if (typeof DATA.ERROR != "undefined"
						&& DATA.ERROR != "") {
					alert(DATA.ERROR);
					return;
				} else {
					if(DATA.result == 'noPermission'){
						alert('권한이 없습니다.');
						return;
					}else if(DATA.result == 'noSelect'){
						alert('잘못된 번호입니다.');
						return;
					}
					else if(DATA.result == 'ok'){
						alert('완료되었습니다.');
						doGetMvnoContact();
						return;
					}
					
				}
			},
			error : function(xhr, code, errorMsg) {
				alert("완료 처리 중 오류가 발생하였습니다. 상세코드 :" + errorMsg);
			},
			beforeSend : function() {
			},
			complete : function() {
			}
		});
	}
</script>
<div id="content_main" class="in_intro">
	<div id="product_top">
		<div id="product_top_img">
			<img src="../images/product/mvno_title_model.png" width="760" height="204" />
		</div>
	</div>
	<div id="contactList" style="float:left; margin-top:60px; margin-left:20px;">
		<table id="contactListTable" style="width:720px;">
			<thead>
				<tr>
					<th width="25px">번호</th>
					<th width="80px">등록일</th>
					<th width="60px">이름</th>
					<th width="100px">연락처</th>
					<th width="55px">서비스</th>
					<th width="165px">주소</th>
					<th width="165px">요청사항</th>
					<th width="70px"></th>
				</tr>
			</thead>
			<tbody id="contactListTableTbody">
				<tr>
					<td colspan="8">상담 신청이 없습니다.</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>