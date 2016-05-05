package kctv.xml;

/**
 * <pre>
 * kctv.xml
 * RssBlog.java
 * </pre>
 * <pre>
 * 네이버 오픈 API 블로그검색 RSS피드를 이용하기 위한 모델 클래스 
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 12.
 * @version: 
 */
public class RssBlog {
	String title;
	String link;
	String desc;
	String bloggername;
	String bloggerlink;
	
	public RssBlog(){
		
	}
	
	public RssBlog(String title, String link, String desc, String bloggername, String bloggerlink){
		this.title = title;
		this.link = link;
		this.desc = desc;
		this.bloggername = bloggername;
		this.bloggerlink = bloggerlink;
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

	public String getBloggername() {
		return bloggername;
	}

	public void setBloggername(String bloggername) {
		this.bloggername = bloggername;
	}

	public String getBloggerlink() {
		return bloggerlink;
	}

	public void setBloggerlink(String bloggerlink) {
		this.bloggerlink = bloggerlink;
	}
}
