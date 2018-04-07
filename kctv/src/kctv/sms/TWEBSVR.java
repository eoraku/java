package kctv.sms;

/**
 * <pre>
 * kctv.sms
 * TWEBSVR.java
 * </pre>
 * <pre>
 * KCTV 상품 변경 관련 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class TWEBSVR {
	String WEBSVRMSID; // 방송국ID
	String WEBSVRSRNO; // 접수번호
	String WEBSVRUSID; // 회원ID
	String WEBSVRCUST; // 가입자ID
	String WEBSVRNAME; // 회원명
	String WEBSVRHTRG; // 전화번호(국번)
	String WEBSVRHTEL; // 전화번호
	String WEBSVRMTRG; // 휴대폰번호(국번)
	String WEBSVRMTEL; // 휴대폰번호
	String WEBSVRPOST; // 우편번호
	String WEBSVRADDR; // 주소
	String WEBSVRMJCD; // 작업유형 NW:신규, AS: AS, MV:이전, BK: 자동이체신청, 해지:DI
	String WEBSVRSVCD; // 서비스유형 ATV:아날로그, DTV;디지털 ISP:인터넷, PHO:인터넷전화, NET:초고속인터넷, EYE:DV아이, CTV:스마트CCTV, SDD:디지털TV+초고속인터넷, STT:디지털TV+초고속인터넷+인터넷전화, SQQ:디지털TV+초고속인터넷+인터넷전화+DV아이
	String WEBSVRAPST; // 신규우편번호
	String WEBSVRAADR; // 신규주소
	String WEBSVRRQDT; // 희망일자
	String WEBSVRFRTM; // 연락가능시작시간
	String WEBSVRTOTM; // 연락가능종료시간
	String WEBSVRRCOM; // 기타요청사항
	String WEBSVRPRGB; // 처리구분 N:접수중,E:접수취소,Y:접수완료
	String WEBSVRPRDT; // 처리일
	String WEBSVRWMAN; // 처리자
	String WEBSVRSMSR; // SMS접수번호
	String WEBSVRWCOM; // 처리비고
	String WEBSVRCWHY; // 취소사유
	String WEBSVRLMDT; // 최종변경일 DATE
	String WEBSVRLMID; // 최종변경자
	String WEBSVROPDT; // 최초등록일 DATE
	String WEBSVROPID; // 최초등록자
	String WEBSVRRQBK; // 은행코드
	String WEBSVRACNO; // 계좌번호
	String WEBSVRACNM; // 계좌명
	
	String requestInfo;
	String status;
	
	public String getWEBSVRMSID() {
		return WEBSVRMSID;
	}
	public void setWEBSVRMSID(String wEBSVRMSID) {
		WEBSVRMSID = wEBSVRMSID;
	}
	public String getWEBSVRSRNO() {
		return WEBSVRSRNO;
	}
	public void setWEBSVRSRNO(String wEBSVRSRNO) {
		WEBSVRSRNO = wEBSVRSRNO;
	}
	public String getWEBSVRUSID() {
		return WEBSVRUSID;
	}
	public void setWEBSVRUSID(String wEBSVRUSID) {
		WEBSVRUSID = wEBSVRUSID;
	}
	public String getWEBSVRCUST() {
		return WEBSVRCUST;
	}
	public void setWEBSVRCUST(String wEBSVRCUST) {
		WEBSVRCUST = wEBSVRCUST;
	}
	public String getWEBSVRNAME() {
		return WEBSVRNAME;
	}
	public void setWEBSVRNAME(String wEBSVRNAME) {
		WEBSVRNAME = wEBSVRNAME;
	}
	public String getWEBSVRHTRG() {
		return WEBSVRHTRG;
	}
	public void setWEBSVRHTRG(String wEBSVRHTRG) {
		WEBSVRHTRG = wEBSVRHTRG;
	}
	public String getWEBSVRHTEL() {
		return WEBSVRHTEL;
	}
	public void setWEBSVRHTEL(String wEBSVRHTEL) {
		WEBSVRHTEL = wEBSVRHTEL;
	}
	public String getWEBSVRMTRG() {
		return WEBSVRMTRG;
	}
	public void setWEBSVRMTRG(String wEBSVRMTRG) {
		WEBSVRMTRG = wEBSVRMTRG;
	}
	public String getWEBSVRMTEL() {
		return WEBSVRMTEL;
	}
	public void setWEBSVRMTEL(String wEBSVRMTEL) {
		WEBSVRMTEL = wEBSVRMTEL;
	}
	public String getWEBSVRPOST() {
		return WEBSVRPOST;
	}
	public void setWEBSVRPOST(String wEBSVRPOST) {
		WEBSVRPOST = wEBSVRPOST;
	}
	public String getWEBSVRADDR() {
		return WEBSVRADDR;
	}
	public void setWEBSVRADDR(String wEBSVRADDR) {
		WEBSVRADDR = wEBSVRADDR;
	}
	public String getWEBSVRMJCD() {
		return WEBSVRMJCD;
	}
	public void setWEBSVRMJCD(String wEBSVRMJCD) {
		WEBSVRMJCD = wEBSVRMJCD;
	}
	public String getWEBSVRSVCD() {
		return WEBSVRSVCD;
	}
	public void setWEBSVRSVCD(String wEBSVRSVCD) {
		WEBSVRSVCD = wEBSVRSVCD;
	}
	public String getWEBSVRAPST() {
		return WEBSVRAPST;
	}
	public void setWEBSVRAPST(String wEBSVRAPST) {
		WEBSVRAPST = wEBSVRAPST;
	}
	public String getWEBSVRAADR() {
		return WEBSVRAADR;
	}
	public void setWEBSVRAADR(String wEBSVRAADR) {
		WEBSVRAADR = wEBSVRAADR;
	}
	public String getWEBSVRRQDT() {
		return WEBSVRRQDT;
	}
	public void setWEBSVRRQDT(String wEBSVRRQDT) {
		WEBSVRRQDT = wEBSVRRQDT;
	}
	public String getWEBSVRFRTM() {
		return WEBSVRFRTM;
	}
	public void setWEBSVRFRTM(String wEBSVRFRTM) {
		WEBSVRFRTM = wEBSVRFRTM;
	}
	public String getWEBSVRTOTM() {
		return WEBSVRTOTM;
	}
	public void setWEBSVRTOTM(String wEBSVRTOTM) {
		WEBSVRTOTM = wEBSVRTOTM;
	}
	public String getWEBSVRRCOM() {
		return WEBSVRRCOM;
	}
	public void setWEBSVRRCOM(String wEBSVRRCOM) {
		WEBSVRRCOM = wEBSVRRCOM;
	}
	public String getWEBSVRPRGB() {
		return WEBSVRPRGB;
	}
	public void setWEBSVRPRGB(String wEBSVRPRGB) {
		WEBSVRPRGB = wEBSVRPRGB;
	}
	public String getWEBSVRPRDT() {
		return WEBSVRPRDT;
	}
	public void setWEBSVRPRDT(String wEBSVRPRDT) {
		WEBSVRPRDT = wEBSVRPRDT;
	}
	public String getWEBSVRWMAN() {
		return WEBSVRWMAN;
	}
	public void setWEBSVRWMAN(String wEBSVRWMAN) {
		WEBSVRWMAN = wEBSVRWMAN;
	}
	public String getWEBSVRSMSR() {
		return WEBSVRSMSR;
	}
	public void setWEBSVRSMSR(String wEBSVRSMSR) {
		WEBSVRSMSR = wEBSVRSMSR;
	}
	public String getWEBSVRWCOM() {
		return WEBSVRWCOM;
	}
	public void setWEBSVRWCOM(String wEBSVRWCOM) {
		WEBSVRWCOM = wEBSVRWCOM;
	}
	public String getWEBSVRCWHY() {
		return WEBSVRCWHY;
	}
	public void setWEBSVRCWHY(String wEBSVRCWHY) {
		WEBSVRCWHY = wEBSVRCWHY;
	}
	public String getWEBSVRLMDT() {
		return WEBSVRLMDT;
	}
	public void setWEBSVRLMDT(String wEBSVRLMDT) {
		WEBSVRLMDT = wEBSVRLMDT;
	}
	public String getWEBSVRLMID() {
		return WEBSVRLMID;
	}
	public void setWEBSVRLMID(String wEBSVRLMID) {
		WEBSVRLMID = wEBSVRLMID;
	}
	public String getWEBSVROPDT() {
		return WEBSVROPDT;
	}
	public void setWEBSVROPDT(String wEBSVROPDT) {
		WEBSVROPDT = wEBSVROPDT;
	}
	public String getWEBSVROPID() {
		return WEBSVROPID;
	}
	public void setWEBSVROPID(String wEBSVROPID) {
		WEBSVROPID = wEBSVROPID;
	}
	public String getWEBSVRRQBK() {
		return WEBSVRRQBK;
	}
	public void setWEBSVRRQBK(String wEBSVRRQBK) {
		WEBSVRRQBK = wEBSVRRQBK;
	}
	public String getWEBSVRACNO() {
		return WEBSVRACNO;
	}
	public void setWEBSVRACNO(String wEBSVRACNO) {
		WEBSVRACNO = wEBSVRACNO;
	}
	public String getWEBSVRACNM() {
		return WEBSVRACNM;
	}
	public void setWEBSVRACNM(String wEBSVRACNM) {
		WEBSVRACNM = wEBSVRACNM;
	}
	public String getRequestInfo() {
		return requestInfo;
	}
	public void setRequestInfo(String requestInfo) {
		this.requestInfo = requestInfo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}