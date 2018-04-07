package kctv.web.admin;

/**
 * <pre>
 * kctv.web.admin
 * AdminList.java
 * </pre>
 * <pre>
 * 관리자 권한 정보 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class AdminList {
	String id;
	String name;
	int level;
	String dept;
	String position;
	String phone;
	String accessdate;
	
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
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAccessdate() {
		return accessdate;
	}
	public void setAccessdate(String accessdate) {
		this.accessdate = accessdate;
	}
}
