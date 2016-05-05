$(document).ready(function(){
	$("form").submit(function(){
		if($("#category").length>0)if(!chkInputEmpty("#category","카테고리를 선택해주세요.")) return false;
		if(!chkInputEmpty("#title","제목을 입력해주세요.")) return false;
		if(!chkInputEmpty("#name","이름을 입력해주세요.")) return false;
		//if(!chkInputEmpty("#email","이메일을 입력해주세요.")) return false;
		submitContents();
		if(!chkInputEmpty("#contents","내용을 입력해주세요.")) return false;
		if(!chkFileExt($("#file1"))) return false;
		return true;
	});
	
	$("#file1").change(function(){
		chkFileExt($(this));
	});
});

function chkFileExt(obj){
	tmp = obj.val().split("\\");
	fullName = tmp[tmp.length-1]; //화일명.확장자
	tmp = fullName.split(".");
	extName = tmp[tmp.length-1]; //확장자
	if(allowFile.indexOf(extName.toLowerCase())<0){//허용 확장자 비교
		alert("업로드가 허용되지 않는 파일형식입니다.");
		obj.val("");
		return false;
	}else{
		return true;
	}
}
/*function ckFileSize(){
	var file=new Image();
	
	//첨부파일의 url경로 취득.
	file.dynsrc=document.getElementById("fudPolicy").value;
	
	//첨부파일크기 지정.
	var filesize=file.fileSize/1024;
	
	if(filesize>3072){
		alert("파일 크기를 확인해보세요.^^ M");
		return false;
	}
	
	return true;
}

function addInputFile(obj){
	fileCnt++;
	var filename = obj.value;
	alert(filename);
	var html = $("#td_files").html();
	html += "<input type=\"file\" name=\"file1\" id=\"file"+fileCnt+"\" class=\"input_file\" onchange=\"javascript:addInputFile(this);\"/><span>("+maxFileMB+"MB 이하)</span>";
	$("#td_files").html(html);
	obj.value=filename;
	$("#file"+(fileCnt-1)).val(filename);
}

//이미지 용량체크
var isFileChecked = false;
var isImgFile = false;
var isEnableFileSize = false;
var maxSize = 1*1024*1024;	   //1M
function checkFileSize(uploadImgObj){
	var enableUploadFileExt=new Array("bmp","jpg","jpeg","gif","png");
	var uploadImgObjName = uploadImgObj.value;
	var startPoint = 0;
	var isImageFile = false;
	
	//File 체크확인
	isFileChecked = true;
	
	if(uploadImgObj.value == ""){
		return;
	}
	
	//이미지파일 확장자 체크
	for(var i=uploadImgObjName.length-1; i>=0; i--) {
		if(uploadImgObjName.charAt(i) == ".") {
			startPoint = i;
			break;
		}
	}
	
	var uploadImgObjExt = uploadImgObjName.substring(startPoint+1,uploadImgObjName.length);
	
	for(i=0; i<enableUploadFileExt.length; i++) {
		if(uploadImgObjExt.toLowerCase() == enableUploadFileExt[i]){
			isImageFile = true;
			break;
		}
	}
	if(!isImageFile){
		alert("이미지 파일이 아닙니다.	 ");
		uploadImgObj.value="";
		isImgFile = false;
		return;
	}else{
		isImgFile = true;
	}
	
	//파일용량 체크
	var img = new Image();
	img.dynsrc = uploadImgObj.value;
	var filesize = img.fileSize;
	//alert(filesize); 
	if(filesize > maxSize) {
		alert("파일업로드 허용용량 "+maxSize/1024+"Kbyte를 초과되었습니다.");
		isEnableFileSize = false;
	}else{
		isEnableFileSize = true;
	}
}

//업로드승인체크
function goFileUploadCheck(){
	if(!isFileChecked){
		alert("업로드할 파일을 지정해주셔야 합니다.	 ");
		return;
	}
	
	if(!isImgFile){
		alert("이미지 파일이 아닙니다.	 ");
		return;
	}
	
	if(!isEnableFileSize){
		alert("파일업로드 허용용량 "+maxSize/1024+"Kbyte를 초과되었습니다.");
		return;
	}
}*/

/*
<input id="txtUploadFile" style="width: 100%" type="file" size="40" name="NewFile"  onchange="javascript:checkFileSize(this);" />
<input type="button" value="Upload" onclick="javascript:goFileUploadCheck();" />
*/