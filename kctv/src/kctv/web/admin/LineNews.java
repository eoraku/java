package kctv.web.admin;

/**
 * <pre>
 * kctv.web.admin
 * LineNews.java
 * </pre>
 * <pre>
 * 자막 뉴스를 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class LineNews {
	String bd_userid;
	String bd_email;
	String bd_contents;
	String bd_modifydate;
	
	public LineNews(){
		
	}
	
	public LineNews(String userid, String contents){
		this.bd_userid = userid;
		this.bd_contents = contents;
	}
	
	public String getBd_userid() {
		return bd_userid;
	}
	public void setBd_userid(String bd_userid) {
		this.bd_userid = bd_userid;
	}
	public String getBd_email() {
		return bd_email;
	}
	public void setBd_email(String bd_email) {
		this.bd_email = bd_email;
	}
	public String getBd_contents() {
		return bd_contents;
	}
	public void setBd_contents(String bd_contents) {
		this.bd_contents = bd_contents;
	}
	public String getBd_modifydate() {
		return bd_modifydate;
	}
	public void setBd_modifydate(String bd_modifydate) {
		this.bd_modifydate = bd_modifydate;
	}
}
