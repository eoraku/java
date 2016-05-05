package kctv.web.user;

/**
 * <pre>
 * kctv.web.user
 * ChkLogin.java
 * </pre>
 * <pre>
 * 로그인 이용시 사용할 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 12.
 * @version: 
 */
public class ChkLogin {
	String userid;
	String userpw;
	
	public ChkLogin(String userid, String userpw){
		this.userid=userid;
		this.userpw=userpw;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
}
