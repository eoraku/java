package kctv.web.news;

import kctv.web.common.Common;

/**
 * <pre>
 * kctv.web.news
 * NewsParameter.java
 * </pre>
 * <pre>
 * 뉴스 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class NewsParameter {
	int pageNo;
	int pageSize;
	int rowBegin;
	int rowEnd;
	int lengthContent;

	int guid;
	String schType;
	String schText;
	
	String andWhere;
	
	public NewsParameter(){
	}
	
	public NewsParameter(int pageNo, int pageSize, int guid, String schType, String schText){
		setNewsParameter(pageNo, pageSize, guid, schType, schText, false, false);
	}
	
	public NewsParameter(int pageNo, int pageSize, int guid, String schType, String schText, boolean isHot){
		setNewsParameter(pageNo, pageSize, guid, schType, schText, isHot, false);
	}
	
	public NewsParameter(int pageNo, int pageSize, int guid, String schType, String schText, boolean isHot, boolean isImage){
		setNewsParameter(pageNo, pageSize, guid, schType, schText, isHot, isImage);
	}
	
	/**
	 * @function : 전달인자 값 설정
	 * @process  : DB 검색 용 뉴스 값 파라미터 설정
	 * 
	 * @MethodName : setNewsParameter
	 * @param pageNo
	 * @param pageSize
	 * @param guid
	 * @param schType
	 * @param schText
	 * @param isHot
	 * @param isImage
	 */
	private void setNewsParameter(int pageNo, int pageSize, int guid, String schType, String schText, boolean isHot, boolean isImage){
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.rowBegin = ((pageNo-1)*pageSize)+1;
		this.rowEnd = pageNo*pageSize;
		this.lengthContent = 120;
		
		this.guid = guid;
		this.schType = schType;
		this.schText = schText;
		
		andWhere = "";
		
		if(guid==-1){
			andWhere = andWhere+" and hot_flag='1' and eng is null and chi is null";
		}else if(guid==0){
			andWhere = andWhere+" and eng is null and chi is null";
		}else if(guid==1){
			andWhere = andWhere+" and group_flag in ('1','5') and eng is null and chi is null";
		}else if(guid==2){
			andWhere = andWhere+" and group_flag in ('2','6') and eng is null and chi is null";
		}else if(guid==3){
			andWhere = andWhere+" and group_flag in ('3','7') and eng is null and chi is null";
		}else if(guid==4){
			andWhere = andWhere+" and group_flag in ('4','8') and eng is null and chi is null";
		}else if(guid==9){
			andWhere = andWhere+" and eng is not null /*and chi is null*/";
		}else if(guid==10){
			andWhere = andWhere+" /*and eng is null*/ and chi is not null";
		}
		
		if(isHot)
			andWhere = andWhere+" and hot_flag='1'";
		
		if(isImage)
			andWhere = andWhere+" and svrfile2 is not null";
		
		if(schType != null && schText != null && !schType.equals("") && !schText.equals("")){
			schText = Common.replaceQuote(schText);
			if(schType.equals("title")){
				andWhere = andWhere+" and title like '%"+schText+"%'";
			}else if(schType.equals("content")){
				andWhere = andWhere+" and content_clob like '%"+schText+"%'";
			}else if(schType.equals("name")){
				andWhere = andWhere+" and name = '"+schText+"'";
			}else if(schType.equals("date")){
				andWhere = andWhere+" and ldate like '"+schText.replace("-", "")+"%'";
			}
		}
		
		//System.out.println(andWhere);
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
	public int getLengthContent() {
		return lengthContent;
	}

	public void setLengthContent(int lengthContent) {
		this.lengthContent = lengthContent;
	}

	public int getGuid() {
		return guid;
	}
	public void setGuid(int guid) {
		this.guid = guid;
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

	public String getAndWhere() {
		return andWhere;
	}

	public void setAndWhere(String andWhere) {
		this.andWhere = andWhere;
	}
}
