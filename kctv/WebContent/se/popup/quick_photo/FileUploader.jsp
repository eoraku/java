<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%> 
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%@page import="com.oreilly.servlet.MultipartRequest"%> 
<% 
String uploadPath = request.getRealPath("/upload");//실제 시스템 상의 경로를 얻어온다.
int size =10*1024*1024;//업로드 파일의 최대 크기 지정 
String name="";
String subject="";
String filename1="";
String filename2="";

try{
	/*
	실제 파일 업로드 담당.
	인수 1) 폼에서 가져온 인자 값을 얻어오기 위해 request객체를 전달 
	인수 2) 업로드될 파일의 위치를 의미 
	인수 3) 최대 크기 
	인수 4) 파일 이름의 한글일 경우 문제가 되므로 처리할수 있도록 인코딩 타입지정.
	인수 5) 인자는 똑같은 파일을 업로드할 경우 중복되지 않도록 자동으로 파일이름을 변환해주는 기능을 한다.(DefaultFileRenamePolicy)
	*/
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
	
	/*request객체의 getparameter메소드를 이용 폼에서 입력된 값을 받아온다.*/
	name = multi.getParameter("name");
	System.out.println(name);
	subject = multi.getParameter("subject");
	
	//업로드한 파일들을 Enumeration타입으로 반환한다.
	Enumeration files=multi.getFileNames();
	String file1 =(String)files.nextElement();
	filename1=multi.getFilesystemName(file1);
	String file2 =(String)files.nextElement();
	filename2=multi.getFilesystemName(file2);
}catch(Exception e){
	e.printStackTrace();
}
%>
<script type="text/javascript">
alert(1);
</script>