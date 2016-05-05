package kctv.web.common;

/**
 * <pre>
 * kctv.web.common
 * PopupParameter.java
 * </pre>
 * <pre>
 * Database 팝업 정보 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 17.
 * @version: 
 */
public class PopupParameter {
	int pageNo;
	int pageSize;
	int rowBegin;
	int rowEnd;

	String schType;
	String schText;
	
	String where;
	
	public PopupParameter(){
		
	}
	
	public PopupParameter(int pageNo, int pageSize, String schType, String schText){
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.rowBegin = ((pageNo-1)*pageSize)+1;
		this.rowEnd = pageNo*pageSize;
		this.schType = schType;
		this.schText = schText;
		this.where = "";
	}
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRowBegin() {
		return rowBegin;
	}

	public void setRowBegin(int rowBegin) {
		this.rowBegin = rowBegin;
	}

	public int getRowEnd() {
		return rowEnd;
	}

	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}

	public String getSchType() {
		return schType;
	}

	public void setSchType(String schType) {
		this.schType = schType;
	}

	public String getSchText() {
		return schText;
	}

	public void setSchText(String schText) {
		this.schText = schText;
	}

	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}
}
