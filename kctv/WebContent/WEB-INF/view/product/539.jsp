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
			alert('이름을 입력해 주세요.');
			return false;
		}

		if($("#moone input[name=phone1]").val() == '' ||
				$("#moone input[name=phone1]").val() == null ||
				$("#moone input[name=phone2]").val() == '' || 
				$("#moone input[name=phone2]").val() == null ||
				$("#moone input[name=phone3]").val() == '' || 
				$("#moone input[name=phone3]").val() == null ||
				!CommonStrLib.reg_match_phone($("#moone input[name=phone1]").val()+$("#moone input[name=phone2]").val()+$("#moone input[name=phone3]").val(), 'korea')){
			alert('전화번호 형식이 맞지 않습니다.');
			return false;
		}
		
		if($("#moone input[name=zipcode]").val() == '' || $("#moone input[name=zipcode]").val() == null){
			alert('우편번호를 입력해 주세요.');
			return false;
		}
		
		if($("#moone input[name=address2]").val() == '' || $("#moone input[name=address2]").val() == null){
			alert('상세주소를 입력해 주세요.');
			return false;
		}
		
		if($("#moone select[name=service]").val() == '' || 
				$("#moone select[name=service]").val() == null || 
				!$("#moone select[name=service]").val() == 'usim' || 
				!$("#moone select[name=service]").val() == 'feature' || 
				!$("#moone select[name=service]").val() == 'smart' || 
				!$("#moone select[name=service]").val() == 'etc'){
			alert('잘못된 관심 서비스입니다.');
			alert($("#moone select[name=service]").val());
			return false;
		}
		
		if(CommonStrLib.getBytes($("#moone textarea[name=memo]").val()) > 400){
			alert('요청사항을 200자 이내로 적어주세요.');
			return false;
		}
		return true;
	}
	
	function setNoteSize(){
		var memo_len = CommonStrLib.getBytes($("#moone textarea[name=memo]").val());
		
		if(memo_len == 0){
			row = "(200자 이내)";
		}else if(memo_len > 0 && memo_len <= 400){
			row = memo_len + "/400(bytes)";
		}else if(memo_len > 400){
			row = "(너무 깁니다.)";
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
						alert('신청 완료되었습니다.');
						return;
					}else{
						alert('신청 중 문제가 생겨 접수되지 않았습니다. 관리자에게 문의하세요.')	
					}
				}
			},
			error : function(xhr, code, errorMsg) {
				alert("문의 신청 중 오류가 발생하였습니다. 상세코드 :" + errorMsg);
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
				return alert("제조사를 선택해주세요.");
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
				return alert("검색어를 입력해주세요.");
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
								row = "<tr><td colspan='6'>검색 결과가 없습니다.</td></tr>";
								$("#serviceable_phone_table_tbody").append(row);
							} else {
								var jejosa;
								for ( var i = 0; i < DATA.list.length; i++) {
									row = "<tr>";
									row += "<td>";
									switch (DATA.list[i].manufacturer) {
									case 'samsung':
										jejosa = '삼성전자';
										break;
									case 'lg':
										jejosa = 'LG전자';
										break;
									case 'htc':
										jejosa = 'HTC';
										break;
									case 'pantech':
										jejosa = '팬텍';
										break;
									case 'kt':
										jejosa = 'KT테크';
										break;
									case 'skt':
										jejosa = 'SK텔레시스';
										break;
									case 'motorola':
										jejosa = '모토로라';
										break;
									case 'sony':
										jejosa = '소니에릭슨';
										break;
									case 'etc':
										jejosa = '기타';
										break;
									}
									row += jejosa;
									row += "</td>";
									row += "<td>";
									row += DATA.list[i].model_name;
									row += "</td>";
									row += "<td>";
									if (DATA.list[i].serviceable_flag)
										row += "가능";
									else
										row += "불가";
									row += "</td>";
									row += "<td>";
									if (DATA.list[i].mms_flag)
										row += "가능";
									else
										row += "불가";
									row += "</td>";
									row += "<td>";
									if (DATA.list[i].data_flag)
										row += "가능";
									else
										row += "불가";
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
						alert("제조사별 조회 도중 오류가 발생하였습니다. 상세코드 :" + errorMsg);
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
					class="row1">상품소개</a></li>
				<li id="btn2" onclick="visibleDivTab(id, 'mvno_price');"><a
					class="row1">이용요금</a></li>
				<li id="btn3" onclick="visibleDivTab(id, 'mvno_service');"><a
					class="row1">부가서비스</a></li>
				<li id="btn4" onclick="visibleDivTab(id, 'mvno_device');"><a
					class="row2">USIM 상품<br />사용 가능 단말기
				</a></li>
				<li id="btn5" onclick="visibleDivTab(id, 'mvno_join');"><a
					class="row2">가입 문의<br />(064-741-7777) </a></li>
			</ul>
		</div>
		<div id="tab_contents">
			<div id="mvno_info" style="display: block;">
				<div id="mvnois" style="height: 130px;">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> KCTV 알뜰폰이란?
					</div>
					<div class="in_contents">
						<p>
							&nbsp;&nbsp;알뜰폰은 이동통신 재판매(MVNO, Mobile Virtual Network
							Operator)서비스의 새로운 우리말(애칭) 입니다. <br /> &nbsp;<strong>KCTV
								알뜰폰</strong>은 SKT로부터 망을 임차하여 이용자에게 KCTV 자체 브랜드로 통신 서비스를 제공하여 가입자는 보다 알뜰한
							요금으로 통신서비스를 이용할 수 있습니다.
						</p>
					</div>
				</div>
				<div id="kctv_mvno" style="margin-top: 20px">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif"> KCTV 알뜰폰 서비스
					</div>
					<p>
						<img width="715" style="margin: 20px;"
							src="../images/product/mvno_info.png">
					</p>
				</div>
				<div id="kctv_device">
					<div class="mvno_device" style="margin-top: 30px">
						<div id="head_title">
							<img src="../images/product/mvno_bullet.gif" /> KCTV 알뜰폰 단말기
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
												<th>구분</th>
												<th>Nexus5</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>제조사</td>
												<td>LG 전자</td>
											</tr>
											<tr>
												<td>출시월</td>
												<td>'13년 11월</td>
											</tr>
											<tr>
												<td>Spec.</td>
												<td>CPU: 2.3GHz 쿼드코어 <br />RAM: 2GB<br />Display:
													5.0"<br />Full HD(1920x1080) IPS<br />Camera: 전면 1.3M, 후면
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
										alt="와인 샤베트" />
									<div id="caption">와인 샤베트</div>
								</div>
								<div id="device_desc">
									<table>
										<thead>
											<tr>
												<th>구분</th>
												<th>와인 샤베트</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>제조사</td>
												<td>LG 전자</td>
											</tr>
											<tr>
												<td>출시월</td>
												<td>'12년 2월</td>
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
										width="200" alt="미니멀 폴더" />
									<div id="caption">미니멀 폴더</div>
								</div>
								<div id="device_desc">
									<table>
										<thead>
											<tr>
												<th>구분</th>
												<th>삼성 미니멀폴더</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>제조사</td>
												<td>삼성 전자</td>
											</tr>
											<tr>
												<td>출시월</td>
												<td>'13년 12월</td>
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
										alt="브리즈4" />
									<div id="caption">브리즈4</div>
								</div>
								<div id="device_desc">
									<table>
										<thead>
											<tr>
												<th>구분</th>
												<th>브리즈4</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>제조사</td>
												<td>팬택</td>
											</tr>
											<tr>
												<td>출시월</td>
												<td>'13년 12월</td>
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
						<img src="../images/product/mvno_bullet.gif" /> 일반 요금제
					</div>
					<div class="in_contents_table">
						<div id="caption_top" style="float: right;">[단위:원, VAT 별도]</div>
						<table id="price_tb">
							<thead>
								<th>판매상품</th>
								<th>약정기간</th>
								<th>기본료</th>
								<th>음성/초</th>
								<th>SMS/건</th>
								<th>DATA/Mb</th>
							</thead>
							<tbody>
								<tr>
									<td>USIM단독(반값)</td>
									<td>없음</td>
									<td>5,500</td>
									<td>1.8</td>
									<td>20</td>
									<td>51.2</td>
								</tr>
								<tr>
									<td>USIM단독(일반)</td>
									<td>없음</td>
									<td>11,000</td>
									<td style="color: red;">1.3</td>
									<td>20</td>
									<td>51.2</td>
								</tr>
							</tbody>
						</table>
						<div id="table_desc">
							<div id="price_title">가입비 면제</div>
							<div id="price_desc">6개월 이내 해지시 가입비 24,000 청구</div>
							<div id="price_title">가입 가능한 단말기 리스트</div>
							<div id="price_desc">
								1) '08년 8월 이후 출시된 SKT 개통 이력이 있는 단말기<br />
								&nbsp;&nbsp;&nbsp;:LTE 단말기는 3G모드로 전환 설정 후 사용 가능<br /> 2) 단,
								SKY(팬택)는 '10년 6월 이후 출시된 스마트폰 단말기<br /> &nbsp;&nbsp;* KT 일부 단말기와
								LG U+ 단말기 가입불가<br /> &nbsp;&nbsp;* 일부 단말기에서는 MMS, DATA 서비스의 제한<br />
								&nbsp;&nbsp;* 일부 단말기종은 A/S방문해서 컨트리락 해제를 해야 정상 이용 가능
							</div>
						</div>
					</div>
				</div>
				<div id="3year">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> 통합 요금제(24개월 약정)
					</div>
					<div class="in_contents_table">
						<div id="caption_top" style="float: right;">[단위:원, VAT 별도]</div>
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
											<span>판매상품</span>
										</p>
									</td>
									<td class="oa2" rowSpan="2" height="25px;">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>기본료</span>
										</p>
									</td>
									<td class="oa2" colSpan="3" height="25px;">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>요율</span>
										</p>
									</td>
									<td class="oa2" colSpan="3" height="25px;">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>기본제공량</span>
										</p>
									</td>
								</tr>
								<tr style="background-color: #DDDDDD" height="30">
									<td class="oa7">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>음성</span>
										</p>
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>/초</span>
										</p>
									</td>
									<td class="oa7">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>SMS</span>
										</p>
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>/건</span>
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
											<span>음성</span>
										</p>
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>/분</span>
										</p>
									</td>
									<td class="oa7">
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>SMS</span>
										</p>
										<p
											style="margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>/건</span>
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
											<span>와인샤베트 +</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span style="color: black;">KCTV 음성9</span>
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
											<span>와인샤베트 +</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span style="color: black;">KCTV 음성17</span>
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
											<span>미니멀폴더 +</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span style="color: black;">KCTV 음성9</span>
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
												style='color: black; mso-ascii-theme-font: minor-latin;'>미니멀폴더
												+</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span style="color: black;">KCTV 음성17</span>
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
											<span>브리즈4 +</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span style="color: black;">KCTV 음성9</span>
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
												style='color: black; mso-ascii-theme-font: minor-latin;'>브리즈4
												+</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span style="color: black;">KCTV 음성17</span>
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
											<span>넥서스5 +</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>스마트38</span>
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
											<span>넥서스5 +</span>
										</p>
										<p
											style="line-height: 18pt; margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; vertical-align: middle;">
											<span>스마트48</span>
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
							<div id="price_title">가입비 면제</div>
							<div id="price_desc">6개월 이내 해지시 가입비 24,000 청구</div>
							<div id="price_title">위약금</div>
							<div id="price_desc">단말요금제는 약정기간 내 해지시 위약금 60,000원 발생 / 잔여
								할부금 청구</div>
						</div>
					</div>
				</div>
			</div>
			<div id="mvno_service" style="display: none;">
				<div id="etc_service_free">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> 무료 제공
					</div>
					<div class="in_contents_table_etc">
						<table>
							<thead>
								<th>서비스명</th>
								<th>내용</th>
							</thead>
							<tbody>
								<tr>
									<td>본인인증</td>
									<td>휴대전화를 이용한 본인인증 서비스</td>
								</tr>
								<tr>
									<td>소액결제</td>
									<td>휴대전화를 이용한 소액결제 서비스</td>
								</tr>
								<tr>
									<td>발신번호 표시</td>
									<td>발신자의 전화번호가 내 휴대폰에 표시되는 서비스</td>
								</tr>
								<tr>
									<td>통화중 대기</td>
									<td>통화 중에 전화가 걸려오면 새로 걸려온 전화를 받을 수 있는 서비스</td>
								</tr>
								<tr>
									<td>레터링</td>
									<td>PR링크로 서비스 중이며 전화를 받는 사람의 휴대폰에 나의 애칭을 표시하는 서비스</td>
								</tr>
								<tr>
									<td>국제전화 발신금지</td>
									<td>국제전화 발신기능을 불가능하게 하는 서비스</td>
								</tr>
								<tr>
									<td>스팸 ARS차단</td>
									<td>스팸으로 의심되는 번호에 대한 음성전화를 차단해 주는 서비스</td>
								</tr>
								<tr>
									<td>스팸 SMS 차단</td>
									<td>SMS 스팸여부를 체크하여 착신되지 못하도록 차단하는 서비스</td>
								</tr>
								<tr>
									<td>발신번호표시 제한</td>
									<td>상대방에게 내 전화번호가 휴대폰에 표시되지 않도록 하는 서비스</td>
								</tr>
								<tr>
									<td>발신금지</td>
									<td>휴대폰에서의 발신은 정지하고 수신만 가능하게 해주는 서비스</td>
								</tr>
								<tr>
									<td>착신금지</td>
									<td>휴대폰으로 걸려오는 모든 수신호를 차단해 주는 서비스</td>
								</tr>
								<tr>
									<td>비밀번호통화</td>
									<td>전화 발신 시 비밀번호를 입력하게 함으로써 다른 사람의 사용을 막아 주는 서비스</td>
								</tr>
								<tr>
									<td>익명호 수신거부</td>
									<td>발신자의 번호가 확인되지 않는 통화를 차단해 주는 서비스</td>
								</tr>
								<tr>
									<td>데이터 요금 상한</td>
									<td>-</td>
								</tr>
								<tr>
									<td>데이터 사용량 알림</td>
									<td>데이터 일정금액 이상 사용 시 데이터사용량을 고객에게 알려주는 서비스</td>
								</tr>
								<tr>
									<td>데이터 통화 차단</td>
									<td>데이터 통신으로 연결되는 통화를 차단해주는 서비스</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="etc_service_paid">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> 조건부 무료 / 유료 제공
					</div>
					<div class="in_contents_table_etc">
						<table>
							<thead>
								<th>서비스명</th>
								<th>요금</th>
								<th>내용</th>
							</thead>
							<tbody>
								<tr>
									<td>WiFi</td>
									<td>5,000원/월<br />요금제에 따라 무료
									</td>
									<td>-</td>
								</tr>
								<tr>
									<td>네비게이션(T-map)</td>
									<td>5,000원/월</td>
									<td>-</td>
								</tr>
								<tr>
									<td>착신전환(일반)</td>
									<td>음성 1.2원/초<br />영상 2.4원/초<br />SMS 10원/건
									</td>
									<td>수신되는 전화 및 문자를 다른 전화로 연결/전송하는 서비스</td>
								</tr>
								<tr>
									<td>착신전환(음성만)</td>
									<td>음성 1.2원/초<br />영상 2.4원/초
									</td>
									<td>수신되는 전화를 다른 휴대폰이나 전화로 즉시 연결해주는 서비스</td>
								</tr>
								<tr>
									<td>자동연결(부재중 전환)</td>
									<td>음성 1.2원/초<br />영상 2.4원/초
									</td>
									<td>수신되는 전화를 못 받은 경우 원하는 전화로 자동 연결하는 서비스</td>
								</tr>
								<tr>
									<td>콜키퍼</td>
									<td>500원/월</td>
									<td>내가 놓친 전화의 발신번호 정보를 알려주는 서비스</td>
								</tr>
								<tr>
									<td>통화가능 통보/알리미</td>
									<td>500원/월</td>
									<td>상대방이 통화 중일때, 통화가능상태를 문자로 통보해주는 서비스</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="etc_service_missing">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> 주요 미제공 부가서비스
					</div>
					<div class="in_contents_table_etc">
						<table>
							<thead>
								<th>서비스명</th>
								<th>내용</th>
							</thead>
							<tbody>
								<tr>
									<td>컬러링</td>
									<td>-</td>
								</tr>
								<tr>
									<td>국제로밍</td>
									<td>*. 임대로밍 제공 중</td>
								</tr>
								<tr>
									<td>로밍관련 부가서비스</td>
									<td>-</td>
								</tr>
								<tr>
									<td>소리샘(음성사서함)</td>
									<td>-</td>
								</tr>
								<tr>
									<td>퀵보이스</td>
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
						<img src="../images/product/mvno_bullet.gif" /> 사용 가능 단말기 조회
					</div>
					<div class="in_contents_table">
						<form id="search_phone" method="post"
							action="javascript:getModelList($('#search_phone input[name=model_name]').val(), 2);">
							<label for="manufacturer" style="margin: 0px 20px 0px 20px;">제조사
								별 조회</label> <select name="manufacturer">
								<option selected="selected" value="none">제조사를 선택해주세요.</option>
								<option value="samsung">삼성</option>
								<option value="lg">LG</option>
								<option value="pantech">팬택</option>
								<option value="kt">KT테크</option>
								<option value="skt">SK텔레시스</option>
								<option value="motorola">모토로라</option>
								<option value="htc">HTC</option>
								<option value="sony">소니에릭슨</option>
								<option value="etc">기타</option>
							</select> <input type="hidden" name="type" /><input type="button"
								value="조회" name="btn_inquiry" class="btn_search"
								onclick="javascript:getModelList(manufacturer.value, 1)">
							<label style="margin: 0px 20px 0px 40px;" for="model_name">모델명
								검색</label> <input type="text" name="model_name" size="15" /> <input
								type="button" class="btn_search"
								onclick="javascript:getModelList(model_name.value, 2)"
								name="btn_search" value="검색">
							<table id="serviceable_phone_table">
								<thead id="serviceable_phone_table_thead">
									<tr>
										<th rowspan="2" width="100px">제조사</th>
										<th rowspan="2" width="120px">모델명</th>
										<th rowspan="2" width="80px">서비스<br />가입 여부
										</th>
										<th colspan="2" width="150px">부가서비스</th>
										<th rowspan="2" width="250px">비고</th>
									</tr>
									<tr>
										<th style="border-top: 0px;">MMS</th>
										<th style="border-top: 0px;">DATA</th>
									</tr>
								</thead>
								<tbody id="serviceable_phone_table_tbody">
									<tr>
										<td colspan="6">조회 또는 검색하여 주세요.</td>
									</tr>
								</tbody>
							</table>
						</form>
						<div id="result_set"></div>
					</div>
				</div>
				<div id="caution">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> 주의 사항
					</div>
					<div class="in_contents_table">
						<div id="table_desc">
							<div id="price_title">가입 가능한 단말기 리스트</div>
							<div id="price_desc">
								1) '08년 8월 이후 출시된 SKT 개통 이력이 있는 단말기<br />
								&nbsp;&nbsp;&nbsp;:LTE 단말기는 3G모드로 전환 설정 후 사용 가능<br /> <br />
								2) 스마트폰 단말기. 단, SKY(팬택)는 '10년 6월 이후 출시된 스마트폰 단말기<br />
								&nbsp;&nbsp; * KT 일부 단말기와 LG U+ 단말기 가입불가<br /> &nbsp;&nbsp; *
								일부 단말기에서는 MMS, DATA 서비스의 제한<br />&nbsp;&nbsp; * 일부 단말기종은
								A/S방문해서 컨트리락 해제를 해야 정상 이용 가능<br /> &nbsp;&nbsp; * 단말기 관련해서는 <strong>고객센터(064-741-7777)</strong>로
								문의하시면 친절히 안내해드리겠습니다
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="mvno_join" style="display: none;">
				<div id="mvno_join_info">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> 가입 문의
					</div>
					<div class="in_contents_table">
						<div id="table_desc">
							<div id="price_title">안내</div>
							<div id="price_desc">
								<strong><span style="font-size:13pt;">고객센터(064-741-7777) </span></strong>로 연락을 주시거나<br /> 아래의 가입 문의를
								남겨주시면 신속히 연락드리겠습니다.
							</div>
						</div>
					</div>
				</div>
				<div id="mvno_join_info">
					<div id="head_title">
						<img src="../images/product/mvno_bullet.gif" /> 가입 문의 신청
					</div>
					<div class="table_contact">
						<form id="moone" name="moone" method="post">
							<table style="border: 0px;" class="contact_join">
								<thead>
									<tr>
										<th colspan="2"
											style="border-top: 1px solid #CBCBCB; padding-left: 20px; border-right: none; border-left: none; background-color: #EDEDED">가입
											문의 신청</th>
									</tr>
								</thead>
								<tbody style="text-align: left;">
									<tr
										style="border-bottom: 1px solid #DDDDDD; border-right: 0px;">
										<th
											style="width: 100px; border-right: 1px solid #EEEEEE; padding-left: 20px;">
											이름</th>
										<td
											style="padding-left: 20px; text-align: left; border-right: 0px; border-bottom: 0px;"><input
											type="text" size="10" name="name"></td>
									</tr>
									<tr
										style="border-bottom: 1px solid #DDDDDD; border-right: 0px;">
										<th
											style="width: 100px; border-right: 1px solid #EEEEEE; padding-left: 20px;">
											연락처</th>
										<td
											style="padding-left: 20px; text-align: left; border-right: 0px; border-bottom: 0px;"><input
											type="number" size="5" name="phone1">-<input
											type="number" size="5" name="phone2">-<input
											type="number" size="5" name="phone3"></td>
									</tr>
									<tr
										style="border-bottom: 1px solid #DDDDDD; border-right: 0px;">
										<th
											style="width: 100px; height: 100px; border-right: 1px solid #EEEEEE; padding-left: 20px;">주소</th>
										<td
											style="padding-left: 20px; text-align: left; border-right: 0px; border-bottom: 0px;">우편번호
											: <input type="text" name="zipcode" id="zipcode"
											maxlength="7" style="width: 50px" readonly="readonly"><a
											href="#" onclick="javascript:searchZipcode('moone');"><img
												width="87" height="22" src="/images/user/zipcode_btn.gif"
												alt="우편번호검색"></a><br>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="text" name="address1" id="address1"
											maxlength="100" style="width: 250px" readonly="readonly"><br>
											상세주소 : <input type="text" name="address2" id="address2"
											maxlength="100" style="width: 250px">
										</td>
									</tr>
									<tr
										style="border-bottom: 1px solid #DDDDDD; border-right: 0px;">
										<th
											style="width: 100px; border-right: 1px solid #EEEEEE; padding-left: 20px;">관심
											서비스</th>
										<td
											style="padding-left: 20px; text-align: left; border-right: 0px; border-bottom: 0px;"><select
											name="service">
												<option value="usim">유심</option>
												<option value="feature">피쳐폰</option>
												<option value="smart">스마트폰</option>
												<option value="etc">기타</option>
										</select></td>
									</tr>
									<tr
										style="border-bottom: 1px solid #DDDDDD; border-right: 0px;">
										<th
											style="width: 100px; border-right: 1px solid #EEEEEE; padding-left: 20px;">요청사항<br />
											<label id="memo_size" name="memo_size">(200자 이내)</label>
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
											type="button" class="btn_search" name="submit" value="문의신청"
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