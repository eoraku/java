package kctv.web.search;

/**
 * <pre>
 * kctv.web.search
 * SearchParameter.java
 * </pre>
 * 검색시 검색API 로 전달하는 인자 정보를 갖는 모델 클래스입니다.
 * <pre>
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 11.
 * @version: 
 */
public class SearchParameter {
	int pageNo;
	int pageSize;
	int rowBegin;
	int rowEnd;
	String schText;
	private String nSearchDate;
	
	String listWhere;
	
	public SearchParameter(){
	}
	
	public SearchParameter(String schText, int pageNo, int pageSize){
		this.schText = schText;
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.rowBegin = ((pageNo-1)*pageSize)+1;
		this.rowEnd = pageNo*pageSize;
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
	

	public String getSchText() {
		return schText;
	}

	public void setSchText(String schText) {
		this.schText = schText;
	}

	public String getlistWhere() {
		return listWhere;
	}

	public void setlistWhere(String whereCategory) {
		this.listWhere = whereCategory;
	}

	public String getnSearchDate() {
		return nSearchDate;
	}

	public void setnSearchDate(String nSearchDate) {
		this.nSearchDate = nSearchDate;
	}
}
