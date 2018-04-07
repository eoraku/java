package kctv.web.admin;

/**
 * <pre>
 * kctv.web.admin
 * Menu.java
 * </pre>
 * <pre>
 * 관리자 메뉴를 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class Menu {
	int cmme_uid;
	String cmme_name;
	int cmme_depth;
	int cmme_parent;
	int cmme_d1;
	int cmme_d2;
	int cmme_d3;
	int cmme_d4;
	int cmme_d5;
	String cmme_link;
	String cmme_link_target;
	int cmme_is_view;
	int cmme_direct_uid;
	
	public int getCmme_uid() {
		return cmme_uid;
	}
	public void setCmme_uid(int cmme_uid) {
		this.cmme_uid = cmme_uid;
	}
	public String getCmme_name() {
		return cmme_name;
	}
	public void setCmme_name(String cmme_name) {
		this.cmme_name = cmme_name;
	}
	public int getCmme_depth() {
		return cmme_depth;
	}
	public void setCmme_depth(int cmme_depth) {
		this.cmme_depth = cmme_depth;
	}
	public int getCmme_parent() {
		return cmme_parent;
	}
	public void setCmme_parent(int cmme_parent) {
		this.cmme_parent = cmme_parent;
	}
	public int getCmme_d1() {
		return cmme_d1;
	}
	public void setCmme_d1(int cmme_d1) {
		this.cmme_d1 = cmme_d1;
	}
	public int getCmme_d2() {
		return cmme_d2;
	}
	public void setCmme_d2(int cmme_d2) {
		this.cmme_d2 = cmme_d2;
	}
	public int getCmme_d3() {
		return cmme_d3;
	}
	public void setCmme_d3(int cmme_d3) {
		this.cmme_d3 = cmme_d3;
	}
	public int getCmme_d4() {
		return cmme_d4;
	}
	public void setCmme_d4(int cmme_d4) {
		this.cmme_d4 = cmme_d4;
	}
	public int getCmme_d5() {
		return cmme_d5;
	}
	public void setCmme_d5(int cmme_d5) {
		this.cmme_d5 = cmme_d5;
	}
	public String getCmme_link() {
		return cmme_link;
	}
	public void setCmme_link(String cmme_link) {
		this.cmme_link = cmme_link;
	}
	public String getCmme_link_target() {
		return cmme_link_target;
	}
	public void setCmme_link_target(String cmme_link_target) {
		this.cmme_link_target = cmme_link_target;
	}
	public int getCmme_is_view() {
		return cmme_is_view;
	}
	public void setCmme_is_view(int cmme_is_view) {
		this.cmme_is_view = cmme_is_view;
	}
	public int getCmme_direct_uid() {
		return cmme_direct_uid;
	}
	public void setCmme_direct_uid(int cmme_direct_uid) {
		this.cmme_direct_uid = cmme_direct_uid;
	}
}
