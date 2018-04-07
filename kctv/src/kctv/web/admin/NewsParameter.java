package kctv.web.admin;

import kctv.web.common.Common;

/**
 * <pre>
 * kctv.web.admin
 * NewsParameter.java
 * </pre>
 * <pre>
 * 뉴스 리스트 조회를 위한 모델 클래스
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

	int guid;
	String schType;
	String schText;
	
	String andWhere;
	
	public NewsParameter(){
	}
	
	public NewsParameter(int pageNo, int pageSize, int guid, String schType, String schText){
		setNewsParameter(pageNo, pageSize, guid, schType, schText, false, false, null, null);
	}
	
	public NewsParameter(int pageNo, int pageSize, int guid, String schType, String schText, boolean isHot){
		setNewsParameter(pageNo, pageSize, guid, schType, schText, isHot, false, null, null);
	}
	
	public NewsParameter(int pageNo, int pageSize, int guid, String schType, String schText, String ldate1, String ldate2){
		setNewsParameter(pageNo, pageSize, guid, schType, schText, false, false, ldate1, ldate2);
	}
	
	public NewsParameter(int pageNo, int pageSize, int guid, String schType, String schText, boolean isHot, boolean isImage){
		setNewsParameter(pageNo, pageSize, guid, schType, schText, isHot, isImage, null, null);
	}
	
	private void setNewsParameter(int pageNo, int pageSize, int guid, String schType, String schText, boolean isHot, boolean isImage, String ldate1, String ldate2){
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.rowBegin = ((pageNo-1)*pageSize)+1;
		this.rowEnd = pageNo*pageSize;
		
		this.guid = guid;
		this.schType = schType;
		this.schText = schText;
		
		andWhere = "";
		
		if(guid==-1){
			//andWhere = andWhere+" and hot_flag='1' and eng is null and chi is null";
		}else if(guid==0){
			//andWhere = andWhere+" and eng is null and chi is null";
		}else if(guid>0 && guid<9){
			andWhere = andWhere+" and group_flag = "+guid+" and eng is null and chi is null";
		}else if(guid==9){
			andWhere = andWhere+" and eng is not null and chi is null";
		}else if(guid==10){
			andWhere = andWhere+" and eng is null and chi is not null";
		}
		
		if(ldate1 != null && ldate1.length()>=8 && ldate2 != null && ldate2.length()>=8){
			if(ldate1.equals(ldate2))
				andWhere += " and ldate = '" + ldate1 + "'";
			else
				andWhere += " and ldate >= '" + ldate1 + "' and ldate <= '" + ldate2 + "'";
		}
		
		if(isHot)
			andWhere = andWhere+" and hot_flag='1'";
		
		if(isImage)
			andWhere = andWhere+" and svrfile2 is not null";
		
		if(!schType.equals("") && !schText.equals("")){
			schText = Common.replaceQuote(schText);
			if(schType.equals("title")){
				andWhere = andWhere+" and title like '%"+schText+"%'";
			}else if(schType.equals("content")){
				andWhere = andWhere+" and content like '%"+schText+"%'";
			}else if(schType.equals("name")){
				andWhere = andWhere+" and name = '"+schText+"'";
			}else if(schType.equals("date")){
				andWhere = andWhere+" and ldate like '"+schText.replace("-", "")+"%'";
			}
		}
		
		if(andWhere.length()>0){
			andWhere = "where"+andWhere.substring(4);
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
}