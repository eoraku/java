$(document).ready(function(){
	$("#news_top_menu dt").hover(function(){
		$(this).children("a").children().toggle();
	});
	
	$("#news_top_view_tab ul li").hover(function(){
		cur_idx=$(this).parent().children("li").index($(this));
		$("#news_top_view_tab").css("background-position","0px -"+(cur_idx*24)+"px");

		for(var i=0; i<=5; i++){
			if(i==cur_idx)
				$("#news_top_"+i).show();
			else
				$("#news_top_"+i).hide();
		}
	});
	
	$("#news_leftmenu_menus li").hover(
		function(){
			if($(this).children("a").attr("class")=="out")
				$(this).children("a").show();
		},
		function(){
			if($(this).children("a").attr("class")=="out")
				$(this).children("a").hide();
		}
	);
	
	$(".ul_news_text a").hover(function(){
		var hotIndex = $(".ul_news_text li").index($(this).parent().parent().parent());
		var hotLength = $(".ul_news_text li").length;
		for(var i=0; i<hotLength; i++){
			if(i==hotIndex)
				$(".ul_news_image li:eq("+i+")").show();
			else
				$(".ul_news_image li:eq("+i+")").hide();
		}
	});
	
	$("#newsSchForm").submit(function(){
		setSchType();
		
		if($("#schText").val()=="" || $("#schText").length<1){
			if($("#schType option:selected").val()=="date"){
				alert("Please input search date.");
				$("#schDate").focus();
			}
			else{
				alert("Please input search words.");
				$("#schText").focus();
			}
			return false;
		}
	});
	
	$("#schType").change(function(){
		setSchType();
	});
	
// $.datepicker.setDefaults($.datepicker.regional["ko"]);
	$("#schDate").datepicker({ 
		dateFormat: 'yy-mm-dd',
		monthNamesShort: ['January','February','March','April','May','June','July','August','September','October','November','December'],
		dayNamesMin: ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'],
		weekHeader: 'Wk',
		changeMonth: true, //월변경가능
		changeYear: true, //년변경가능
		yearRange:'2008:+0', // 연도 셀렉트 박스 범위(현재와 같으면 1988~현재년)
		showMonthAfterYear: true, //년 뒤에 월 표시
		//buttonImageOnly: true, //이미지표시  
		//buttonText: '날짜를 선택하세요', 
		autoSize: false //오토리사이즈(body등 상위태그의 설정에 따른다)
		//buttonImage: '/wtm/images/egovframework/wtm2/sub/bull_calendar.gif', //이미지주소 /wtm/images/egovframework/wtm2/sub/bull_calendar.gif
		//showOn: "both" //엘리먼트와 이미지 동시 사용
	});
	
	setSchType();
});

function setNewsHot(idx){
	if(idx==1){
		$("#news_top_view_tab").css("background-position","0px -24px");
		$("#news_top_1").show();
	}else if(idx==2){
		$("#news_top_view_tab").css("background-position","0px -48px");
		$("#news_top_2").show();
	}else if(idx==3){
		$("#news_top_view_tab").css("background-position","0px -72px");
		$("#news_top_3").show();
	}else if(idx==4){
		$("#news_top_view_tab").css("background-position","0px -96px");
		$("#news_top_4").show();
	}else{
		$("#news_top_view_tab").css("background-position","0px 0px");
		$("#news_top_0").show();
	}
}

function setSchType(){
	if($("#schType option:selected").val()=="date"){
		$("#schText").hide();
		$("#schDate").show();
		$("#schText").val($("#schDate").val());
	}else{
		$("#schText").show();
		$("#schDate").hide();
		$("#schDate").val($("#schText").val());
	}
}

function printView(nuid){
	newWindow("print_window.htm?nuid="+nuid, "print_window", 620, 620, 1);
	
	/*var print_contents = $(".news_view").html();
	$("#print_iframe").contents().find("body").html(print_contents);
	//$("#print_iframe").contents().find(".btn_box_hidden").hide();
	$("#print_iframe").focus();
	frames["print_iframe"].focus();
	frames["print_iframe"].print();*/
}