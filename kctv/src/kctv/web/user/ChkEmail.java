package kctv.web.user;

/**
 * <pre>
 * kctv.web.user
 * ChkEmail.java
 * </pre>
 * <pre>
 * 이메일 체크시 사용할 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 12.
 * @version: 
 */
public class ChkEmail {
	String userid;
	String email;
	
	public ChkEmail(String userid,String email){
		this.userid=userid;
		this.email=email;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
