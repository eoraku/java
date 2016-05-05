package kctv.xml;

/**
 * <pre>
 * kctv.xml
 * BodoXml.java
 * </pre>
 * <pre>
 * 뉴스기사에 대한 xml 파일 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 16.
 * @version: 
 */
public class BodoXml {
	String makeDateTime;
	String tpName;
	String category;
	String writerId;
	String writerName;
	String title;
	String subTitle;
	String content;
	String wmv;
	
	public BodoXml(){
		
	}
	
	public BodoXml(String makeDateTime, String tpName, String category, String writerId, String writerName, String title, String subTitle, String content, String wmv){
		this.makeDateTime = makeDateTime;
		this.tpName = tpName;
		this.category = category;
		this.writerId = writerId;
		this.writerName = writerName;
		this.title = title;
		this.subTitle = subTitle;
		this.content = content;
		this.wmv = wmv;
	}

	public String getMakeDateTime() {
		return makeDateTime;
	}

	public void setMakeDateTime(String makeDateTime) {
		this.makeDateTime = makeDateTime;
	}

	public String getTpName() {
		return tpName;
	}

	public void setTpName(String tpName) {
		this.tpName = tpName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWmv() {
		return wmv;
	}

	public void setWmv(String wmv) {
		this.wmv = wmv;
	}
}
