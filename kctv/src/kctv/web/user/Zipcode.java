package kctv.web.user;

/**
 * <pre>
 * kctv.web.user
 * Zipcode.java
 * </pre>
 * <pre>
 * 우편번호 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class Zipcode {
	int zp_uid;
	String zp_zipcode;
	String zp_sido;
	String zp_gugun;
	String zp_dong;
	String zp_bunji;
	
	String address1;
	String address2;
	
	public int getZp_uid() {
		return zp_uid;
	}
	public void setZp_uid(int zp_uid) {
		this.zp_uid = zp_uid;
	}
	public String getZp_zipcode() {
		return zp_zipcode;
	}
	public void setZp_zipcode(String zp_zipcode) {
		this.zp_zipcode = zp_zipcode;
	}
	public String getZp_sido() {
		return zp_sido;
	}
	public void setZp_sido(String zp_sido) {
		this.zp_sido = zp_sido;
	}
	public String getZp_gugun() {
		return zp_gugun;
	}
	public void setZp_gugun(String zp_gugun) {
		this.zp_gugun = zp_gugun;
	}
	public String getZp_dong() {
		return zp_dong;
	}
	public void setZp_dong(String zp_dong) {
		this.zp_dong = zp_dong;
	}
	public String getZp_bunji() {
		return zp_bunji;
	}
	public void setZp_bunji(String zp_bunji) {
		this.zp_bunji = zp_bunji;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
}
