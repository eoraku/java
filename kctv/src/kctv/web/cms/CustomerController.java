package kctv.web.cms;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kctv.sms.SmsParameter;
import kctv.sms.TWEBSVR;
import kctv.web.common.Common;
import kctv.web.session.Session;
import kctv.web.user.Zipcode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplateSMS;
	
	String menu;
	ModelAndView mav;
	HttpSession session;
	
	private void common(HttpSession session, boolean isLeftMenu,String menu,String muid){
		this.session = session;
		mav = new ModelAndView(menu+"/"+muid);
		mav.addObject("isLeftMenu",isLeftMenu);
	}
	
	@RequestMapping("/content_top.htm")
	public ModelAndView contents_top(HttpSession session,@RequestParam("muid") int muid) throws Exception {
		mav = new ModelAndView("customer/content_top");
		mav.addObject("menuName",(String)sqlMapClientTemplate.queryForObject("getMenuName",muid));
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/index.htm",method=RequestMethod.GET)
	public ModelAndView customer(HttpSession session
			,@RequestParam(value="muid",required=false,defaultValue="") String muid
			,@RequestParam(value="pageNo",required=false,defaultValue="1") int pageNo
			,@RequestParam(value="pageSize",required=false,defaultValue="10") int pageSize) throws Exception {
		common(session,true,"customer",muid);
		 
		if(    muid.equals("128") //신규신청
			|| muid.equals("129") //AS신
			|| muid.equals("130") //이사설치신청
			|| muid.equals("131") //신청내역조회
			|| muid.equals("136") //결제방법변경신청
			|| muid.equals("215") //해지신청
			){
			if(Session.chkLogin(session,mav)){
				if(muid.equals("131")){
					SmsParameter smsParameter = new SmsParameter(pageNo,pageSize,session.getAttribute("userid").toString());
					ArrayList<TWEBSVR> listSms = (ArrayList<TWEBSVR>)sqlMapClientTemplateSMS.queryForList("listSmsRequest",smsParameter);
					ArrayList<TWEBSVR> listSms2 = (ArrayList<TWEBSVR>)sqlMapClientTemplate.queryForList("listSmsRequest",smsParameter);
					
					for(TWEBSVR item:listSms2){
						listSms.add(item);
					}
					
					for(TWEBSVR item:listSms){
						item.setWEBSVRAADR(getAddress(item.getWEBSVRPOST()));
						item.setRequestInfo(getRequestInfo(item.getWEBSVRMJCD(), item.getWEBSVRSVCD()));
						item.setStatus(getStatus(item.getWEBSVRPRGB()));
						item.setWEBSVRRCOM(Common.replaceLineToBR(item.getWEBSVRRCOM()));
					}
					mav.addObject("listSms",listSms);
					mav.addObject("listTotal",listSms.size());
				}else{
					Calendar today = Calendar.getInstance();
					int year = today.get(Calendar.YEAR);
					int month = today.get(Calendar.MONTH)+1;
					int day = today.get(Calendar.DATE);
					
					mav.addObject("year",year);
					mav.addObject("month",month);
					mav.addObject("day",day);
				}
			}else{
				mav.setViewName("include/common_receive");
				mav.addObject("msg", "로그인후 이용해주세요.");
				mav.addObject("go_url", ctxRoot+"user/login.htm?ret_url="+ctxRoot+"contents/customer.htm?muid="+muid);
			}
		}
		return mav;
	}
	
	@RequestMapping(value="/smsRequest.htm",method=RequestMethod.POST)
	public ModelAndView smsRequest(HttpServletRequest request) throws Exception {
		common(request.getSession(),true,"customer","128");
		request.setCharacterEncoding("euc-kr");
		
		String mode = Common.strToStr(request.getParameter("mode"),"new");
		String mjcd = Common.strToStr(request.getParameter("mjcd"));
		String srno = Common.strToStr(request.getParameter("srno"));
		String name = Common.strToStr(request.getParameter("name"));
		String htrg = Common.strToStr(request.getParameter("htrg"));
		String htel_1 = Common.strToStr(request.getParameter("htel_1"));
		String htel_2 = Common.strToStr(request.getParameter("htel_2"));
		String mtrg = Common.strToStr(request.getParameter("mtrg"));
		String mtel_1 = Common.strToStr(request.getParameter("mtel_1"));
		String mtel_2 = Common.strToStr(request.getParameter("mtel_2"));
		String zipcode = Common.strToStr(request.getParameter("zipcode"));
		//String address1 = Common.strToStr(request.getParameter("address1"));
		String address2 = Common.strToStr(request.getParameter("address2"));
		String zipcode2 = Common.strToStr(request.getParameter("zipcode2"));
		//String address21 = Common.strToStr(request.getParameter("address21"));
		String address22 = Common.strToStr(request.getParameter("address22"));
		
		String tigb_1 = Common.strToStr(request.getParameter("tigb_1"));
		String chgb = Common.strToStr(request.getParameter("chgb"));
		String chgb2 = Common.strToStr(request.getParameter("chgb2"));
		String chgb3 = Common.strToStr(request.getParameter("chgb3"));
		int p_year = Common.strToInt(request.getParameter("p_year"));
		int p_month = Common.strToInt(request.getParameter("p_month"));
		int p_day = Common.strToInt(request.getParameter("p_day"));
		String memo = Common.strToStr(request.getParameter("memo"));
		String isDel = Common.strToStr(request.getParameter("isDel"));
		
		if(mode.equals("new")){
			srno = (String)sqlMapClientTemplateSMS.queryForObject("getReceipNo");
			sqlMapClientTemplateSMS.update("setReceipNo",srno);
		}else{
			
		}
		
		String MSID = "101"; // 방송국ID
		String SRNO = srno; // 접수번호
		String USID = session.getAttribute("userid").toString(); // 회원ID
		String CUST = session.getAttribute("userid").toString(); // 가입자ID
		String NAME = name; // 회원명
		String HTRG = htrg; // 전화번호(국번)
		String HTEL;
		if(htel_1.length()>0 && htel_2.length()>0) HTEL = htel_1 + "-" + htel_2; // 전화번호
		else HTEL = "";
		String MTRG = mtrg; // 휴대폰번호(국번)
		String MTEL;
		if(mtel_1.length()>0 && mtel_2.length()>0) MTEL = mtel_1 + "-" + mtel_2; // 휴대폰번호
		else MTEL = "";
		String POST = zipcode.replace("-", ""); // 우편번호
		String ADDR = address2; // 주소
		String MJCD = mjcd; // 작업유형 NW:신규, AS: AS, MV:이전, BK: 자동이체신청, 해지:DI
		String SVCD; // 서비스유형 ATV:아날로그, DTV;디지털 ISP:인터넷, PHO:인터넷전화, NET:초고속인터넷, EYE:DV아이, CTV:스마트CCTV, SDD:디지털TV+초고속인터넷, STT:디지털TV+초고속인터넷+인터넷전화, SQQ:디지털TV+초고속인터넷+인터넷전화+DV아이
		if(tigb_1.equals("TV")) SVCD = chgb;
		else if(tigb_1.equals("ISP")) SVCD = chgb2;
		else if(tigb_1.equals("SUMM")) SVCD = chgb3;
		else SVCD = tigb_1;
		String APST = zipcode2.replace("-", ""); // 신규우편번호
		String AADR = address22; // 신규주소
		String RQDT = String.format("%4d.%02d.%02d", p_year, p_month, p_day); // 희망일자
		String FRTM = ""; // 연락가능시작시간
		String TOTM = ""; // 연락가능종료시간
		String RCOM = memo; // 기타요청사항
		String PRGB; // 처리구분 
		if(isDel.equals("Y")) PRGB = "E";
		else PRGB = "N";
		String PRDT = ""; // 처리일
		String WMAN = ""; // 처리자
		String SMSR = ""; // SMS접수번호
		String WCOM = ""; // 처리비고
		String CWHY = ""; // 취소사유
		//String LMDT; // 최종변경일 DATE
		String LMID ="WEB"; // 최종변경자
		//String OPDT; // 최초등록일 DATE
		String OPID ="WEB"; // 최초등록자
		String RQBK = ""; // 은행코드
		String ACNO = ""; // 계좌번호
		String ACNM = ""; // 계좌명
		
		TWEBSVR sms = new TWEBSVR();
		sms.setWEBSVRMSID(MSID);
		sms.setWEBSVRSRNO(SRNO);
		sms.setWEBSVRUSID(USID);
		sms.setWEBSVRCUST(CUST);
		sms.setWEBSVRNAME(NAME);
		sms.setWEBSVRHTRG(HTRG);
		sms.setWEBSVRHTEL(HTEL);
		sms.setWEBSVRMTRG(MTRG);
		sms.setWEBSVRMTEL(MTEL);
		sms.setWEBSVRPOST(POST);
		sms.setWEBSVRADDR(ADDR);
		sms.setWEBSVRMJCD(MJCD);
		sms.setWEBSVRSVCD(SVCD);
		sms.setWEBSVRAPST(APST);
		sms.setWEBSVRAADR(AADR);
		sms.setWEBSVRRQDT(RQDT);
		sms.setWEBSVRFRTM(FRTM);
		sms.setWEBSVRTOTM(TOTM);
		sms.setWEBSVRRCOM(RCOM);
		sms.setWEBSVRPRGB(PRGB);
		sms.setWEBSVRPRDT(PRDT);
		sms.setWEBSVRWMAN(WMAN);
		sms.setWEBSVRSMSR(SMSR);
		sms.setWEBSVRWCOM(WCOM);
		sms.setWEBSVRCWHY(CWHY);
		//sms.setWEBSVRLMDT("sysdate");
		sms.setWEBSVRLMID(LMID);
		//service.setWEBSVROPDT("sysdate");
		sms.setWEBSVROPID(OPID);
		sms.setWEBSVRRQBK(RQBK);
		sms.setWEBSVRACNO(ACNO);
		sms.setWEBSVRACNM(ACNM);
		
		sqlMapClientTemplateSMS.insert("insertSmsRequest",sms);
		
		mav.setViewName("include/common_receive");
		mav.addObject("msg", "접수되었습니다.");
		mav.addObject("go_url", ctxRoot+"contents/customer.htm?muid=131");
		
		return mav;
	}
	
	private String getAddress(String zipcode){
		String tmpZipcode = zipcode.substring(0,3)+"-"+zipcode.substring(3,6);
		Zipcode tmpAddress = (Zipcode)sqlMapClientTemplate.queryForObject("getAddress",tmpZipcode);
		String address;
		if(tmpAddress!=null)
			address = tmpAddress.getZp_gugun() + " " + tmpAddress.getZp_dong();
		else
			address = tmpZipcode;
		return address;
	}
	
	private String getRequestInfo(String tmpType, String tmpService){
		String requestInfo;
		
		if(tmpType!=null){
			if(tmpType.equals("NW")) tmpType = "신규가입";
			else if(tmpType.equals("AS")) tmpType = "AS신청";
			else if(tmpType.equals("MV")) tmpType = "이전신청";
			else if(tmpType.equals("BK")) tmpType = "자동이체신청";
			else if(tmpType.equals("DI")) tmpType = "해지신청";
			else if(tmpType.equals("AD")) tmpType = "추가";
			else if(tmpType.equals("CD")) tmpType = "미납요금결제";
			else tmpType = "기타";
		}else tmpType="기타";
		
		if(tmpService!=null){
			if(tmpService.equals("ATV")) tmpService = "아날로그 방송";
			else if(tmpService.equals("DTV")) tmpService = "디지털 방송";
			else if(tmpService.equals("ISP")) tmpService = "인터넷";
			else if(tmpService.equals("PHO")) tmpService = "인터넷전화";
			else if(tmpService.equals("NET")) tmpService = "초고속인터넷";
			else if(tmpService.equals("EYE")) tmpService = "DV아이";
			else if(tmpService.equals("CTV")) tmpService = "스마트CCTV";
			else if(tmpService.equals("SDD")) tmpService = "디지털TV+초고속인터넷";
			else if(tmpService.equals("STT")) tmpService = "디지털TV+초고속인터넷+인터넷전화";
			else if(tmpService.equals("SQQ")) tmpService = "디지털TV+초고속인터넷+인터넷전화+DV아이";
			else if(tmpService.equals("PRO")) tmpService = "KCTV유해차단서비스";
			else tmpService="기타";
		}else tmpService="기타";
		
		if(tmpService.equals(""))
			requestInfo = tmpType;
		else
			requestInfo = tmpType+" / "+tmpService;
		return requestInfo;
	}
	
	private String getStatus(String tmpStatus){
		String status;
		if(tmpStatus!=null){
			if(tmpStatus.equals("N")) tmpStatus = "접수중";
			else if(tmpStatus.equals("E")) tmpStatus = "접수취소";
			else if(tmpStatus.equals("Y")) tmpStatus = "접수완료";
			else tmpStatus = "기타";
		}else tmpStatus="";
		
		status = tmpStatus;
		
		return status;
	}
}
