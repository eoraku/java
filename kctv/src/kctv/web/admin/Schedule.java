package kctv.web.admin;

/**
 * <pre>
 * kctv.web.admin
 * Schedule.java
 * </pre>
 * <pre>
 * 관리자 페이지 CH7 편성표 관리 시 데이터 파라미터 모델로 사용되는 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class Schedule {
	int num;
	String pd;
	String title;
	String firstdt;
	String content;
	
	public Schedule(){
		
	}
	
	public Schedule(String writer, String title, String firstdt, String content){
		this.pd = writer;
		this.title = title;
		this.firstdt = firstdt;
		this.content = content;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPd() {
		return pd;
	}
	public void setPd(String pd) {
		this.pd = pd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFirstdt() {
		return firstdt;
	}
	public void setFirstdt(String firstdt) {
		this.firstdt = firstdt;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
