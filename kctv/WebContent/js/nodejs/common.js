var nodeIP = "localhost:3000";
var io,socket;

/* v1.jsp */
var cur = 0;
var img1 = 0;
var img2 = 0;
var img3 = 0;
var img4 = 0;
var img5 = 0;
var img6 = 0;

function setSocket(url){
	socket = io.connect(url,{
		'reconnect':true
		, 'resource':'socket.io'
	});
}

function sendToView(act, val){
	socket.emit('fromClient', {act:act, val:val});
}

function goHref(href){
	location.href = href;
}

function clickV1ById(id){
	//alert($("#Stage").html());
	if(id>0){
		var id1 = "#Stage_Layer"+id;
		var id2 = "#Stage_L"+id;
		var img = eval("img"+id);
		if(img){
			img = 0;
			cur = 0;
			$(id2).trigger('click');
		}else{
			img = 1;
			cur = id;
			$(id1).trigger('click');
		}
	}else if(cur>0)
		$("#Stage_L"+cur).trigger('click');
}

function clickV2ById(id){
	$("#Stage_"+id).trigger('click');
}

function launchFullscreen() {
	var element = document.documentElement;
	if(element.requestFullScreen) {
		element.requestFullScreen();
	} else if(element.mozRequestFullScreen) {
		element.mozRequestFullScreen();
	} else if(element.webkitRequestFullScreen) {
		element.webkitRequestFullScreen();
	}
}

function cancelFullscreen() {
	if(document.cancelFullScreen) {
		document.cancelFullScreen();
	} else if(document.mozCancelFullScreen) {
		document.mozCancelFullScreen();
	} else if(document.webkitCancelFullScreen) {
		document.webkitCancelFullScreen();
	}
}