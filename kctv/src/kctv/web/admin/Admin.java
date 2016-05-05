package kctv.web.admin;

/**
 * <pre>
 * kctv.web.admin
 * Admin.java
 * </pre>
 * <pre>
 * 관리자 정보 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 27.
 * @version: 
 */
public class Admin {
	String adad_id;
	String adad_name;
	String adad_passwd;
	int adad_level;
	String adad_auth_menu;
	
	String adde_email;
	
	String andWhere = "";
	
	public Admin(){
		
	}
	
	public Admin(String id, String pw){
		this.adad_id = id;
		this.adad_passwd = pw;
	}
	
	public Admin(String id, String name, int level, String menus){
		this.adad_id = id;
		this.adad_name = name;
		this.adad_level = level;
		this.adad_auth_menu = menus;
		
		if(level>2)
			this.andWhere += " and (adme_auth = 0 or substring(adme_code,1,2) in (\""+adad_auth_menu.replace("|", "\",\"")+"\"))";
	}
	
	public String getAdad_id() {
		return adad_id;
	}
	public void setAdad_id(String adad_id) {
		this.adad_id = adad_id;
	}
	public String getAdad_name() {
		return adad_name;
	}
	public void setAdad_name(String adad_name) {
		this.adad_name = adad_name;
	}
	public String getAdad_passwd() {
		return adad_passwd;
	}
	public void setAdad_passwd(String adad_passwd) {
		this.adad_passwd = adad_passwd;
	}
	public int getAdad_level() {
		return adad_level;
	}
	public void setAdad_level(int adad_level) {
		this.adad_level = adad_level;
	}
	public String getAdad_auth_menu() {
		return adad_auth_menu;
	}
	public void setAdad_auth_menu(String adad_auth_menu) {
		this.adad_auth_menu = adad_auth_menu;
	}
	public String getAdde_email() {
		return adde_email;
	}
	public void setAdde_email(String adde_email) {
		this.adde_email = adde_email;
	}
	public String getAndWhere() {
		return andWhere;
	}
	public void setAndWhere(String andWhere) {
		this.andWhere = andWhere;
	}
}
