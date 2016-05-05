package kctv.web.search;

/**
 * <pre>
 * kctv.web.search
 * SearchValue.java
 * </pre>
 * <pre>
 * 전임자가 작성한 클래스입니다.
 * 검색어 입력값에 대한 Model 클래스로 홈페이지 검색에서 검색어 DB 입력까지 처리할 때 사용됩니다. text_uid, text_real, text_view, text_cnt, regdate, text_use, referer, ip 에 대한 getter setter
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 11.
 * @version: 
 */
public class SearchValue {
	int text_uid;
	String text_real;
	String text_view;
	int text_cnt;
	String regdate;
	String text_use;
	String referer;
	String ip;
	
	public int getText_uid() {
		return text_uid;
	}
	public void setText_uid(int text_uid) {
		this.text_uid = text_uid;
	}
	public String getText_real() {
		return text_real;
	}
	public void setText_real(String text_real) {
		this.text_real = text_real;
	}
	public String getText_view() {
		return text_view;
	}
	public void setText_view(String text_view) {
		this.text_view = text_view;
	}
	public int getText_cnt() {
		return text_cnt;
	}
	public void setText_cnt(int text_cnt) {
		this.text_cnt = text_cnt;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getText_use() {
		return text_use;
	}
	public void setText_use(String text_use) {
		this.text_use = text_use;
	}
	public String getReferer() {
		return referer;
	}
	public void setReferer(String referer) {
		this.referer = referer;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}
