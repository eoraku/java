//페이지 특수키 막음 함수
function processKey(){ 

if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode >= 112 && event.keyCode <= 123) || event.keyCode == 8){ 
		event.keyCode = 0; 
		event.cancelBubble = true; 
		event.returnValue = false; 
	} 
} 
//document.onkeydown = processKey;

//버퍼링시 배너보이기
function showLayer(obj, flag){
	if(flag){
		obj.style.display = 'block';
	}else{
		obj.style.display = 'none';
	}
}
//플레이어 버퍼링시
function Buffering(B){
	if(B){//버퍼링시 
		showLayer(Advertising, true);
		showLayer(divPlayer, false);
		//showLayer(divSkinAd, false);
		//showLayer(divPlayer, false);
		//showLayer(divSkinAd, true);//동영상 시작전 배너보기
	}else{
		showLayer(Advertising, false);
		showLayer(divPlayer, true);
		//showLayer(divSkinAd, false);
	}

}
var s_time;
var e_time;
//동영상 시작스트림
function NewStream(){

var s_time=document.form.s_time.value;
	bIsPlay = true;
	bIsStop = false;
	bIsEndOfPlay = false;


	dispState();//실시간 진행위치 체크함수 호출
	bIsFirstLoad = false;
	m_player.CurrentPosition=s_time;//동영상 시작 위치 이동 단위:초
}

//실시간 진행바 위치 체크
var bIsEndOfPlay		= false;						// 모든 무비 재생이 끝났는지의 여부
var bb=0; //time
function dispState(){
	var e_time=document.form.e_time.value;
	var s_time=document.form.s_time.value;
	
	if(m_player.CurrentPosition > s_time && m_player.CurrentPosition < e_time){
		bb=bb+1;
	}
	setTimeout('dispState();', 1000);//매초마다 동영상 체크
	//dispTimeBar();

}


// 플레이 진행 바 시작 #######################################################
var nTimeStartPosition = 0;							// 플레이 바 시작 점(고정)
var nTimeEndPosition = 285;							// 플레이 바 끝 점(고정)
var arrIsMovieAd		= new Array();
var bIsPositionSet		= false;					// 위치바 드래그 여부
var nCurrPlayCount = 1;								// 현재 곡의 순번

var mStopmode = false;
function dispTimeBar(){
	var e_time=document.form.e_time.value;
	if(m_player.currentPosition > 0){
		
		var nTimePosition = ((m_player.currentPosition * 275) / m_player.Duration);// + nTimeStartPosition;
		
		//timebg.style.pixelWidth = nTimePosition;// - nTimeStartPosition;
		//time.style.pixelLeft = nTimePosition;
		if(m_player.currentPosition > e_time){
			onClickStop();
		}
	}
}

//진행바 드래그시 함수 호출
function setTimeBar(){
	if(!arrIsMovieAd[nCurrPlayCount]){
		if(Math.floor(m_player.currentPosition)>0){
			bIsPositionSet = true;
			iex = event.clientX;
			tempx = time.style.pixelLeft;
			document.onmousemove = positionDragControl;

			if (document.all){document.onmouseup=setPlayerPosition;}
		}
	}
}

function setPlayerPosition(){
	if (bIsPositionSet == true){
		m_player.currentPosition = Math.floor(m_player.Duration*((time.style.pixelLeft-nTimeStartPosition)/280));
		bIsPositionSet = false;
	}
}
//진행바 셋팅함수
function positionDragControl(){
	if (bIsPositionSet==true){
		var mov = tempx+event.clientX-iex;
		if ((mov >= nTimeStartPosition)  && (mov < nTimeEndPosition)){
			document.all.time.style.pixelLeft=mov;
			//timebg.style.pixelWidth=mov
		}
		return false;
	}
}

// 플레이 진행 바 끝 #######################################################

// 볼륨 바 시작 ############################################################
var nVolLeftPosition = 0;							// 볼륨 바 배경 시작점
var nVolStartPosition = 0;							// 볼륨 바 시작위치 점
var nVolEndPosition = 60;							// 볼륨 바 끝위치 점
var nVolume = 59;									// 볼륨 초기 시작 위치값
var nPrevVol;										// 볼륨이 변경되기 전의 값


var bIsBuff				= false;						// 버퍼 모드 여부
var bIsPositionSet		= false;						// 위치바 드래그 여부
var bIsVolumeSet		= false;						// 볼륨바 드래그 여부
var bIsEndOfPlay		= false;						// 모든 무비 재생이 끝났는지의 여부

//볼륨 드레그시 함수 호출
function setVolumeBar(){
	nPrevVol = event.clientX;
	nVolLeftPosition = sound.style.pixelLeft;

	bIsVolumeSet = true;
	document.onmousemove=drag_dropie;
	if (document.all){document.onmouseup=endVolume;}
	
}

function drag_dropie(){
	if (bIsVolumeSet==true){
		var mov = nVolLeftPosition+event.clientX-nPrevVol;
		
		if ((mov >= nVolStartPosition)  && (mov < nVolEndPosition)){
			cutpoint=nVolEndPosition-sound.style.pixelLeft;
			document.all.soundbg.style.pixelWidth=62-cutpoint;
			document.all.sbg.width = 62-cutpoint;
			sound.style.pixelLeft=nVolLeftPosition+event.clientX-nPrevVol;
			m_player.Volume = -2500*(cutpoint/60); // -10000 ~ 0 사이의 값 디폴트는 -600 값이 범위 벗어날시 에러
			nVolume=sound.style.pixelLeft; //볼륨의 위치
			
		}
		return false;
	}
}

function endVolume(){
	bIsVolumeSet=false;
}


// 볼륨 바 끝 //


// 뮤비 재생,일시정지,정지 버튼 //###########################################
// 버튼초기화

var mStopmode = false;

//뮤비 실행
function onClickPlay(){
	if(mStopmode){
		m_player.setCurrentEntry(1);//처음 부터 시작
	}else{
		m_player.play();//정지된 위치에서 시작
	}
}

// 뮤비 일시 정지
function onClickPause(){
	m_player.pause();
	mStopmode = false;
}

// 뮤비 정지
function onClickStop(){
	m_player.stop();
	mStopmode = true;
}

//강의 리스트 숨기기
//강의 리스트 초기화
var showlist=true;

function showhidelist(){
	if(showlist){
		list.style.display = 'none';//숨기기
		shlist.src='<%=img%>/review/btn09_up.gif';
		shlist.alt='우측리스트 보이기';
		showlist=false;
		
	}else{
		list.style.display ='block';//보이기
		shlist.src='<%=img%>/review/btn_09.gif';
		shlist.alt='우측리스트 숨기기';
		showlist=true;
	}
	windowresize();//창크기 조절
}

var zoomsize_w=60;
var zoomsize_h=45;

function windowresize(){
	var Width;
	var Height;
	
	if(!showlist){
		Width=493+(zoomstate*zoomsize_w);
		Height=504+(zoomstate*zoomsize_h);
	}else{
		Width=803+(zoomstate*zoomsize_w);
		Height=534+(zoomstate*zoomsize_h);
	}	
	window.resizeTo (Width,Height);
}

//화면 줌 인,아웃
//화면 줌 상태초기화
var zoomstate=0;

function onClickzoom(no){//no 0:화면 줌인,1:화면 줌아웃
	//timebg left=172  top=411
	//soundbg left=417 top=410
	if(no==0){
		if(zoomstate > 0){//정상크기가 아닐때
			if(zoomstate==1){
				m_player.style.width=352;
				m_player.style.height=240;
				//timebg.style.left='122px';
				//timebg.style.top='345px';
				soundbg.style.left='367px';
				soundbg.style.top='343px';
			}else if(zoomstate==2){
				m_player.style.width=540;
				m_player.style.height=405;
				//timebg.style.left='232px';
				//timebg.style.top='456px';
				soundbg.style.left='477px';
				soundbg.style.top='455px';
			}else if(zoomstate==3){
				m_player.style.width=600;
				m_player.style.height=450;
				//timebg.style.left='292px';
				//timebg.style.top='501px';
				soundbg.style.left='537px';
				soundbg.style.top='500px';
			}
			zoomstate=zoomstate-1;
			windowresize();
		}
	}else{
		if(zoomstate < 3){//화면 크기가 최대크기보다 작을때
			zoomstate+=1;
			m_player.style.width=480+(zoomstate*zoomsize_w);
			m_player.style.height=360+(zoomstate*zoomsize_h);
			if(zoomstate==1){
				//timebg.style.left='232px';
				//timebg.style.top='456px';
				soundbg.style.left='477px';
				soundbg.style.top='455px';
			}else if(zoomstate==2){
				//timebg.style.left='292px';
				//timebg.style.top='501px';
				soundbg.style.left='537px';
				soundbg.style.top='500px';
			}else if(zoomstate==3){
				//timebg.style.left='352px';
				//timebg.style.top='546px';
				soundbg.style.left='597px';
				soundbg.style.top='545px';
			}
			windowresize();
			
		}
	}	
}

//화면 표준보기
function onClickComm(){
	if(zoomstate>0){
		zoomstate=1;
	}
	onClickzoom(0);
}

//화면 전체보기
function onClickFull(){
	m_player.DisplaySize=3;
}

function mError(){
	var bIsOk = confirm('오류가 발생하였습니다 : ' + m_player.ErrorCode + ';' + m_player.ErrorDescription + '\n\n플레이어를 종료하시겠습니까?\n\n\'확인\'을 선택하면 플레이어가 종료되며, \'취소\'를 선택면 플레이어를 재시작합니다');
	if(bIsOk){
		window.close();
	}else{
		document.location.reload();
	}
}

function go1(s_time){
	m_player.CurrentPosition=parseInt(s_time);
	m_player.play();//정지된 위치에서 시작
	
}


function fastforward(){
	m_player.CurrentPosition=Math.floor(m_player.Duration*(time.style.pixelLeft/200));//진행바 현재 위치에서 부터 빠른 진행
	m_player.FastForward();
}

//9.0버젼에서 지원
function fastreverse(){
	/*m_player.CurrentPosition=Math.floor(m_player.Duration*(time.style.pixelLeft/200));//진행바 현재 위치에서 부터 빠른 진행
	alert(m_player.isAvailable('FastReverse'));
	alert('dd');
	//	m_player.FastReverse();*///안먹힘
}

setInterval("setDurationTime()",1000);

// 플레이어 시간 넣기
function setDurationTime() {
	var sFullTime			= getPosition_Time();
	var sDurationTime	= getRunning_Time();
	sTime.innerHTML = sFullTime + '/' + sDurationTime;
	//alert(sFullTime+'/'+sDurationTime);
}

function getPosition_Time(){
	var Player = document.all["m_player"];
	var Player = document.getElementById("m_player");

	var sPosition_Time = "";
	
	if(m_player){
		var dmin = parseInt(Player.currentPosition / 60);
		var dsec = parseInt(Player.currentPosition % 60);
	
		if( dmin < 10)
			dmin = "0" + dmin;

		if( dsec < 10)
			dsec = "0" + dsec;
			
		sPosition_Time = dmin + ":" + dsec
	}
 	else{ //이거 골치.
		//if (m_player.controls.currentPositionString != null && m_player.controls.currentPositionString !='' && typeof m_player.controls.currentPositionString != 'undefined')
		if (Player != null )
		{
			sPosition_Time = Player.controls.currentPositionString;
		}
	}
			
	if( sPosition_Time == "" )
		sPosition_Time = "00:00";

	return sPosition_Time;

}

function getRunning_Time(){
	var Player = document.all["m_player"];

	if(m_player){
		var pmin = parseInt(Player.duration / 60);
		var psec = parseInt(Player.duration % 60);

		if( pmin < 10)
			pmin = "0" + pmin;

		if( psec < 10)
			psec = "0" + psec;
					
		return pmin + ":" + psec;
	}
  else {
		return Player.currentMedia.durationString;
	}
	
}




function viewMovie(filename,width,height){
	movieStr = '<object id=\"m_player\" classid=\"clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95\"  codebase=\"http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,5,715\" width=\"'+width+'\" height=\"'+height+'\" type=\"application/x-oleobject\" standby=\"Loading Microsoft Windows Media Player components...\" align=\"center\" VIEWASTEXT>';

     movieStr += '<param name="transparentAtStart" VALUE="True">';
     movieStr += '<param name="transparentAtStop" VALUE="True">';
     movieStr += '<param name="AnimationAtStart" VALUE="true">';    
     movieStr += '<param name="CurrentPosition" value="1">';
     movieStr += '<param name="SetCurrentEntry" value="1">';
     moviestr += '<param name="ClickToPlay" value="1">';
     moviestr += '<param name="AutoSize" value="false">';
     moviestr += '<param name="AutoStart" value="true">';
     moviestr += '<param name="ShowControls" value="0">';
     moviestr += '<param name="ShowAudioControls" value="0">';
     moviestr += '<param name="ShowDisplay" value="0">';
     moviestr += '<param name="ShowTracker" value="1">';
     moviestr += '<param name="ShowStatusBar" value="0">';
     moviestr += '<param name="EnableContextMenu" value="0">';
     moviestr += '<param name="Filename" value="mms://211.246.255.181/'+filename+'">';
     moviestr += '<param name="ShowPositionControls" value="0">';
     moviestr += '<param name="DisplayBackColor" value="0">';
     moviestr += '<param name="ShowTracker" value="1">';
     moviestr += '<param name="ShowCaptioning" value="0">';
     movieStr += '</object>';
	document.write(movieStr);

}
//-->