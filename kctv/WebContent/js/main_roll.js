var mainBanner = {
	depth: 0,
	current_id: -1,
	isFirst:true,
	timer:"",
	setRolling: function(){
		var timer_id;
		var delay = 3000; //롤링시간설정
		var total = $("#mainBanner").find(".imgBanner").size();
		var $this = $("#mainBanner");

		$this.mouseenter(function(){
			stopTimer();
		});
		$this.mouseleave(function(){
			newTimer();
		});

		function newTimer(){
			if(timer_id) stopTimer();
			timer_id = setTimeout(timerListener, delay);
			timer = timer_id;
		}

		function stopTimer(){
			clearTimeout(timer_id);
		}

		function timerListener(){
			var _id = Number(mainBanner.current_id) + 1;
			if(_id >= total) _id = 0;
				mainBanner.on(_id);
			newTimer();
		}

		newTimer();
	},
	on: function(number){
		if (number == mainBanner.current_id) return;
		else mainBanner.current_id = number;

		$("#mainBannerTab").find("li> a img").attr("src","images/index/scroll_circle_off.png");
		$("#mainBannerLink"+number+" img").attr("src","images/index/scroll_circle_on.png");

		$("#mainBanner").find(".imgBanner").stop();
		$("#mainBanner").find(".imgBanner").show();
		$("#mainBanner").find(".imgBanner").css("filter", " ");
		$("#mainBanner").find(".imgBanner").each(function(i){
			var _item = $(this);
			if (i == number) {
				mainBanner.depth++;
				_item.css("z-index", mainBanner.depth);
				var list_num= mainBanner.depth%5;
				if (mainBanner.isFirst) {
					mainBanner.isFirst = false;
					return;
				}
				_item.fadeTo(0, 0);
				_item.fadeTo(300, 1, "easeOutCubic");
			}
		});
	},
	over: function(){
		clearTimeout(timer);
	}
};