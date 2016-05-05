<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/common_header.htm"/>
<div id="info_top">
	<div>
		<a href="${homeUrl }"><img
			src="${ctxRoot }images/user/info_logo.png" width="260" height="60"
			alt="KCTV 홈으로" /></a>
	</div>
	<dl>
		<dt>
			<img src="${ctxRoot }images/user/title_findid.png" width="200"
				height="36" />
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/title_small_yourself_on.png" style="padding-top:2px;" />
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/arrow_off.png" style="padding-top:10px;"/>
		</dt>
		<dt>
			<img src="${ctxRoot }images/user/title_small_viewid.png" style="padding-top:2px;" />
		</dt>
	</dl>
</div>
<div id="common_main">
	<div id="join_step2">
		<form name="form1" action="" target="auth_popup" method="post">
		<dl id="join_step2_text">
			<dt><img src="${ctxRoot }images/user/realname.gif" width="81" height="32"/></dt>
			<dd>KCTV 제주방송은 타인에 의한 부정 회원가입을 방지하기 위하여 회원본인확인인증을 시행하고 있습니다.</dd>
			<dd>아래의 휴대폰 본인확인 또는 아이핀 중 하나를 선택하여 KCTV 아이디 찾기를 진행하여 주시기 바랍니다.</dd>
			<dd>입력하신 소중한 개인정보는 회원님의 동의 없이 공개 또는 제3자에게 제공되지 않습니다.</dd>
			<dd>인증관련 모든 비용은 무료입니다.</dd>
		</dl>
		<ul id="join_step2_box">
			<li class="join_step2_hori"></li>
			<li>
				<dl class="join_way">
					<dt><a href="#" onclick="javascript:realCheck(1);"><img src="${ctxRoot }images/user/real_icon1.png" width="50" height="55"></a></dt>
					<dd class="join_way_info">본인명의의 휴대폰으로 인증번호를<br/>
						전송받아 본인확인을 할 수 있습니다.<br/>
						(인증완료된 휴대폰 번호는 회원정보 검색시 사용되며, 저장되지 않습니다.)</dd>
					<dd class="join_way_btn"><a href="#" onclick="javascript:realCheck(1);" class="a_join_setp2_btn realname_btn">휴대폰 인증하기</a></dd>
				</dl>
				<dl class="join_or">
					<dd><img src="${ctxRoot }images/user/real_icon_or.png" width="25" height="14"/></dd>
				</dl>
				<dl class="join_way">
					<dt><a href="#" onclick="javascript:realCheck(2);"><img src="${ctxRoot }images/user/real_icon2.png" width="50" height="55"></a></dt>
					<dd class="join_way_info">아이핀은 주민등록번호를 대체하여<br/>
						온라인상에서 신원을 확인하는<br/>
						수단입니다.</dd>
					<dd class="join_way_btn"><a href="#" onclick="javascript:realCheck(2);" class="a_join_setp2_btn realname_btn">아이핀 인증하기</a></dd>
				</dl>
			</li>
			<li class="join_step2_hori"></li>
			<li>
				<dl class="join_ipin">
					<dt><a href="http://i-pin.kisa.or.kr/kor/main.jsp" target="_new"><img src="${ctxRoot }images/user/real_icon_ipin.png" width="144" height="44"/></a></dt>
					<dd>▶ 아이핀(I-PIN)을 신규 발급 받거나, 아이핀에 관한 문의가 필요하시면<br/>
						<a href="http://i-pin.kisa.or.kr/kor/main.jsp" target="_new">한국인터넷진흥원</a>의 아이핀 이용안내 페이지를 참고 하시기 바랍니다.</dd>
				</dl>
			</li>
		</ul>
		</form>
	</div>
</div>
<form name="resultForm" action="" method="post">
<input type="hidden" name="authType" value=""/>
<input type="hidden" name="realName" value=""/>
<input type="hidden" name="sex" value=""/>
<input type="hidden" name="nationalInfo" value=""/>
<input type="hidden" name="birthDate" value=""/>
<input type="hidden" name="phoneCode" value=""/>
<input type="hidden" name="phoneNumber" value=""/>
</form>
<script>
<!--
function realCheck(type){
	var form1 = document.form1;
	if(type==1){
		form1.action = "auth_phone1.htm";
		window.open("", "auth_popup", "width=432,height=588,scrollbar=yes");
		form1.target = "auth_popup";
	}
	else{
		form1.action = "auth_ipin1.htm";
		window.open("", "auth_popup", "width=445,height=551,scrollbar=yes");
		form1.target = "auth_popup";
	}

	form1.submit();
}
//-->
</script>
<jsp:include page="/include/common_footer.htm"/>