package kctv.web.user;

/**
 * <pre>
 * kctv.web.user
 * User.java
 * </pre>
 * <pre>
 * 회원 정보에 대한 모델 클래스
 * UserInfoBasic과 같이 있는데 수정이 필요할 것으로 판단됨.
 * User 클래스는 회원 가입시 사용되어있고 UserInfoBasic은 회원 정보 수정시 사용되고 있음
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 12.
 * @version: 
 */
public class User {
	int num;
	String id;
	String passwd;
	String name;
	String jumin;
	String zipcode;
	String address1;
	String address2;
	String phone;
	String cellphone;
	String email;
	String regdate;
	String accessdate;
	int mailing;
	int hit;
	int level;
	int status;
	String intro;
	String group;
	
	int linenum;

	public User(){
	}

	// 회원가입
	public User(String id,
				String passwd,
				String name,
				String jumin,
				String zipcode,
				String address1,
				String address2,
				String phone,
				String cellphone,
				String email,
				int mailing
			) {
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.jumin = jumin;
		this.email = email;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.phone = phone;
		this.cellphone = cellphone;
		this.email = email;
		this.mailing = mailing;
		this.hit = 0;
		this.level = 99;
		this.status = 1;
		this.intro = "";
		this.group = "";
	}
	
	// 회원 기본정보
	public User(String id,
			String name,
			String zipcode,
			String address1,
			String address2,
			String phone,
			String cellphone,
			String email,
			int mailing,
			int hit,
			int level,
			int status) {
	this.id = id;
	this.name = name;
	this.email = email;
	this.zipcode = zipcode;
	this.address1 = address1;
	this.address2 = address2;
	this.phone = phone;
	this.cellphone = cellphone;
	this.email = email;
	this.mailing = mailing;
	this.hit = hit;
	this.level = level;
	this.status = status;
	this.intro = "";
	this.group = "";
	}
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public String getPasswd() {
		return passwd;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getJumin() {
		return jumin;
	}
	
	public void setJumin(String jumin) {
		this.jumin=jumin;
	}
	
	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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

	public int getMailing() {
		return mailing;
	}

	public int isMailing() {
		return mailing;
	}

	public void setMailing(int mailing) {
		this.mailing = mailing;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
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

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public int getLinenum() {
		return linenum;
	}

	public void setLinenum(int linenum) {
		this.linenum = linenum;
	}
}
