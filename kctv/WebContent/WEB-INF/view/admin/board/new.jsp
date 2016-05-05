<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/admin_header.asp"/>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">게시판 관리</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>게시판 등록</b></td>
	</tr>
</table>
<form name="board_new_form" method="post" action="insert.asp" style="margin:0;border:0">
<input type="hidden" name="board_id" value=""/>
<input type="hidden" name="chk_delreply" value="1"/>
<input type="hidden" name="cfg_is_file" value=""/>
<input type="hidden" name="cfg_is_category" value=""/>
<input type="hidden" name="cfg_is_comment" value=""/>
<table width="100%" cellpadding="10" cellspacing="0"/>
	<tr>
		<td>
			<table width="100%" cellpadding="5" cellspacing="1" bgcolor="#333333">
				<tr height="30">
					<th bgcolor="#666666">* 게시판 아이디</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_boardid" maxlength="7"/>
						<input type="hidden" name="check_id" value=""/>
						<input type=button value="중복체크" class="button_1" onclick="la_checkid(this.form)"/> (영문,숫자) 
					</td>
				</tr>
				
				<tr height="30">
					<th bgcolor="#666666">* 게시판 이름</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_boardname" value=""/>
					</td>
				</tr>
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">게시판 기능</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 첨부파일 기능</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isfile" onclick="la_clickfile(this.form)"/> 첨부파일 기능이 있는지 여부(pds폴더 설정 필요)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 겔러리 게시판</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isimageview" onclick="la_clickimageview(this.form);"/> 리스트에 이미지 보여줄지 여부(스킨을 설정해줘야 한다.)
						<div id="divimage" style="display:none">
							<b>이미지 사이즈 : </b><br>
							width : <input type="text" name="txt_maxwidth" size="3" maxlength="3"/>,
							height : <input type="text" name="txt_maxheight" size="3" maxlength="3"/>
							리스트에 뿌려줄 이미지의 사이즈 (pixel단위)
						</div>
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 공지사항 기능</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isnotice"/> 리스트 상단에 관리자만이 쓸 수 있는 공지글 여부
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 비밀글 기능</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_issecret"/> 비밀글 기능 여부
					</td>
				</tr>
				
				<tr height="30">
					<th bgcolor="#666666">* 카테고리 기능</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_iscategory" onclick="la_viewcategory(this.form)"/>
						카테고리 기능 여부
						<div style="display:none;" id="divcate">
							<table border="0" cellpadding="3" cellspacing="0">
								<tr valign="top">
									<td><span id="spancate"><input type="text" name="txt_category[]" id="id_cate1"></span></td>
									<td><input type="button" value="add" onclick="la_addcategory()" class="button_1"/>
										<input type="button" value="reset" onclick="la_resetcategory()" class="button_1"/>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				
				<tr height="30">
					<th bgcolor="#666666">* 꼬릿말 기능</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_iscomment"/> 꼬릿말 기능 여부
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 답글 기능</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isreply"  onclick="la_clickusereply(this.form);"/> 답글 기능 여부
					</td>
				</tr>
				<!-- <tr height="30">
					<th bgcolor="#666666">* 추천 기능</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isvote"/> 추천 기능 여부
					</td>
				</tr> -->
				<tr height="30">
					<th bgcolor="#666666">* 회원정보 기능</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_ismemberboard"/> 회원용 게시판인지...<br>
						(회원일 경우 개인정보 스킨에 따라 입력이 필요없다)
					</td>
				</tr>
				<tr>
					<th bgcolor="#666666">* 그룹기능</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isgroupboard"/> 그룹별 게시판기능!<br>
						(그룹 아이디를 받아서 그룹별 출력한다.)
					</td>
				</tr>
				<!-- <tr>
					<th bgcolor="#666666">* 쪽지 기능</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isformmail"/> 쪽지 기능 여부
					</td>
				</tr> -->
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">권한</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* LIST 권한</th>
					<td bgcolor="#ffffff">
						<input type="radio" name="radio_grantlist" value="0" checked="checked"/> 일반공개
						<input type="radio" name="radio_grantlist" value="2"/> 회원공개
						<input type="radio" name="radio_grantlist" value="1"/> 관리자공개
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* READ 권한</th>
					<td bgcolor="#ffffff">
						<input type="radio" name="radio_grantread" value="0" checked="checked"/> 일반공개
						<input type="radio" name="radio_grantread" value="2"/> 회원공개
						<input type="radio" name="radio_grantread" value="1"/> 관리자공개
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* WRITE 권한</th>
					<td bgcolor="#ffffff">
						<input type="radio" name="radio_grantwrite" value="0" checked="checked"/> 일반공개
						<input type="radio" name="radio_grantwrite" value="2"/> 회원공개
						<input type="radio" name="radio_grantwrite" value="1"/> 관리자공개
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 꼬릿말 권한</th>
					<td bgcolor="#ffffff">
						<input type="radio" name="radio_grantcomment" value="0" checked="checked"/> 일반공개
						<input type="radio" name="radio_grantcomment" value="2"/> 회원공개
						<input type="radio" name="radio_grantcomment" value="1"/> 관리자공개
					</td>
				</tr>
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">스킨파일</td>
				</tr>
				<tr>
					<th bgcolor="#666666">* 게시판 상단 파일</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_header" value="header.asp"/> 게시판 상단 부분 파일 (게시판 설치 경로를 기준)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 게시판 상단 내용<br/>* (자동 &lt;br&gt;)</th>
					<td bgcolor="#ffffff">
						<textarea name="txtarea_headercontents" style="width:100%" rows="4"></textarea>
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 게시판 하단 내용<br/>* (자동 &lt;br&gt;)</th>
					<td bgcolor="#ffffff">
						<textarea name="txtarea_footercontents" style="width:100%" rows="4"></textarea>
					</td>
				</tr>
				<tr>
					<th bgcolor="#666666">* 게시판 하단 파일</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_footer" value=""> 게시판 하단 부분 파일 (게시판 설치 경로를 기준)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* LIST 스킨 파일</th>
					<td bgcolor="#ffffff">
						<select name="slt_skinlist" style="width:150;">
							<option value="gallery_list.html">gallery_list</option>
							<option value="list_blue.asp">list_blue</option>
							<option value="list_blue_back.asp">list_blue_back</option>
							<option value="list_book.asp">list_book</option>
							<option value="list_book.html">list_book</option>
							<option value="list_gallery.asp">list_gallery</option>
							<option value="list_green.asp">list_green</option>
							<option value="list_orange.asp">list_orange</option>
							<option value="list_pp.asp">list_pp</option>
							<option value="list_purple.asp">list_purple</option>
							<option value="list_template.asp">list_template</option>
							<option value="list_white.asp">list_white</option>
							<option value="pp_list.html">pp_list</option>
						 </select>
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* READ 스킨파일</th>
					<td bgcolor="#ffffff">
						<select name="slt_skinread" style="width:150;">
							<option value="read_blue.asp">read_blue</option>
							<option value="read_book.asp">read_book</option>
							<option value="read_book.html">read_book</option>
							<option value="read_green.asp">read_green</option>
							<option value="read_purple.asp">read_purple</option>
						 </select>
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* WRITE 스킨파일</th>
					<td bgcolor="#ffffff">
						<select name="slt_skinwrite" style="width:150;">
							<option value="pp_write.html">pp_write</option>
							<option value="write_blue.asp">write_blue</option>
							<option value="write_club.asp">write_club</option>
							<option value="write_green.asp">write_green</option>
							<option value="write_pp.asp">write_pp</option>
							<option value="write_purple.asp">write_purple</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 비밀번호 스킨파일</th>
					<td bgcolor="#ffffff">
						<select name="slt_skinpwd" style="width:150;">
							<option value="pwd_blue.asp">pwd_blue</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 꼬릿말 스킨파일</th>
					<td bgcolor="#ffffff">
						<select name="slt_skincomment" style="width:150;">
							<option value="comment_blue.asp">comment_blue</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">LIST 부분 설정</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 페이지당 게시물 수</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_rowperpage" size="3" maxlength="3" value="15"/> 페이지당 게시물 수 (겔러리 게시판일 경우는 열수의 배수로)
					</td>
				</tr>
				<!-- <tr height="30">
					<th bgcolor="#666666">* 블럭당 페이지 수</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_pageperblock" size="3" maxlength="3" value="10"/> 블럭당 페이지 수
					</td>
				</tr> -->
				<tr height="30">
					<th bgcolor="#666666">* 답글 최대 깊이</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_limitdepth" size="2" maxlength="2" value="5"/> 답글 최대 깊이 제한
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 글제목 길이</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_subjectlength" size="3" maxlength="3" value="40"/> 글제목 길이 제한
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 새글 표시 시간</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_limitnew" size="3" value="24"/> 새글 표시 시간 제한( 시간단위)
					</td>
				</tr>
				
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">WRITE 부분 설정</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 답글 원글 추가</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isaddorigin" checked="checked"/> 답글 쓰기에서 원글을 붙여줄지 여부
					</td>
				</tr>
				<!-- <tr height="30">
					<th bgcolor="#666666">* 글쓰기 제한시간</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_limitwritetime" size="10" maxlength="10" req item="글쓰기 제한시간" pattern="num" value="3600"> 
						글쓰기 제한시간(초단위)
					</td>
				</tr> -->
				<tr height="30">
					<th bgcolor="#666666">* 업로드 허락 파일</th>
					<td bgcolor="#ffffff">
						<textarea name="txtarea_allowfile" cols="50" rows="3">png,jpg,bmp,gif,zip,alz,rar,tar,tgz,gz,hwp,doc,txt,xls,ppt,pdf,mp3,asf,wmv,mepg,mpg,avi,swf</textarea><br>
						업로드 허락 파일 "," 표시로 구분할 것(png,jpg,bmp,gif,zip,alz,rar,tar,tgz,gz)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 최대 허용파일 용량</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_maxfilesize" size="10" maxlength="10" value="2097152"/> 1Mbyte = 1048576byte<br>
						최대 허용파일 용량 (byte 단위,기본 2M - (byte 단위,최고 5M)
					</td>
				</tr>
				<!-- <tr height="30">
					<th bgcolor="#666666">* 최대 허용파일 개수</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_maxfilecnt" size="2" value="10"/> 
						최대 허용파일 개수
					</td>
				</tr> -->
				<tr height="30">
					<th bgcolor="#666666">* 웹에디터 사용여부</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_istag" checked="checked"/>
						웹에디터(htmlarea) 사용여부
					</td>
				</tr>
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">READ 부분 설정</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 이미지 최대 폭</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_maximagewidth" size="4" maxlength="4" value="500"/> READ 부분에서 출력할 이미지 최대폭 크기(pixel단위)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 이전글 다음글 출력</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_viewprevnext" checked="checked"/> 이전글,다음글 보여주기 여부
					</td>
				</tr>
				<!-- <tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">기타 설정</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 답글 아이콘 경로</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_icon_re" value=""/> 빈공백일 경우 [RE] (게시판 설치 경로를 기준)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 새글 아이콘 경로</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_icon_new" value=""/> 빈공백일 경우 <nobr><font color="red">[new]</font></nobr> (게시판 설치 경로를 기준)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 공지글 아이콘 경로</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_icon_notice" value=""/> 빈공백일 경우 <nobr><b>[공지]</b></nobr> (게시판 설치 경로를 기준)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 비밀글 아이콘 경로</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_icon_secret" value=""/> 빈공백일 경우 <nobr><font color="#b52f24">[비밀]</font></nobr> (게시판 설치 경로를 기준)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* 첨부파일 아이콘 경로</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_icon_file" value="images/file.gif"/> 빈공백일 경우 <nobr>[파일]</nobr> (게시판 설치 경로를 기준)
					</td>
				</tr> -->
			</table>
		</td>
	</tr>
	<tr>
		<td align="center" height="50"> 
			<input type="button" value="설정완료" onclick="la_submitform(this.form);" class="button_1"/>
			<input type="button" value="취  소" onclick="history.back();" class="button_1"/>
		</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>