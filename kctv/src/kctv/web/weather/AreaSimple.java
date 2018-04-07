package kctv.web.weather;

/**
 * <pre>
 * kctv.web.weather
 * AreaSimple.java
 * </pre>
 * <pre>
 * 기상정보 DB 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class AreaSimple {
	int sc_order;
	String rd_name;
	int w3_pty;
	int w3_sky;
	int wl_t1h;
	
	public int getSc_order() {
		return sc_order;
	}
	public void setSc_order(int sc_order) {
		this.sc_order = sc_order;
	}
	public String getRd_name() {
		return rd_name;
	}
	public void setRd_name(String rd_name) {
		this.rd_name = rd_name;
	}
	public int getW3_pty() {
		return w3_pty;
	}
	public void setW3_pty(int w3_pty) {
		this.w3_pty = w3_pty;
	}
	public int getW3_sky() {
		return w3_sky;
	}
	public void setW3_sky(int w3_sky) {
		this.w3_sky = w3_sky;
	}
	public int getWl_t1h() {
		return wl_t1h;
	}
	public void setWl_t1h(int wl_t1h) {
		this.wl_t1h = wl_t1h;
	}
}
