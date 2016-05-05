package kctv.xml;

/**
 * <pre>
 * kctv.xml
 * RssWeb.java
 * </pre>
 * <pre>
 * 네이버 오픈 API 웹검색 RSS피드를 이용하기 위한 모델 클래스 
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 12.
 * @version: 
 */
public class RssWeb {
	String title;
	String link;
	String desc;
	
	public RssWeb(){
		
	}
	
	public RssWeb(String title, String link, String desc){
		this.title = title;
		this.link = link;
		this.desc = desc;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
}
