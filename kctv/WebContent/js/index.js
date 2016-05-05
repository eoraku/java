$(document).ready(function(){
	var news_index=Math.floor(Math.random()*6);
	
	$("#news_latest_"+news_index).show();
	$("#news_latest_top").css("background-position","0px -"+(news_index*25)+"px");

	$("#news_latest_top_tab ul li").hover(function(){
		cur_idx=$(this).parent().children("li").index($(this));
		$("#news_latest_top").css("background-position","0px -"+(cur_idx*25)+"px");

		for(var i=0; i<6; i++){
			if(i==cur_idx)
				$("#news_latest_"+i).show();
			else
				$("#news_latest_"+i).hide();
		}
	});

	$("#news_latest_top_tab ul li").click(function(){
		location.href=$(this).attr("href");
	});

	var right_banner_index=Math.floor(Math.random()*2);
	if(right_banner_index)
	{
		var $myobj=$("#main_right_banner_list li:first").clone(true);
		$("#main_right_banner_list li:first").remove();
		$("#main_right_banner_list").css("left",0);
		$("#main_right_banner_list").append($myobj);
	}
	$("#main_right_banner_prev").click(function(){
		var $myobj=$("#main_right_banner_list li:first").clone(true);
		$("#main_right_banner_list li:first").remove();
		$("#main_right_banner_list").css("left",0);
		$("#main_right_banner_list").append($myobj);
	});

	$("#main_right_banner_next").click(function(){
		var $myobj=$("#main_right_banner_list li:last").clone(true);
		$("#main_right_banner_list li:last").remove();
		$("#main_right_banner_list").css("left",0);
		$("#main_right_banner_list").prepend($myobj);
	});
});