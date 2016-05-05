<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> node.js - view </title>
<link href="${ctxRoot }css/common.css" rel="stylesheet" type="text/css" />
<style type="text/css">
p{width:650px;padding:5px;background-color:#dddddd;font-weight:bold;text-align:center;color:red;}
#divList{width:660px;}
#ulList{}
#ulList li{float:left;width:180px;height:101px;margin:20px;}
.newsBox{}
#divContent{position:absolute;z-index:100;top:40px;left:100px;}
.ulContent{width:400px;}
.ulContent li{float:left;width:400px;height:386px;display:none;background-color:#fff;}
.ulContent dt{float:left;width:360px;height:202px;padding:19px;}
.ulContent dd{float:left;width:380px;height:126px;padding:10px;overflow:hidden;}
</style>
<script type="text/javascript" src="${ctxRoot }js/nodejs/socket.io.js"></script>
<script type="text/javascript" src="${ctxRoot }js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var socket;
$(document).ready(function(){
	socket = io.connect('${serverUrl}',{
		'reconnect':true
		, 'resource':'socket.io'
	});
	
	socket.on('connect', function(){
		$("p").text('Connected').css("color","blue");
	});

	socket.on('toServer', function(data){
		if(data.act == 'over')
			liOver(data.val);
		else if(data.act == 'out')
			liOut(data.val);
		else if(data.act == 'click')
			liClick(data.val);
		else if(data.act == 'setText')
			liSetText(data.val);
		else if(data.act == 'closeAll')
			closeAll();
	});
});

//var selectedLi = -1;

function liOver(val){
	//$("ul").children("li:eq("+val+")").css("background-color","#ddffdd");
}

function liOut(val){
	/*if(selectedLi != $("ul").children("li").index($("ul").children("li:eq("+val+")"))){
		$("ul").children("li:eq("+val+")").css("background-color","#ffffff");
		$("ul").children("li:eq("+val+")").text("");
	}*/
}

function liClick(val){
	selectedLi = val;
	$(".ulContent").children("li").each(function(idx,item){
		$(item).hide();
	});
	$(".ulContent").children("li:eq("+val+")").show();
}

function closeAll(){
	$(".ulContent").children("li").each(function(idx,item){
		$(item).hide();
	});
}

function liSetText(val){
	//$("ul").children("li:eq("+selectedLi+")").text(val);
}

function initialize(){
	$.ajax({
		type : "GET" //"POST", "GET"
		, async : true //true, false
		, url : "http://localhost:8080/kctv/ajax/listVod.xml" //Request URL
		, dataType : "xml" //전송받을 데이터의 타입
			//"xml", "html", "script", "json" 등 지정 가능
			//미지정시 자동 판단
		, timeout : 30000 //제한시간 지정
		, cache : false  //true, false
		//, data : $("#inputForm").serialize() //서버에 보낼 파라메터
			//form에 serialize() 실행시 a=b&c=d 형태로 생성되며 한글은 UTF-8 방식으로 인코딩
			//"a=b&c=d" 문자열로 직접 입력 가능
			//{a:b, c:d} json 형식 입력 가능
		, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		, error : function(request, status, error) {
			//통신 에러 발생시 처리
			alert("code : " + request.status + "\r\nmessage : " + request.reponseText);
		}
		, success : function(response, status, request) {
			//통신 성공시 처리
			//$('#resultDIV').append(response);
			//$("#text").val(response.val);
			alert(response);
		}
		, beforeSend: function() {
			//통신을 시작할때 처리
			//$('#ajax_indicator').show().fadeIn('fast');
		}
		, complete: function() {
			//통신이 완료된 후 처리
			//$('#ajax_indicator').fadeOut();
		}
	});
}
</script>
</head>

<body>
<p>Not connected</p>
<div id="divList">
	<ul id="ulList">
		<c:forEach items="${listNews}" var="item">
		<li><img src="${item.svrfile2 }" width="180" height="101" /></li>
		</c:forEach>
	</ul>
</div>
<c:forEach items="${listNews}" var="item">
<div id="divContent">
	<ul class="ulContent">
		<li>
			<dl>
				<dt><img src="${item.svrfile2 }" width="360" height="202" /></dt>
				<dd>${item.content }</dd>
			</dl>
		</li>
	</ul>
</div>
</c:forEach>
</body>
</html>
