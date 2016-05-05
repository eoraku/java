$(document).ready(function(){
	$("#table_board_list .tr_list").hover(
			function(){$(this).addClass("over");},
			function(){$(this).removeClass("over");}
	);
	
	$("#ul_board_pages a").hover(
			function(){$(this).addClass("over");},
			function(){$(this).removeClass("over");}
	);
});

function form_reset(){
	$("form").each(function(){
		this.reset();
	});
}

function setBoardCategory(obj){
	var url = $.url();
	var newUrl;
	
	if(typeof url.param("muid") !== 'undefined')
		newUrl="?muid="+url.param("muid");
	else
		newUrl="?muid=";
	
	if(typeof url.param("pageSize") !== 'undefined')
		newUrl=newUrl+"&pageSize="+url.param("pageSize");
	else
		newUrl=newUrl+"&pageSize=";
	
	if(typeof url.param("pageView") !== 'undefined')
		newUrl=newUrl+"&pageView="+url.param("pageView");
	else
		newUrl=newUrl+"&pageView=";
	
	newUrl=newUrl+"&cuid="+obj.value;
	
	if(typeof url.param("guid") !== 'undefined')
		newUrl=newUrl+"&guid="+url.param("guid");
	else
		newUrl=newUrl+"&guid=";
	
	if(typeof url.param("schType") !== 'undefined')
		newUrl=newUrl+"&schType="+url.param("schType");
	else
		newUrl=newUrl+"&schType=";
	
	if(typeof url.param("schText") !== 'undefined')
		newUrl=newUrl+"&schText="+url.param("schText");
	else
		newUrl=newUrl+"&schText=";
	
	location.href=newUrl;
}