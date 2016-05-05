<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="${ctxRoot}/css/base.css" />
<script type="text/javascript" src="${ctxRoot}/js/view.js"></script>
<script type="text/javascript" src="${ctxRoot}/js/dom.js"></script>
<script type="text/javascript" src="${ctxRoot}/js/utils.js"></script>
<script type="text/javascript">
//<![CDATA[
           
// 싱글턴 클래스
var ColorKeyDrawer = new function(){
	//상수
	this.RED = 0;
	this.GREEN = 1;
	this.YELLOW = 2;
	this.BLUE = 3;
	this.OK = 4;
	
	//이미지경로
	var imgSrc=[];
	imgSrc[this.RED]="${imgRoot}/common/red_key.png";
	imgSrc[this.GREEN]="${imgRoot}/common/green_key.png";
	imgSrc[this.YELLOW]="${imgRoot}/common/yellow_key.png";
	imgSrc[this.BLUE]="${imgRoot}/common/blue_key.png";
	imgSrc[this.OK]="${imgRoot}/common/ok_key.png";
	
	//설정값 (오른쪽 기준 시작포지션임);
	var imgW=18, imgY=405, txtY=imgY+5, startPosX=680, txtColor = "#dcdcdc", txtFontSize=15, gap=5, padding=10;
	//폰트메트릭스에 이용할 폰트
	var font = $D.create("font").setFontSize(txtFontSize);
	
	var elem = [];
	var oldArr = null;
	/**
	* 컬러키를 그린다
	* [[ColorKeyDrawer.RED, "한글"],[ColorKeyDrawer.GREEN, "bbb"], [ColorKeyDrawer.BLUE, "ccc"]]
	*/
	this.draw=function(arr){
		if(arr !== oldArr){
			cleanElem();
			var txtW = 0;
			var x = startPosX;
			
			for(var i=arr.length-1; i>=0; i--){
				x -= FontMetrics.getWidth(font, arr[i][1]);
				elem.push($D.create("font").setFontSize(txtFontSize).setPos(x, txtY).setColor(txtColor).setText(arr[i][1]).draw());
				x -= gap;
				x -= imgW;
				elem.push($D.create("img").setPath(imgSrc[arr[i][0]]).setPos(x, imgY).draw());
				x -= padding;
			}
			oldArr=arr;
		}
	};
	
	/**
	* 기존에 그렸던 컬러키 자원을 해제한다
	*/
	var cleanElem=function(){
		while(elem.length > 0){
			document.body.removeChild(elem.pop());
		}
	};
};
//]]>
</script>