package kctv.web.common;

/**
 * <pre>
 * kctv.web.common
 * CountUpdate.java
 * </pre>
 * <pre>
 * 클래스 네임 리팩토링 필요할 듯함.
 * 특정 Table , Field 에 대해 Where 절을 설정 할 수 있게 만든 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class CountUpdate {
	String table;
	String field;
	String where;
	
	public CountUpdate(String strTable,String strField,  String strWhere){
		this.table = strTable;
		this.field = strField;
		this.where = strWhere;
	}
	
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
}
