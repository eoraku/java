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
			alert('${sessionScope.name}' + "�� ȯ���մϴ�.");
			
			doGetMvnoContact();
		}else{
			alert('�α����� �ʿ��մϴ�.');
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
						alert('��ȸ ������ �����ϴ�.');
						return;
					}else if(DATA.result == 'ok'){
						$("#contactListTableTbody").empty();
						var row;
						if (DATA.list.length == 0) {
							row = "<tr><td colspan='8'>�˻� ����� �����ϴ�.</td></tr>";
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
											row += '����'
											break;
										case 'feature':
											row += '������'
											break;
										case 'smart':
											row += '����Ʈ��'
											break;
										case 'etc':
											row += '��Ÿ'
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
									row += "<input type='button' class='btn_search' value='�Ϸ�' onclick='javascript:doFinishContact(" + DATA.list[i].seq + ")'/>";
									row += "<input type='button' class='btn_search' value='����' onclick='javascript:deleteContact(" + DATA.list[i].seq + ")'/>";
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
				alert("��û�� ��ȸ �� ������ �߻��Ͽ����ϴ�. ���ڵ� :" + errorMsg);
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
						alert('������ �����ϴ�.');
						return;
					}else if(DATA.result == 'noSelect'){
						alert('�߸��� ��ȣ�Դϴ�.');
						return;
					}else if(DATA.result == 'ok'){
						alert('�����Ǿ����ϴ�.');
						doGetMvnoContact();
						return;
					}
					
				}
			},
			error : function(xhr, code, errorMsg) {
				alert("������ ���� �� ������ �߻��Ͽ����ϴ�. ���ڵ� :" + errorMsg);
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
						alert('������ �����ϴ�.');
						return;
					}else if(DATA.result == 'noSelect'){
						alert('�߸��� ��ȣ�Դϴ�.');
						return;
					}
					else if(DATA.result == 'ok'){
						alert('�Ϸ�Ǿ����ϴ�.');
						doGetMvnoContact();
						return;
					}
					
				}
			},
			error : function(xhr, code, errorMsg) {
				alert("�Ϸ� ó�� �� ������ �߻��Ͽ����ϴ�. ���ڵ� :" + errorMsg);
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
					<th width="25px">��ȣ</th>
					<th width="80px">�����</th>
					<th width="60px">�̸�</th>
					<th width="100px">����ó</th>
					<th width="55px">����</th>
					<th width="165px">�ּ�</th>
					<th width="165px">��û����</th>
					<th width="70px"></th>
				</tr>
			</thead>
			<tbody id="contactListTableTbody">
				<tr>
					<td colspan="8">��� ��û�� �����ϴ�.</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>