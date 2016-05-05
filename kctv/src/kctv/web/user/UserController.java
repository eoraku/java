package kctv.web.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kctv.exception.ErrorMsg;
import kctv.web.user.ChkEmail;
import kctv.web.user.ChkLogin;
import kctv.web.user.UserInfoBasic;

import kctv.web.board.BoardNotice;
import kctv.web.common.Common;

import java.io.*;
import java.util.*;
import java.text.SimpleDateFormat;

/**
 * <pre>
 * kctv.web.user
 * UserController.java
 * </pre>
 * <pre>
 * 회원 정보 컨트롤 클래스
 * 회원가입, 휴대폰 본인인증, 아이핀 인증, 우편번호 검색, 로그인, 회원정보 수정, 로그아웃에 관련한 컨트롤을 포함함
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 13.
 * @version: 
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Value("#{config['serverType']}") String serverType;
	@Value("#{config['ssl']}") String ssl;
	@Value("#{config['domain']}") String domain;
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Value("#{config['queryId_chkLogin']}") String queryId_chkLogin;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	@Autowired private BoardNotice boardNotice;
	
	ModelAndView mav;
	HttpSession session;
	String menu="user";
	String homeUrl;
	String sslDomain;
	UserInfoBasic userInfoBasic;
	
	/**
	 * @function : 페이지 정보 처리
	 * @process  : ModelAndView를 view페이지에 따라 생성하여 처리하고 Home url 저장
	 * 
	 * @MethodName : common
	 * @param session
	 * @param view
	 */
	private void common(HttpSession session, String view){
		this.session = session;
		mav = new ModelAndView(view);
		mav.addObject("menu",menu);
		mav.addObject("ctxRoot",ctxRoot);
		
		homeUrl = "http://"+domain+ctxRoot;
		sslDomain = ssl+domain+ctxRoot;	//실서버 
//		sslDomain = "https://localhost:8443/";	//로컬호스트
		
		mav.addObject("homeUrl",homeUrl);
	}
	
	/**
	 * @function : 회원 아이디 찾기 페이지 처리(실명인증)
	 * @process  : 이전페이지부터 정상적으로 접근하였는지 확인 처리
	 * 
	 * @MethodName : find_id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/find_id.htm",method=RequestMethod.GET)
	public ModelAndView find_id(HttpServletRequest request) throws Exception {
//		System.out.println("find_id.htm");
		common(request.getSession(),"user/find_id");
		session.setAttribute("callType", "findID");
		
		goRetUrl(request);
		return mav;
	}
	/**
	 * @function : 회원 아이디 찾기 페이지 처리(실명인증)
	 * @process  : 이전페이지부터 정상적으로 접근하였는지 확인 처리
	 * 
	 * @MethodName : find_id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/rs_find_id.htm",method=RequestMethod.POST)
	public ModelAndView rs_find_id(HttpServletRequest request) throws Exception {
//		System.out.println("rs_find_id.htm");
		common(request.getSession(),"user/rs_find_id");
		
		request.setCharacterEncoding("EUC-KR");
		
		String refURL = request.getHeader("REFERER");
		
		if(refURL == null || !refURL.equals(sslDomain+"user/find_id.htm")){
			throw new ErrorMsg(new String("잘못된 접근입니다.|"+ctxRoot));
		}
		
		String authType = request.getParameter("authType");
		String realName = request.getParameter("realName");
		String sex = request.getParameter("sex");
		String nationalInfo = request.getParameter("nationalInfo");
		String birthDate = request.getParameter("birthDate");
		String phoneCode = request.getParameter("phoneCode");
		String phoneNumber = request.getParameter("phoneNumber");
		/*
		System.out.println("실명 : " + realName);
		System.out.println("인증타입 : " + authType);
		System.out.println("성별 : " + sex);
		System.out.println("국가정보 : " + nationalInfo);
		System.out.println("생년월일 : " + birthDate);
		System.out.println("통신사코드 : " + phoneCode);
		System.out.println("핸드폰번호 : " + phoneNumber);
		*/
//		realName = "강우진";
		User user = new User();
		user.setName(realName);
		user.setJumin(birthDate + sex);
		
		ArrayList<User> matchID = new ArrayList<User>();
		matchID = (ArrayList<User>) sqlMapClientTemplate.queryForList("getUserListByNamecheck", user);
		String userId = null;

		if(matchID.size() == 1){
			userId = matchID.get(0).getId();
		}else if(matchID.size() > 1){
			for(int i=0; i<matchID.size(); i++){
				if(i==0)
					userId = matchID.get(i).getId();
				else
					userId += " , " + matchID.get(i).getId();
			}
		}

		mav.addObject("sslDomain", sslDomain);
		mav.addObject("realName",realName);
		mav.addObject("birthDate",birthDate);
		mav.addObject("userId", userId);
		
		session.removeAttribute("callType");
		goRetUrl(request);
		
		return mav;
	}
	
	/**
	 * @function : 회원 비밀번호 찾기 페이지 처리(실명인증)
	 * @process  : 이전페이지부터 정상적으로 접근하였는지 확인 처리
	 * 
	 * @MethodName : find_id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/find_pw.htm",method=RequestMethod.GET)
	public ModelAndView find_pw(HttpServletRequest request) throws Exception {
//		System.out.println("find_pw.htm");
		common(request.getSession(),"user/find_pw");
		session.setAttribute("callType", "findPW");
		
		goRetUrl(request);
		return mav;
	}
	/**
	 * @function : 회원 비밀번호 찾기 페이지 처리(실명인증)
	 * @process  : 이전페이지부터 정상적으로 접근하였는지 확인 처리
	 * 
	 * @MethodName : find_id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/rs_find_pw.htm",method=RequestMethod.POST)
	public ModelAndView rs_find_pw(HttpServletRequest request) throws Exception {
//		System.out.println("rs_find_pw.htm");
		common(request.getSession(),"user/rs_find_pw");
		
		request.setCharacterEncoding("EUC-KR");
		
		String refURL = request.getHeader("REFERER");
		
		if(refURL == null || !refURL.equals(sslDomain+"user/find_pw.htm")){
			throw new ErrorMsg(new String("잘못된 접근입니다.|"+ctxRoot));
		}
		
		String authType = request.getParameter("authType");
		String realName = request.getParameter("realName");
		String sex = request.getParameter("sex");
		String nationalInfo = request.getParameter("nationalInfo");
		String birthDate = request.getParameter("birthDate");
		String phoneCode = request.getParameter("phoneCode");
		String phoneNumber = request.getParameter("phoneNumber");
/*
		System.out.println("실명 : " + realName);
		System.out.println("인증타입 : " + authType);
		System.out.println("성별 : " + sex);
		System.out.println("국가정보 : " + nationalInfo);
		System.out.println("생년월일 : " + birthDate);
		System.out.println("통신사코드 : " + phoneCode);
		System.out.println("핸드폰번호 : " + phoneNumber);
		*/
//		realName = "강우진";
		User user = new User();
		user.setName(realName);
		user.setJumin(birthDate + sex);
		user.setId((String) session.getAttribute("findID"));

//		user.setId("asdf");
		ArrayList<User> matchID = new ArrayList<User>();
		matchID = (ArrayList<User>) sqlMapClientTemplate.queryForList("getUserByRealName", user);
		String userId = null;

		if(matchID.size() == 1){
			userId = matchID.get(0).getId();
		}else if(matchID.size() > 1){
			for(int i=0; i<matchID.size(); i++){
				if(i==0)
					userId = matchID.get(i).getId();
				else
					userId += " , " + matchID.get(i).getId();
			}
		}

		mav.addObject("sslDomain", sslDomain);
		mav.addObject("realName",realName);
		mav.addObject("birthDate",birthDate);
		mav.addObject("userId", userId);
		
		session.removeAttribute("callType");
		goRetUrl(request);
		
		return mav;
	}
	
	@RequestMapping(value="/re_passwd.htm",method=RequestMethod.POST)
	public ModelAndView re_passwd(HttpServletRequest request) throws Exception {
		mav = new ModelAndView("include/common_receive");
		
		if(!request.getParameter("passwd").equals(request.getParameter("passwd_re")))
			throw new ErrorMsg(new String("비밀번호가 다릅니다."));
		
		User user = new User();
		user.setId(request.getParameter("userId"));
		user.setName(request.getParameter("realName"));
		user.setPasswd(request.getParameter("passwd"));
		
		int result = sqlMapClientTemplate.update("doUpdateUserPasswd", user);
		if(result == 0)
			throw new ErrorMsg(new String("비밀번호 변경 중 오류가 발생하였습니다.|login.htm"));
		
		mav.addObject("msg", "비밀번호가 재설정 되었습니다.");
		mav.addObject("go_url",ctxRoot);
		return mav;
	}
	
	/**
	 * @function : 회원가입 첫페이지(약관동의)
	 * @process  : 
	 * 
	 * @MethodName : join_step1
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/join1.htm",method=RequestMethod.GET)
	public ModelAndView join_step1(HttpServletRequest request) throws Exception {
		common(request.getSession(),"user/join_step1");
		
		goRetUrl(request);
		return mav;
	}
	
	/**
	 * @function : 회원가입 두번째 페이지 처리(실명인증)
	 * @process  : 이전페이지부터 정상적으로 접근하였는지 확인 처리
	 * 
	 * @MethodName : join_step2
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/join2.htm",method=RequestMethod.POST)
	public ModelAndView join_step2(HttpServletRequest request) throws Exception {
		common(request.getSession(),"user/join_step2");

		String refURL = request.getHeader("REFERER");
		
		if(refURL == null || !refURL.equals(sslDomain+"user/join1.htm")){
			throw new ErrorMsg(new String("잘못된 접근입니다.|"+ctxRoot));
		}
		goRetUrl(request);
		
		return mav;
	}
	
	/**
	 * @function : 회원가입 세번째 페이지 처리(회원정보입력)
	 * @process  : 정상적인 경로로 접근했는지 확인하고, 실명인증에 대한 결과값을 받아와 ModelAndView에 저장 
	 * 
	 * @MethodName : join_step3
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/join3.htm",method=RequestMethod.POST)
	public ModelAndView join_step3(HttpServletRequest request) throws Exception {
		common(request.getSession(),"user/join_step3");
		
		request.setCharacterEncoding("euc-kr");
		
		String refURL = request.getHeader("REFERER");
		if(refURL == null || !refURL.equals(sslDomain+"user/join2.htm")){
			throw new ErrorMsg(new String("잘못된 접근입니다.|"+ctxRoot));
		}
		
		String authType = request.getParameter("authType");
		String realName = request.getParameter("realName");
		String sex = request.getParameter("sex");
		String nationalInfo = request.getParameter("nationalInfo");
		String birthDate = request.getParameter("birthDate");
		String phoneCode = request.getParameter("phoneCode");
		String phoneNumber = request.getParameter("phoneNumber");
		
		mav.addObject("authType",authType);
		mav.addObject("realName",realName);
		mav.addObject("sex",sex);
		mav.addObject("nationalInfo",nationalInfo);
		mav.addObject("birthDate",birthDate);
		mav.addObject("phoneCode",phoneCode);
		mav.addObject("phoneNumber",phoneNumber);
		
		return mav;
	}
	
	/**
	 * @function : 가입 완료 처리
	 * @process  : 정상적으로 url타고 들어왔는지 체크, 로그인 안돼있는지 체크 후 회원정보를 저장 
	 * 
	 * @MethodName : join_run
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/join_run.htm",method=RequestMethod.POST)
	public ModelAndView join_run(HttpServletRequest request) throws Exception {
		
		request.setCharacterEncoding("euc-kr");
		
		String refURL = request.getHeader("REFERER");
		
		String userid = Common.strToStr(request.getParameter("userid"));
		String userpw1 = Common.strToStr(request.getParameter("userpw1"));
		String name = Common.strToStr(request.getParameter("name"));
		String zipcode = Common.strToStr(request.getParameter("zipcode"));
		String address1 = Common.strToStr(request.getParameter("address1"));
		String address2 = Common.strToStr(request.getParameter("address2"));
		String tel = Common.strToStr(request.getParameter("tel"));
		String phone = Common.strToStr(request.getParameter("phone"));
		String email = Common.strToStr(request.getParameter("email"));
		int emailReceive = Common.strToInt(request.getParameter("emailReceive"));
		String authType = Common.strToStr(request.getParameter("authType"));
		String birthDate = Common.strToStr(request.getParameter("birthDate"));
		String sex = Common.strToStr(request.getParameter("sex"));
		String phoneCode = Common.strToStr(request.getParameter("phoneCode"));
		
		if(refURL == null || !refURL.equals(sslDomain+"user/join3.htm")){
			throw new ErrorMsg(new String("잘못된 접근입니다.|"+ctxRoot));
		}
		
		chkLoginBack();
		
		String jumin = birthDate+sex+authType+phoneCode;
		
		User user=new User(
				userid,
				userpw1,
				name,
				jumin,
				zipcode,
				address1,
				address2,
				tel,
				phone,
				email,
				emailReceive
			);
		sqlMapClientTemplate.insert("insertUser", user);
		
		mav = new ModelAndView("include/common_receive");
		
		mav.addObject("msg","회원가입이 완료되었습니다.");
		mav.addObject("go_url","join_finish.htm?ret_url=join_finish.htm&userid="+userid);
		
		return mav;
	}
	
	/**
	 * @function : 회원가입 완료
	 * @process  : 홈 url로 이동
	 * 
	 * @MethodName : join_finish
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/join_finish.htm",method=RequestMethod.GET)
	public ModelAndView join_finish(HttpServletRequest request) throws Exception {
		common(request.getSession(),"include/common_receive");
		
		mav.addObject("go_url", homeUrl);
		
		return mav;
	}
	
	/**
	 * @function :휴대전화 실명인증 
	 * @process  : 
	 * 
	 * @MethodName : auth_phone1
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/auth_phone1.htm",method=RequestMethod.POST)
	public ModelAndView auth_phone1(HttpServletRequest request) throws Exception {
		//비밀번호 찾기를 위한 아이디값 세션에 설정
		String findID = request.getParameter("userId")==null ? null:request.getParameter("userId");
		if(findID != null)
			session.setAttribute("findID", findID);
		
		common(request.getSession(),"user/safe_hs_cert2");
		/**************************************************************************
		 * okname 파라미터
		 **************************************************************************/
		String inTpBit 		= "0";											// 입력구분코드(고정값 '0')
		String name 		= "x";											// 성명
		String birthday 	= "x";											// 생년월일
		String gender 		= "x";											// 성별
		String ntvFrnrTpCd 	= "x";											// 내외국인구분
		String mblTelCmmCd 	= "x";											// 이동통신사코드
		String mbphnNo 		= "x";											// 휴대폰번호
		
		String memId = "P23680000000";										// 회원사코드
		String clientIp = "x";												// 회원사 IP, InetAddress.getLocalHost().getHostAddress() 로 얻어올 수 있음.
		String clientDomain = "kctvjeju.com";								// 회원사 도메인. (휴대폰인증번호 송신시 제휴사명에 노출)
		
		// 거래일련번호 ( 20자리의 문자열. 0-9,A-Z,a-z 사용.)
		/**  거래 일련 번호는 아래와 같이 생성하는 것을 추천. *********************************
		** 별도 생성하여 사용할 경우 동일 거래번호를 두번 사용할 수 없는 것에 주의하여 작성. **/
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String svcTxSeqno = df.format(cal.getTime()); 
		//**********************************************************************************/
		
		// 예약 항목
		String rsv1 = "0";
		String rsv2 = "0";
		String rsv3 = "0";
		
		String hsCertMsrCd	=	"10";										// 인증수단코드 2byte  (10:핸드폰)
		String hsCertRqstCausCd	=	"00";									// 인증요청사유코드 2byte  (00:회원가입, 01:성인인증, 02:회원정보수정, 03:비밀번호찾기, 04:상품구매, 99:기타)
		
		//okname을 호출할 파라미터 정보(내부에서 암호화하여 리턴함. 팝업창에 미리 세팅하는 경우 암호화된 값을 팝업으로 전달할 수 있다.)
		String returnMsg = "x";
		
		// 본인인증 완료후 리턴될 URL (도메인 포함 full path)
		String returnUrl = sslDomain+"user/auth_phone2.htm";
		
		//okname 실행 정보
		String exe = "C:\\Inetpub\\KCB\\okname.exe";
		String serverDomain = "safe.ok-name.co.kr";
		String endPointURL = "http://"+serverDomain+"/KcbWebService/OkNameService";
		
		String logpath = "C:\\Inetpub\\KCB\\log1\\";
		String option;
		if(serverType.equals("real")) option = "Q";
		else option = "QU";
		
		String[] cmd = new String[22];
		cmd[0]=exe;
		cmd[1]=svcTxSeqno;
		cmd[2]=name;
		cmd[3]=birthday;
		cmd[4]=gender;
		cmd[5]=ntvFrnrTpCd;
		cmd[6]=mblTelCmmCd;
		cmd[7]=mbphnNo;
		cmd[8]=rsv1;
		cmd[9]=rsv2;
		cmd[10]=rsv3;
		cmd[11]=returnMsg;
		cmd[12]=returnUrl;
		cmd[13]=inTpBit;
		cmd[14]=hsCertMsrCd;
		cmd[15]=hsCertRqstCausCd;
		cmd[16]=memId;
		cmd[17]=clientIp;
		cmd[18]=clientDomain;
		cmd[19]=endPointURL;
		cmd[20]=logpath;
		cmd[21]=option;
		
		/*for(int i=0; i<22; i++) {
			System.out.println(cmd[i]);
		}*/
		
		/**************************************************************************
		okname 실행
		**************************************************************************/
		
		//cmd 실행
		Runtime oRuntime = Runtime.getRuntime();
		Process oProcess = oRuntime.exec(cmd);
		// 외부 프로그램 출력 읽기
		BufferedReader stdOut   = new BufferedReader(new InputStreamReader(oProcess.getInputStream()));
		
		String[] out1 = new String[20];
		String s="";
		int ret_cnt=0;
		while ((s =   stdOut.readLine()) != null) {
			//System.out.println(s);
			out1[ret_cnt++] = s;
		}
		
		// 외부 프로그램 반환값 출력 
		oProcess.waitFor();// 프로세스가 끝날때 까지 기다림
		int ret = oProcess.exitValue();
		
		//System.out.println("ret="+ret+"<br>");
		
		/**************************************************************************
		okname 응답 정보
		**************************************************************************/
		
		String retcode = "";
		String retmsg = "";
		String e_rqstData = "";
		
		if (ret == 0) {//성공일 경우 변수를 결과에서 얻음
			retcode = out1[0];
			retmsg  = out1[1];
			e_rqstData = out1[2];
		}
		else {
			retcode = out1[0];
			retmsg  = out1[1];
		}
		
		
		/**************************************************************************
		safe_hs_cert3.jsp 실행 정보(SOAP호출에서는 사용하지 않고 POPUP시에만 사용함)
		**************************************************************************/
		
		String targetId = "";// 타겟ID (팝업오픈 스크립트의 window.name 과 동일하게 설정
		
		mav.addObject("serverDomain",serverDomain);
		mav.addObject("targetId",targetId);
		mav.addObject("e_rqstData",e_rqstData);
		mav.addObject("retcode",retcode);
		mav.addObject("retmsg",retmsg);
		
		return mav;
	}
	
	/**
	 * @function : 휴대전화 본인인증 2단계
	 * @process  : 
	 * 
	 * @MethodName : auth_phone2
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/auth_phone2.htm",method=RequestMethod.POST)
	public ModelAndView auth_phone2(HttpServletRequest request) throws Exception {
		common(request.getSession(),"user/safe_hs_cert3");
		
		/**************************************************************************
		본인인증 결과 화면
		(고객 인증정보 KCB팝업창에서 입력용)
		**************************************************************************/

		/* 공통 리턴 항목 */
		String idcfMbrComCd		=	request.getParameter("idcf_mbr_com_cd");		// 고객사코드
		//String hsCertSvcTxSeqno	=	request.getParameter("hs_cert_svc_tx_seqno");	// 거래번호
		//String hsCertMsrCd		=	request.getParameter("hs_cert_msr_cd");			// 인증요청수단코드(00:전체, 10:휴대폰, 20:신용카드, 30:공인인증서);//
		//String hsCertRqstCausCd	=	request.getParameter("hs_cert_rqst_caus_cd");	// 인증요청사유코드 2byte  (00:회원가입, 01:성인인증, 02:회원정보수정, 03:비밀번호찾기, 04:상품구매, 99:기타);// 

		String resultCd			=	request.getParameter("result_cd");				// 결과코드
		//@SuppressWarnings("deprecation")
		//String resultMsg		=	java.net.URLDecoder.decode(request.getParameter("result_msg"));	// 결과메세지
		//String certDtTm			=	request.getParameter("cert_dt_tm");				// 인증일시

		/**************************************************************************
		 * 모듈 호출	; 데이터 검증 
		 **************************************************************************/

		//* (필요한 경우 이 줄을 제거하여 사용)

		String encInfo = request.getParameter("encInfo");

		//KCB서버 공개키와 서명값
		String WEBPUBKEY = request.getParameter("WEBPUBKEY") == null || "".equals(request.getParameter("WEBPUBKEY").trim()) ? "" : request.getParameter("WEBPUBKEY").trim();
		String WEBSIGNATURE = request.getParameter("WEBSIGNATURE") == null || "".equals(request.getParameter("WEBSIGNATURE").trim()) ? "" : request.getParameter("WEBSIGNATURE").trim();
		//System.out.println("encInfo:"+encInfo+"<br/>");	

		// 모듈 파라미터 설정.
		String[] cmd = new String[9];
		cmd[0] = "C:\\Inetpub\\KCB\\okname.exe";
		cmd[1] = "C:\\Inetpub\\KCB\\safecert_"+idcfMbrComCd+".key";				// IPIN에서 설정된 키파일명과 다른 이름으로 설정해야함.
		cmd[2] = idcfMbrComCd;            // 회원사코드
		cmd[3] = "http://safe.ok-name.co.kr/KcbWebService/OkNameService";	//운영 EndPointURL
		cmd[4] = WEBPUBKEY;       //server publickey
		cmd[5] = WEBSIGNATURE;    //server signature
		cmd[6] = encInfo;     //PERSONALINFO
		cmd[7] ="./";
		if(serverType.equals("real")) cmd[8] ="S";
		else cmd[8] ="SU";

		String[] field = new String[17];

		Runtime oRuntime = null;
		Process oProcess = null;
		BufferedReader stdOut = null;
		BufferedReader stdError = null;
		InputStream outstream = null;
		InputStream errorstream = null;

		//@SuppressWarnings("rawtypes")
		//ArrayList outData = new ArrayList(0); //인증결과
			
		try {
			oRuntime = Runtime.getRuntime();
			oProcess = oRuntime.exec(cmd);
			oProcess.waitFor(); // 프로세스 종료를 기다림.
			
			outstream = oProcess.getInputStream();
			errorstream = oProcess.getErrorStream();
			stdOut = new BufferedReader ( new InputStreamReader( outstream ) );
			stdError = new BufferedReader ( new InputStreamReader( errorstream ) );

			String s;
			int cnt = 0;
			// "표준 출력"과 "표준 에러 출력"을 출력. 
			// **주의** 환경에따라 해당버퍼를 소진시키지 않는 경우 프로세스가 즉시 종료되지 않을 수 있다.
			while ((s = stdOut.readLine()) != null){	
				field[cnt++]=s;	
				//System.out.println(cnt+":"+s+"<br/>");	
			}
			cnt = 0;
			while ((s = stdError.readLine()) != null){
				//System.out.println(cnt+":"+s+"<br/>");	
			}
			
			int ret = oProcess.exitValue();
			
			// 외부 프로그램 반환값 출력 (이 부분은 필수가 아님)
			//System.out.println("WEBPUBKEY=" + WEBPUBKEY + "<br>");
			//System.out.println("WEBSIGNATURE=" + WEBSIGNATURE + "<br>");
			//System.out.println("ret=" + ret + "<br>");
			
			if( ret==0 ){
				resultCd = field[0];
				//hsCertSvcTxSeqno = field[2];
			}
			else resultCd = "ERROR";
		}
		catch(Exception e) {
			e.printStackTrace();
			//finally절에 명시적으로 close 선언
		}finally{
			if(oProcess != null) {
				try{
					if(stdOut != null) stdOut.close();
					if(stdError != null) stdError.close();
					if(outstream != null ) outstream.close();
					if(errorstream != null ) errorstream.close();
				}
				finally {
					oProcess.destroy();
				}
			}
		}
		
		/*
		System.out.println("처리결과코드	:" + field[0]);
		System.out.println("처리결과메시지	:" + field[1]);
		System.out.println("거래일련번호	:" + field[2]);
		System.out.println("인증일시		:" + field[3]);
		System.out.println("DI				:" + field[4]);
		System.out.println("CI				:" + field[5]);
		System.out.println("성명			:" + field[7]);
		System.out.println("생년월일		:" + field[8]);
		System.out.println("성별			:" + field[9]);
		System.out.println("내외국인구분	:" + field[10]);
		System.out.println("통신사코드		:" + field[11]);
		System.out.println("휴대폰번호		:" + field[12]);
		System.out.println("리턴메시지		:" + field[16]);
		*/
		// 데이터 검증 종료
		
		int phoneLength;
		String phoneNumber, number1, number2, number3;
		phoneNumber = field[12];
		phoneLength = phoneNumber.length();
		
		number1 = phoneNumber.substring(0,3);
		number2 = phoneNumber.substring(3,phoneLength-4);
		number3 = phoneNumber.substring(phoneLength-4,phoneLength);
		
		phoneNumber = number1 +"-" + number2 + "-" + number3;
		
		//System.out.println(field[7]);
		//System.out.println(field[11]+"-"+phoneNumber);
		
		mav.addObject("homeUrl",homeUrl);
		mav.addObject("sslDomain",sslDomain);
		mav.addObject("resultCd",resultCd);
		mav.addObject("realName",field[7]);
		mav.addObject("birthDate",field[8]);
		mav.addObject("sex",field[9]);
		mav.addObject("nationalInfo",field[10]);
		mav.addObject("phoneCode",field[11]);
		mav.addObject("phoneNumber",phoneNumber);
		return mav;
	}
	
	/**
	 * @function : 아이핀 본인인증1
	 * @process  : 
	 * 
	 * @MethodName : auth_ipin1
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/auth_ipin1.htm",method=RequestMethod.POST)
	public ModelAndView auth_ipin1(HttpServletRequest request) throws Exception {
//		비밀번호 찾기를 위한 아이디값 세션에 설정
		String findID = request.getParameter("userId")==null ? null:request.getParameter("userId");
		if(findID != null)
			session.setAttribute("findID", findID);
				
		common(request.getSession(),"user/ipin1");
		
		String idpUrl = "";

		//웹사이트가 PERSONALINFO를 RECEIVE하는 페이지
		String returnUrl = "";

		//KCB 운영서버를 호출할 경우
		idpUrl    = "https://ipin.ok-name.co.kr/tis/ti/POTI90B_SendCertInfo.jsp";
		//결과 URL
		returnUrl = sslDomain+"user/auth_ipin2.htm";

		String idpCode = "V";						//웹사이트 선호본인확인기관(KCB기관)코드
		String cpCode  = "P23680000000";			//중복가입확인정보 생성을 위한 사이트 식별번호 (회원사아이디를 사용)

		//아이핀 서버와 통신을 위한 키파일 생성
		//Writer writer    = response.getWriter();
		Runtime oRuntime = Runtime.getRuntime();
		
		String[] cmd = new String[8];
		cmd[0] = "C:\\Inetpub\\KCB\\okname";
		cmd[1] = "C:\\Inetpub\\KCB\\key\\okname.key";

		cmd[2] = cpCode;//memid
		cmd[3] = "0";//reserved1
		cmd[4] = "0";//reserved2
		cmd[5] = "http://safe.ok-name.co.kr/KcbWebService/OkNameService";//EndPointURL
		
		cmd[6] = "C:\\Inetpub\\KCB\\log2\\";// logpath
		if(serverType.equals("real")) cmd[7] = "C";// Option
		else cmd[7] = "CU";
		
		/*for(int i=0; i<8; i++) { 
			System.out.println(cmd[i]);
			System.out.println(" ");	
		}*/
		
		String s = "", pubkey = "", sig = "", curtime = "";
		

		Process oProcess = null;
		BufferedReader stdOut = null;
		BufferedReader stdError = null;
		InputStream outstream = null;
		InputStream errorstream = null;

		@SuppressWarnings("rawtypes")
		ArrayList outData = new ArrayList(0);	// 인증결과
		
		try {
			oProcess = oRuntime.exec(cmd);
			oProcess.waitFor();					// 프로세스 종료를 기다림.

			outstream = oProcess.getInputStream();
			errorstream = oProcess.getErrorStream();
			stdOut = new BufferedReader ( new InputStreamReader( outstream ) );
			stdError = new BufferedReader ( new InputStreamReader( errorstream ) );

			// "표준 출력"과 "표준 에러 출력"을 출력. 
			// **주의** 환경에따라 해당버퍼를 소진시키지 않는 경우 프로세스가 즉시 종료되지 않을 수 있다.
			while ((s = stdOut.readLine()) != null){
				outData.add(s);
				//System.out.println(s);
			}
			//while ((s = stdError.readLine()) != null) System.out.println(s);

			//int ret = oProcess.exitValue();
		
			// 외부 프로그램 반환값 출력 (이 부분은 필수가 아님)
			//System.out.println("ret=" + ret);
		
			try
			{
				pubkey 	= (String)outData.get(0);   //client publickey
				sig 	= (String)outData.get(1);   //client signature
				curtime	= (String)outData.get(2);   //cprequestnum
			}
			catch ( Exception e ){
				//System.out.println("Error");
			}

		}
		catch(Exception e) {
			e.printStackTrace();

			//finally절에 명시적으로 close 선언
		}finally{
			if(oProcess != null) {
				try{
					if(stdOut != null) stdOut.close();
					if(stdError != null) stdError.close();
					if(outstream != null ) outstream.close();
					if(errorstream != null ) errorstream.close();
				}
				finally {
					oProcess.destroy();
				}
			}
		}
		
		mav.addObject("idpCode",idpCode);
		mav.addObject("idpUrl",idpUrl);
		mav.addObject("cpCode",cpCode);
		mav.addObject("curtime",curtime);
		mav.addObject("returnUrl",returnUrl);
		mav.addObject("pubkey",pubkey);
		mav.addObject("sig",sig);
		
		return mav;
	}
	
	/**
	 * @function : 아이핀 본인인증 2단계
	 * @process  : 
	 * 
	 * @MethodName : auth_ipin2
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/auth_ipin2.htm",method=RequestMethod.POST)
	public ModelAndView auth_ipin2(HttpServletRequest request) throws Exception {
		common(request.getSession(),"user/ipin2");
		
		//아이핀으로부터 받는 parameter는  encPsnlInfo, WEBPUBKEY, WEBSIGNATURE으로 대소문자 동일하여야 한다.
		//아이핀팝업에서 조회한 PERSONALINFO이다.
		String encPsnlInfo = request.getParameter("encPsnlInfo");
		String cpCode    = "P23680000000";				//중복가입확인정보 생성을 위한 사이트 식별번호 (회원사코드를 사용)

		//아이핀 서버와 통신을 위한 키파일 생성
		//Writer writer = response.getWriter();
		Runtime oRuntime = Runtime.getRuntime();
		
		//KCB서버 공개키
		String WEBPUBKEY = request.getParameter("WEBPUBKEY") == null || "".equals(request.getParameter("WEBPUBKEY").trim()) ? "" : request.getParameter("WEBPUBKEY").trim();
		//KCB서버 서명값
		String WEBSIGNATURE = request.getParameter("WEBSIGNATURE") == null || "".equals(request.getParameter("WEBSIGNATURE").trim()) ? "" : request.getParameter("WEBSIGNATURE").trim();
		
		String[] cmd = new String[9];
		cmd[0] = "C:\\Inetpub\\KCB\\okname";
		cmd[1] = "C:\\Inetpub\\KCB\\key\\okname.key";
		cmd[2] = cpCode;//memid
		cmd[3] = "http://www.ok-name.co.kr/KcbWebService/OkNameService";// 운영 서버
		cmd[4] = WEBPUBKEY;       //server publickey
		cmd[5] = WEBSIGNATURE;    //server signature
		cmd[6] = encPsnlInfo;     //PERSONALINFO
		cmd[7] ="C:\\Inetpub\\KCB\\log2\\";
		if(serverType.equals("real")) cmd[8] ="S";
		else cmd[8] ="SU";

		String[] field = new String[13];

		Process oProcess = null;
		BufferedReader stdOut = null;
		BufferedReader stdError = null;
		InputStream outstream = null;
		InputStream errorstream = null;

		//ArrayList outData = new ArrayList(0); 	//인증결과
			
		try {
			oProcess = oRuntime.exec(cmd);
			oProcess.waitFor();					// 프로세스 종료를 기다림.
			
			outstream = oProcess.getInputStream();
			errorstream = oProcess.getErrorStream();
			stdOut = new BufferedReader ( new InputStreamReader( outstream ) );
			stdError = new BufferedReader ( new InputStreamReader( errorstream ) );
		
			String s;
			int cnt = 0;
			// "표준 출력"과 "표준 에러 출력"을 출력. 
			// **주의** 환경에따라 해당버퍼를 소진시키지 않는 경우 프로세스가 즉시 종료되지 않을 수 있다.
			while ((s = stdOut.readLine()) != null){
				field[cnt++]=s;
				//System.out.println(s);
			}
			//while ((s = stdError.readLine()) != null) System.out.println(s);
		
			//int ret = oProcess.exitValue();
		
			// 외부 프로그램 반환값 출력 (이 부분은 필수가 아님)
			//System.out.println("ret=" + ret);
		}
		catch(Exception e) {
			e.printStackTrace();
		
		//finally절에 명시적으로 close 선언
		}finally{

			if(oProcess != null) {
				try{
					if(stdOut != null) stdOut.close();
					if(stdError != null) stdError.close();
					if(outstream != null ) outstream.close();
					if(errorstream != null ) errorstream.close();
				}
				finally {
					oProcess.destroy();
				}
			}
		}
		
		/*
		dupinfo =			field[0];
		coinfo1 =			field[1];
		coinfo2 =			field[2];
		ciupdate =			field[3];
		virtualno =			field[4];
		cpcode =			field[5];
		realname =			field[6];
		cprequestnumber =	field[7];
		age =				field[8];
		sex =				field[9];
		nationalinfo =		field[10];
		birthdate =			field[11];
		authinfo =			field[12];
		*/
		
		mav.addObject("homeUrl",homeUrl);
		mav.addObject("sslDomain",sslDomain);
		mav.addObject("realName", field[6]);
		mav.addObject("sex", field[9]);
		mav.addObject("nationalInfo", field[10]);
		mav.addObject("birthdate", field[11]);
		
		
		return mav;
	}
	
	/**
	 * @function : 우편번호 검색
	 * @process  : 
	 * 
	 * @MethodName : searchZipcode
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/searchZipcode.htm",method=RequestMethod.GET)
	public ModelAndView searchZipcode(HttpServletRequest request) throws Exception {
		common(request.getSession(),"user/searchZipcode");
		
		request.setCharacterEncoding("euc-kr");
		
		String kw = Common.strToStr(request.getParameter("KW"));
		String formName = Common.strToStr(request.getParameter("formName"));
		String formZipcode = Common.strToStr(request.getParameter("formZipcode"));
		String formAddress1 = Common.strToStr(request.getParameter("formAddress1"));
		String formAddress2 = Common.strToStr(request.getParameter("formAddress2"));
		
		if(formName == null || formName.equals("")) formName = "join_form";
		if(formZipcode == null || formZipcode.equals("")) formZipcode = "zipcode";
		if(formAddress1 == null || formAddress1.equals("")) formAddress1 = "address1";
		if(formAddress2 == null || formAddress2.equals("")) formAddress2 = "address2";
		
		kw = Common.toEUCKR(kw);
		ArrayList<Zipcode> listZipcode = null;
		int totalZipcode = 0;
		
		if(kw != null && kw.length()>0){
			listZipcode = (ArrayList<Zipcode>)sqlMapClientTemplate.queryForList("listZipcode",kw);
			totalZipcode = (Integer)sqlMapClientTemplate.queryForObject("cntZipcode",kw);
			
			for(Zipcode item:listZipcode){
				if(item.getZp_bunji() != null && item.getZp_bunji().length()>0)
					item.setAddress1(item.getZp_sido() + " " + item.getZp_gugun() + " " + item.getZp_dong() + " " + item.getZp_bunji());
				else
					item.setAddress1(item.getZp_sido() + " " + item.getZp_gugun() + " " + item.getZp_dong());
				item.setAddress2(item.getZp_sido() + " " + item.getZp_gugun() + " " + item.getZp_dong());
			}
		}
		
		mav.addObject("kw", kw);
		mav.addObject("formName", formName);
		mav.addObject("formZipcode", formZipcode);
		mav.addObject("formAddress1", formAddress1);
		mav.addObject("formAddress2", formAddress2);
		mav.addObject("listZipcode", listZipcode);
		mav.addObject("totalZipcode", totalZipcode);
		
		return mav;
	}
	
	/**
	 * @function : 로그인 페이지
	 * @process  : 로그인 페이지 이동, 노출되는 공지사항 7개 받아와서 처리
	 * 
	 * @MethodName : login
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login.htm",method=RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request) throws Exception {
		common(request.getSession(),"user/login");
		BoardNotice boardNotice=new BoardNotice(sqlMapClientTemplate);
		mav.addObject("listNotice",boardNotice.listIndex(7,17));
		
		goRetUrl(request);
		
		return mav;
	}

	/**
	 * @function : 로그인 체크
	 * @process  : 로그인 시도시 일치하는 정보가 있는지 확인 후 페이지 이동 혹은 새로고침
	 * 
	 * @MethodName : login_chk
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_chk.htm",method=RequestMethod.POST)
	public ModelAndView login_chk(HttpServletRequest request) throws Exception {
		common(request.getSession(),"include/common_receive");
		
		request.setCharacterEncoding("euc-kr");
		
		String ret_url = request.getParameter("ret_url");
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");

		if (chkLogin(userid,userpw)){
			userInfoBasic=(UserInfoBasic)sqlMapClientTemplate.queryForObject("getUserInfoBasic",userid);
			session.setAttribute("userid", userInfoBasic.getId());
			session.setAttribute("name", userInfoBasic.getName());
			session.setAttribute("level", userInfoBasic.getLevel());
			session.setAttribute("email", userInfoBasic.getEmail());
			sqlMapClientTemplate.update("updateUserCnt",userInfoBasic.getId());
			mav.addObject("go_url",ret_url);
		}
		else{
			throw new ErrorMsg(new String("아이디 혹은 비밀번호가 다릅니다.|login.htm?ret_url="+ret_url));
		}
		
		return mav;
	}
	
	/**
	 * @function : 로그아웃
	 * @process  : 로그아웃 처리
	 * 
	 * @MethodName : logout
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/logout.htm",method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session) throws Exception {
		common(session,"include/common_receive");
		chkLogoutBack();
		session.invalidate();
		mav.addObject("go_url",homeUrl);
		return mav;
	}
	
	/**
	 * @function : 내정보관리 페이지
	 * @process  : 로그아웃상태라면 뒤로이동
	 * 
	 * @MethodName : info
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/info.htm",method=RequestMethod.GET)
	public ModelAndView info(HttpSession session) throws Exception {
		common(session,"user/info");
		chkLogoutBack();
		return mav;
	}
	
	/**
	 * @function : 비밀번호 체크 페이지
	 * @process  : 세션의 비밀번호 인증 상태 지운 후 유저id 정보만 리턴하여줌
	 * 
	 * @MethodName : info_pw
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/info_pw.htm",method=RequestMethod.GET)
	public ModelAndView info_pw(HttpSession session) throws Exception {
		common(session,"user/info_pw");
		chkLogoutBack();
		session.removeAttribute("isPasswordAuthorized");
		mav.addObject("userid",session.getAttribute("userid"));
		return mav;
	}
	
	/**
	 * @function : 비밀번호 체크 페이지
	 * @process  : 세션의 비밀번호 인증 상태 지운 후 유저id 정보만 리턴하여줌
	 * 
	 * @MethodName : info_del
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/info_del.htm",method=RequestMethod.GET)
	public ModelAndView info_del(HttpSession session) throws Exception {
		common(session,"user/info_del");
		chkLogoutBack();
		session.removeAttribute("isPasswordAuthorized");
		mav.addObject("userid",session.getAttribute("userid"));
		return mav;
	}
	
	/**
	 * @function : 기본정보 수정 페이지
	 * @process  : 로그인 상태 체크 후 비밀번호 재인증 상태일 경우에 회원정보 조회 후 ModelAndView에 넣어 처리
	 * 
	 * @MethodName : info_basic
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/info_basic.htm",method=RequestMethod.GET)
	public ModelAndView info_basic(HttpSession session) throws Exception {
		this.session = session;
		chkLogoutBack();
		if(session.getAttribute("userid") != null && session.getAttribute("userid").toString().length()>0){
			if((String)session.getAttribute("isPasswordAuthorized")=="yes"){
				userInfoBasic=(UserInfoBasic)sqlMapClientTemplate.queryForObject("getUserInfoBasic",session.getAttribute("userid"));
				mav = new ModelAndView("user/info_basic");
				mav.addObject("infoBasic",userInfoBasic);
			}
			else{
				mav = new ModelAndView("user/info_pw");
			}
		}
		else{
			mav = new ModelAndView("include/common_receive");
			mav.addObject("go_url",ctxRoot);
		}
		
		mav.addObject("homeUrl",homeUrl);
		mav.addObject("menu",menu);
		mav.addObject("ctxRoot",ctxRoot);
		return mav;
	}
	
	/**
	 * @function : 회원정보 수정 확인 처리 로직인듯함
	 * @process  : 
	 * 
	 * @MethodName : info_edit_basic
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/info_edit_basic.htm",method=RequestMethod.POST)
	public ModelAndView info_edit_basic(HttpServletRequest request) throws Exception {
		common(request.getSession(),"include/common_receive");
		
		request.setCharacterEncoding("euc-kr");
		
		String name = request.getParameter("name");
		String zipcode = request.getParameter("zipcode");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String tel = request.getParameter("tel");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		chkLogoutBack();
		userInfoBasic = new UserInfoBasic(
			session.getAttribute("userid").toString(),
			name,
			zipcode,
			address1,
			address2,
			tel,
			phone,
			email
			);
		sqlMapClientTemplate.update("updateUserBasic",userInfoBasic);
		
		mav.addObject("msg","수정되었습니다.");
		mav.addObject("go_url","info.htm");
		return mav;
	}
	
	/**
	 * @function : 비밀번호 변경 페이지
	 * @process  : 
	 * 
	 * @MethodName : info_edit_pw
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/info_edit_pw.htm",method=RequestMethod.GET)
	public ModelAndView info_edit_pw(HttpSession session) throws Exception {
		common(session,"user/info_edit_pw");
		chkLogoutBack();
		session.removeAttribute("isPasswordAuthorized");
		return mav;
	}
	
	/**
	 * @function : 비밀번호 변경 확인 페이지
	 * @process  : 이전 비밀번호가 맞고 새 비밀번호 2개가 일치할 경우에 수정처리, 아닐 경우 오류메세지 출력
	 * 
	 * @MethodName : edit_pw
	 * @param session
	 * @param userpw0
	 * @param userpw1
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit_pw.htm",method=RequestMethod.POST)
	public ModelAndView edit_pw(HttpSession session
			,@RequestParam(value="userpw0",required=true,defaultValue="") String userpw0
			,@RequestParam(value="userpw1",required=true,defaultValue="") String userpw1) throws Exception {
		this.session=session;
		chkLogoutBack();
		
		if(chkLogin(session.getAttribute("userid").toString(),userpw0)){
			ChkLogin chkLogin=new ChkLogin((String)session.getAttribute("userid"),userpw1);
			sqlMapClientTemplate.update("updateUserPasswd",chkLogin);
			mav = new ModelAndView("include/common_receive");
			mav.addObject("msg","수정되었습니다.");
			mav.addObject("go_url","info.htm");
		}
		else{
			throw new ErrorMsg(new String("비밀번호가 다릅니다.|info_edit_pw.htm"));
		}
		return mav;
	}
	
	/**
	 * @function : 회원정보 관리 페이지 사이드메뉴
	 * @process  : 공지사항 게시판 게시글 5개 및 회원정보 일부 처리
	 * 
	 * @MethodName : info_side
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/info_side.htm",method=RequestMethod.GET)
	public ModelAndView info_side(HttpSession session) throws Exception {
		common(session,"user/info_side");
		chkLogoutBack();
		BoardNotice boardNotice=new BoardNotice(sqlMapClientTemplate);
		mav.addObject("listNotice",boardNotice.listIndex(5,17));
		userInfoBasic=(UserInfoBasic)sqlMapClientTemplate.queryForObject("getUserInfoBasic",session.getAttribute("userid"));
		mav.addObject("infoBasic2",userInfoBasic);
		return mav;
	}
	
	/**
	 * @function : 중복 아이디 검사
	 * @process  : 
	 * 
	 * @MethodName : chk_userid
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/chk_userid.htm",method=RequestMethod.POST)
	@ResponseBody
	public ChkUserid chk_userid(@RequestParam(value="userid",required=true,defaultValue="") String userid) throws Exception {
		Integer cntUserid = (Integer)sqlMapClientTemplate.queryForObject("cntUserid",userid);
		ChkUserid result = new ChkUserid(cntUserid.intValue());
		return result;
	}
	
	/**
	 * @function : 비밀번호 검사
	 * @process  : 기본정보 수정시 비밀번호 체크 하는 부분에 사용됨
	 * 
	 * @MethodName : chk_pw
	 * @param session
	 * @param userpw
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/chk_pw.htm",method=RequestMethod.POST)
	public ModelAndView chk_pw(HttpSession session,@RequestParam(value="userpw",required=true,defaultValue="") String userpw) throws Exception {
		this.session=session;
		chkLogoutBack();
		
		if(chkLogin(session.getAttribute("userid").toString(),userpw)){
			session.setAttribute("isPasswordAuthorized", "yes");
			mav = new ModelAndView("include/common_receive");
			mav.addObject("go_url",ctxRoot+"user/info_basic.htm");
		}
		else{
			throw new ErrorMsg(new String("비밀번호가 다릅니다."));
		}
		return mav;
	}
	
	/**
	 * @function : 비밀번호 검사
	 * @process  : 기본정보 수정시 비밀번호 체크 하는 부분에 사용됨
	 * 
	 * @MethodName : chk_pw
	 * @param session
	 * @param userpw
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/chk_pw_del.htm",method=RequestMethod.POST)
	public ModelAndView chk_pw_del(HttpSession session,@RequestParam(value="userpw",required=true,defaultValue="") String userpw) throws Exception {
		this.session=session;
		chkLogoutBack();
		
		if(chkLogin(session.getAttribute("userid").toString(),userpw)){
			session.setAttribute("isPasswordAuthorized", "yes");
			mav = new ModelAndView("include/common_receive");
			chkLogoutBack();
			//회원 정보 삭제 처리!
			boolean result = doDeleteUser(session.getAttribute("userid").toString(), userpw);
			if(!result)
				throw new ErrorMsg(new String("회원정보 삭제 중 오류가 발생하였습니다."));
			session.invalidate();
			mav.addObject("msg", "탈퇴되었습니다.");
			mav.addObject("go_url",ctxRoot);
		}
		else{
			throw new ErrorMsg(new String("비밀번호가 다릅니다."));
		}
		return mav;
	}
	
	/**
	 * @function : 탈퇴 신청 회원 정보 공백으로 업데이트 
	 * @process  : 
	 * 
	 * @MethodName : doDeleteUser
	 * @param userid
	 * @param userpw
	 * @return
	 */
	private boolean doDeleteUser(String userid, String userpw) {
		// TODO Auto-generated method stub
		ChkLogin chkLogin = new ChkLogin(userid,userpw);
		int resultFlag = 0;
		resultFlag = sqlMapClientTemplate.update("doUpdateDelUser", chkLogin);
		sqlMapClientTemplate.insert("doInsertSecede", chkLogin);
		if(resultFlag == 1)
			return true;
		else
			return false;
		
	}

	/**
	 * @function : 아이디 검사
	 * @process  : 이미 가입된 아이디가 있는지 확인
	 * 
	 * @MethodName : bln_userid
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/bln_userid.htm",method=RequestMethod.POST)
	@ResponseBody
	public boolean bln_userid(@RequestParam(value="userid",required=true,defaultValue="") String userid) throws Exception {
		Integer cntUserid = (Integer)sqlMapClientTemplate.queryForObject("cntUserid",userid);
		if(cntUserid.intValue()>0)
			return false;
		else
			return true;
	}
	/**
	 * @function : 이메일 확인
	 * @process  : 기존에 가입된 이메일이 있는지 확인
	 * 
	 * @MethodName : bln_email
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/bln_email.htm",method=RequestMethod.POST)
	@ResponseBody
	public boolean bln_email(HttpSession session, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("euc-kr");
		String email = Common.strToStr(request.getParameter("email"));
		this.session=session;
		Integer cntEmail;
		if(session.getAttribute("userid") != null && session.getAttribute("userid").toString().length()>0){
			cntEmail = (Integer)sqlMapClientTemplate.queryForObject("cntEmailUserid",new ChkEmail(session.getAttribute("userid").toString(),email));
		}
		else{
			cntEmail = (Integer)sqlMapClientTemplate.queryForObject("cntEmail",email);
		}
		if(cntEmail.intValue()>0)
			return false;
		else
			return true;
	}
	
	/**
	 * @function : 아이디와 비밀번호 디비 매칭검사
	 * @process  : 
	 * 
	 * @MethodName : chkLogin
	 * @param userid
	 * @param userpw
	 * @return
	 */
	private boolean chkLogin(String userid,String userpw){
		ChkLogin chkLogin = new ChkLogin(userid,userpw);
		Integer login_chk;
		login_chk = (Integer)sqlMapClientTemplate.queryForObject(queryId_chkLogin,chkLogin);
		
		if(login_chk.intValue()>0)
			return true;
		else
			return false;
	}
	
	/**
	 * @function : 로그인 후 페이지 이동정보 처리
	 * @process  : 로그인 상태가 되면 홈 url을 ModelAndView에 저장
	 * 
	 * @MethodName : chkLoginBack
	 */
	private void chkLoginBack(){
		if(session.getAttribute("userid")!=null && session.getAttribute("userid").toString().length()>0){
			mav = new ModelAndView("include/common_receive");
			mav.addObject("go_url",ctxRoot);
			return;
		}
	}
	
	/**
	 * @function : 로그아웃 후 페이지 이동 정보 처리
	 * @process  : 로그아웃한 상태인지 체크하여 홈 url 을 ModelAndView에 저장
	 * 
	 * @MethodName : chkLogoutBack
	 */
	private void chkLogoutBack(){
		if(session.getAttribute("userid")==null && session.getAttribute("userid").toString().length()<1){
			mav = new ModelAndView("include/common_receive");
			mav.addObject("go_url",ctxRoot);
			return;
		}
	}
	
	/**
	 * @function : 페이지 이동
	 * @process  : ServeletRequest 로 부터 가고자하는 url 처리하거나 데이터가 없을 경우 이전페이지 리턴 처리
	 * 
	 * @MethodName : goRetUrl
	 * @param request
	 */
	private void goRetUrl(HttpServletRequest request){
		chkLoginBack();
		
		if(request.getParameter("ret_url") == null || request.getParameter("ret_url").toString().length()<1)
			mav.addObject("ret_url",request.getHeader("referer"));
		else
			mav.addObject("ret_url",request.getParameter("ret_url").toString());
	}
}