$(document).ready(function(){
	$('.top_menu_center').hover(
	function(){
		left=$("#common_top_menu dl").offset().left+172;
		$(this).children("div").css("left",left).show();
	},
	function(){
		$(this).children("div").hide();
	});

	$('.top_menu_side').hover(
	function(){
		sub_id=$(this).children("div").attr("id");
		if(sub_id=="top_menu_sub_1"){
			img=$(this).children("a").children("img");
			src_old=img.attr("src");
			src_new=src_old.replace("_out","_over");
			img.attr("src",src_new);
			left=$(this).offset().left;
		}
		else if(sub_id=="top_menu_sub_8")
			left=$(this).offset().left-194;
		else
			left=$(this).offset().left;
		$(this).children("div").css("left",left).show();
	},
	function(){
		sub_id=$(this).children("div").attr("id");
		if(sub_id=="top_menu_sub_1"){
			img=$(this).children("a").children("img");
			src_old=img.attr("src");
			src_new=src_old.replace("_over","_out");
			img.attr("src",src_new);
		}
		$(this).children("div").hide();
	});
});