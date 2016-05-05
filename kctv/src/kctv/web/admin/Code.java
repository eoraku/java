package kctv.web.admin;

/**
 * <pre>
 * kctv.web.admin
 * Code.java
 * </pre>
 * <pre>
 * 코드 정보 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 27.
 * @version: 
 */
public class Code {
	int code_uid;
	String code_name;
	int code_depth;
	int code_parent;
	int code_d1;
	int code_d2;
	int code_d3;
	int code_d4;
	int code_d5;
	String code_regdate;
	int code_is_view;
	String code_number;
	
	public int getCode_uid() {
		return code_uid;
	}
	public void setCode_uid(int code_uid) {
		this.code_uid = code_uid;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public int getCode_depth() {
		return code_depth;
	}
	public void setCode_depth(int code_depth) {
		this.code_depth = code_depth;
	}
	public int getCode_parent() {
		return code_parent;
	}
	public void setCode_parent(int code_parent) {
		this.code_parent = code_parent;
	}
	public int getCode_d1() {
		return code_d1;
	}
	public void setCode_d1(int code_d1) {
		this.code_d1 = code_d1;
	}
	public int getCode_d2() {
		return code_d2;
	}
	public void setCode_d2(int code_d2) {
		this.code_d2 = code_d2;
	}
	public int getCode_d3() {
		return code_d3;
	}
	public void setCode_d3(int code_d3) {
		this.code_d3 = code_d3;
	}
	public int getCode_d4() {
		return code_d4;
	}
	public void setCode_d4(int code_d4) {
		this.code_d4 = code_d4;
	}
	public int getCode_d5() {
		return code_d5;
	}
	public void setCode_d5(int code_d5) {
		this.code_d5 = code_d5;
	}
	public String getCode_regdate() {
		return code_regdate;
	}
	public void setCode_regdate(String code_regdate) {
		this.code_regdate = code_regdate;
	}
	public int getCode_is_view() {
		return code_is_view;
	}
	public void setCode_is_view(int code_is_view) {
		this.code_is_view = code_is_view;
	}
	public String getCode_number() {
		return code_number;
	}
	public void setCode_number(String code_number) {
		this.code_number = code_number;
	}
}
