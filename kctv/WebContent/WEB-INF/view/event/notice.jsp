<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>KCTV 행사 ＆ 알림</title>
<link href="${ctxRoot }css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var roll_Class=function(){this.initialize.apply(this,arguments);}
roll_Class.prototype={

initialize:function(){

this.className=arguments[0]?arguments[0]:null;
this.foundit(arguments[1],'',false);
this.contents=new Array('0');
this.contents_delay=null;
this.nowdelay=null;
this.foundit(
this.roll.childNodes,this.foundvalue ,
function(rt,that){

if(that.constrain_size !== null) that.foundit(rt.childNodes,'IMG',function(rt,that){rt.style[(this.moving != 'left' ? 'width' : 'height')] = that.constrain_size;});
that.contents_delay=that.contents[that.contents.length]=that.contents_delay+-rt[(that.moving=='left'?'offsetWidth':'offsetHeight')];});

{
this.rollHeight=this.proll.style[(this.moving=='left'?'width':'height')]=Math.abs(this.contents[this.contents.length-1]);
this.roll.appendChild(this.roll.cloneNode(true));
this.roll.appendChild(this.roll.cloneNode(true));
};},


foundit:function(tg,n){

var temp=new Array();

	for(var v in tg)
		switch(typeof arguments[2]){
		case 'object':if(arguments[2].initialize(tg[v],n,this)==true) return; else break;
		case 'function':if(tg[v].nodeName==n) arguments[2](tg[v],this); break;
		case 'boolean':this[v]=tg[v]; break;
		default:if(tg[v].nodeName==n) return tg[v];
	}

return temp;},

inaction:function(time){

this.roll.style[this.moving]=time=time < 0 ?(this.fall==false && time <= -this.rollHeight?0:time):-this.rollHeight,null;
this.foundit(this.contents,time,{initialize:function(rt,vrt,that){if(Math.abs(rt - vrt) <(that.fast==false?that.tick:that.ftick)){that.roll.style[that.moving]=rt; that.nowdelay=that.fast==true?that.lengthen:that.delay; that.fast=false; return true;} else that.nowdelay=that.lengthen;}});
{var ticks=this.fast==true?this.ftick:this.tick;}
this.control=setTimeout(this.className+".inaction("+(parseInt(this.roll.style[this.moving])+(this.fall==true?ticks:-ticks))+");",this.nowdelay);},

stop:function(){
this.temp=parseInt(this.roll.style[this.moving]);
clearTimeout(this.control);}};
</script>
</head>
<body>
<div style="width:400px;height:70px;">
	<div id="parent_rolltable1" style="width:100%;" onmouseover='height_class.stop();' onmouseout='height_class.inaction(height_class.temp);'>
		<nobr id="rolltable1" name="rolltable1" style="position:relative;">
			<div>
				<table border="0" cellpadding="0" cellspacing="0" width="400" height="70">
					<tr>
						<td style="line-height:160%;">${eventNotice }</td>
					</tr>
				</table>
			</div>
		</nobr>
	</div>
</div>
</body>
<script type="text/javascript">
{
	// 세로롤링 설정키
	var roll_init1=new Array();
	roll_init1.constrain_size=null;							// 전체의 넓이값 [기본 default]
	roll_init1.tick=1;													// 움직이는 칸수
	roll_init1.ftick=10;												// 빠른 움직이는 칸수
	roll_init1.lengthen=70;										// 1초당 움직이는 속도
	roll_init1.delay=0;											// 잠시멈춤 속도
	roll_init1.fall=false;												// 이동 반대로 설정 ~
	roll_init1.fast=false;											// 빠른속도:true 는 on 이며,false 는 off 이다.
	roll_init1.foundvalue =	'DIV';								// Nobr 내부엘리멘트
	roll_init1.moving='top';										 // 상하좌우 움직임 설정
	roll_init1.roll=document.getElementById('rolltable1');										// roll
	roll_init1.proll=document.getElementById('parent_rolltable1');							// proll
};

{
	// 세로롤링 선언부분
	var height_class=new roll_Class('height_class',roll_init1);
	height_class.inaction();
};
</script>
</html>