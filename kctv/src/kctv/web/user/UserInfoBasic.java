package kctv.web.user;

/**
 * <pre>
 * kctv.web.user
 * UserInfoBasic.java
 * </pre>
 * <pre>
 * 회원 정보에 대한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class UserInfoBasic {
	String id;
	String name;
	String zipcode;
	String address1;
	String address2;
	String phone;
	String cellphone;
	String email;
	String regdate;
	String accessdate;
	boolean mailing;
	int level;
	int status;
	
	public UserInfoBasic(){}
	
	public UserInfoBasic(String id, String name, String zipcode, String address1, String address2, String phone, String cellphone, String email){
		this.id=id;
		this.name=name;
		this.zipcode=zipcode;
		this.address1=address1;
		this.address2=address2;
		this.phone=phone;
		this.cellphone=cellphone;
		this.email=email;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getAccessdate() {
		return accessdate;
	}
	public void setAccessdate(String accessdate) {
		this.accessdate = accessdate;
	}
	public boolean isMailing() {
		return mailing;
	}
	public void setMailing(boolean mailing) {
		this.mailing = mailing;
	}
	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
