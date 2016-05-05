//플래시 임베디드
function swf(src,w,h){
		//id, name 파라미터 추가
		var html = '';
		html += '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,124,0" width="' + w + '" height="' + h + '" id="main" align="middle">';
		html += '<param name="allowScriptAccess" value="sameDomain">';
		html += '<param name="always" name="allowScriptAccess">';
		html += '<param name="movie" value="' + src + '">';
		html += '<param name="quality" value="high">';
		html += '<param name="salign" value="l">';
		html += '<param name="wmode" value="transparent">';
		html += '<param name="bgcolor" value="#ffffff">';
		html += '<embed src="' + src + '" width="' + w + '" height="' + h + '" quality="high" salign="l" bgcolor="#ffffff" allowscriptaccess="always" quality="high" wmode="transparent" src="http://adimg.daumcdn.net/www4/3D8s/dGGZ/skin_top_general_430x105_130903ae.swf" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="main">';
		html += '</object>';
		document.write(html);
} 

//Base64 인코드, 디코드
var Base64 = {
	// private property
	_keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",

	// public method for encoding
	encode : function(input) {
		var output = "";
		var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
		var i = 0;
		input = Base64._utf8_encode(input);
		while (i < input.length) {
			chr1 = input.charCodeAt(i++);
			chr2 = input.charCodeAt(i++);
			chr3 = input.charCodeAt(i++);
			enc1 = chr1 >> 2;
			enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
			enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
			enc4 = chr3 & 63;
			if (isNaN(chr2)) {
				enc3 = enc4 = 64;
			} else if (isNaN(chr3)) {
				enc4 = 64;
			}
			output = output + this._keyStr.charAt(enc1)
					+ this._keyStr.charAt(enc2) + this._keyStr.charAt(enc3)
					+ this._keyStr.charAt(enc4);
		}
		return output;
	},

	// public method for decoding
	decode : function(input) {
		var output = "";
		var chr1, chr2, chr3;
		var enc1, enc2, enc3, enc4;
		var i = 0;
		input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
		while (i < input.length) {
			enc1 = this._keyStr.indexOf(input.charAt(i++));
			enc2 = this._keyStr.indexOf(input.charAt(i++));
			enc3 = this._keyStr.indexOf(input.charAt(i++));
			enc4 = this._keyStr.indexOf(input.charAt(i++));
			chr1 = (enc1 << 2) | (enc2 >> 4);
			chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
			chr3 = ((enc3 & 3) << 6) | enc4;
			output = output + String.fromCharCode(chr1);
			if (enc3 != 64) {
				output = output + String.fromCharCode(chr2);
			}
			if (enc4 != 64) {
				output = output + String.fromCharCode(chr3);
			}
		}
		output = Base64._utf8_decode(output);
		return output;
	},

	// private method for UTF-8 encoding
	_utf8_encode : function(string) {
		string = string.replace(/\r\n/g, "\n");
		var utftext = "";
		for ( var n = 0; n < string.length; n++) {
			var c = string.charCodeAt(n);
			if (c < 128) {
				utftext += String.fromCharCode(c);
			} else if ((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			} else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
		}
		return utftext;
	},

	// private method for UTF-8 decoding
	_utf8_decode : function(utftext) {
		var string = "";
		var i = 0;
		var c = c1 = c2 = 0;
		while (i < utftext.length) {
			c = utftext.charCodeAt(i);
			if (c < 128) {
				string += String.fromCharCode(c);
				i++;
			} else if ((c > 191) && (c < 224)) {
				c2 = utftext.charCodeAt(i + 1);
				string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
				i += 2;
			} else {
				c2 = utftext.charCodeAt(i + 1);
				c3 = utftext.charCodeAt(i + 2);
				string += String.fromCharCode(((c & 15) << 12)
						| ((c2 & 63) << 6) | (c3 & 63));
				i += 3;
			}
		}
		return string;
	}
}

// CommonStrLib Trim 과 자주쓰는 정규표현식 getBytes를 담고있음
CommonStrLib = {
	trim : function(string) {
		return string.replace(/^\s+|\s+$/g, '');
	},

	trim_left : function(string) {
		return string.replace(/^\s+/gi, "");
	},

	trim_right : function(string) {
		return string.replace(/\s+$/g, "");
	},

	reg_match_phone : function(string, optionflag) {
		var regex;
		string = string.replace(/-/g, ''); // -제거한 상태로 확인
		switch (optionflag) {
		case 'mobile':
			regex = /^01[0-9]{9,10}$/;
			break;
		case 'phone':
			regex = /^0[2-7]{1}[0-9]{8,9}$/;
			break;
		case 'world':
			regex = /^00[1-9]{1,}[0-9]{6,}$/;
			break;
		case 'world2':
			regex = /^\+[1-9]{1,4}[0-9]{6,}$/;
			break;
		case 'korea':
			regex = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4,5}$/;
			break;
		default:
			regex = /^(0,1)[0-9]{1,}$/;
		}

		if (regex.test(string))
			return true;
		return false;
	},

	reg_match_zipcode : function(string) {

	},

	getBytes : function(string) {
		var i, tmp = escape(string);
		var bytes = 0;
		for (i = 0; i < tmp.length; i++) {
			if (tmp.charAt(i) == "%") {
				if (tmp.charAt(i + 1) == "u") {
					bytes += 2;
					i += 5;
				} else {
					bytes += 1;
					i += 2;
				}
			} else {
				bytes += 1;
			}
		}
		return bytes;
	},

	cutByte : function(str, len) {
		var count = 0;

		for ( var i = 0; i < str.length; i++) {
			if (escape(str.charAt(i)).length >= 4)
				count += 2;
			else if (escape(str.charAt(i)) != "%0D")
				count++;

			if (count > len) {
				if (escape(str.charAt(i)) == "%0A")
					i--;
				break;
			}
		}
		return str.substring(0, i);
	},
}

function getBytesSize(str) {
	var i, tmp = escape(str);
	var bytes = 0;
	for (i = 0; i < tmp.length; i++) {
		if (tmp.charAt(i) == "%") {
			if (tmp.charAt(i + 1) == "u") {
				bytes += 2;
				i += 5;
			} else {
				bytes += 1;
				i += 2;
			}
		} else {
			bytes += 1;
		}
	}

	return bytes;
}

function cutByte(str, len) {
	var count = 0;

	for ( var i = 0; i < str.length; i++) {
		if (escape(str.charAt(i)).length >= 4)
			count += 2;
		else if (escape(str.charAt(i)) != "%0D")
			count++;

		if (count > len) {
			if (escape(str.charAt(i)) == "%0A")
				i--;
			break;
		}
	}
	return str.substring(0, i);
}
// getElementsByClassName 없을 경우 재정의 외국 포럼에서 주워옴
(function() {
	if (!document.getElementsByClassName) {
		var indexOf = [].indexOf || function(prop) {
			for ( var i = 0; i < this.length; i++) {
				if (this[i] === prop)
					return i;
			}
			return -1;
		};
		getElementsByClassName = function(className, context) {
			var elems = document.querySelectorAll ? context
					.querySelectorAll("." + className)
					: (function() {
						var all = context.getElementsByTagName("*"), elements = [], i = 0;
						for (; i < all.length; i++) {
							if (all[i].className
									&& (" " + all[i].className + " ")
											.indexOf(" " + className + " ") > -1
									&& indexOf.call(elements, all[i]) === -1)
								elements.push(all[i]);
						}
						return elements;
					})();
			return elems;
		};
		document.getElementsByClassName = function(className) {
			return getElementsByClassName(className, document);
		};
		Element.prototype.getElementsByClassName = function(className) {
			return getElementsByClassName(className, this);
		};
	}
})();