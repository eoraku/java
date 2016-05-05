function Scroll(left, top, width, height, bgColor, barColor, total){
	var left = left;
	var top = top;
	var width = width;
	var height = height;
	var bgColor = bgColor;
	var barColor = barColor;
	var total = total;	
	var current;
	current = 0;
	var moving;	
	var scroll = null;
	var scrollBar = null;


	this.drawBg = function(){
		scroll = document.createElement("div");
		scroll.style.position = 'absolute';
		scroll.style.left = left + 'px';
		scroll.style.top = top + 'px';
		scroll.style.width = width + 'px';
		scroll.style.height = height + 'px';
		scroll.style.backgroundColor = bgColor;
		
		document.body.appendChild(scroll);
	};
	
	this.drawBar = function(){
		moving = parseInt(height/total);
		scrollBar = document.createElement("div");
		scrollBar.style.position = 'absolute';
		scrollBar.style.left = 0 + 'px';
		scrollBar.style.top = 0 + 'px';
		scrollBar.style.width = width + 'px';
		scrollBar.style.height = moving + 'px';
		scrollBar.style.backgroundColor = barColor;
		
		scroll.appendChild(scrollBar);
	};
	
	this.up = function() {
		moving = parseInt(height/total);
		if(current > 0){
			current -= moving;
	 		if(current <= 0)	
	 	 		current = 0;
		}		
		scrollBar.style.top = current + 'px';
	};
	this.down = function(){
		moving = parseInt(height/total);
		if(current <= height-moving){
			current += moving;
	 		if(current >= height-moving)	
	 	 		current = height-moving;
		}	
		scrollBar.style.top = current + 'px';
		
	};
	
}
