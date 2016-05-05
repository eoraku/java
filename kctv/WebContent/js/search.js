$(document).ready(function(){
	$(".search_menu_off img").live("mouseover focus",function(){
		$(this).attr("src",$(this).attr("src").replace("out","over"));
	});

	$(".search_menu_off img").live("mouseout blur",function(){
		$(this).attr("src",$(this).attr("src").replace("over","out"));
	});

	$(".search_menu_sub_off img").live("mouseover focus",function(){
		$(this).attr("src",$(this).attr("src").replace("out","over"));
	});

	$(".search_menu_sub_off img").live("mouseout blur",function(){
		$(this).attr("src",$(this).attr("src").replace("over","out"));
	});

	$(".search_menu_sub img").live("mouseover focus",function(){
		$("#search_left_board").css("left",$(this).position().left+150);
		$("#search_left_board").css("top",$(this).position().top);
		$("#search_left_board").show();
	});

	$(".search_menu_sub img").live("mouseout blur",function(){
		$("#search_left_board").hide();
	});

	$("#search_left_board").live("mouseover focus",function(){
		$("#search_left_board").show();
	});

	$("#search_left_board").live("mouseout blur",function(){
		$("#search_left_board").hide();
	});
});