package kctv.web.vod;

/**
 * <pre>
 * kctv.web.vod
 * VodWeek.java
 * </pre>
 * <pre>
 * 금주의 vod 에 사용되는 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 13.
 * @version: 
 */
public class VodWeek {
	String ldate;
	String title;
	String image_url;
	
	public String getLdate() {
		return ldate;
	}
	public void setLdate(String ldate) {
		this.ldate = ldate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
}
