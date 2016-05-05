package kctv.xml;

/**
 * <pre>
 * kctv.xml
 * XmlParameter.java
 * </pre>
 * <pre>
 * mybatis 쿼리에 where절과 value값을 적용하기 위한 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 16.
 * @version: 
 */
public class XmlParameter {
	String where;
	String val1;
	String val2;
	
	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
	public String getVal1() {
		return val1;
	}
	public void setVal1(String val1) {
		this.val1 = val1;
	}
	public String getVal2() {
		return val2;
	}
	public void setVal2(String val2) {
		this.val2 = val2;
	}
}
