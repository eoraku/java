<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:include page="/include/admin_header.asp"/>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul03.gif" width="13" height="13" hspace="5" align="absmiddle"><strong class="font05" style="font-size:15;color:336699;">�Խ��� ����</strong></td>
	</tr>
	<tr>
		<td height="1" bgcolor="#DDDDDD"><img src="../../images/admin/line.gif" width="204" height="2"></td>
	</tr>
	<tr>
		<td style="padding:10px;"><img src="../../images/admin/bul02.gif" width="4" height="5" hspace="8" align="absmiddle"><b>�Խ��� ���</b></td>
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
					<th bgcolor="#666666">* �Խ��� ���̵�</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_boardid" maxlength="7"/>
						<input type="hidden" name="check_id" value=""/>
						<input type=button value="�ߺ�üũ" class="button_1" onclick="la_checkid(this.form)"/> (����,����) 
					</td>
				</tr>
				
				<tr height="30">
					<th bgcolor="#666666">* �Խ��� �̸�</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_boardname" value=""/>
					</td>
				</tr>
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">�Խ��� ���</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ÷������ ���</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isfile" onclick="la_clickfile(this.form)"/> ÷������ ����� �ִ��� ����(pds���� ���� �ʿ�)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* �ַ��� �Խ���</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isimageview" onclick="la_clickimageview(this.form);"/> ����Ʈ�� �̹��� �������� ����(��Ų�� ��������� �Ѵ�.)
						<div id="divimage" style="display:none">
							<b>�̹��� ������ : </b><br>
							width : <input type="text" name="txt_maxwidth" size="3" maxlength="3"/>,
							height : <input type="text" name="txt_maxheight" size="3" maxlength="3"/>
							����Ʈ�� �ѷ��� �̹����� ������ (pixel����)
						</div>
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* �������� ���</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isnotice"/> ����Ʈ ��ܿ� �����ڸ��� �� �� �ִ� ������ ����
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ��б� ���</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_issecret"/> ��б� ��� ����
					</td>
				</tr>
				
				<tr height="30">
					<th bgcolor="#666666">* ī�װ� ���</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_iscategory" onclick="la_viewcategory(this.form)"/>
						ī�װ� ��� ����
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
					<th bgcolor="#666666">* ������ ���</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_iscomment"/> ������ ��� ����
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ��� ���</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isreply"  onclick="la_clickusereply(this.form);"/> ��� ��� ����
					</td>
				</tr>
				<!-- <tr height="30">
					<th bgcolor="#666666">* ��õ ���</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isvote"/> ��õ ��� ����
					</td>
				</tr> -->
				<tr height="30">
					<th bgcolor="#666666">* ȸ������ ���</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_ismemberboard"/> ȸ���� �Խ�������...<br>
						(ȸ���� ��� �������� ��Ų�� ���� �Է��� �ʿ����)
					</td>
				</tr>
				<tr>
					<th bgcolor="#666666">* �׷���</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isgroupboard"/> �׷캰 �Խ��Ǳ��!<br>
						(�׷� ���̵� �޾Ƽ� �׷캰 ����Ѵ�.)
					</td>
				</tr>
				<!-- <tr>
					<th bgcolor="#666666">* ���� ���</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isformmail"/> ���� ��� ����
					</td>
				</tr> -->
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">����</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* LIST ����</th>
					<td bgcolor="#ffffff">
						<input type="radio" name="radio_grantlist" value="0" checked="checked"/> �Ϲݰ���
						<input type="radio" name="radio_grantlist" value="2"/> ȸ������
						<input type="radio" name="radio_grantlist" value="1"/> �����ڰ���
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* READ ����</th>
					<td bgcolor="#ffffff">
						<input type="radio" name="radio_grantread" value="0" checked="checked"/> �Ϲݰ���
						<input type="radio" name="radio_grantread" value="2"/> ȸ������
						<input type="radio" name="radio_grantread" value="1"/> �����ڰ���
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* WRITE ����</th>
					<td bgcolor="#ffffff">
						<input type="radio" name="radio_grantwrite" value="0" checked="checked"/> �Ϲݰ���
						<input type="radio" name="radio_grantwrite" value="2"/> ȸ������
						<input type="radio" name="radio_grantwrite" value="1"/> �����ڰ���
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ������ ����</th>
					<td bgcolor="#ffffff">
						<input type="radio" name="radio_grantcomment" value="0" checked="checked"/> �Ϲݰ���
						<input type="radio" name="radio_grantcomment" value="2"/> ȸ������
						<input type="radio" name="radio_grantcomment" value="1"/> �����ڰ���
					</td>
				</tr>
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">��Ų����</td>
				</tr>
				<tr>
					<th bgcolor="#666666">* �Խ��� ��� ����</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_header" value="header.asp"/> �Խ��� ��� �κ� ���� (�Խ��� ��ġ ��θ� ����)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* �Խ��� ��� ����<br/>* (�ڵ� &lt;br&gt;)</th>
					<td bgcolor="#ffffff">
						<textarea name="txtarea_headercontents" style="width:100%" rows="4"></textarea>
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* �Խ��� �ϴ� ����<br/>* (�ڵ� &lt;br&gt;)</th>
					<td bgcolor="#ffffff">
						<textarea name="txtarea_footercontents" style="width:100%" rows="4"></textarea>
					</td>
				</tr>
				<tr>
					<th bgcolor="#666666">* �Խ��� �ϴ� ����</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_footer" value=""> �Խ��� �ϴ� �κ� ���� (�Խ��� ��ġ ��θ� ����)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* LIST ��Ų ����</th>
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
					<th bgcolor="#666666">* READ ��Ų����</th>
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
					<th bgcolor="#666666">* WRITE ��Ų����</th>
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
					<th bgcolor="#666666">* ��й�ȣ ��Ų����</th>
					<td bgcolor="#ffffff">
						<select name="slt_skinpwd" style="width:150;">
							<option value="pwd_blue.asp">pwd_blue</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ������ ��Ų����</th>
					<td bgcolor="#ffffff">
						<select name="slt_skincomment" style="width:150;">
							<option value="comment_blue.asp">comment_blue</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">LIST �κ� ����</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* �������� �Խù� ��</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_rowperpage" size="3" maxlength="3" value="15"/> �������� �Խù� �� (�ַ��� �Խ����� ���� ������ �����)
					</td>
				</tr>
				<!-- <tr height="30">
					<th bgcolor="#666666">* ���� ������ ��</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_pageperblock" size="3" maxlength="3" value="10"/> ���� ������ ��
					</td>
				</tr> -->
				<tr height="30">
					<th bgcolor="#666666">* ��� �ִ� ����</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_limitdepth" size="2" maxlength="2" value="5"/> ��� �ִ� ���� ����
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ������ ����</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_subjectlength" size="3" maxlength="3" value="40"/> ������ ���� ����
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ���� ǥ�� �ð�</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_limitnew" size="3" value="24"/> ���� ǥ�� �ð� ����( �ð�����)
					</td>
				</tr>
				
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">WRITE �κ� ����</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ��� ���� �߰�</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_isaddorigin" checked="checked"/> ��� ���⿡�� ������ �ٿ����� ����
					</td>
				</tr>
				<!-- <tr height="30">
					<th bgcolor="#666666">* �۾��� ���ѽð�</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_limitwritetime" size="10" maxlength="10" req item="�۾��� ���ѽð�" pattern="num" value="3600"> 
						�۾��� ���ѽð�(�ʴ���)
					</td>
				</tr> -->
				<tr height="30">
					<th bgcolor="#666666">* ���ε� ��� ����</th>
					<td bgcolor="#ffffff">
						<textarea name="txtarea_allowfile" cols="50" rows="3">png,jpg,bmp,gif,zip,alz,rar,tar,tgz,gz,hwp,doc,txt,xls,ppt,pdf,mp3,asf,wmv,mepg,mpg,avi,swf</textarea><br>
						���ε� ��� ���� "," ǥ�÷� ������ ��(png,jpg,bmp,gif,zip,alz,rar,tar,tgz,gz)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* �ִ� ������� �뷮</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_maxfilesize" size="10" maxlength="10" value="2097152"/> 1Mbyte = 1048576byte<br>
						�ִ� ������� �뷮 (byte ����,�⺻ 2M - (byte ����,�ְ� 5M)
					</td>
				</tr>
				<!-- <tr height="30">
					<th bgcolor="#666666">* �ִ� ������� ����</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_maxfilecnt" size="2" value="10"/> 
						�ִ� ������� ����
					</td>
				</tr> -->
				<tr height="30">
					<th bgcolor="#666666">* �������� ��뿩��</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_istag" checked="checked"/>
						��������(htmlarea) ��뿩��
					</td>
				</tr>
				<tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">READ �κ� ����</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* �̹��� �ִ� ��</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_maximagewidth" size="4" maxlength="4" value="500"/> READ �κп��� ����� �̹��� �ִ��� ũ��(pixel����)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ������ ������ ���</th>
					<td bgcolor="#ffffff">
						<input type="checkbox" name="chk_viewprevnext" checked="checked"/> ������,������ �����ֱ� ����
					</td>
				</tr>
				<!-- <tr height="30">
					<td align="center" bgcolor="#eeeeee" colspan="2">��Ÿ ����</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ��� ������ ���</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_icon_re" value=""/> ������� ��� [RE] (�Խ��� ��ġ ��θ� ����)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ���� ������ ���</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_icon_new" value=""/> ������� ��� <nobr><font color="red">[new]</font></nobr> (�Խ��� ��ġ ��θ� ����)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ������ ������ ���</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_icon_notice" value=""/> ������� ��� <nobr><b>[����]</b></nobr> (�Խ��� ��ġ ��θ� ����)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ��б� ������ ���</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_icon_secret" value=""/> ������� ��� <nobr><font color="#b52f24">[���]</font></nobr> (�Խ��� ��ġ ��θ� ����)
					</td>
				</tr>
				<tr height="30">
					<th bgcolor="#666666">* ÷������ ������ ���</th>
					<td bgcolor="#ffffff">
						<input type="text" name="txt_icon_file" value="images/file.gif"/> ������� ��� <nobr>[����]</nobr> (�Խ��� ��ġ ��θ� ����)
					</td>
				</tr> -->
			</table>
		</td>
	</tr>
	<tr>
		<td align="center" height="50"> 
			<input type="button" value="�����Ϸ�" onclick="la_submitform(this.form);" class="button_1"/>
			<input type="button" value="��  ��" onclick="history.back();" class="button_1"/>
		</td>
	</tr>
</table>
</form>
<jsp:include page="/include/admin_footer.asp"/>