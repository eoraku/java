package kctv.web.common;

/**
 * <pre>
 * kctv.web.common
 * Popup.java
 * </pre>
 * <pre>
 * 팝업 이용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 17.
 * @version: 
 */
public class Popup {
	int pu_uid;
	String pu_adad_id;
	String pu_title;
	String pu_contents;
	int pu_top;
	int pu_left;
	int pu_width;
	int pu_height;
	int pu_is_active;
	String pu_start;
	String pu_end;
	String pu_bgcolor;
	int pu_is_skin;
	int pu_is_html;
	String pu_regdate;
	
	public int getPu_uid() {
		return pu_uid;
	}
	public void setPu_uid(int pu_uid) {
		this.pu_uid = pu_uid;
	}
	public String getPu_adad_id() {
		return pu_adad_id;
	}
	public void setPu_adad_id(String pu_adad_id) {
		this.pu_adad_id = pu_adad_id;
	}
	public String getPu_title() {
		return pu_title;
	}
	public void setPu_title(String pu_title) {
		this.pu_title = pu_title;
	}
	public String getPu_contents() {
		return pu_contents;
	}
	public void setPu_contents(String pu_contents) {
		this.pu_contents = pu_contents;
	}
	public int getPu_top() {
		return pu_top;
	}
	public void setPu_top(int pu_top) {
		this.pu_top = pu_top;
	}
	public int getPu_left() {
		return pu_left;
	}
	public void setPu_left(int pu_left) {
		this.pu_left = pu_left;
	}
	public int getPu_width() {
		return pu_width;
	}
	public void setPu_width(int pu_width) {
		this.pu_width = pu_width;
	}
	public int getPu_height() {
		return pu_height;
	}
	public void setPu_height(int pu_height) {
		this.pu_height = pu_height;
	}
	public int getPu_is_active() {
		return pu_is_active;
	}
	public void setPu_is_active(int pu_is_active) {
		this.pu_is_active = pu_is_active;
	}
	public String getPu_start() {
		return pu_start;
	}
	public void setPu_start(String pu_start) {
		this.pu_start = pu_start;
	}
	public String getPu_end() {
		return pu_end;
	}
	public void setPu_end(String pu_end) {
		this.pu_end = pu_end;
	}
	public String getPu_bgcolor() {
		return pu_bgcolor;
	}
	public void setPu_bgcolor(String pu_bgcolor) {
		this.pu_bgcolor = pu_bgcolor;
	}
	public int getPu_is_skin() {
		return pu_is_skin;
	}
	public void setPu_is_skin(int pu_is_skin) {
		this.pu_is_skin = pu_is_skin;
	}
	public int getPu_is_html() {
		return pu_is_html;
	}
	public void setPu_is_html(int pu_is_html) {
		this.pu_is_html = pu_is_html;
	}
	public String getPu_regdate() {
		return pu_regdate;
	}
	public void setPu_regdate(String pu_regdate) {
		this.pu_regdate = pu_regdate;
	}
}
