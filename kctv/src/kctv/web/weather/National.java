package kctv.web.weather;

/**
 * <pre>
 * kctv.web.weather
 * National.java
 * </pre>
 * <pre>
 * 기상정보 DB 사용 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 13.
 * @version: 
 */
public class National {
	String rc_name;
	String wn_rainf;
	String wn_forecast;
	int wn_temp;
	int rc_x;
	int rc_y;
	int rc_order;
	
	public String getRc_name() {
		return rc_name;
	}
	public void setRc_name(String rc_name) {
		this.rc_name = rc_name;
	}
	public String getWn_rainf() {
		return wn_rainf;
	}
	public void setWn_rainf(String wn_rainf) {
		this.wn_rainf = wn_rainf;
	}
	public String getWn_forecast() {
		return wn_forecast;
	}
	public void setWn_forecast(String wn_forecast) {
		this.wn_forecast = wn_forecast;
	}
	public int getWn_temp() {
		return wn_temp;
	}
	public void setWn_temp(int wn_temp) {
		this.wn_temp = wn_temp;
	}
	public int getRc_x() {
		return rc_x;
	}
	public void setRc_x(int rc_x) {
		this.rc_x = rc_x;
	}
	public int getRc_y() {
		return rc_y;
	}
	public void setRc_y(int rc_y) {
		this.rc_y = rc_y;
	}
	public int getRc_order() {
		return rc_order;
	}
	public void setRc_order(int rc_order) {
		this.rc_order = rc_order;
	}
}
