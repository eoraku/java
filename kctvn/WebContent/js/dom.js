var $D = {
	create : function(tagName) {
		var ele = document.createElement(tagName);
		ele.style.position = "absolute";
		return ele;
	},
	get : function(id) {
		var ele = document.getElementById(id);		
		return ele;
	}	
};

Element.prototype.setId = function(id) {
	this.id = id;
	return this;
};
Element.prototype.setClass = function(className) {
	this.className = className;
	return this;
};
Element.prototype.setHidden = function(state) {
	state = (state == null || state == true) ? "none" : "block";
	this.style.display = state;
	return this;
};
Element.prototype.draw = function(element) {
	if(element == null) element = document.body;
	element.appendChild(this);
	return this;
};
Element.prototype.setPos = function(left, top) {
	this.style.left = left + "px";
	this.style.top = top + "px";
	return this;
};
Element.prototype.setDepth = function(depth) {
	this.style.zIndex = depth;
	return this;
};
HTMLImageElement.prototype.setSize = function(width, height) {
	this.width = width;
	this.height = height;	
	return this;
};
HTMLImageElement.prototype.setPath = function(src) {
	this.src = src;
	return this;
};
HTMLImageElement.prototype.replaceEvent = "";
HTMLImageElement.prototype.addReplace = function(fnc, msec) {
	clearInterval(this.replaceEvent);
	this.src = fnc();
	var self = this;
	this.replaceEvent = setInterval(function() {
		self.src = fnc();
	}, msec);
	return this;
};
HTMLImageElement.prototype.removeReplace = function() {
	clearInterval(this.replaceEvent);
	return this;
};

HTMLFontElement.prototype.setSize = function(width, height) {
	this.style.width = width + "px";
	//this.style.height = height + "px";	
	return this;
};
HTMLFontElement.prototype.setColor = function(color) {
	this.color = color;
	return this;
};
HTMLFontElement.prototype.setText = function(text) {
	this.innerHTML = text;
	return this;
};
HTMLFontElement.prototype.replaceEvent = "";
HTMLFontElement.prototype.addReplace = function(fnc, msec) {
	clearInterval(this.replaceEvent);
	this.innerHTML = fnc();
	var self = this;
	this.replaceEvent = setInterval(function() {
		self.innerHTML = fnc();
	}, msec);
	return this;
};
HTMLFontElement.prototype.removeReplace = function() {
	clearInterval(this.replaceEvent);
	return this;
};
HTMLFontElement.prototype.setAlign = function(align) {
	this.style.textAlign = align;
	return this;
};
HTMLFontElement.prototype.setFontSize = function(size) {
	this.style.fontSize = (size - 3) + "pt";
	return this;
};
HTMLFontElement.prototype.setBold = function(bold) {
	//this.style.fontWeight = (bold) ? "bold" : "";	
	return this;
};
HTMLDivElement.prototype.setSize = function(width, height) {
	this.style.width = width + "px";
	this.style.height = height + "px";		
	return this;
};
HTMLDivElement.prototype.setColor = function(color){
	this.style.backgroundColor = color;
	return this;
};
HTMLDivElement.prototype.setAlign = function(sAlign){
	this.align = sAlign;
	return this;
};
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/gi, "");
};
String.prototype.replaceAll = function(str1, str2) {
	var temp_str = this.trim();
	return temp_str.split(str1).join(str2);
};