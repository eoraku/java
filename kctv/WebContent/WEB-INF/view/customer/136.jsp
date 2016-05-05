<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content_main">
	<div style="float:left;width:700px;height:115px;margin:10px;">
		<img src="../images/customer/topimg.jpg" width="670" height="115"/>
	</div>
	<div style="float:left;width:700px;height:20px;margin:10px;">
		<img src="../images/customer/c_title2222.gif" width="225" height="18"/>
	</div>
	<form name="service_new_form" method="post" target="exec_iframe" action="">
	<input type="hidden" name="mode" value="new"/>
	<input type="hidden" name="mjcd" value="AS"/>
	<table class="service_new_table">
		<caption><img src="../images/customer/member.gif" width="118" height="33"/></caption>
		<thead>
		<tr>
			<th colspan="2"></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<th>신청자 이름</th>
			<td><input type="text" name="name" id="name" value="${login_name }"/></td>
		</tr>
		<tr>
			<th>신청자 전화번호</th>
			<td><input type="text" class="form_03" style="width:50px" name="htrg"   id="htrg"   maxlength=3 value="064"/> - 
				<input type="text" class="form_03" style="width:50px" name="htel_1" id="htel_1" maxlength=4 value=""/> - 
				<input type="text" class="form_03" style="width:50px" name="htel_2" id="htel_2" maxlength=4 value=""/></td>
		</tr>
		<tr>
			<th>연락가능번호</th>
			<td><input type="text" class="form_03" style="width:50px" name="mtrg"   id="mtrg"   maxlength=3 value=""> - 
				<input type="text" class="form_03" style="width:50px" name="mtel_1" id="mtel_1" maxlength=4> - 
				<input type="text" class="form_03" style="width:50px" name="mtel_2" id="mtel_2" maxlength=4></td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<th colspan="2"></th>
		</tr>
		</tfoot>
	</table>
	<table class="service_new_table">
		<caption><img src="../images/customer/approve02.gif" width="118" height="33"/></caption>
		<thead>
		<tr>
			<th colspan="2"></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<th>결제방법</th>
			<td>
				<input type="radio" name="tiga_1" value="CARD" onclick="select_tiga(this)" checked="checked"> <font color="blue">카드이체</font>
				<input type="radio" name="tiga_1" value="AUTO" onclick="select_tigb(this)"> <font color="blue">자동이체</font>

			</td>
		</tr>
		<tr id="tr_tigb_1">
			<th>카드사</th>
			<td>
					<SELECT style="WIDTH: 120px" name=BANKCODE dmsg="카드사를 선택해주세요." required="y">
					<OPTION selected value=039>비씨카드</OPTION>
					<OPTION value=034>롯데카드</OPTION>
					<OPTION value=004>삼성카드</OPTION>
					<OPTION value=003>신한카드</OPTION>
					<OPTION value=011>현대카드</OPTION>
					<OPTION value=031>KB국민카드</OPTION>
					<OPTION value=055>하나SK카드</OPTION>
					<OPTION value=060>우리카드</OPTION>
					<OPTION value=020>외환카드</OPTION>
					<OPTION value=043>농협카드</OPTION>
					</SELECT>
			</td>
		</tr>				
		<tr id="tr_tigb_2">
			<th>카드번호</th>
			<td>
				<input type="text" name="cnum1" value="" size=4 maxlength="4"/> -
				<input type="text" name="cnum2" value="" size=4  maxlength="4"/> - 
				<input type="text" name="cnum3" value="" size=4 maxlength="4"/> -
				<input type="text" name="cnum4" value="" size=4 maxlength="4"/>
			</td>
		</tr>
		<tr id="tr_tigb_3">
			<th>유효일자</th>
			<td>월/년		
			    <select name="p_month" tabindex="2">
					
					<option value="1">01</option>
					
					<option value="2">02</option>
					
					<option value="3">03</option>
					
					<option value="4">04</option>
					
					<option value="5">05</option>
					
					<option value="6">06</option>
					
					<option value="7">07</option>
					
					<option value="8">08</option>
					
					<option value="9">09</option>
					
					<option value="10">10</option>
					
					<option value="11" selected="selected">11</option>
					
					<option value="12">12</option>
					
				   </select>
				/<select name="p_year" tabindex="1">
					
					<option value="2013" selected="selected">2013</option>
					
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>
					
				</select> 
			</td>
		</tr>
		<tr id="tr_tigb_4">
			<th>소유자성명</th>
			<td>
				<input type="text" name="name1" value="" maxlength="5"/>
			</td>
		</tr>
		<tr id="tr_tigb_5">
			<th>비고</th>
			<td>
				방송통신요금이 매월 25일 자동 결제 됩니다.
			</td>
		</tr>		
		<tr id="tr_tiga_1" style="display:none;">
			<th>은행명</th>
			<td>
					<SELECT style="WIDTH: 120px" name=BANKCODE dmsg="은행을 선택해주세요." required="y">
					<OPTION value=039>경남은행</OPTION>
					<OPTION value=034>광주은행</OPTION>
					<OPTION value=004>국민은행</OPTION>
					<OPTION value=003>기업은행</OPTION>
					<OPTION value=011>농협은행</OPTION>
					<OPTION value=031>대구은행</OPTION>
					<OPTION value=055>도이치은행</OPTION>
					<OPTION value=060>뱅크오브아메리카</OPTION>
					<OPTION value=032>부산은행</OPTION>
					<OPTION value=064>산림조합</OPTION>
					<OPTION value=002>산업은행</OPTION>
					<OPTION value=050>상호저축은행</OPTION>
					<OPTION value=045>새마을금고</OPTION>
					<OPTION value=007>수협</OPTION>
					<OPTION value=088>신한은행</OPTION>
					<OPTION value=048>신협</OPTION><
					<OPTION value=005>외환은행</OPTION>
					<OPTION value=020>우리은행</OPTION>
					<OPTION value=071>우체국</OPTION>
					<OPTION value=037>전북은행</OPTION>
					<OPTION selected value=035>제주은행</OPTION>
					<OPTION value=012>지역농협</OPTION>
					<OPTION value=081>하나은행</OPTION>
					<OPTION value=027>한국씨티은행</OPTION>
					<OPTION value=054>홍콩은행</OPTION>
					<OPTION value=057>JP모간체이스</OPTION>
					<OPTION value=023>SC은행</OPTION>
					<OPTION value=261>교보증권</OPTION>
					<OPTION value=267>대신증권</OPTION>
					<OPTION value=238>대우증권</OPTION>
					<OPTION value=279>동부증권</OPTION>
					<OPTION value=209>동양증권</OPTION>
					<OPTION value=287>메리츠증권</OPTION>
					<OPTION value=230>미래에셋증권</OPTION>
					<OPTION value=290>부국증권</OPTION>
					<OPTION value=240>삼성증권</OPTION>
					<OPTION value=268>솔로몬투자증권</OPTION>
					<OPTION value=291>신영증권</OPTION>
					<OPTION value=278>신한금융투자</OPTION>
					<OPTION value=247>우리투자증권</OPTION>
					<OPTION value=280>유진투자증권</OPTION>
					<OPTION value=265>이트레이드증권</OPTION>
					<OPTION value=264>키움증권</OPTION>
					<OPTION value=270>하나대투증권</OPTION>
					<OPTION value=262>하이투자증권</OPTION>
					<OPTION value=243>한국투자증권</OPTION>
					<OPTION value=269>한화증권</OPTION>
					<OPTION value=218>현대증권</OPTION>
					<OPTION value=263>HMC투자증권</OPTION>
					<OPTION value=292>LIG투자증권</OPTION>
					<OPTION value=289>NH농협증권</OPTION>
					<OPTION value=266>SK증권</OPTION>
					</SELECT>
			</td>
		</tr>		
		<tr id="tr_tiga_2" style="display:none;">
			<th>계좌번호</th>
			<td>
				<input type="text" name="cnuma1" value="" size=20 maxlength="20"/> 
			</td>
		</tr>		
		<tr id="tr_tiga_3" style="display:none;">
			<th>주민등록번호</th>
			<td>
				<input type="text" name="cnuma2" value="" size=6 maxlength="6"/>- <input type="password" name="cnuma3" value="" size=7 maxlength="7"/>
			</td>
		</tr>	
		<tr id="tr_tiga_4" style="display:none;">
			<th>이름</th>
			<td>
				<input type="text" name="name22" value="" maxlength="5"/>
			</td>
		</tr>			
		<tr>
			<th>요청사항</th>
			<td><textarea name="memo" id="memo" class="form_03" maxlength="2000"></textarea></td>
		</tr>

		<tfoot>
		<tr>
			<th colspan="2"></th>
		</tr>
		</tfoot>
	</table>
	<div class="service_new_btn">
		<ul>
			<li><input type="image" src="../images/customer/ok_btn.gif" width="55" height="21"/></li>
			<li><a href="#" onclick="document.service_new_form.reset();"><img src="../images/customer/esc_btn.gif" width="55" height="21"/></a></li>
		</ul>
	</div>
	</form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("form").submit(function(){
		if(!chkInputEmpty("#name","'신청자이름'을 입력해주세요.")) return false;
		if(!chkInputEmpty("#htrg","'설치지 전화번호'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#htel_1","'설치지 전화번호'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#htel_2","'설치지 전화번호'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#mtrg","'연락가능번호'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#mtel_1","'연락가능번호'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#mtel_2","'연락가능번호'를 입력해주세요.")) return false;
		//if(!chkInputEmpty("#zipcode","'설치주소'를 입력해주세요.")) return false;
		//if(!chkInputEmpty("#address1","'설치주소'를 입력해주세요.")) return false;
		//if(!chkInputEmpty("#address2","'나머지주소'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#memo","'요청사항'을 입력해주세요.")) return false;
		return true;
	});
});

function select_tiga(obj)
{
		document.all["tr_tigb_1"].style.display = "";
		document.all["tr_tigb_2"].style.display = ""; 
		document.all["tr_tigb_3"].style.display = ""; 
		document.all["tr_tigb_4"].style.display = "";
		document.all["tr_tigb_5"].style.display = "";
		document.all["tr_tiga_1"].style.display = "none";
		document.all["tr_tiga_2"].style.display = "none"; 
		document.all["tr_tiga_3"].style.display = "none"; 	
		document.all["tr_tiga_4"].style.display = "none";	
 
}
function select_tigb(obj)
{
		document.all["tr_tigb_1"].style.display = "none";
		document.all["tr_tigb_2"].style.display = "none"; 
		document.all["tr_tigb_3"].style.display = "none"; 
		document.all["tr_tigb_4"].style.display = "none"; 
		document.all["tr_tigb_5"].style.display = "none"; 
		document.all["tr_tiga_1"].style.display = "";
		document.all["tr_tiga_2"].style.display = ""; 
		document.all["tr_tiga_3"].style.display = ""; 
		document.all["tr_tiga_4"].style.display = "";			
}

</script>