package kctv.web.cms;

/**
 * <pre>
 * kctv.web.cms
 * CmSubMenu.java
 * </pre>
 * <pre>
 * CM_MENU 의 하위 메뉴 조회때 사용하는 모델 클래스(궂이 필요없음)
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class CmSubMenu {
	String cmme_uid;
	String cmme_name;
	String cmct_type;
	String cmct_exefile;
	
	public String getCmme_uid() {
		return cmme_uid;
	}
	public void setCmme_uid(String cmme_uid) {
		this.cmme_uid = cmme_uid;
	}
	public String getCmme_name() {
		return cmme_name;
	}
	public void setCmme_name(String cmme_name) {
		this.cmme_name = cmme_name;
	}
	public String getCmct_type() {
		return cmct_type;
	}
	public void setCmct_type(String cmct_type) {
		this.cmct_type = cmct_type;
	}
	public String getCmct_exefile() {
		return cmct_exefile;
	}
	public void setCmct_exefile(String cmct_exefile) {
		this.cmct_exefile = cmct_exefile;
	}
}
