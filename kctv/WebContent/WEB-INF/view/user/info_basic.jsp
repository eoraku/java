<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/common_header.htm"/>
<script type="text/javascript" src="${ctxRoot }js/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctxRoot }js/user_join.js" charset="utf-8"></script>
<div id="info_top">
	<div><a href="${homeUrl }"><img src="${ctxRoot }images/user/info_logo.png" width="260" height="60" alt="KCTV 홈으로" /></a></div>
	<dl>
		<dt><a href="${ctxRoot }user/info.htm"><img src="${ctxRoot }images/user/info_home.png" width="200" height="36" alt="회원정보 홈" /></a></dt>
		<dd><a href="${ctxRoot }user/info_pw.htm"><img src="${ctxRoot }images/user/info_basic_over.png" width="120" height="36" alt="기본정보 변경" /></a></dd>
		<dd><a href="${ctxRoot }user/info_edit_pw.htm"><img src="${ctxRoot }images/user/info_pw_out.png" width="130" height="36" alt="비밀번호 변경" /></a></dd>
		<dd><a href="${ctxRoot }user/info_del.htm"><img src="${ctxRoot }images/user/info_del_out.png" width="120" height="36" alt="온라인 회원 탈퇴" /></a></dd>
	</dl>
</div>

<div id="common_main">
	<jsp:include page="/user/info_side.htm"/>
	<div id="info_title">
		<img src="../images/user/modify_info.gif" width="84" height="16"/>
	</div>
	<div id="info_content">
		<ul style="float:left;">
			<li style="float:left;width:128px;height:20px;border-width:1px 1px 0px 1px;border-style:solid;border-color:#d5d5d5;text-align:center;padding-top:10px;font-size:10pt;font-weight:bold;">기본정보</li>
			<li style="float:left;width:540px;height:30px;border-bottom:1px solid #d5d5d5"></li>
		</ul>
		<div style="float:left;margin-top:10px;padding:5px;line-height:140%">
			회원님의 정보 중 변경된 내용이 있는 경우, 아래에서 수정해주세요.<br/> 
			회원정보는 개인정보취급방침에 따라 안전하게 보호되며, 회원님의 명백한 동의 없이 공개 또는 제 3자에게<br/> 
			제공되지 않습니다. 개인정보취급방침
		</div>
		<form name="info_edit" method="post" target="exec_iframe" action="info_edit_basic.htm">
		<table id=info_table>
			<caption>상세정보를 정확히 입력해주세요. 표시 필수입력사항</caption>
			<tbody>
			<tr>
				<th class="left" scope="row"><label for="useridf">아이디</label></th>
				<td class="right">${infoBasic.id } ※아이디는 변경 불가능합니다.</td>
			</tr>
			<tr>
				<th class="left" scope="row"><label for="name">이름</label></th>
				<td class="right">${infoBasic.name } ※개명으로 이름이 변경된 경우 고객감동실(064-741-7777)로 연락 주세요.</td>
			</tr>
			<tr>
				<th class="left" scope="row"><label for="email">* 이메일</label></th>
				<td class="right">
					<dl>
						<dt><input type="text" name="email" id="email" value="${infoBasic.email }" maxlength="50" style="width:200px"/></dt>
						<dd>* 핫메일(hotmail.com)은 메일수신이 안될 수도 있습니다. 가능하면 해당 메일 이외의 주소를 적어주십시오. (확인메일 발송함)</dd>
					</dl>
				</td>
			</tr>
			<tr>
				<th class="left" scope="row"><label for="address1">* 주소</label></th>
				<td class="right">
					<dl>
						<dt><span>우편번호 : </span><input type="text" name="zipcode" id="zipcode" value="${infoBasic.zipcode }" maxlength="7" style="width:50px" readonly="readonly"/><a href="#" onclick="javascript:searchZipcode('info_edit');" style="margin-left:7px;"><img src="${ctxRoot }images/user/zipcode_btn.gif" width="87" height="22" alt="우편번호검색" /></a></dt>
						<dd><input type="text" name="address1" id="address1" value="${infoBasic.address1 }" maxlength="100" style="width:300px" readonly="readonly"/></dd>
						<dd><span>나머지주소 : </span><input type="text" name="address2" id="address2" value="${infoBasic.address2 }" maxlength="100" style="width:228px"/></dd>
					</dl>
				</td>
			</tr>
			<tr>
				<th class="left" scope="row"><label for="tel">* 전화번호</label></th>
				<td class="right">
					<dl>
						<dt><input type="text" name="tel" id="tel" value="${infoBasic.phone }" maxlength="20"/></dt>
						<dd>* 반드시 연락이 가능한 연락처로 남겨주세요, 전화번호는 번호와 '-'만 가능합니다.</dd>
					</dl>
				</td>
			</tr>
			<tr>
				<th class="left" scope="row"><label for="phone">* 휴대폰번호</label></th>
				<td class="right">
					<dl>
						<dt><input type="text" name="phone" id="phone" value="${infoBasic.cellphone }" maxlength="20"/></dt>
						<dd>* 반드시 연락이 가능한 연락처로 남겨주세요, 휴대폰번호는 번호와 '-'만 가능합니다.</dd>
					</dl>
				</td>
			</tr>
			<tr>
				<th class="left" scope="row"><label for="emailReceive">* 메일 수신여부</label></th>
				<td class="emailCheck"><input type="checkbox" name="emailReceive" checked="checked"/> 이메일을 수신하겠습니다.</td>
			</tr>
			<tr>
				<th class="btm" scope="row" colspan="2">
					<input type="image" src="../images/user/btn_ok.png" width="60" height="29" />
					<a href="info.htm"><img src="../images/user/btn_cancel.png" width="60" height="29" /></a>
				</th>
			</tr>
			</tbody>
		</table>
		</form>
	</div>
</div>
<jsp:include page="/include/common_footer.htm"/>