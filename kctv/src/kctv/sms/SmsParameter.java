package kctv.sms;

/**
 * <pre>
 * kctv.sms
 * SmsParameter.java
 * </pre>
 * <pre>
 * sms 전송 요청 검색을 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class SmsParameter {
	int pageNo;
	int pageSize;
	int rowBegin;
	int rowEnd;
	String userid;
	
	public SmsParameter(){
		
	}
	
	public SmsParameter(int pageNo, int pageSize, String userid){
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.rowBegin = ((pageNo-1)*pageSize)+1;
		this.rowEnd = pageNo*pageSize;
		this.userid = userid;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getRowBegin() {
		return rowBegin;
	}
	public void setRowBegin(int rowBegin) {
		this.rowBegin = rowBegin;
	}
	public int getRowEnd() {
		return rowEnd;
	}
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
}
