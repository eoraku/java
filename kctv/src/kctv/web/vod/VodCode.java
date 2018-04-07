package kctv.web.vod;

/**
 * <pre>
 * kctv.web.vod
 * VodCode.java
 * </pre>
 * <pre>
 * 	Vod 코드 매핑에 사용되는 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class VodCode {
	int code_uid;
	String code_name;
	int code_parent;
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
	public int getCode_parent() {
		return code_parent;
	}
	public void setCode_parent(int code_parent) {
		this.code_parent = code_parent;
	}
	public String getCode_number() {
		return code_number;
	}
	public void setCode_number(String code_number) {
		this.code_number = code_number;
	}
	
}
