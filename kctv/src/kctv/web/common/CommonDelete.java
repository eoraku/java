package kctv.web.common;

/**
 * <pre>
 * kctv.web.common
 * CommonDelete.java
 * </pre>
 * <pre>
 * DB 삭제 쿼리 시 사용할 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class CommonDelete {
	String table;
	String where;
	String limit;
	
	public CommonDelete(){
		
	}
	
	public CommonDelete(String table, String where){
		this.table = table;
		this.where = where;
		this.limit = "";
	}
	
	/**
	 * @param table
	 * @param where
	 * @param limit 1건 삭제를 위한 플래그값
	 */
	public CommonDelete(String table, String where, boolean limit){
		this.table = table;
		this.where = where;
		if(limit)
			this.where += " and rownum<=1";
	}
	
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
}
