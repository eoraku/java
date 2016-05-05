<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<link href="../css/template.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="../js/bslib.js"></script>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {

	});
	
	function validationChk(){
		$("#moone input[name=name]").val(CommonStrLib.trim($("#moone input[name=name]").val()));

		$("#moone input[name=phone1]").val(CommonStrLib.trim($("#moone input[name=phone1]").val()));
		$("#moone input[name=phone2]").val(CommonStrLib.trim($("#moone input[name=phone2]").val()));
		$("#moone input[name=phone3]").val(CommonStrLib.trim($("#moone input[name=phone3]").val()));
		
		$("#moone input[name=zipcode]").val(CommonStrLib.trim($("#moone input[name=zipcode]").val()));
		$("#moone input[name=address2]").val(CommonStrLib.trim($("#moone input[name=address2]").val()));
		
		if($("#moone input[name=name]").val() == '' || $("#moone input[name=name]").val() == null){
			alert('�̸��� �Է��� �ּ���.');
			return false;
		}

		if($("#moone input[name=phone1]").val() == '' ||
				$("#moone input[name=phone1]").val() == null ||
				$("#moone input[name=phone2]").val() == '' || 
				$("#moone input[name=phone2]").val() == null ||
				$("#moone input[name=phone3]").val() == '' || 
				$("#moone input[name=phone3]").val() == null ||
				!CommonStrLib.reg_match_phone($("#moone input[name=phone1]").val()+$("#moone input[name=phone2]").val()+$("#moone input[name=phone3]").val(), 'korea')){
			alert('��ȭ��ȣ ������ ���� �ʽ��ϴ�.');
			return false;
		}
		
		if($("#moone input[name=zipcode]").val() == '' || $("#moone input[name=zipcode]").val() == null){
			alert('�����ȣ�� �Է��� �ּ���.');
			return false;
		}
		
		if($("#moone input[name=address2]").val() == '' || $("#moone input[name=address2]").val() == null){
			alert('���ּҸ� �Է��� �ּ���.');
			return false;
		}
		
		if($("#moone select[name=service]").val() == '' || 
				$("#moone select[name=service]").val() == null || 
				!$("#moone select[name=service]").val() == 'usim' || 
				!$("#moone select[name=service]").val() == 'feature' || 
				!$("#moone select[name=service]").val() == 'smart' || 
				!$("#moone select[name=service]").val() == 'etc'){
			alert('�߸��� ���� �����Դϴ�.');
			alert($("#moone select[name=service]").val());
			return false;
		}
		
		if(CommonStrLib.getBytes($("#moone textarea[name=memo]").val()) > 400){
			alert('��û������ 200�� �̳��� �����ּ���.');
			return false;
		}
		return true;
	}
	
	function setNoteSize(){
		var memo_len = CommonStrLib.getBytes($("#moone textarea[name=memo]").val());
		
		if(memo_len == 0){
			row = "(200�� �̳�)";
		}else if(memo_len > 0 && memo_len <= 400){
			row = memo_len + "/400(bytes)";
		}else if(memo_len > 400){
			row = "(�ʹ� ��ϴ�.)";
		}
		$("#memo_size").empty();
		$("#memo_size").append(row);
		
	}
	
	function submitContact(){
		if(!validationChk())
			return;
		var param = "name=" + escape(encodeURIComponent($("#moone input[name=name]").val()));
			param += "&phone=" + $("#moone input[name=phone1]").val() + "-" + $("#moone input[name=phone2]").val() + "-" + $("#moone input[name=phone3]").val();
			param += "&zipcode=" + $("#moone input[name=zipcode]").val();
			param += "&address=" + escape(encodeURIComponent($("#moone input[name=address1]").val()) + " " + encodeURIComponent($("#moone input[name=address2]").val()));
			param += "&service=" + $("#moone select[name=service]").val();
			param += "&memo=" + escape(encodeURIComponent($("#moone textarea[name=memo]").val()));
		
		$.ajax({
			url : "${pageContext.servletContext.contextPath }/doInsertContact.json",
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
					if(DATA.result == 'ok'){
						$("#moone input[name=name]").val('');
						$("#moone input[name=phone1]").val('');
						$("#moone input[name=phone2]").val('');
						$("#moone input[name=phone3]").val('');
						$("#moone input[name=zipcode]").val('');
						$("#moone input[name=address1]").val('');
						$("#moone input[name=address2]").val('');
						$("#moone textarea[name=memo]").val('');
						alert('��û �Ϸ�Ǿ����ϴ�.');
						return;
					}else{
						alert('��û �� ������ ���� �������� �ʾҽ��ϴ�. �����ڿ��� �����ϼ���.')	
					}
				}
			},
			error : function(xhr, code, errorMsg) {
				alert("���� ��û �� ������ �߻��Ͽ����ϴ�. ���ڵ� :" + errorMsg);
			},
			beforeSend : function() {
			},
			complete : function() {
			}
		});
	}

	function getModelList(paramVal, type) {
		switch (type) {
		case 1:
			if (paramVal == 'none') {
				return alert("�����縦 �������ּ���.");
			}
			$("#search_phone input[name=type]").val(1);
			if (paramVal == null) {
				$("#search_phone select[name=manufacturer]").val('etc');
			} else {
				$("#search_phone select[name=manufacturer]").val(paramVal);
			}
			break;
		case 2:
			if (paramVal == '' || paramVal == null) {
				return alert("�˻�� �Է����ּ���.");
			}
			$("#search_phone input[name=type]").val(2);
			$("#search_phone input[name=model_name]").val(paramVal);
			break;
		}

		var param = $("#search_phone").serialize();
		param += "&encodeModelName="
				+ escape(encodeURIComponent($(
						"#search_phone input[name=model_name]").val()));
		$.ajax({
					url : "${pageContext.servletContext.contextPath }/getServiceablePhoneList.json",
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
							$("#serviceable_phone_table_tbody").empty();
							var row;
							if (DATA.list.length == 0) {
								row = "<tr><td colspan='6'>�˻� ����� �����ϴ�.</td></tr>";
								$("#serviceable_phone_table_tbody").append(row);
							} else {
								var jejosa;
								for ( var i = 0; i < DATA.list.length; i++) {
									row = "<tr>";
									row += "<td>";
									switch (DATA.list[i].manufacturer) {
									case 'samsung':
										jejosa = '�Ｚ����';
										break;
									case 'lg':
										jejosa = 'LG����';
										break;
									case 'htc':
										jejosa = 'HTC';
										break;
									case 'pantech':
										jejosa = '����';
										break;
									case 'kt':
										jejosa = 'KT��ũ';
										break;
									case 'skt':
										jejosa = 'SK�ڷ��ý�';
										break;
									case 'motorola':
										jejosa = '����ζ�';
										break;
									case 'sony':
										jejosa = '�ҴϿ�����';
										break;
									case 'etc':
										jejosa = '��Ÿ';
										break;
									}
									row += jejosa;
									row += "</td>";
									row += "<td>";
									row += DATA.list[i].model_name;
									row += "</td>";
									row += "<td>";
									if (DATA.list[i].serviceable_flag)
										row += "����";
									else
										row += "�Ұ�";
									row += "</td>";
									row += "<td>";
									if (DATA.list[i].mms_flag)
										row += "����";
									else
										row += "�Ұ�";
									row += "</td>";
									row += "<td>";
									if (DATA.list[i].data_flag)
										row += "����";
									else
										row += "�Ұ�";
									row += "</td>";
									row += "<td>";
									if (DATA.list[i].note)
										row += DATA.list[i].note;
									row += "</td>";
									row += "</tr>";
									$("#serviceable_phone_table_tbody").append(
											row);
								}
							}
						}
					},
					error : function(xhr, code, errorMsg) {
						alert("�����纰 ��ȸ ���� ������ �߻��Ͽ����ϴ�. ���ڵ� :" + errorMsg);
					},
					beforeSend : function() {
					},
					complete : function() {
					}
				});
	}

	function visibleDivTab(tabId, divId) {
		tabMenuHighlight(tabId);
		var contentsDiv = document.getElementById('tab_contents');
		for ( var i = 0; i < contentsDiv.children.length; i++) {
			contentsDiv.children[i].style.display = 'none';
		}
		var visibleDiv = document.getElementById(divId);
		visibleDiv.style.display = 'block';
	}

	function tabMenuHighlight(item) {
		var li = document.getElementById(item);
		for ( var i = 0; i < li.parentNode.children.length; i++) {
			li.parentNode.children[i].className = "";
		}
		li.className = "on";
	}
</script>
<div id="content_main" class="in_intro">
	<div id="product_top">
		<div id="product_top_img">
			<img src="../images/product/mvno_title_model.png" width="760" height="204" />
		</div>
	</div>
	<div id="product_main" style="margin-top: 60px;">
		<div id="product_category">
			<ul>
				<li id="btn1" class="on" onclick="visibleDivTab(id, 'mvno_info');"><a
					class="row1">��ǰ�Ұ�</a></li>
				<li id="btn2" onclick="visibleDivTab(id, 'mvno_price');"><a
					class="row1">�̿���</a></li>
				<li id="btn3" onclick="visibleDivTab(id, 'mvno_service');"><a
					class="row1">�ΰ�����</a></li>
				<li id="btn4" onclick="visibleDivTab(id, 'mvno_device');"><a
					class="row2">USIM ��ǰ<br />��� ���� �ܸ���
				</a></li>
				<li id="btn5" onclick="visibleDivTab(id, 'mvno_join');"><a
					class="row2">���� ����<br />(064-741-7777) </a></li>
			</ul>
		</div>
		<div id="tab_contents">
			<div id="mvno_info" style="display: block;">
				<div id="mvnois" style="height: 130px;">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> KCTV �˶����̶�?
					</div>
					<div class="in_contents">
						<p>
							&nbsp;&nbsp;�˶����� �̵���� ���Ǹ�(MVNO, Mobile Virtual Network
							Operator)������ ���ο� �츮��(��Ī) �Դϴ�. <br /> &nbsp;<strong>KCTV
								�˶���</strong>�� SKT�κ��� ���� �����Ͽ� �̿��ڿ��� KCTV ��ü �귣��� ��� ���񽺸� �����Ͽ� �����ڴ� ���� �˶���
							������� ��ż��񽺸� �̿��� �� �ֽ��ϴ�.
						</p>
					</div>
				</div>
				<div id="kctv_mvno" style="margin-top: 20px">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif"> KCTV �˶��� ����
					</div>
					<p>
						<img width="715" style="margin: 20px;"
							src="../images/product/mvno_info.png">
					</p>
				</div>
				<div id="kctv_device">
					<div class="mvno_device" style="margin-top: 30px">
						<div id="head_title">
							<img src="../images/product/mvno_bullet.gif" /> KCTV �˶��� �ܸ���
						</div>
						<div class="kctv_sale_device">
							<div class="kctv_device">
								<div id="device_pic">
									<img width="200" height="200" style="float: left;"
										src="../images/product/nexus5.jpg" alt="nexus5">
									<div id="caption" style="margin-top: 5px; padding-top: 5px;">Nexus
										5</div>
								</div>
								<div id="device_desc">
									<table>
										<thead>
											<tr>
												<th>����</th>
												<th>Nexus5</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>������</td>
												<td>LG ����</td>
											</tr>
											<tr>
												<td>��ÿ�</td>
												<td>'13�� 11��</td>
											</tr>
											<tr>
												<td>Spec.</td>
												<td>CPU: 2.3GHz �����ھ� <br />RAM: 2GB<br />Display:
													5.0"<br />Full HD(1920x1080) IPS<br />Camera: ���� 1.3M, �ĸ�
													8M
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="kctv_device">
								<div id="device_pic">
									<img src="../images/product/wine.png" height="200" width="200"
										alt="���� ����Ʈ" />
									<div id="caption">���� ����Ʈ</div>
								</div>
								<div id="device_desc">
									<table>
										<thead>
											<tr>
												<th>����</th>
												<th>���� ����Ʈ</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>������</td>
												<td>LG ����</td>
											</tr>
											<tr>
												<td>��ÿ�</td>
												<td>'12�� 2��</td>
											</tr>
											<tr>
												<td>Spec.</td>
												<td>Feature
													Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />Display:2.4"<br />Camera:3.2M
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="kctv_device">
								<div id="device_pic">
									<img src="../images/product/minimal.png" height="200"
										width="200" alt="�̴ϸ� ����" />
									<div id="caption">�̴ϸ� ����</div>
								</div>
								<div id="device_desc">
									<table>
										<thead>
											<tr>
												<th>����</th>
												<th>�Ｚ �̴ϸ�����</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>������</td>
												<td>�Ｚ ����</td>
											</tr>
											<tr>
												<td>��ÿ�</td>
												<td>'13�� 12��</td>
											</tr>
											<tr>
												<td>Spec.</td>
												<td>Feature
													Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />Display:2.6"<br />Camera:2M
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="kctv_device">
								<div id="device_pic">
									<img src="../images/product/breez.png" height="200" width="200"
										alt="�긮��4" />
									<div id="caption">�긮��4</div>
								</div>
								<div id="device_desc">
									<table>
										<thead>
											<tr>
												<th>����</th>
												<th>�긮��4</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>������</td>
												<td>����</td>
											</tr>
											<tr>
												<td>��ÿ�</td>
												<td>'13�� 12��</td>
											</tr>
											<tr>
												<td>Spec.</td>
												<td>Feature Phone(Dual LCD)<br />Display: 3.0"<br />Camera:
													2M
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="mvno_price" style="display: none;">
				<div id="normal">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> �Ϲ� �����
					</div>
					<div class="in_contents_table">
						<div id="caption_top" style="float: right;">[����:��, VAT ����]</div>
						<table id="price_tb">
							<thead>
								<th>�ǸŻ�ǰ</th>
								<th>�����Ⱓ</th>
								<th>�⺻��</th>
								<th>����/��</th>
								<th>SMS/��</th>
								<th>DATA/Mb</th>
							</thead>
							<tbody>
								<tr>
									<td>USIM�ܵ�(�ݰ�)</td>
									<td>����</td>
									<td>5,500</td>
									<td>1.8</td>
									<td>20</td>
									<td>51.2</td>
								</tr>
								<tr>
									<td>USIM�ܵ�(�Ϲ�)</td>
									<td>����</td>
									<td>11,000</td>
									<td style="color: red;">1.3</td>
									<td>20</td>
									<td>51.2</td>
								</tr>
							</tbody>
						</table>
						<div id="table_desc">
							<div id="price_title">���Ժ� ����</div>
							<div id="price_desc">6���� �̳� ������ ���Ժ� 24,000 û��</div>
							<div id="price_title">���� ������ �ܸ��� ����Ʈ</div>
							<div id="price_desc">
								1) '08�� 8�� ���� ��õ� SKT ���� �̷��� �ִ� �ܸ���<br />
								&nbsp;&nbsp;&nbsp;:LTE �ܸ���� 3G���� ��ȯ ���� �� ��� ����<br /> 2) ��,
								SKY(����)�� '10�� 6�� ���� ��õ� ����Ʈ�� �ܸ���<br /> &nbsp;&nbsp;* KT �Ϻ� �ܸ����
								LG U+ �ܸ��� ���ԺҰ�<br /> &nbsp;&nbsp;* �Ϻ� �ܸ��⿡���� MMS, DATA ������ ����<br />
								&nbsp;&nbsp;* �Ϻ� �ܸ������� A/S�湮�ؼ� ��Ʈ���� ������ �ؾ� ���� �̿� ����
							</div>
						</div>
					</div>
				</div>
				<div id="3year">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> ���� �����(24���� ����)
					</div>
					<div class="in_contents_table">
						<div id="caption_top" style="float: right;">[����:��, VAT ����]</div>
						<table>
							<colgroup>
								<!-- 
								<col style="width: 78pt;" width="104">
								<col style="width: 50pt;" width="67">
								<col style="width: 45pt;" width="60">
								<col style="width: 37pt;" span="3" width="50">
								<col style="width: 32pt;" width="43">
								<col style="width: 37pt;" width="50">
								<col style="width: 43pt;" width="57">
								<col style="width: 27pt;" width="36">
								<col style="width: 33pt;" width="43">
								<col style="width: 45pt;" width="60">
								<col style="width: 28pt;" span="2" width="38">
								<col style="width: 40pt;" width="53">
 -->
							<tbody>
								<tr style="background-color: #DDDDDD; height: 15px;">
									<td class="oa1" rowSpan="2" height="25px;">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>�ǸŻ�ǰ</span>
										</p>
									</td>
									<td class="oa2" rowSpan="2" height="25px;">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>�⺻��</span>
										</p>
									</td>
									<td class="oa2" colSpan="3" height="25px;">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>����</span>
										</p>
									</td>
									<td class="oa2" colSpan="3" height="25px;">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>�⺻������</span>
										</p>
									</td>
								</tr>
								<tr style="background-color: #DDDDDD" height="30">
									<td class="oa7">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>����</span>
										</p>
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>/��</span>
										</p>
									</td>
									<td class="oa7">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>SMS</span>
										</p>
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>/��</span>
										</p>
									</td>
									<td class="oa7">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>DATA</span>
										</p>
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>/Mb</span>
										</p>
									</td>
									<td class="oa7">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>����</span>
										</p>
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>/��</span>
										</p>
									</td>
									<td class="oa7">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>SMS</span>
										</p>
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>/��</span>
										</p>
									</td>
									<td class="oa7">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>DATA</span>
										</p>
								</tr>
								<tr style="height: 39.91pt;" height="53">
									<td style="width: 78pt; height: 39.91pt;" class="oa10"
										height="53" width="104">
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>���λ���Ʈ +</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span style="color: black;">KCTV ����9</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa11" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>9,000</span>
										</p>
									</td>
									<td style="width: 27pt;" class="oa12" width="36">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>1.8</span>
										</p>
									</td>
									<td style="width: 33pt;" class="oa12" width="43">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>20</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa12" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>51.2</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>&nbsp;- </span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>&nbsp;- </span>
										</p>
									</td>
									<td style="width: 40pt;" class="oa12" width="53">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>&nbsp;- </span>
										</p>
									</td>
								</tr>
								<tr style="height: 39.67pt;" height="53">
									<td style="width: 78pt; height: 39.67pt;" class="oa10"
										height="53" width="104">
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>���λ���Ʈ +</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span style="color: black;">KCTV ����17</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa11" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>17,000</span>
										</p>
									</td>
									<td style="width: 27pt;" class="oa12" width="36">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>1.8</span>
										</p>
									</td>
									<td style="width: 33pt;" class="oa12" width="43">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>20</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa12" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>51.2</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>60</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>50</span>
										</p>
									</td>
									<td style="width: 40pt;" class="oa12" width="53">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>&nbsp;- </span>
										</p>
									</td>
								</tr>
								<tr style="height: 39.67pt;" height="53">
									<td style="width: 78pt; height: 39.67pt;" class="oa10"
										height="53" width="104">
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>�̴ϸ����� +</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span style="color: black;">KCTV ����9</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa11" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>9,000</span>
										</p>
									</td>
									<td style="width: 27pt;" class="oa12" width="36">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>1.8</span>
										</p>
									</td>
									<td style="width: 33pt;" class="oa12" width="43">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>20</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa12" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>51.2</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>&nbsp;- </span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>&nbsp;- </span>
										</p>
									</td>
									<td style="width: 40pt;" class="oa12" width="53">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>&nbsp;- </span>
										</p>
									</td>
								</tr>
								<tr style="height: 40.45pt;" height="54">
									<td style="width: 78pt; height: 40.45pt;" class="oa10"
										height="54" width="104">
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span
												style='color: black; mso-ascii-theme-font: minor-latin;'>�̴ϸ�����
												+</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span style="color: black;">KCTV ����17</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa11" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>17,000</span>
										</p>
									</td>
									<td style="width: 27pt;" class="oa12" width="36">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>1.8</span>
										</p>
									</td>
									<td style="width: 33pt;" class="oa12" width="43">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>20</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa12" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>51.2</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>60</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>50</span>
										</p>
									</td>
									<td style="width: 40pt;" class="oa12" width="53">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>&nbsp;- </span>
										</p>
									</td>
								</tr>
								<tr style="height: 39.67pt;" height="53">
									<td style="width: 78pt; height: 39.67pt;" class="oa10"
										height="53" width="104">
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>�긮��4 +</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span style="color: black;">KCTV ����9</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa11" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>9,000</span>
										</p>
									</td>
									<td style="width: 27pt;" class="oa12" width="36">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>1.8</span>
										</p>
									</td>
									<td style="width: 33pt;" class="oa12" width="43">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>20</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa12" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>51.2</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>&nbsp;- </span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>&nbsp;- </span>
										</p>
									</td>
									<td style="width: 40pt;" class="oa12" width="53">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>&nbsp;- </span>
										</p>
									</td>
								</tr>
								<tr style="height: 39.67pt;" height="53">
									<td style="width: 78pt; height: 39.67pt;" class="oa10"
										height="53" width="104">
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span
												style='color: black; mso-ascii-theme-font: minor-latin;'>�긮��4
												+</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span style="color: black;">KCTV ����17</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa11" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>17,000</span>
										</p>
									</td>
									<td style="width: 27pt;" class="oa12" width="36">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>1.8</span>
										</p>
									</td>
									<td style="width: 33pt;" class="oa12" width="43">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>20</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa12" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>51.2</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>60</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>50</span>
										</p>
									</td>
									<td style="width: 40pt;" class="oa12" width="53">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>&nbsp;- </span>
										</p>
									</td>
								</tr>
								<tr style="height: 39.67pt;" height="53">
									<td style="width: 78pt; height: 39.67pt;" class="oa10"
										height="53" width="104">
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>�ؼ���5 +</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>����Ʈ38</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa11" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>38,000</span>
										</p>
									</td>
									<td style="width: 27pt;" class="oa12" width="36">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>1.8</span>
										</p>
									</td>
									<td style="width: 33pt;" class="oa12" width="43">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>20</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa12" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>51.2</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>120</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>70</span>
										</p>
									</td>
									<td style="width: 40pt;" class="oa12" width="53">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>700MB</span>
										</p>
									</td>
								</tr>
								<tr style="height: 39.67pt;" height="53">
									<td style="width: 78pt; height: 39.67pt;" class="oa10"
										height="53" width="104">
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>�ؼ���5 +</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>����Ʈ48</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa11" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>48,000</span>
										</p>
									</td>
									<td style="width: 27pt;" class="oa12" width="36">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>1.8</span>
										</p>
									</td>
									<td style="width: 33pt;" class="oa12" width="43">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>20</span>
										</p>
									</td>
									<td style="width: 45pt;" class="oa12" width="60">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>51.2</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>150</span>
										</p>
									</td>
									<td style="width: 28pt;" class="oa12" width="38">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>100</span>
										</p>
									</td>
									<td style="width: 40pt;" class="oa12" width="53">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>1GB</span>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
						<div id="table_desc">
							<div id="price_title">���Ժ� ����</div>
							<div id="price_desc">6���� �̳� ������ ���Ժ� 24,000 û��</div>
							<div id="price_title">�����</div>
							<div id="price_desc">�ܸ�������� �����Ⱓ �� ������ ����� 60,000�� �߻� / �ܿ�
								�Һα� û��</div>
						</div>
					</div>
				</div>
			</div>
			<div id="mvno_service" style="display: none;">
				<div id="etc_service_free">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> ���� ����
					</div>
					<div class="in_contents_table_etc">
						<table>
							<thead>
								<th>���񽺸�</th>
								<th>����</th>
							</thead>
							<tbody>
								<tr>
									<td>��������</td>
									<td>�޴���ȭ�� �̿��� �������� ����</td>
								</tr>
								<tr>
									<td>�Ҿװ���</td>
									<td>�޴���ȭ�� �̿��� �Ҿװ��� ����</td>
								</tr>
								<tr>
									<td>�߽Ź�ȣ ǥ��</td>
									<td>�߽����� ��ȭ��ȣ�� �� �޴����� ǥ�õǴ� ����</td>
								</tr>
								<tr>
									<td>��ȭ�� ���</td>
									<td>��ȭ �߿� ��ȭ�� �ɷ����� ���� �ɷ��� ��ȭ�� ���� �� �ִ� ����</td>
								</tr>
								<tr>
									<td>���͸�</td>
									<td>PR��ũ�� ���� ���̸� ��ȭ�� �޴� ����� �޴����� ���� ��Ī�� ǥ���ϴ� ����</td>
								</tr>
								<tr>
									<td>������ȭ �߽ű���</td>
									<td>������ȭ �߽ű���� �Ұ����ϰ� �ϴ� ����</td>
								</tr>
								<tr>
									<td>���� ARS����</td>
									<td>�������� �ǽɵǴ� ��ȣ�� ���� ������ȭ�� ������ �ִ� ����</td>
								</tr>
								<tr>
									<td>���� SMS ����</td>
									<td>SMS ���Կ��θ� üũ�Ͽ� ���ŵ��� ���ϵ��� �����ϴ� ����</td>
								</tr>
								<tr>
									<td>�߽Ź�ȣǥ�� ����</td>
									<td>���濡�� �� ��ȭ��ȣ�� �޴����� ǥ�õ��� �ʵ��� �ϴ� ����</td>
								</tr>
								<tr>
									<td>�߽ű���</td>
									<td>�޴��������� �߽��� �����ϰ� ���Ÿ� �����ϰ� ���ִ� ����</td>
								</tr>
								<tr>
									<td>���ű���</td>
									<td>�޴������� �ɷ����� ��� ����ȣ�� ������ �ִ� ����</td>
								</tr>
								<tr>
									<td>��й�ȣ��ȭ</td>
									<td>��ȭ �߽� �� ��й�ȣ�� �Է��ϰ� �����ν� �ٸ� ����� ����� ���� �ִ� ����</td>
								</tr>
								<tr>
									<td>�͸�ȣ ���Űź�</td>
									<td>�߽����� ��ȣ�� Ȯ�ε��� �ʴ� ��ȭ�� ������ �ִ� ����</td>
								</tr>
								<tr>
									<td>������ ��� ����</td>
									<td>-</td>
								</tr>
								<tr>
									<td>������ ��뷮 �˸�</td>
									<td>������ �����ݾ� �̻� ��� �� �����ͻ�뷮�� ������ �˷��ִ� ����</td>
								</tr>
								<tr>
									<td>������ ��ȭ ����</td>
									<td>������ ������� ����Ǵ� ��ȭ�� �������ִ� ����</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="etc_service_paid">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> ���Ǻ� ���� / ���� ����
					</div>
					<div class="in_contents_table_etc">
						<table>
							<thead>
								<th>���񽺸�</th>
								<th>���</th>
								<th>����</th>
							</thead>
							<tbody>
								<tr>
									<td>WiFi</td>
									<td>5,000��/��<br />������� ���� ����
									</td>
									<td>-</td>
								</tr>
								<tr>
									<td>�׺���̼�(T-map)</td>
									<td>5,000��/��</td>
									<td>-</td>
								</tr>
								<tr>
									<td>������ȯ(�Ϲ�)</td>
									<td>���� 1.2��/��<br />���� 2.4��/��<br />SMS 10��/��
									</td>
									<td>���ŵǴ� ��ȭ �� ���ڸ� �ٸ� ��ȭ�� ����/�����ϴ� ����</td>
								</tr>
								<tr>
									<td>������ȯ(������)</td>
									<td>���� 1.2��/��<br />���� 2.4��/��
									</td>
									<td>���ŵǴ� ��ȭ�� �ٸ� �޴����̳� ��ȭ�� ��� �������ִ� ����</td>
								</tr>
								<tr>
									<td>�ڵ�����(������ ��ȯ)</td>
									<td>���� 1.2��/��<br />���� 2.4��/��
									</td>
									<td>���ŵǴ� ��ȭ�� �� ���� ��� ���ϴ� ��ȭ�� �ڵ� �����ϴ� ����</td>
								</tr>
								<tr>
									<td>��Ű��</td>
									<td>500��/��</td>
									<td>���� ��ģ ��ȭ�� �߽Ź�ȣ ������ �˷��ִ� ����</td>
								</tr>
								<tr>
									<td>��ȭ���� �뺸/�˸���</td>
									<td>500��/��</td>
									<td>������ ��ȭ ���϶�, ��ȭ���ɻ��¸� ���ڷ� �뺸���ִ� ����</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="etc_service_missing">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> �ֿ� ������ �ΰ�����
					</div>
					<div class="in_contents_table_etc">
						<table>
							<thead>
								<th>���񽺸�</th>
								<th>����</th>
							</thead>
							<tbody>
								<tr>
									<td>�÷���</td>
									<td>-</td>
								</tr>
								<tr>
									<td>�����ι�</td>
									<td>*. �Ӵ�ι� ���� ��</td>
								</tr>
								<tr>
									<td>�ιְ��� �ΰ�����</td>
									<td>-</td>
								</tr>
								<tr>
									<td>�Ҹ���(�����缭��)</td>
									<td>-</td>
								</tr>
								<tr>
									<td>�����̽�</td>
									<td>-</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="mvno_device" style="display: none;">
				<div id="serviceable_phone">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> ��� ���� �ܸ��� ��ȸ
					</div>
					<div class="in_contents_table">
						<form id="search_phone" method="post"
							action="javascript:getModelList($('#search_phone input[name=model_name]').val(), 2);">
							<label for="manufacturer" style="margin: 0px 20px 0px 20px;">������
								�� ��ȸ</label> <select name="manufacturer">
								<option selected="selected" value="none">�����縦 �������ּ���.</option>
								<option value="samsung">�Ｚ</option>
								<option value="lg">LG</option>
								<option value="pantech">����</option>
								<option value="kt">KT��ũ</option>
								<option value="skt">SK�ڷ��ý�</option>
								<option value="motorola">����ζ�</option>
								<option value="htc">HTC</option>
								<option value="sony">�ҴϿ�����</option>
								<option value="etc">��Ÿ</option>
							</select> <input type="hidden" name="type" /><input type="button"
								value="��ȸ" name="btn_inquiry" class="btn_search"
								onclick="javascript:getModelList(manufacturer.value, 1)">
							<label style="margin: 0px 20px 0px 40px;" for="model_name">�𵨸�
								�˻�</label> <input type="text" name="model_name" size="15" /> <input
								type="button" class="btn_search"
								onclick="javascript:getModelList(model_name.value, 2)"
								name="btn_search" value="�˻�">
							<table id="serviceable_phone_table">
								<thead id="serviceable_phone_table_thead">
									<tr>
										<th rowspan="2" width="100px">������</th>
										<th rowspan="2" width="120px">�𵨸�</th>
										<th rowspan="2" width="80px">����<br />���� ����
										</th>
										<th colspan="2" width="150px">�ΰ�����</th>
										<th rowspan="2" width="250px">���</th>
									</tr>
									<tr>
										<th style="border-top: 0px;">MMS</th>
										<th style="border-top: 0px;">DATA</th>
									</tr>
								</thead>
								<tbody id="serviceable_phone_table_tbody">
									<tr>
										<td colspan="6">��ȸ �Ǵ� �˻��Ͽ� �ּ���.</td>
									</tr>
								</tbody>
							</table>
						</form>
						<div id="result_set"></div>
					</div>
				</div>
				<div id="caution">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> ���� ����
					</div>
					<div class="in_contents_table">
						<div id="table_desc">
							<div id="price_title">���� ������ �ܸ��� ����Ʈ</div>
							<div id="price_desc">
								1) '08�� 8�� ���� ��õ� SKT ���� �̷��� �ִ� �ܸ���<br />
								&nbsp;&nbsp;&nbsp;:LTE �ܸ���� 3G���� ��ȯ ���� �� ��� ����<br /> <br />
								2) ����Ʈ�� �ܸ���. ��, SKY(����)�� '10�� 6�� ���� ��õ� ����Ʈ�� �ܸ���<br />
								&nbsp;&nbsp; * KT �Ϻ� �ܸ���� LG U+ �ܸ��� ���ԺҰ�<br /> &nbsp;&nbsp; *
								�Ϻ� �ܸ��⿡���� MMS, DATA ������ ����<br />&nbsp;&nbsp; * �Ϻ� �ܸ�������
								A/S�湮�ؼ� ��Ʈ���� ������ �ؾ� ���� �̿� ����<br /> &nbsp;&nbsp; * �ܸ��� �����ؼ��� <strong>������(064-741-7777)</strong>��
								�����Ͻø� ģ���� �ȳ��ص帮�ڽ��ϴ�
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="mvno_join" style="display: none;">
				<div id="mvno_join_info">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> ���� ����
					</div>
					<div class="in_contents_table">
						<div id="table_desc">
							<div id="price_title">�ȳ�</div>
							<div id="price_desc">
								<strong><span style="font-size:13pt;">������(064-741-7777) </span></strong>�� ������ �ֽðų�<br /> �Ʒ��� ���� ���Ǹ�
								�����ֽø� �ż��� �����帮�ڽ��ϴ�.
							</div>
						</div>
					</div>
				</div>
				<div id="mvno_join_info">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> ���� ���� ��û
					</div>
					<div class="table_contact">
						<form id="moone" name="moone" method="post">
							<table style="border: 0px;" class="contact_join">
								<thead>
									<tr>
										<th colspan="2"
											style="border-top: 1px solid #CBCBCB; padding-left: 20px; border-right: none; border-left: none; background-color: #EDEDED">����
											���� ��û</th>
									</tr>
								</thead>
								<tbody style="text-align: left;">
									<tr
										style="border-bottom: 1px solid #DDDDDD; border-right: 0px;">
										<th
											style="width: 100px; border-right: 1px solid #EEEEEE; padding-left: 20px;">
											�̸�</th>
										<td
											style="padding-left: 20px; text-align: left; border-right: 0px; border-bottom: 0px;"><input
											type="text" size="10" name="name"></td>
									</tr>
									<tr
										style="border-bottom: 1px solid #DDDDDD; border-right: 0px;">
										<th
											style="width: 100px; border-right: 1px solid #EEEEEE; padding-left: 20px;">
											����ó</th>
										<td
											style="padding-left: 20px; text-align: left; border-right: 0px; border-bottom: 0px;"><input
											type="number" size="5" name="phone1">-<input
											type="number" size="5" name="phone2">-<input
											type="number" size="5" name="phone3"></td>
									</tr>
									<tr
										style="border-bottom: 1px solid #DDDDDD; border-right: 0px;">
										<th
											style="width: 100px; height: 100px; border-right: 1px solid #EEEEEE; padding-left: 20px;">�ּ�</th>
										<td
											style="padding-left: 20px; text-align: left; border-right: 0px; border-bottom: 0px;">�����ȣ
											: <input type="text" name="zipcode" id="zipcode"
											maxlength="7" style="width: 50px" readonly="readonly"><a
											href="#" onclick="javascript:searchZipcode('moone');"><img
												width="87" height="22" src="/images/user/zipcode_btn.gif"
												alt="�����ȣ�˻�"></a><br>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="text" name="address1" id="address1"
											maxlength="100" style="width: 250px" readonly="readonly"><br>
											���ּ� : <input type="text" name="address2" id="address2"
											maxlength="100" style="width: 250px">
										</td>
									</tr>
									<tr
										style="border-bottom: 1px solid #DDDDDD; border-right: 0px;">
										<th
											style="width: 100px; border-right: 1px solid #EEEEEE; padding-left: 20px;">����
											����</th>
										<td
											style="padding-left: 20px; text-align: left; border-right: 0px; border-bottom: 0px;"><select
											name="service">
												<option value="usim">����</option>
												<option value="feature">������</option>
												<option value="smart">����Ʈ��</option>
												<option value="etc">��Ÿ</option>
										</select></td>
									</tr>
									<tr
										style="border-bottom: 1px solid #DDDDDD; border-right: 0px;">
										<th
											style="width: 100px; border-right: 1px solid #EEEEEE; padding-left: 20px;">��û����<br />
											<label id="memo_size" name="memo_size">(200�� �̳�)</label>
										</th>
										<td
											style="padding-left: 20px; padding-top: 10px; padding-bottom: 10px; text-align: left; border-right: 0px; border-bottom: 0px;">
											<textarea style="resize: none;" cols="60" rows="4"
												name="memo" onkeydown="javascript:setNoteSize();" onkeyup="javascript:setNoteSize();"></textarea>
										</td>
									</tr>
									<tr style="border-bottom: 0px; border-right: 0px;">
										<td colspan="2"
											style="text-align: right; padding-right: 60px; border: none;"><input
											type="button" class="btn_search" name="submit" value="���ǽ�û"
											onclick="javascript:submitContact();">
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>