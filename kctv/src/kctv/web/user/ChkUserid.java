package kctv.web.user;

/**
 * <pre>
 * kctv.web.user
 * ChkUserid.java
 * </pre>
 * <pre>
 * 유저아이디 중복 검사시 사용할 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class ChkUserid {
	int cntUserid;
	String isAvailable;
	
	public ChkUserid(int cntUserid){
		this.cntUserid = cntUserid;
		
		if(cntUserid>0)
			this.isAvailable = "no";
		else
			this.isAvailable = "yes";
	}
	
	public int getCntUserid() {
		return cntUserid;
	}
	public void setCntUserid(int cntUserid) {
		this.cntUserid = cntUserid;
	}
	public String getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}
}
