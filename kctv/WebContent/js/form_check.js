/**********************************/
/*	최종 수정일 : 2005-12-08
/**********************************/
function LA_checkForm(f)
{
	var i,currEl;

	for(i = 0; i < f.elements.length; i++){ 
		currEl = f.elements[i]; 
		
		if(!currEl.disabled){	//비활성화된거는 체크 안한다 2005-11-05
			//필수 항목을 체크한다.  req 는 필수항목 require
			if (currEl.getAttribute("req") != null)
			{ 
				if(currEl.type.toUpperCase() == "TEXT" || currEl.tagName.toUpperCase() == "TEXTAREA" ||currEl.type.toUpperCase() == "PASSWORD")
				{ 
					if(!chkText(currEl,currEl.getAttribute("item"))) return false; 
				
				} else if(currEl.tagName.toUpperCase() == "SELECT"){ 
					if(!chkSelectbox(currEl,currEl.getAttribute("item"))) return false; 

				} else if(currEl.type.toUpperCase() == "CHECKBOX"){ 
					if(!chkCheckbox(f, currEl,currEl.getAttribute("item"))) return false; 

				} else if(currEl.type.toUpperCase() == "RADIO"){ 
					if(!chkRadio(f, currEl,currEl.getAttribute("item"))) return false; 

				} else if(currEl.type.toUpperCase() == "FILE"){
					if(!chkFile(f, currEl,currEl.getAttribute("item"))) return false;
				}
			}
			// 입력 페턴을 체크한다.
			if(currEl.getAttribute("pattern") != null && currEl.value.length > 0){
				if(!chkPattern(currEl,currEl.getAttribute("pattern"),currEl.getAttribute("item"))) return false; 
			} 
			// 길이제한을 체크한다.
			if(currEl.getAttribute("maxbyte") != null && currEl.value.length > 0){ 
				if(!chkLength(currEl,currEl.getAttribute("maxbyte"),currEl.getAttribute("item"))) return false; 
			} 
			// 비밀번호와 비밀번호 확인의 비교를 수행한다.(pCheck 항목이 있으면비교 한다)
			if (i > 0)
			{
				preEl  = f.elements[i-1];
				if (preEl.type.toUpperCase() == "PASSWORD" && preEl.getAttribute("pCheck") != null && currEl.type.toUpperCase() == "PASSWORD")
				{
					if (preEl.value != currEl.value)
					{
						alert('비밀번호 입력과 확인 입력이 일치하지 않습니다.');
						preEl.value = '';
						currEl.value = '';
						preEl.focus();
						return false;
					}
				}
			}
		}
	  
	}
	return true;
}  
function chkPattern(field,pattern,name)
{		

		//pattern 변수명들
		var num         = /^[0-9]+$/;                                     //숫자만
		var phone       = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;             //전화번호 064-333-4444 형식으로 입력할 때
		var phone1      = /^[0-9]{2,4}$/;                                 //국번
		var phone2      = /^[0-9]{3,4}$/;                                 //전화번호 앞에꺼 위에서 333
		var phone3      = /^[0-9]{4}$/;                                   //전화번호 뒤에꺼 위에서 4444
		var cell_phone  = /^(01)[0-9]{1}-[0-9]{3,4}-[0-9]{4}$/;           //핸드폰 011-9664-1111 형식
		var cell_phone1 = /^(01)[0-9]{1}$/;                               //핸드폰 통신회사 번호(011,016..) 아래 phone1,phone2는 동일
		var cell_phone2 = /^[0-9]{3,4}$/;								 //핸드폰 앞에꺼 전화번호와 동일하지만 편의상 명시	
		var cell_phone3 = /^[0-9]{4}$/;                                   //핸드폰 뒤에꺼 전화번호와 동일하지만 편의상 명시
		var email       = /^[_a-zA-Z0-9-]+@[._a-zA-Z0-9-]+\.[a-zA-Z]+$/;  //이메일 주소
		//var homepage    = /^(http:\/\/)([가-힣a-zA-Z0-9-]+\.[a-zA-Z]{2,3}$)/;
		//var homepage    = /^(([가-힣a-zA-Z0-9-])+\.)?([가-힣a-zA-Z0-9-])+\.[a-zA-Z]{2,3}$/;                 
		var homepage	= /^(([가-힣a-zA-Z0-9-])+\.)+([가-힣a-zA-Z0-9\.\/@~\?&=_]+)/;
		// 2005-07-19 추가
		var http		= /^(http:\/\/)(([가-힣a-zA-Z0-9-])+\.)+([가-힣a-zA-Z0-9\.\/@~\?&=_]+)/;
		var eng         = /^[a-zA-Z]+$/; 
		var host        = /^[a-zA-Z-]+$/; 
		var hangul      = /[가-힣]/; 
		var hangul_eng  = /[가-힣a-zA-Z]/; 
		var hangul_only = /^[가-힣]*$/; 
		var userid      = /^[a-zA-Z]{1}[a-zA-Z0-9_-]{3,11}$/; 
		var date        = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/; 
		var year        = /^[0-9]{4}$/; 
		//var passwd      = /^[a-zA-Z0-9_-]{4,12}$/;
		var passwd      = /^[!-}]{4,12}$/;
		var jumin1      = /^[0-9]{6}$/;
		var jumin2      = /^[0-9]{7}$/;
		var account_num	= /^[0-9-\-]+$/;
		var alnum		= /^[a-zA-Z0-9_-]+$/		//2005-01-24 추가
		var zipcode		= /^[0-9]{3}-[0-9]{3}$/		//2005-12-08 추가
		var ct_txt  = /[가-힣a-zA-Z]/; 
		

		var checkPattern = eval(pattern); 
		
		if(!checkPattern.test(field.value)){
			var msg	=	name + " 항목의 형식이 올바르지 않습니다.";

			try{
				msg	+=	"\n\n"+getErrorMsg(pattern);
			} catch(e){
				msg	=	"";
			}

			alert(msg); 
			field.focus();
			field.select();
			return false; 
		} 
		return true; 
}

// 에러메세지 2005-07-19
function getErrorMsg(pattern){
	//pattern 변수명들
	var num         = "숫자만 입력하세요!";			//숫자만
	var phone       = "(예:02-123-1234)";			//전화번호 064-333-4444 형식으로 입력할 때
	var phone1      = "(예:02,064...)";				//국번
	var phone2      = "숫자 3~4자리로 입력하세요!";	//전화번호 앞에꺼 위에서 333
	var phone3      = "숫자 4자리로 입력하세요!";	//전화번호 뒤에꺼 위에서 4444
	var cell_phone  = "(예:010-123-1234)";			//핸드폰 011-9664-1111 형식
	var cell_phone1 = "(예:010,011,016,018,019)";	//핸드폰 통신회사 번호(011,016..) 아래 phone1,phone2는 동일
	var cell_phone2 = "숫자 3~4자리로 입력하세요!";	//핸드폰 앞에꺼 전화번호와 동일하지만 편의상 명시	
	var cell_phone3 = "숫자 4자리로 입력하세요!";	//핸드폰 뒤에꺼 전화번호와 동일하지만 편의상 명시
	var email       = "(예:email@email.com)"		//이메일 주소
	var homepage	= "(예:homepage.com)";
	// 2005-07-19 추가
	var http		= "(예:http://homepage.com)";
	var eng         = "영문만 입력하세요!"; 
	var host        = ""; 
	var hangul      = "한글만 입력하세요!"; 
	var hangul_eng  = "한글과 영문만 입력하세요!";  
	var hangul_only = "한글만 입력하세요!";
	var userid      = "첫글자는 영문으로 시작하고, 영문/숫자 조합으로 4~16자로 입력하세요!"; 
	var date        = "(예:2005-07-19)"; 
	var year        = "숫자 4자리로 입력하세요!";
	//var passwd      = /^[a-zA-Z0-9_-]{4,12}$/;
	var passwd      = "4~12자로 입력하세요!";
	var jumin1      = "숫자 6자리로 입력하세요!";
	var jumin2      = "숫자 7자리로 입력하세요!";
	var account_num	= "(예:123-1234-12-1234)";
	var alnum		= "영문이나 숫자로 입력하세요!"; 		//2005-01-24 추가
	var zipcode		= "(예:123-456)"; 		//2005-12-08 추가

	return eval(pattern);

}


//-- 문자열 길이 검사
function getLength(str) {
       return (str.length + (escape(str) + "/%u").match(/%u/g).length-1);
}
function chkLength(field,length,name)
{
       if(getLength(field.value) > length){ 
              alert("\n\n글자제한 영문,숫자 "+length+"자 , 한글 "+(length/2)+"자 이하 입력제한 입니다."); 
              field.focus(); 
			  field.select();
              return false; 
       } 
       return true; 
}

function chkText(field, name)
{
    fieldvalue = field.value;
    fieldvalue = fieldvalue.split(" ");
    
    if(field.value.length + 1 == fieldvalue.length){ 
        alert(name + " 항목을 입력하세요."); 
        field.value = "";
        field.focus(); 
		field.select();
        return false; 
    } 
    return true; 
}
function chkSelectbox(field, name)
{
    if(!field.value){ 
        alert(name + " 항목을 선택하세요."); 
        field.focus(); 
        return false; 
    } 
    return true; 
}

function chkCheckbox(form, field, name)
{
       fieldname = eval(form.name+'.'+field.name); //form.name은 폼의 각 엘리먼트, field.name은 각 엘리먼트의 item속성
       if (!fieldname.checked){
              alert(name + " 항목을 체크하세요."); 
              field.focus(); 
              return false; 
       }
       return true; 
}

function chkRadio(form, field, name)
{
       fieldname = eval(form.name+'.'+field.name);
       for (i=0;i<fieldname.length;i++) {
              if (fieldname[i].checked)
                     return true; 
       }
       alert(name + " 항목을 선택하세요."); 
       field.focus(); 
       return false; 
} 
function chkFile(form, field, name)
{
	 
	if(!field.value){
		alert(name + " 항목의 업로드할 파일을 선택하세요");
		field.focus();
		return false;
	}
	return true;
}	

//주민번호,외국인번호,사업자번호 체크 Script 
//
//1. 주민등록번호
//2. 재외국인 등록번호
//3. 사업자등록번호
//
//등의 진위 여부를 체크할 수 있는 JavaScript입니다.
//(정통부(?)에서 공개되어있던 스크립트일겁니다...)
//
//사용법은
//LA_chkFgnNum('외국인번호13자리');
//LA_chkJuminNum('주민번호13자리');
//LA_chkBusiNum('사업자번호10자리');
//
//----------------------------------------------------

// 재외국인 번호 체크
function LA_chkFgnNo(fgnno) {
        var sum=0;
        var odd=0;
        buf = new Array(13);
        for(i=0; i<13; i++) { buf[i]=parseInt(fgnno.charAt(i)); }
        odd = buf[7]*10 + buf[8];
        if(odd%2 != 0) { return false; }
        if( (buf[11]!=6) && (buf[11]!=7) && (buf[11]!=8) && (buf[11]!=9) ) {
                return false;
        }
        multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];
        for(i=0, sum=0; i<12; i++) { sum += (buf[i] *= multipliers[i]); }
        sum = 11 - (sum%11);
        if(sum >= 10) { sum -= 10; }
        sum += 2;
        if(sum >= 10) { sum -= 10; }
        if(sum != buf[12]) { return false }
        return true;
}

// 주민번호 체크
function LA_chkJuminNum(juminno) {
        if(juminno=="" || juminno==null || juminno.length!=13) {
                alert("주민등록번호를 적어주세요.");
                return false;
        }
        var jumin1 = juminno.substr(0,6);
        var jumin2 = juminno.substr(6,7);
        var yy     = jumin1.substr(0,2);        // 년도
        var mm     = jumin1.substr(2,2);        // 월
        var dd     = jumin1.substr(4,2);        // 일
        var genda  = jumin2.substr(0,1);        // 성별
        var msg, ss, cc;

        // 숫자가 아닌 것을 입력한 경우
        if (!LA_isNumeric(jumin1)) {
                alert("주민등록번호 앞자리를 숫자로 입력하세요.");
                return false;
        }
        // 길이가 6이 아닌 경우
        if (jumin1.length != 6) {
                alert("주민등록번호 앞자리를 다시 입력하세요.");
                return false;
        }
        // 첫번째 자료에서 연월일(YYMMDD) 형식 중 기본 구성 검사
        if (yy < "00" || yy > "99" ||
                mm < "01" || mm > "12" ||
                dd < "01" || dd > "31") {
                alert("주민등록번호 앞자리를 다시 입력하세요.");
                return false;
        }
        // 숫자가 아닌 것을 입력한 경우
        if (!LA_isNumeric(jumin2)) {
                alert("주민등록번호 뒷자리를 숫자로 입력하세요.");
                return false;
        }
        // 길이가 7이 아닌 경우
        if (jumin2.length != 7) {
                alert("주민등록번호 뒷자리를 다시 입력하세요.");
                return false;
        }
        // 성별부분이 1 ~ 4 가 아닌 경우
        if (genda < "1" || genda > "4") {
                alert("주민등록번호 뒷자리를 다시 입력하세요.");
                return false;
        }
        // 연도 계산 - 1 또는 2: 1900년대, 3 또는 4: 2000년대
        cc = (genda == "1" || genda == "2") ? "19" : "20";
        // 첫번째 자료에서 연월일(YYMMDD) 형식 중 날짜 형식 검사
        if (LA_isYYYYMMDD(parseInt(cc+yy), parseInt(mm), parseInt(dd)) == false) {
                alert("주민등록번호 앞자리를 다시 입력하세요.");
                return false;
        }
        // Check Digit 검사
        if (!LA_isSSN(jumin1, jumin2)) {
                alert("입력한 주민등록번호를 검토한 후, 다시 입력하세요.");
                return false;
        }
        return true;
}

// 사업자등록번호 체크
function LA_chkBusiNum(vencod) {
        var sum = 0;
        var getlist =new Array(10);
        var chkvalue =new Array("1","3","7","1","3","7","1","3","5");
        for(var i=0; i<10; i++) { getlist[i] = vencod.substring(i, i+1); }
        for(var i=0; i<9; i++) { sum += getlist[i]*chkvalue[i]; }
        sum = sum + parseInt((getlist[8]*5)/10);
        sidliy = sum % 10;
        sidchk = 0;
        if(sidliy != 0) { sidchk = 10 - sidliy; }
        else { sidchk = 0; }
        if(sidchk != getlist[9]) { return false; }
        return true;
}


function LA_isYYYYMMDD(y, m, d) {
        switch (m) {
        case 2:        // 2월의 경우
                if (d > 29) return false;
                if (d == 29) {
                        // 2월 29의 경우 당해가 윤년인지를 확인
                        if ((y % 4 != 0) || (y % 100 == 0) && (y % 400 != 0))
                                return false;
                }
                break;
        case 4:        // 작은 달의 경우
        case 6:
        case 9:
        case 11:
                if (d == 31) return false;
        }
        // 큰 달의 경우
        return true;
}
function LA_isNumeric(s) {
        for (i=0; i<s.length; i++) {
                c = s.substr(i, 1);
                if (c < "0" || c > "9") return false;
        }
        return true;
}
function LA_isLeapYear(y) {
        if (y < 100)
        y = y + 1900;
        if ( (y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0) ) {
                return true;
        } else {
                return false;
        }
}
function LA_getNumberOfDate(yy, mm) {
        month = new Array(29,31,28,31,30,31,30,31,31,30,31,30,31);
        if (mm == 2 && LA_isLeapYear(yy)) mm = 0;
        return month[mm];
}
function LA_isSSN(s1, s2) {
        n = 2;
        sum = 0;
        for (i=0; i<s1.length; i++)
                sum += parseInt(s1.substr(i, 1)) * n++;
        for (i=0; i<s2.length-1; i++) {
                sum += parseInt(s2.substr(i, 1)) * n++;
                if (n == 10) n = 2;
        }
        c = 11 - sum % 11;
        if (c == 11) c = 1;
        if (c == 10) c = 0;
        if (c != parseInt(s2.substr(6, 1))) return false;
        else return true;
}