<%@page language="java" contentType="text/html;charset=euc-kr" import="java.util.*"  %>


<%
		
		String bankname	=	request.getParameter("bankname");
		String account		=	request.getParameter("accountNo");					
		String account_Name=	request.getParameter("accountName");			
		String resp_Cd		=	request.getParameter("respCd");		
		String ret_msg		=	request.getParameter("ret_msg");
		
		String RETURN_PAGE_URL	=	request.getParameter("RETURN_PAGE_URL");
		
		//�ѱ۽����̽�(2byte����)
		int a=0;
	
		do{
	
		
			a= account_Name.indexOf("��");
			if(a>0)
			
				account_Name=account_Name.substring(0,a)+ "  " + account_Name.substring(a+1,account_Name.length());	
		}while(a>0);
	
		acount_Name = account_Name.trim();
		
%>
<HTML>
<HEAD>
<TITLE> :: ���� ��ȸ :: </TITLE>

<script language="javascript" src="/js/common.js" type="text/JavaScript"></script>
<script>
<!--
//â�ݱ�
function sendResultInterPark(){
	var f = document.conForm;
	f.action	=	"<%=RETURN_PAGE_URL%>";
	f.submit();
	//self.close();
}


//-->
</script>
</HEAD>

<BODY  topmargin="0" leftmargin="0"  >
<form name="conForm" method="post">
<!-- 2005-05-18 ���� -->
<p align="center" valign="middle">

<table border="0" cellpadding="3" cellspacing="0" width="290">
<br><Br>
<tr><td colspan="2"><b>������ȸ���</b></td></tr>
</table>

<br><Br>
<table border="0" cellpadding="3" cellspacing="0" width="290">
<tr><td width="5" rowspan="10"></td></tr>
<tr>
	<td width="100" height="30" >�����</td>
	<td width="190"><%= bankname %></td>
</tr>

<tr>
	<td height="30" >���¹�ȣ</td>
	<td><%= account %></td>
</tr>

<tr>
	<td height="30" >�����ָ�</td>
	<td><%= account_Name %></td>
</tr>

<tr>
	<td valign="top" height="30" >����޽���</td>
	<td><%= ret_msg %></td>
</tr>


</table></p>
</form>
</BODY></HTML>