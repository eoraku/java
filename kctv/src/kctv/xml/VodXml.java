package kctv.xml;

/**
 * <pre>
 * kctv.xml
 * VodXml.java
 * </pre>
 * <pre>
 * VOD정보에 대한 XML 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class VodXml {
	String id;
	String gbn;
	String title;
	String file;
	String director;
	String talent1;
	String talent2;
	String synopsis;
	String grade;
	String cate;
	
	public VodXml(String id, String title, String file){
		this.id=id;
		this.title=title;
		this.file=file;
	}
	
	public VodXml(String title, String file, String director, String talent1, String talent2, String synopsis){
		this.title=title;
		this.file=file;
		this.director=director;
		this.talent1=talent1;
		this.synopsis=synopsis;
	}
	
	public VodXml(String id, String gbn, String title, String file, String director, String talent1, String talent2, String synopsis, String grade, String cate){
		this.id=id;
		this.gbn=gbn;
		this.title=title;
		this.file=file;
		this.director=director;
		this.talent1=talent1;
		this.synopsis=synopsis;
		this.grade=grade;
		this.cate=cate;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGbn() {
		return gbn;
	}
	public void setGbn(String gnb) {
		this.gbn = gnb;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getTalent1() {
		return talent1;
	}
	public void setTalent1(String talent1) {
		this.talent1 = talent1;
	}
	public String getTalent2() {
		return talent2;
	}
	public void setTalent2(String talent2) {
		this.talent2 = talent2;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
}
