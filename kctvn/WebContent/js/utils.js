var SMART_PHONE = "true";
function NaviItem(element, evt) {
	this.element = element;
	this.evt = evt;
}

function NaviEvent() {
	var self = this;
	var visible = true;
	var rolling = false;
	var pageing = false;
	var focus = 0;
	var start = 0;
	var maxCount = 0;
	var focusObj = null;
	var onItems = new Array();
	var offItems = new Array();
	var onFos = new Array();
	var offFos = new Array();
	var prevItem = null;
	var nextItem = null;
	var naviActive = false;

	this.pos = function(left, top) {
		this.left = left;
		this.top = top;
	};
	this.start = function() {
		naviActive = true;
		var focusIMG = document.createElement("img");
		savePosition();
		drawFocus();
		drawItems();
		setPosition();
		if (SMART_PHONE == "true")
			addEvent();
	};

	this.clear = function() {
		visible = true;
		focus = 0;
		start = 0;
		maxCount = 0;
		if (focusObj != null)
			document.body.removeChild(focusObj);
		onItems = [];
		if (offItems != null && offItems.length > 0) {
			for ( var i = 0; i < offItems.length; i++) {
				if (offItems[i] == null)
					break;
				if (offItems[i].evt != null)
					if (SMART_PHONE == "true")
						MouseEvent.removeEvent(offItems[i].element, "mousedown", offItems[i].evt);
				if (offItems[i].element != null)
					document.body.removeChild(offItems[i].element);
			}
		}
		offItems = [];
		onFos = [];
		offFos = [];
		if (prevItem != null) {
			if (prevItem.evt != null)
				if (SMART_PHONE == "true")
					MouseEvent.removeEvent(prevItem.element, "mousedown", evt);
			if (prevItem.element != null)
				document.body.removeChild(prevItem.element);
		}
		if (nextItem != null) {
			if (nextItem.evt != null)
				if (SMART_PHONE == "true")
					MouseEvent.removeEvent(nextItem.element, "mousedown", evt);
			if (nextItem.element != null)
				document.body.removeChild(nextItem.element);
		}
	};
	this.changeFocus = function(url) {
		if (typeof focusObj.childNodes[0] == "undefined") {
			focusObj.src = url;
		} else {
			focusObj.childNodes[0].src = url;
		}
	};
	this.changeOnFocus = function(url, index) {
		if (typeof onItems[self.getIndex()].element.childNodes[0] == "undefined") {
			onItems[index].element.src = url;
		} else {
			onItems[index].element.childNodes[0].src = url;
		}
	};
	this.changeOffFocus = function(url, index) {
		if (typeof offItems[self.getIndex()].element.childNodes[0] == "undefined") {
			offItems[index].element.src = url;
		} else {
			offItems[index].element.childNodes[0].src = url;
		}
	};
	this.changeOnFontColor = function(color) {
		for ( var i = 0; i < onItems.length; i++) {
			if (typeof onItems[self.getIndex()].element.childNodes[1] == "undefined") {
				onItems[i].element.color = color;
			} else {
				onItems[i].element.childNodes[1].color = color;
			}
		}
	};
	this.arrowVisible = function(flag) {
		if (flag) {
			if (prevItem.element != null)
				prevItem.element.style.display = "none";
			if (nextItem.element != null)
				nextItem.element.style.display = "none";
		} else {
			if (prevItem.element != null)
				prevItem.element.style.display = "block";
			if (nextItem.element != null)
				nextItem.element.style.display = "block";
		}
	};
	this.setNaviActive = function(flag) {
		naviActive = flag;
		if (flag) {
			if (prevItem != null) {
				prevItem.element.style.display = "block";
				if (start + focus == 0) {
					prevItem.element.style.display = "none";
				}
			}
			if (nextItem != null) {
				nextItem.element.style.display = "block";
				if (start + focus == offItems.length - 1) {
					nextItem.element.style.display = "none";
				}
			}
		} else {
			if (prevItem.element != null)
				prevItem.element.style.display = "none";
			if (nextItem.element != null)
				nextItem.element.style.display = "none";
		}
	};
	this.getNaviActive = function() {
		return naviActive;
	};
	this.visible = function(flag) {
		visible = flag;
		var display = "block";
		if (!flag)
			display = "none";
		focusObj.style.display = display;
		if (offItems != null && offItems.length > 0) {
			for ( var i = 0; i < offItems.length; i++) {
				if (offItems[i] != null)
					offItems[i].element.style.display = display;
			}
		}
		if (prevItem != null)
			prevItem.element.style.display = display;
		if (nextItem != null)
			nextItem.element.style.display = display;
		if (flag)
			setPosition();
	};
	this.isVisible = function() {
		return visible;
	};
	this.setRolling = function(_rolling) {
		rolling = _rolling;
	};
	this.setPageing = function(_pageing) {
		pageing = _pageing;
	};
	var savePosition = function() {
		for ( var i = 0; i < maxCount; i++) {
			if (onItems[i] != null) {
				onFos[i] = new self.pos(onItems[i].element.style.left, onItems[i].element.style.top);
			}
		}
		for ( var i = 0; i < maxCount; i++) {
			if (offItems[i] != null) {
				offFos[i] = new self.pos(offItems[i].element.style.left, offItems[i].element.style.top);
			}
		}
	};
	this.setSelectBtn = function(prevKNaviItem, nextKNaviItem) {
		prevItem = prevKNaviItem;
		MouseEvent.addEvent(prevKNaviItem.element, "mousedown", self.selectPrevItem);
		document.body.appendChild(prevKNaviItem.element);
		nextItem = nextKNaviItem;
		MouseEvent.addEvent(nextKNaviItem.element, "mousedown", self.selectNextItem);
		document.body.appendChild(nextKNaviItem.element);
	};
	this.addItem = function(onKNaviItem, offKNaviItem) {
		onItems.push(onKNaviItem);
		offItems.push(offKNaviItem);
		self.setMaxItem(onItems.length);
	};
	this.setMaxItem = function(_maxCount) {
		maxCount = _maxCount;
		if (maxCount > onItems.length) {
			maxCount = onItems.length;
		}
	};
	this.setFocus = function(_focus) {
		focus = _focus;
		drawFocus();
	};
	this.setFocusAndStart = function(_start, _focus) {
		start = _start;
		focus = _focus;
		setPosition();
		self.setFocus(focus);
	};
	this.getFocus = function() {
		return focus;
	};
	this.getStart = function() {
		return start;
	};
	this.getIndex = function() {
		return start + focus;
	};
	this.action = function() {
		if (!naviActive)
			return;
		if (onItems[self.getFocus() + start].evt != null)
			onItems[self.getFocus() + start].evt();
	};
	this.selectPrevItem = function() {
		if (!visible)
			return;
		if (onItems.length == 1 || offItems.length == 1) return;
		if (pageing) {
			if (rolling && focus == 0 && start == 0) {
				start = offItems.length - (offItems.length % maxCount);
				focus = (offItems.length % maxCount) - 1;
				setPosition();
				self.setFocus(focus);
				return;
			}
			if (focus == 0 && start != 0) {
				start -= maxCount;
				focus = maxCount - 1;
			} else {
				if (focus > 0)
					focus--;
			}
		} else {
			if (focus > 0) {
				focus--;
			} else {
				if (start > 0) {
					start--;
				} else if (rolling) {
					start = offItems.length - maxCount;
					focus = maxCount - 1;
				}
			}
		}
		setPosition();
		self.setFocus(focus);
	};
	this.selectNextItem = function() {
		if (!visible)
			return;
		if (onItems.length == 1 || offItems.length == 1) return;
		if (pageing) {
			if (rolling && start + focus > offItems.length - 2) {
				start = 0;
				focus = 0;
				setPosition();
				self.setFocus(focus);
				return;
			}
			if (focus == maxCount - 1 && offItems.length > maxCount + start) {
				start += maxCount;
				focus = 0;
			} else {
				if (focus < maxCount && start + focus < offItems.length - 1)
					focus++;
			}
		} else {
			if (focus < maxCount - 1 && focus < offItems.length - 1) {
				focus++;
			} else {
				if (focus + start < offItems.length - 1)
					start++;
				else if (rolling) {
					start = 0;
					focus = 0;
				}
			}
		}
		setPosition();
		self.setFocus(focus);
	};
	var setPosition = function() {
		var lastIndex = offItems.length < maxCount ? offItems.length : start + maxCount;
		var fosCount = 0;
		for ( var i = 0; i < start; i++) {
			offItems[i].element.style.display = "none";
		}
		for ( var i = start; i < lastIndex; i++) {
			if (offItems[i] != null) {
				offItems[i].element.style.display = "block";
				offItems[i].element.style.left = offFos[fosCount].left;
				offItems[i].element.style.top = offFos[fosCount].top;
				fosCount++;
			}
		}
		for ( var i = lastIndex; i < offItems.length; i++) {
			offItems[i].element.style.display = "none";
		}
		if (prevItem != null) {
			prevItem.element.style.display = "block";
			if (start + focus == 0) {
				prevItem.element.style.display = "none";
			}
		}
		if (nextItem != null) {
			nextItem.element.style.display = "block";
			if (start + focus == offItems.length - 1) {
				nextItem.element.style.display = "none";
			}
		}
	};
	var drawItems = function() {
		for ( var i = 0; i < onItems.length; i++) {
			if (onItems[i] == null)
				break;
			if(i != 0) onItems[i].element.style.display = "none";
			document.body.appendChild(onItems[i].element);
		}
		for ( var i = 0; i < offItems.length; i++) {
			if (offItems[i] == null)
				break;
			document.body.appendChild(offItems[i].element);
		}
	};
	var onClickSetFocus = function(e) {
		if (!naviActive)
			return;
		var targetobj = window.event ? event.srcElement : e.target;
		var tempFocus = -1;
		for ( var i = 0; i < offItems.length; i++) {
			if (targetobj == offItems[i].element || targetobj.parentNode == offItems[i].element) {
				tempFocus = i;
			}
		}
		if (tempFocus != -1) {
			self.setFocus(tempFocus - start);
		}
		return tempFocus - start;
	};
	var drawFocus = function() {
		if (onItems.length == 0)
			return;
		if (SMART_PHONE == "true" && focusObj != null)
			MouseEvent.removeEvent(focusObj, "mousedown", self.action);
		if (focusObj != null)
			focusObj.style.display = "none";

		focusObj = onItems[self.getFocus() + start].element;
		focusObj.style.left = onFos[self.getFocus()].left;
		focusObj.style.top = onFos[self.getFocus()].top;
		focusObj.style.display = "block";
		if (SMART_PHONE == "true")
			MouseEvent.addEvent(focusObj, "mousedown", self.action);
	};
	var addEvent = function() {
		for ( var i = 0; i < offItems.length; i++) {
			if (offItems[i] == null)
				break;
			MouseEvent.addEvent(offItems[i].element, "mousedown", function(e) {
				var _focus = onClickSetFocus(e);
				if (offItems[_focus].evt != null)
					offItems[_focus].evt();
				setPosition();
			});
		}
	};
};

var MouseEvent = {
	evts : [],
	transactionData : [],
	EvtObj : function(obj, type, fn) {
		this.obj = obj;
		this.type = type;
		this.fn = fn;
	},
	/**
	 * <pre>
	 * 이벤트등록및메니저에저장
	 * </pre>
	 * 
	 * @param {Object} obj
	 * @param {String} type
	 * @param {function} fn
	 * @return
	 */
	addEvent : function(obj, type, fn) {
		var obj = (obj.constructor === String) ? document.getElementById(obj) : obj;
		if (obj.attachEvent) {
			obj['e' + type + fn] = fn;
			obj[type + fn] = function() {
				obj['e' + type + fn](window.event);
			};
			obj.attachEvent('on' + type, obj[type + fn]);
		} else {
			obj.addEventListener(type, fn, false);
		}
		obj.style.cursor = "pointer";
		this.evts.push(new this.EvtObj(obj, type, fn));
	},
	removeEvent : function(obj, type, fn) {
		var obj = (obj.constructor === String) ? document.getElementById(obj) : obj;
		if (obj.detachEvent) {
			obj.detachEvent('on' + type, obj[type + fn]);
			obj[type + fn] = null;
		} else {
			obj.removeEventListener(type, fn, false);
		}
		this.del(obj, type, fn);
	},
	clearEvent : function() {
		for ( var i = this.evts.length - 1; i >= 0; i--) {
			this.removeEvent(this.evts[i].obj, this.evts[i].type, this.evts[i].fn);
		}
	},
	del : function(obj, type, fn) {
		for ( var i = 0; i < this.evts.length; i++) {
			if (this.evts[i].obj == obj && this.evts[i].type == type && this.evts[i].fn == fn) {
				this.evts.splice(i, 1);
			}
		}
	}
};

function Thread(evt, durationMillis) {
	var evt = evt;
	var durationMillis = durationMillis;
	var thread = null;
	var status = false;

	this.run = function() {
		thread = setInterval(evt, durationMillis);
	};
	this.stop = function() {
		if (thread != null)
			clearInterval(thread);
	};
	this.sleep = function(sleepMillis) {
		if (status)
			return;
		status = true;
		this.stop();
		status = setTimeout(function() {
			thread = setInterval(evt, durationMillis);
			status = false;
		}, sleepMillis);
	};
};

var Ajax = {
	_XHRs : [],
	_XHRcnt : 0,
	_findXHR : function(obj) {
		if (obj != null) {
			for ( var i = 0; i < this._XHRcnt; i++) {
				if (this._XHRs[i] != null && obj == this._XHRs[i]._xhr) {
					return this._XHRs[i];
				}
			}
		}
		return null;
	},
	_removeXHR : function(obj) {
		if (obj != null) {
			for ( var i = 0; i < this._XHRcnt; i++) {
				if (this._XHRs[i] != null && obj == this._XHRs[i]._xhr) {
					this._XHRs.splice(i, 1);
					this._XHRcnt--;
				}
			}
		}
	},
	_defCallBack : function() {
		var obj = Ajax._findXHR(this);
		if (obj != null && obj._xhr.readyState == 4) {
			if (obj._xhr.status == 200) {
				if (obj._onok != null) {
					obj._onok(obj);
				}
			} else {
				if (obj._onerr != null) {
					obj._onerr(obj);
				}
			}
			Ajax._removeXHR(this);
		}
	},
	getXHRCount : function() {
		return this._XHRcnt;
	},
	createXHR : function(onok, onerr) {
		function XHR(onok, onerr) {
			this._xhr = (window.XMLHttpRequest) ? new XMLHttpRequest() : (window.ActiveXObject ? new ActiveXObject('Microsoft.XMLHTTP') : null);
			this._onok = onok;
			this._onerr = onerr;
			this._param = [];

			if (this._xhr != null) {
				this._xhr.onreadystatechange = Ajax._defCallBack;
			}
		}
		//		XHR.prototype.open = function(method, uri, async) {
				//			if (this._xhr != null) {
				//				this._method = method;
				//				this._xhr.open(_method, uri, async);
				//				if (_method.toUpperCase() == "POST") {
				//					this._xhr.setRequestHeader("Accept", "*/*");
				//					this._xhr.setRequestHeader("Accept-Language", "ko-kr,ko;q=0.8,en-us;q=0.5,en;q=0.3");
				//					this._xhr.setRequestHeader("Accept-Encoding", "gzip,deflate");
				//					this._xhr.setRequestHeader("Accept-Charset", "EUC-KR,utf-8;q=0.7,*;q=0.7");
				//					this._xhr.setRequestHeader("Keep-Alive", "115");
				//					this._xhr.setRequestHeader("Connection", "keep-alive");
				//					this._xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
				//					this._xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
				//					this._xhr.setRequestHeader("Cache-Control", "no-cache, must-revalidate");// 노 캐쉬
				//					this._xhr.setRequestHeader("Pragma", "no-cache"); // 노 캐쉬
				//				}
				//			}
				//		};
				XHR.prototype.setParam = function(key, val) {
					if (this._xhr != null) {
						this._param.push(key + "=" + val);
					}
				}, XHR.prototype.send = function(method, uri, async) {
					if (this._xhr != null) {
						var params = (method.toUpperCase() == "GET" && this._param.length > 0) ? "?" : "";
						for ( var i = 0; i < this._param.length; i++) {
							params += this._param[i];
							if (i != this._param.length - 1)
								params += "&";
						}
						
						uri = (method.toUpperCase() == "GET") ? uri + params : uri;

						this._xhr.open(method, uri, async);
						this._xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
						this._xhr.setRequestHeader("Cache-Control", "no-cache, must-revalidate");// 노 캐쉬
						this._xhr.setRequestHeader("Pragma", "no-cache"); // 노 캐쉬
						
						if (method.toUpperCase() == "POST") {
							this._xhr.send(params);
						} else {
							this._xhr.send(null);
						}
						this._param = [];
					}
				};
		XHR.prototype.setRequestHeader = function(name, value) {
			if (this._xhr != null) {
				this._xhr.setRequestHeader(name, value);
			}
		};
		XHR.prototype.getResponseHeader = function(name) {
			if (this._xhr != null) {
				return this._xhr.getResponseHeader(name);
			}
			return null;
		};
		XHR.prototype.getResultText = function() {
			if (this._xhr != null) {
				if (this._xhr.readyState == 4) {
					if (this._xhr.status == 200) {
						return this._xhr.responseText;
					}
				}
			}
			return null;
		};
		XHR.prototype.getResultXML = function() {
			if (this._xhr != null) {
				if (this._xhr.readyState == 4) {
					if (this._xhr.status == 200) {
						return this._xhr.responseXML;
					}
				}
			}
			return null;
		};
		XHR.prototype.getErrorCode = function() {
			if (this._xhr != null) {
				if (this._xhr.readyState == 4) {
					if (this._xhr.status != 200) {
						return this._xhr.status;
					}
				}
			}
			return null;
		};

		var ret = new XHR(onok, onerr);
		this._XHRs[this._XHRcnt++] = ret;

		return ret;
	}
};

function getNowClock() {
	var nowClock = "";
	var date = new Date();
	var hourTemp = parseInt(date.getHours().toString());
	var ampm = (hourTemp >= 12) ? "PM" : "AM";
	var hour = (hourTemp > 12) ? hourTemp - 12 : hourTemp;
	hour = (hour >= 10) ? hour : "0" + hour;
	var minute = date.getMinutes().toString();
	minute = (minute.length == 2) ? minute : "0" + minute;
	var sec = date.getSeconds().toString();
	sec = (sec.length == 2) ? sec : "0" + sec;
	nowClock = hour + ":" + minute + " " + ampm;
	return nowClock;
}

function MetricsMenu(left, top, xspace, yspace, col, row) {
	var _self = this;
	var _left = left;
	var _top = top;
	var _xspace = xspace;
	var _yspace = yspace;
	var _col = col;
	var _row = row;
	var _rolling = false;
	var _focus = 0;
	var _start = 0;
	var _focusObj = null;
	var _onItems = new Array();
	var _offItems = new Array();
	var _prevItem = null;
	var _nextItem = null;
	var _maxCount = col * row;
	var _totalPage = 0;

	this.pos = function(left, top) {
		this.left = left;
		this.top = top;
	};
	this.start = function() {
		var focusIMG = document.createElement("img");
		drawFocus();
		drawItems();
		_self.setTotalPage(_offItems.length, col * row);
		setPosition();
		if (SMART_PHONE == "true")
			addEvent();
	};
	this.setTotalPage = function(totalCount, onePageMax) {
		_totalPage = (totalCount % onePageMax) == 0 ? (totalCount / onePageMax) : parseInt(totalCount / onePageMax) + 1;
	};
	this.getTotalPage = function() {
		return _totalPage;
	};
	this.addItem = function(onKNaviItem, offKNaviItem) {
		_onItems.push(onKNaviItem);
		_offItems.push(offKNaviItem);
	};
	this.setRolling = function(rolling) {
		_rolling = rolling;
	};
	this.getRolling = function() {
		return _rolling;
	};
	this.setFocus = function(focus) {
		_focus = focus;
		drawFocus();
	};
	this.getFocus = function() {
		return _focus;
	};
	this.setStart = function(start) {
		_start = start; 
	};
	this.getStart = function() {
		return _start;
	};
	this.getIndex = function() {
		return _start + _focus;
	};
	this.changeFocus = function(url) {
		if (typeof _focusObj.childNodes[0] == "undefined") {
			_focusObj.src = url;
		} else {
			_focusObj.childNodes[0].src = url;
		}
	};
	this.action = function() {
		if (_onItems[_self.getIndex()].evt != null)
			_onItems[_self.getIndex()].evt();
	};
	this.selectPrevItem = function() {
		if (_rolling && _focus == 0 && _start == 0) {
			_start = _offItems.length - (_offItems.length % _maxCount);
			_focus = (_offItems.length % _maxCount) - 1;
			setPosition();
			_self.setFocus(_focus);
			return;
		}
		if (_focus == 0 && _start != 0) {
			_start -= _maxCount;
			_focus = _maxCount - 1;
		} else {
			if (_focus > 0)
				_focus--;
		}
		setPosition();
		_self.setFocus(_focus);
	};
	
	this.left = function() { 
		if (_self.getFocus() % _col == 0) { // 왼쪽벽
			if(_self.getStart() - (_col * _row) < 0) { // 첫페이지일때
				
				//이건 모지 ??
				if(_self.getTotalPage() == 1) {
					if(_self.getFocus() + _col - 1 > _offItems.length - 1) {
						return;
					} else {
						_self.setFocus(_self.getFocus() + _col - 1);
						return;
					}
				} else {
					var lastPageFirstIdx = (_col * _row) * (_self.getTotalPage() - 1);
					_self.setStart(lastPageFirstIdx);
				}
			} else {
				_self.setStart(_self.getStart() - (_col * _row));
			}
			_self.setFocus(0);
		} else {
			_self.selectPrevItem();
		}
		setPosition();
	};
	

	
	
	this.right = function() {
		if (_self.getFocus() % _col == (_col - 1)) { // 오른쪽벽 
			
			
			if(_self.getStart() + (_col * _row) > _offItems.length - 1) { // 마지막 페이지
				
				if(_self.getTotalPage() == 1) {
					_self.setFocus(_self.getFocus() - _col + 1);
					return;
				} else {
					_self.setStart(0);
				}
			} else {
				_self.setStart(_self.getStart() + (_col * _row));
			}
			_self.setFocus(0);
		} else {			
			_self.selectNextItem();
		}
		setPosition();
	};

	
	this.up = function() {
		if(_self.getFocus() < col) { // 윗쪽벽
			if(_self.getIndex() + (_col * (_row - 1)) > _offItems.length - 1) {
				var lastPageCount = _offItems.length % (_col * _row);
				var tempRow = parseInt(lastPageCount / _col);
				var focus = tempRow * _col + _self.getFocus();
				
				if(focus >= lastPageCount) {
					_self.setFocus(focus - _col);
				} else {
					_self.setFocus(focus);
				}
			} else {
				_self.setFocus(_self.getFocus() + (_col * (_row - 1)));
			}
		} else {
			_self.setFocus(_self.getFocus() - _col);
		}
		setPosition();
	};
	
	
	this.down = function() { // 아래쪽벽
		if(_self.getIndex() + _col > _offItems.length - 1 || _self.getFocus() >= (_col *(_row - 1))) {
			_self.setFocus(parseInt(_self.getIndex() % (_col * _row)) % _col);
		} else {
			_self.setFocus(_self.getFocus() + _col);
		}
		setPosition();
	};
	
	
	this.selectNextItem = function() {
		if (_rolling && _start + _focus > _offItems.length - 2) {
			_start = 0;
			_focus = 0;
			setPosition();
			_self.setFocus(_focus);
			return;
		}
		if (_focus == _maxCount - 1 && _offItems.length > _maxCount + _start) {
			_start += _maxCount;
			_focus = 0;
		} else {
			if (_focus < _maxCount && _start + _focus < _offItems.length - 1)
				_focus++;
		}
		setPosition();
		_self.setFocus(_focus);
	};
	var setPosition = function() {
		var lastIndex = _offItems.length < _maxCount ? _offItems.length : _start + _maxCount;
		for ( var i = 0; i < _start; i++) {
			_offItems[i].element.style.display = "none";
		}
		for ( var i = _start; i < lastIndex; i++) {
			if (_offItems[i] != null) {
				_offItems[i].element.style.display = "block";
				_offItems[i].element.style.left = _left + (_xspace * (i % _col)) + "px";
				_offItems[i].element.style.top = _top + (_yspace * ((parseInt(i / _col) % _row))) + "px";
			}
		}
		for ( var i = lastIndex; i < _offItems.length; i++) {
			_offItems[i].element.style.display = "none";
		}
		if (_prevItem != null) {
			_prevItem.element.style.display = "block";
			if (_start + _focus == 0) {
				_prevItem.element.style.display = "none";
			}
		}
		if (_nextItem != null) {
			_nextItem.element.style.display = "block";
			if (_start + _focus == _offItems.length - 1) {
				_nextItem.element.style.display = "none";
			}
		}
	};
	var drawItems = function() {
		for ( var i = 0; i < _offItems.length; i++) {
			if (_offItems[i] == null)
				break;
			document.body.appendChild(_offItems[i].element);
		}
	};
	var onClickSetFocus = function(e) {
		var targetobj = window.event ? event.srcElement : e.target;
		var tempFocus = -1;
		for ( var i = 0; i < _offItems.length; i++) {
			if (targetobj == _offItems[i].element || targetobj.parentNode == _offItems[i].element) {
				tempFocus = i;
			}
		}
		if (tempFocus != -1) {
			_self.setFocus(tempFocus - _start);
		}
		return tempFocus - _start;
	};
	var drawFocus = function() {
		if (_onItems.length == 0)
			return;
		if (SMART_PHONE == "true" && _focusObj != null)
			MouseEvent.removeEvent(_focusObj, "mousedown", _self.action);
		if (_focusObj != null)
			document.body.removeChild(_focusObj);
		_focusObj = _onItems[_self.getIndex()].element;
		_focusObj.style.left = _left + (_xspace * (_self.getIndex() % col)) + "px";
		_focusObj.style.top = _top + (_yspace * ((parseInt(_self.getIndex() / _col) % _row))) + "px";
		if (SMART_PHONE == "true")
			MouseEvent.addEvent(_focusObj, "mousedown", _self.action);
		document.body.appendChild(_focusObj);
	};
	var addEvent = function() {
		for ( var i = 0; i < _offItems.length; i++) {
			if (_offItems[i] == null)
				break;
			MouseEvent.addEvent(_offItems[i].element, "mousedown", function(e) {
				var _focus = onClickSetFocus(e);
				if (_offItems[_focus].evt != null)
					_offItems[_focus].evt();
				setPosition();
			});
		}
	};
};

var FontMetrics = {
	getBounds : function(obj) {
		var ret = new Object();
		var rect = obj.getBoundingClientRect();
		ret.left = rect.left
				+ (document.documentElement.scrollLeft || document.body.scrollLeft);
		ret.top = rect.top
				+ (document.documentElement.scrollTop || document.body.scrollTop);
		ret.width = rect.right - rect.left;
		ret.height = rect.bottom - rect.top;		

		return ret;
	},
	getWidth : function(fontElement, str) {
		var width = 0;
		fontElement.style.opatity = "0.0";
		var textNode = document.createTextNode(str);
		fontElement.appendChild(textNode);
		document.body.appendChild(fontElement);
		width = this.getBounds(fontElement).width;

		fontElement.removeChild(textNode);
		document.body.removeChild(fontElement);

		return width;
	},
	getHeight : function(fontElement, str) {
		var height = 0;		
		fontElement.style.opatity = "0.0";
		var textNode = document.createTextNode(str.charAt(0));
		fontElement.appendChild(textNode);
		document.body.appendChild(fontElement);
		height = FontMetrics.getBounds(fontElement).height;

		fontElement.removeChild(textNode);
		document.body.removeChild(fontElement);

		return height;
	},
	parseFont : function(fontElement, str, maxWidth) {
		var result = new Array();
		fontElement.style.opatity = "0.0";
		document.body.appendChild(fontElement);

		var temp = "";
		for ( var i = 0; i < str.length; i++) {
			temp += str.charAt(i);			
			fontElement.innerHTML = temp;
			if (str.charAt(i) == "\n"
					|| parseInt(this.getBounds(fontElement).width) > maxWidth) {
				result[result.length] = temp.substring(0, temp.length - 1);
				temp = str.charAt(i);
			}
			//fontElement.removeChild(text);
		}
		if (temp.length > 0)
			result[result.length] = temp;
		document.body.removeChild(fontElement);

		return result;
	}
};

function textWidthSplitAddDot(font, str, maxWidth, dot) {
	var result = "";
	if(FontMetrics.getWidth(font, str) < maxWidth) {
		result = str;
		return result;
		
	}
	if(str != null && str.length > 0) {
		while(true) {
			var strWidth = FontMetrics.getWidth(font, str + dot);
			if(strWidth >= maxWidth) {
				str = str.substring(0, str.length - 1);
			} else {
				result = str + dot;
				break;
			}
		}
	}
	return result;
}

function TextArea(left, top, width, height) {
	var self = this;
	var area = null;
	var page = null;
	var curIdx = 1;
	var xPos = 0;
	var pHeight = 0; 
	
	this.createArea = function() {
		area = document.createElement("div");
		area.style.left = left + "px";
		area.style.top = top + "px";
		area.style.width = width + "px";
		area.style.height = height + "px";
		area.style.position = "absolute";
		area.style.clip = "rect(0px, " + width + "px, " + height + "px, 0px)";
		document.body.appendChild(area);
	};

	this.createPage = function() {
		page = document.createElement("div");
		page.style.left = 0 + "px";
		page.style.top = 0 + "px";
		page.style.width = width + "px";
		page.style.position = "absolute";
		area.appendChild(page);
	};
	// 텍스트 추가
	this.insertText = function(element) {
		var elements = self.getSplitElement(element);
		for(var i = 0; i < elements.length; i++) {
			var element = element.cloneNode(true);
			element.innerHTML = elements[i];
			element.style.position = "absolute";
			//element.style.border = "1px solid #ff0000";
			page.appendChild(element);
			var divH = FontMetrics.getBounds(element).height;
			divH += 3;
			element.style.left = xPos + "px";
			element.style.width = width + "px";
			if((pHeight % height) + divH > height) {
				element.style.top = (parseInt(pHeight / height) + 1) * height + "px";
				pHeight = (parseInt(pHeight / height) + 1) * height + divH;
			} else {
				element.style.top = pHeight + "px";
				pHeight += divH;
			}
			xPos += 0;
		}
	};
	this.getSplitElement = function(element) {
		var result = [];
		var str = element.innerHTML;
		var temp = str.split("<br>");
		for ( var i = 0; i < temp.length; i++) {
			var elements = FontMetrics.parseFont(element.cloneNode(false), temp[i], width);
			if(elements.length > 0 ) {
				for ( var j = 0; j < elements.length; j++) {
					result[result.length] = elements[j];
				}
			} else {
				result[result.length] = "<br />";
			}
		}
		return result;
	};
	// 이미지 추가
	this.inserSimbol = function(src, leftMargin, topMargin) {
		var simbol = document.createElement("img");
		simbol.src = src;
		simbol.style.left = leftMargin + "px";
		simbol.style.top = topMargin + pHeight + "px";
		simbol.style.position = "absolute";
		page.appendChild(simbol);
		//xPos += leftMargin;
		//xPos += FontMetrics.getBounds(simbol).width;
	};
	// 공백 추가
	this.insertLine = function(lineHeight) {
		if(lineHeight == null) lineHeight = 10;
		var line = document.createElement("font");
		line.innerHTML = " ";
		line.style.position = "absolute";
		line.style.height = lineHeight + "px";
		this.insertText(line);
	};
	// 총페이지 가져오기
	this.getTotalCnt = function() {
		return (pHeight % height) == 0 ? pHeight / height : parseInt(pHeight / height) + 1;
	};
	// 스크롤 업
	this.up = function() {
		if(curIdx > 1) {
			curIdx--;
			page.style.top = parseInt(page.style.top) + height +  "px";
		}
	};
	// 스크롤 다운
	this.down = function() {
		if(curIdx < this.getTotalCnt()) {
			curIdx++;
			page.style.top = parseInt(page.style.top) - height +  "px";
		}
	};
	
	this.appendArea = function(element) {
		element.appendChild(area);
	};
	
	self.createArea();
	self.createPage();
}

function Scroll(left, top, width, height, bgColor, barColor, totalPageCnt){
	var left = left;
	var top = top;
	var width = width;
	var height = height;
	var bgColor = bgColor;
	var barColor = barColor;
	var total = totalPageCnt;	
	var current = 0;
	var moving = 0;	
	var scroll = null;
	var scrollBar = null;

	this.setTotalCnt=function(nCnt){
		total = nCnt;		
		this.drawBar();
	};
	
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
		if(total > 1){
			moving = height/total;
			scrollBar = document.createElement("div");
			scrollBar.style.position = 'absolute';
			scrollBar.style.left = 0 + 'px';
			scrollBar.style.top = 0 + 'px';
			scrollBar.style.width = width + 'px';
			scrollBar.style.height = moving + 'px';
			scrollBar.style.backgroundColor = barColor;
			scroll.appendChild(scrollBar);
		}else{
			return;
		}
		
	};
	this.up = function() {
		if(total > 1){
			current -= moving;
	 		if(current <= 0)	
	 	 		current = 0;
	 		scrollBar.style.top = Math.round(current) + 'px';
		}
		
	};
	this.down = function(){
		if(total > 1){
			if(current <= height-moving){
				current += moving;
		 		if(current >= height-moving)	
		 	 		current = height-moving;
			}
			scrollBar.style.top = Math.round(current) + 'px';
		}
			
	};
	this.show = function(){
		scroll.style.display = "block";
	};
	this.hide = function() {
		scroll.style.display = "none";
	
	};
	
	
	this.drawBg();
	this.drawBar();
}
