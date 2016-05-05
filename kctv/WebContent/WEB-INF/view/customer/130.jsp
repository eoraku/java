<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content_main">
	<div style="float:left;width:700px;height:115px;margin:10px;">
		<img src="../images/customer/topimg.jpg" width="670" height="115"/>
	</div>
	<div style="float:left;width:700px;height:20px;margin:10px;">
		<img src="../images/customer/c_title03.gif" width="225" height="18"/>
	</div>
	<form name="service_new_form" method="post" target="exec_iframe" action="${ctxRoot }customer/smsRequest.htm">
	<input type="hidden" name="mode" value="new"/>
	<input type="hidden" name="mjcd" value="MV"/>
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
			<th>설치지 전화번호</th>
			<td><input type="text" class="form_03" style="width:50px" name="htrg"   id="htrg"   maxlength="3" value="064"/> - 
				<input type="text" class="form_03" style="width:50px" name="htel_1" id="htel_1" maxlength="4" value=""/> - 
				<input type="text" class="form_03" style="width:50px" name="htel_2" id="htel_2" maxlength="4" value=""/></td>
		</tr>
		<tr>
			<th>연락가능번호</th>
			<td><input type="text" class="form_03" style="width:50px" name="mtrg"   id="mtrg"   maxlength="3" value=""> - 
				<input type="text" class="form_03" style="width:50px" name="mtel_1" id="mtel_1" maxlength="4"> - 
				<input type="text" class="form_03" style="width:50px" name="mtel_2" id="mtel_2" maxlength="4"></td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<th colspan="2"></th>
		</tr>
		</tfoot>
	</table>
	<table class="service_new_table">
		<caption><img src="../images/customer/move.gif" width="129" height="33"/></caption>
		<thead>
		<tr>
			<th colspan="2"></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<th rowspan="3">기존설치주소</th>
			<td>
				<ul>
					<li style="float:left;padding-right:5px;padding-top:2px;"><input name="zipcode" id="zipcode" type="text" class="form_03" size="7" readonly="readonly"/></li> 
					<li style="float:left;"><a href="#" onclick="javascript:searchZipcode('service_new_form','zipcode','address1','address2');"><img src="${ctxRoot }images/user/zipcode_btn.gif" width="87" height="22" alt="우편번호검색" /></a></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" class="form_03" style="width:200px" name="address1" id="address1" value="" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td>
				나머지주소 <input type="text" class="form_03" style="width:180px" name="address2" id="address2" value=""/>
			</td>
		</tr>
		<tr>
			<th rowspan="3">신규설치주소</th>
			<td>
				<ul>
					<li style="float:left;padding-right:5px;padding-top:2px;"><input name="zipcode2" id="zipcode2" type="text" class="form_03" size="7" readonly="readonly"/></li> 
					<li style="float:left;"><a href="#" onclick="javascript:searchZipcode('service_new_form','zipcode2','address21','address22');"><img src="${ctxRoot }images/user/zipcode_btn.gif" width="87" height="22" alt="우편번호검색" /></a></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" class="form_03" style="width:200px" name="address21" id="address21" value="" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<td>
				나머지주소 <input type="text" class="form_03" style="width:180px" name="address22" id="address22" value=""/>
			</td>
		</tr>
		<tr>
			<th>이전설치희망일</th>
			<td>
				<select name="p_year" tabindex="1">
					<c:forEach var="i" begin="${year }" end="${year+1 }">
					<option value="${i }"<c:if test="${year==i }"> selected="selected"</c:if>>${i }</option>
					</c:forEach>
				</select> 년
				<select name="p_month" tabindex="2">
					<c:forEach var="i" begin="1" end="12">
					<option value="${i }"<c:if test="${month==i }"> selected="selected"</c:if>>${i }</option>
					</c:forEach>
				</select> 월
				<select name="p_day" tabindex="3">
					<c:forEach var="i" begin="1" end="31">
					<option value="${i }"<c:if test="${day==i }"> selected="selected"</c:if>>${i }</option>
					</c:forEach>
				</select> 일
			</td>
		</tr>
		<tr>
			<th>기타요청사항</th>
			<td><textarea name="memo" class="form_03" maxlength="2000"></textarea></td>
		</tr>
		</tbody>
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
		if(!chkInputEmpty("#zipcode","'기존설치주소'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#address1","'기존설치주소'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#address2","'기존설치 나머지주소'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#zipcode2","'신규설치주소'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#address21","'신규설치주소'를 입력해주세요.")) return false;
		if(!chkInputEmpty("#address22","'신규설치 나머지주소'를 입력해주세요.")) return false;
		return true;
	});
});

function select_tigb(obj)
{
	var f = document.service_new_form;
	if( obj.value == "TV") {
		document.all["tr_tigb_1"].style.display = "block";
		document.all["tr_tigb_2"].style.display = "none"; 
		document.all["tr_tigb_3"].style.display = "none"; 
	}else if( obj.value == "ISP"){
		document.all["tr_tigb_1"].style.display = "none"; 
		document.all["tr_tigb_2"].style.display = "block";
		document.all["tr_tigb_3"].style.display = "none";
	}else if( obj.value == "SUMM"){
		document.all["tr_tigb_1"].style.display = "none"; 
		document.all["tr_tigb_2"].style.display = "none"; 
		document.all["tr_tigb_3"].style.display = "block";
	}else if( obj.value == "PRO"){
		document.all["tr_tigb_1"].style.display = "none";
		document.all["tr_tigb_2"].style.display = "none"; 
		document.all["tr_tigb_3"].style.display = "none"; 
	}

	f.tigb_1.value = obj.value;
}
</script>