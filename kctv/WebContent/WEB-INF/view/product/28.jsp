<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div id="content_main" class="ad_request">
	<div id="product_top">
		<div id="product_top_img">
			<img src="../images/product/topimg10.gif" width="623" height="108"/>
		</div>
	</div>
	<div id="product_main">
		<dl>
			<dt>
				<img src="../images/product/tel.gif" width="177" height="23"/>
			</dt>
			<dd>
				<form name=frmadvertise method=post action="advertise_proc.asp">
				<table>
					<caption>* ǥ�ô� �ʼ� �Է»����Դϴ�. </caption>
					<thead>
						<tr>
							<th>* �̸�</th>
							<td><input name="txt_name" type="text" style="width:150;" /></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>* ��ȭ��ȣ</th>
							<td><input name="txt_phone" type="text" style="width:150;" /></td>
						</tr>
						<tr>
							<th>* �̸��� �ּ�</th>
							<td><input name="txt_email" type="text" size="40" style="width:150;" /></td>
						</tr>
						<tr>
							<th>* ����ڵ�Ϲ�ȣ</th>
							<td><input name="txt_ssn" type="text" size="40" style="width:150;" /></td>
						</tr>
						<tr>
							<th>* ��������</th>
							<td>
								<input type="text" name="txt_date" readonly size="12">
								<input type="button" value="�Ⱓ �ʱ�ȭ" onclick="this.form.txt_date.value='';">
							</td>
						</tr>
						<tr>
							<th>* �����Ƿ� ����</th>
							<td><textarea name="txt_content" cols="60" rows="10"></textarea></td>
						</tr>
					</tbody>
				</table>
				</form>
			</dd>
		</dl>
	</div>
</div>