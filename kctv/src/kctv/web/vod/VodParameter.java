package kctv.web.vod;

import kctv.web.common.Common;

/**
 * <pre>
 * kctv.web.vod
 * VodParameter.java
 * </pre>
 * <pre>
 *	Vod 검색에 사용하기 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class VodParameter {
	int pageNo;
	int pageSize;
	int rowBegin;
	int rowEnd;
	
	String maincd;
	String subcd;
	String schType;
	String schText;
	
	String codeAnd="";
	String schAnd="";
	
	public VodParameter(int pageNo, String maincd, String subcd, String schType, String schText){
		setParameter(pageNo, maincd, subcd, schType, schText, 10);
	}
	
	public VodParameter(int pageNo, String maincd, String subcd, String schType, String schText, int pageSize){
		setParameter(pageNo, maincd, subcd, schType, schText, pageSize);
	}
	
	public void setParameter(int pageNo, String maincd, String subcd, String schType, String schText, int pageSize){
		this.pageNo=pageNo;
		this.pageSize=pageSize;
		this.maincd=maincd;
		this.subcd=subcd;
		this.schType=schType;
		this.schText=Common.replaceQuote(schText);
		
		this.rowBegin = ((pageNo-1)*pageSize)+1;
		this.rowEnd = pageNo*pageSize;
		
		if(maincd.length()>1)
			codeAnd+=" and maincd='"+maincd+"'";
		
		if(subcd.equals("515")) subcd = "0515";
		
		if(subcd.length()>1)
			codeAnd+=" and subcd='"+subcd+"'";
		
		if(!schType.equals("") && !schText.equals("")){
			if(schType.equals("title"))
				schAnd=" and title like '%"+schText+"%'";
			else if(schType.equals("date"))
				schAnd=" and firstdt='"+schText.replace("-", "")+"'";
		}
		
		//System.out.println(codeAnd);
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
	public String getMaincd() {
		return maincd;
	}

	public void setMaincd(String maincd) {
		this.maincd = maincd;
	}

	public String getSubcd() {
		return subcd;
	}

	public void setSubcd(String subcd) {
		this.subcd = subcd;
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

	public String getCodeAnd() {
		return codeAnd;
	}
	public void setCodeAnd(String codeAnd) {
		this.codeAnd = codeAnd;
	}

	public String getSchAnd() {
		return schAnd;
	}

	public void setSchAnd(String schAnd) {
		this.schAnd = schAnd;
	}
}
