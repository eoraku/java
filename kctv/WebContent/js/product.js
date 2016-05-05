$(document).ready(function(){
	$(".vod_image").click(function(){
		idx=$(this).parent().parent().children("div").index($(this).parent());
		if(idx==2)
			$(this).siblings(".vod_detail").css("left","-88px");
		else if(idx==3)
			$(this).siblings(".vod_detail").css("left","-219px");
		else if(idx==4)
			$(this).siblings(".vod_detail").css("left","-350px");
		$(this).siblings(".vod_detail").toggle();
	});
	
	$(".vod_defail_close").click(function(){
		$(this).parent().parent().parent().parent().parent().toggle();
	});
});

function chgWeekImg(){
	$("#weekImg").attr("src",$("#selWeekImg").val());
}