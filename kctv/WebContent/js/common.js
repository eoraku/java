$(document).ready(function(){
	$(".left_menu_div_hover").hover(
		function(){$(this).addClass("over");},
		function(){$(this).removeClass("over");}
	);
	
	$(".left_menu_depth2").click(function(){
		sub=$(this).attr("sub");
		if($(".parent_"+sub).length>0){
			if($(".parent_"+sub).css("display")=="none"){
				$(this).removeClass("bg_menu_plus").addClass("bg_menu_minus");
				$(".parent_"+sub).show();
			}
			else{
				$(this).removeClass("bg_menu_minus").addClass("bg_menu_plus");
				$(".parent_"+sub).hide();
			}
		}
		else{
			if(typeof sub!="undefined" && sub.length>0)
				document.location="?muid="+sub;
		}
	});
	$(".left_menu_depth3 a").hover(
		function(){$(this).addClass("over");},
		function(){$(this).removeClass("over");}
	);
	
	$("form[name=common_search]").submit(function(){
		if(!chkInputEmpty("input[name=schText","검색어를 입력해주세요.")) return false;
		
		//$("input[name=schText").val(encodeURI($("input[name=schText").val()));
		return true;
	});
	
	left_menu_current();
});

function chkInputEmpty(obj,mgs){
	//if($("input:checkbox[name="+obj+"]").is(":checked")==false){
	//if($("#"+obj).is(":checked")==false){
	if($.trim($(obj).val())==""){
		//if(msg!="")
			alert(mgs);
		$(obj).focus();
		return false;
	}
	return true;
}

function chkCheckboxEmpty(obj,mgs){
	if($(obj).val()==""){
		//if(msg!="")
			alert(mgs);
		$(obj).focus();
		return false;
	}
	return true;
}

function chkInputCheck(obj,mgs){
	if($("input[name='"+obj+"']").is(":checked") == false){
		//if(msg!="")
			alert(mgs);
		$(obj).focus();
		return false;
	}
	return true;
}

function chkSelect(obj,mgs){
	if($(obj).val()==""){
		//if(msg!="")
			alert(mgs);
		$(obj).focus();
		return false;
	}
	return true;
}

function left_menu_current(){
	var address = unescape(location.href);
	var muid = "";
	if(address.indexOf("muid", 0) != -1) {
		param = address.substring(address.indexOf("muid", 0) + 5);
		$(".parent_"+muid).show();
	}
}

var device_type;
function _not_device_detection() {
	var ua = navigator.userAgent;
	var qs = window.location.search.substring(1);
	var agent = "error";
	var re = {
		"pcswitch" : new RegExp("pc", "i"),
		"pomswitch" : new RegExp("pom", "i"),
		"iphoneswitch" : new RegExp("iphone", "i"),
		"iphone" : new RegExp("iP(hone|od)(;|\s)", "i"),
		"winmo" : new RegExp("Windows\s+CE", "i"),
		"linux" : new RegExp("Linux", "i"),
		"windows" : new RegExp("Windows", "i"),
		"MSIE" : new RegExp("MSIE", "i"),
		"mac" : new RegExp("OS\s+(X|9)", "i"),
		"solaris" : new RegExp("Solaris", "i"),
		"android" : new RegExp("Android", "i"),
		"bsd" : new RegExp("BSD", "i")
	};
	//alert (ua);
	if (qs.match(re.pcswitch)) {
		/* This assumes you have a single query string value of "pc" */
		agent = "pc";

	} else if (qs.match(re.pomswitch)) {
		/* This assumes you have a single query string value of "pom" */
		agent = "pom";
	} else if (qs.match(re.iphoneswitch)) {
		/* This assumes you have a single query string value of "iphone" */
		agent = "iphone";
	} else if (ua.match(re.iphone)) {
		/* This user agent should be an iPhone/iPod */
		agent = "iphone";
	} else if (ua.match(re.winmo)) {
		/* This user agent should be a Windows Mobile device - you may want a special class for this and possibly high-end Symbian too */
		agent = "pom";
		// }else if (ua.match(re.mobile)) {
		/* This assumes you have a single query string value of "pc" */
		// agent = "mobile";
	}else if (ua.match(re.android)) {
		/* This assumes you have a single query string value of "pc" */
		agent = "android";
	} else if (
		(!ua.match(re.linux)) &&
		(!ua.match(re.windows)) &&
		(!ua.match(re.MSIE)) &&
		(!ua.match(re.mac)) &&
		(!ua.match(re.solaris)) &&
		(!ua.match(re.bsd))
	) {
		/* This user agent is not Linux, Windows, a Mac, Solaris or BSD */
		agent = "pom";
	} else {
		/* Otherwise assume it's a PC */
		agent = "pc";
	}
	return agent;
}

device_type=_not_device_detection();

function Switch() {
	if (device_type=="pc"){
		location.href="javascript:good_win('/vod/live/20/view.htm','vod_live',668,430)";
	}
	else{
		location.href="http://122.202.129.136:1935/live/ch4/playlist.m3u8";
	}
}

function Switch2() {
	if (device_type=="pc"){
		location.href="javascript:good_win('/vod/live/7/view.htm','vod_live',668,430)";
	}
	else{
		location.href="http://122.202.129.136:1935/live/ch5/playlist.m3u8";
	}
}

function set_search_text(val){
	f=document.common_search;
	f.schText.value=val;
	f.submit();
}

function newWindow(url, target, width, height, sbar) {
	var top = (screen.height - height) / 2 -30;
	var left = (screen.width - width) / 2;
	if(sbar) sbar = 'yes';
	else sbar = 'no';
	var modaless = window.open(url, target, 'width='+width+',height='+height+',top='+top+',left='+left+',scrollbars='+sbar);
	modaless.focus();
}

function newWindowPos(url, target, width, height, cnt, tot) {
	var top = (screen.height - height) / 2 -30;
	var left = ((screen.width - tot*width) / 2) + cnt*width;
	var modaless = window.open(url, target, 'width='+width+',height='+height+',top='+top+',left='+left+',scrollbars=no');
	modaless.focus();
}

function good_win(URL,name,WD,HT)
{
	window.open(URL, name, 'width='+WD+',height='+HT+', left=10,top=10,scrollbars=no');
}

function goto_byselect(sel, targetstr)
{
	var index = sel.selectedIndex;
	if (sel.options[index].value != '') {
		if (targetstr == 'blank') {
			window.open(sel.options[index].value, 'win1');
		} else {
			var frameobj;
			if (targetstr == '')
				targetstr = 'self';
			if ((frameobj = eval(targetstr)) != null)
				frameobj.location = sel.options[index].value;
		}
	}
}

function newWindow(url, target, width, height, sbar){
	var top = (screen.height - height) / 2 -30;
	var left = (screen.width - width) / 2;
	if(sbar) sbar = 'yes';
	else sbar = 'no';
	var modaless = window.open(url, target, 'width='+width+',height='+height+',top='+top+',left='+left+',scrollbars='+sbar);
	modaless.focus();
}

function img_view_window(pageUrl, imgUrl, imgWidth, imgHeight){
	windowUrl = pageUrl+"?imgUrl="+imgUrl+"&imgWidth="+imgWidth+"&imgHeight="+imgHeight;
	if(imgWidth>0 && imgHeight>0){
		newWindow(windowUrl, "imgView", imgWidth, imgHeight, 1);
	}else{
		newWindow(windowUrl, "imgView", 400, 300, 1);
	}
}

function popup_window(url, num, width, height, cnt, tot){
	if(tot>1){
		newWindowPos(url+"?num="+num,"popup_"+num,width,height+25,cnt,tot);
	}else
		newWindow(url+"?num="+num,"popup_"+num,width,height+25,0);
}

function vod_opwin(win_url, vod, num){
	win_url2 = win_url +"?vodfile=" + vod + "&num=" + num; 
	n111 = window.open(win_url2,"vod_wmv", " scrollbars=no,scrolling=no,menubar=no,resizable=no,width=970 height=430,left=100, top=100");
	n111.focus();
}

function vod_live(root,ch){
	var win_url = root+"vod/live/"+ch+"/view.htm";
	var width = 640;
	var height = 427;
	var left = (screen.width - width) / 2;
	var top = (screen.height - height) / 2 -30;
	var vod_wmv = window.open(win_url,"vod_live", "scrollbars=no,scrolling=no,menubar=no,resizable=no,width="+width+",height="+height+",left="+left+",top="+top);
	vod_wmv.focus();
}

function vod_wmv(root,num){
	var win_url = root+"vod/wmv/"+num+"/view.htm";
	var width = 970;
	var height = 427;
	var left = (screen.width - width) / 2;
	var top = (screen.height - height) / 2 -30;
	var vod_wmv = window.open(win_url,"vod_wmv", "scrollbars=no,scrolling=no,menubar=no,resizable=no,width="+width+",height="+height+",left="+left+",top="+top);
	vod_wmv.focus();
}

function vod_flv(root,num){
	var win_url = root+"vod/flv/"+num+"/view.htm";
	var width = 1022;
	var height = 446;
	var left = (screen.width - width) / 2;
	var top = (screen.height - height) / 2 -30;
	var vod_flv = window.open(win_url,"vod_flv", "scrollbars=no,scrolling=no,menubar=no,resizable=no,width="+width+",height="+height+",left="+left+",top="+top);
	vod_flv.focus();
}

function vod_intro(root,num){
	var win_url = root+"vod/flv/"+num+"/view.htm";
	var width = 762;
	var height = 446;
	var left = (screen.width - width) / 2;
	var top = (screen.height - height) / 2 -30;
	var vod_flv = window.open(win_url,"vod_flv", "scrollbars=no,scrolling=no,menubar=no,resizable=no,width="+width+",height="+height+",left="+left+",top="+top);
	vod_flv.focus();
}

function totalSearch() {
	var f = document.common_search ;
	if(f.schText.value == "") {
		alert("검색어를 입력하세요");
		f.schText.focus();
		return ;
	}
	
	f.schText.value = encodeURI(f.schText.value);
	
	f.submit();
}

function searchZipcode(form,code,addr1,addr2){
	if(typeof form=="undefined" || form=="" || form=="0")
		form="join_form";
	if(typeof code=="undefined" || code=="" || code=="0")
		code="zipcode";
	if(typeof addr1=="undefined" || addr1=="" || addr1=="0")
		addr1="address1";
	if(typeof addr2=="undefined" || addr2=="" || addr2=="0")
		addr2="address2";
	newWindow("../user/searchZipcode.htm?formName="+form+"&formZipcode="+code+"&formAddress1="+addr1+"&formAddress2="+addr2, "popup_zipcode", 360, 200, 0);
}

function loginAlert(){
	alert("로그인 후 이용해주세요.");
	location.href = "/user/login.htm";
}