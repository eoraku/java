package kctv.web.common;

/**
 * <pre>
 * kctv.web.common
 * CommonUpdate.java
 * </pre>
 * <pre>
 * 데이터베이스 필드 업데이트 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class CommonUpdate {
	String table;
	String field;
	String where;
	String value;
	
	public CommonUpdate(String table, String field, String where, String value){
		this.table = table;
		this.field = field;
		this.where = where;
		this.value = value;
	}
	
	public CommonUpdate(){
		
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
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}
