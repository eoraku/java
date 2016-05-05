package kctv.web.common;

/**
 * <pre>
 * kctv.web.common
 * FileInfo.java
 * </pre>
 * <pre>
 * 파일 업로드, 리네임 관련 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 17.
 * @version: 
 */
public class FileInfo {
	String orgFileName;
	String newFileName;
	String type;
	long length;
	
	public FileInfo(){
		
	}
	
	public FileInfo(String orgName, String newName, String type, long length){
		this.orgFileName = orgName;
		this.newFileName = newName;
		this.type = type;
		this.length = length;
	}
	
	public String getOrgFileName() {
		return orgFileName;
	}
	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public long getLength() {
		return length;
	}
	public void setLength(long length) {
		this.length = length;
	}
}
