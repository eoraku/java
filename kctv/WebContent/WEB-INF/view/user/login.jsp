<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/include/common_header.htm" />
<div id="info_top">
	<div>
		<a href="${homeUrl }"><img
			src="${ctxRoot }images/user/info_logo.png" width="260" height="60"
			alt="KCTV 홈으로" /></a>
	</div>
	<dl>
		<dt>
			<img src="${ctxRoot }images/user/info_login.png" width="200"
				height="36" />
		</dt>
	</dl>
</div>
<div id="common_main">
	<div id="login_border">
		<div id="login_box">
			<div id="login_logo">
				<img src="../images/user/login_icon.gif" width="51" height="78" />
			</div>
			<div id="login_form">
				<form method="post" action="login_chk.htm" target="exec_iframe">
					<input type="hidden" name="ret_url" value="${ret_url }" />
					<ul>
						<li style="height: 30px;"><img
							src="../images/user/login_title.gif" width="96" height="16" /></li>
						<li style="height: 35px;">
							<dl>
								<dt>
									<img src="../images/user/login_id.gif" width="33" height="14" />
								</dt>
								<dd>
									<input name="userid" id="userid" type="text" class="form_01"
										size="12" />
								</dd>
							</dl>
						</li>
						<li style="height: 40px;">
							<dl>
								<dt>
									<img src="../images/user/login_pw.gif" width="44" height="14" />
								</dt>
								<dd>
									<input name="userpw" id="userpw" type="password"
										class="form_01" size="12" />
								</dd>
							</dl>
						</li>
						<li style="height: 40px; text-align: center;"><input
							type="image" src="../images/user/btn_login.png" width="60"
							height="29" /></li>
					</ul>
				</form>
			</div>
			<div id="login_notice">
				<div id="notice_top">
					<div id="notice_top_title">
						<a href="${homeUrl }contents/?muid=117&pmuid=116"><img
							src="../images/index/left_notice.gif" width="67" height="16"></a>
					</div>
					<div id="notice_top_more">
						<a href="${homeUrl }contents/company.htm?muid=117"><img
							src="../images/common/more02.gif" width="36" height="11"></a>
					</div>
				</div>
				<div id="notice_body">
					<ul>
						<c:forEach items="${listNotice }" var="item">
							<li><a
								href="${homeUrl }contents/company.htm?muid=117&mode=view&buid=${item.board_uid }">${item.board_title
									}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div id="login_msg">
				* 아이디와 비밀번호를 입력 후 로그인버튼을 클릭하세요.<br />
			</div>
			<div id="login_btm">
				<ul>
					<li>* 비밀번호를 잊으셨나요?</li>
					<li><a href="${ctxRoot }user/find_id.htm" target="_parent"><img
							src="../images/user/btn_findid.png" /></a></li>
					<li><a href="${ctxRoot }user/find_pw.htm" target="_parent"><img
							src="../images/user/btn_findpw.png" /></a></li>
				</ul>
				<ul>
					<li>* KCTV 제주방송 회원이 아니세요?</li>
					<li><a href="${ctxRoot }user/join1.htm" target="_parent"><img
							src="../images/user/join_btn.gif" width="61" height="16" /></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$("form").submit(function() {
			if ($("#userid").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#userid").focus();
				return false;
			}
			if ($("#userpw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userpw").focus();
				return false;
			}
			return true;
		});
	});
</script>
<jsp:include page="/include/common_footer.htm" />