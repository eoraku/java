package kctv.web.vod;

/**
 * <pre>
 * kctv.web.vod
 * Vod.java
 * </pre>
 * <pre>
 * 	VOD 리스트 저장에 사용되는 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 13.
 * @version: 
 */
public class Vod {
	int num;
	int no;
	String maincd;
	String subcd;
	String vodcode;
	String vodname;
	String firstdt;
	String title;
	String goal;
	String character;
	String run_time;
	String pd;
	String photo_upfile;
	String photo_svrfile;
	String upfile;
	String svrfile;
	String urlfile;
	String urlfile2;
	String urlfile3;
	String speed1;
	String speed2;
	String speed3;
	String filechk;
	String wdate;
	String flv;
	String web_view;
	String size_chk;
	String vod_ment;
	String content2;
	int view_cnt;
	String ldate;
	String photo_url;
	String hotvod;
	String hotdate;
	String content;
	
	String code_name;
	
	public Vod(){
	}
	
	public Vod(int num, String maincd, String subcd, String firstdt, String title, String goal, String character, String runTime
			, String writer, String vodFile, String speed1, String photo_url, String content){
		this.num = num;
		this.maincd = maincd;
		this.subcd = subcd;
		this.firstdt = firstdt;
		this.title = title;
		this.goal = goal;
		this.character = character;
		this.run_time = runTime;
		this.pd = writer;
		this.urlfile = vodFile;
		this.speed1 = speed1;
		this.filechk = "0";
		this.flv = "0";
		this.web_view = "0";
		this.size_chk = "0";
		this.view_cnt = 0;
		this.photo_url = photo_url;
		this.hotvod = "0";
		this.content = content;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getVodcode() {
		return vodcode;
	}
	public void setVodcode(String vodcode) {
		this.vodcode = vodcode;
	}
	public String getVodname() {
		return vodname;
	}
	public void setVodname(String vodname) {
		this.vodname = vodname;
	}
	public String getFirstdt() {
		return firstdt;
	}
	public void setFirstdt(String firstdt) {
		this.firstdt = firstdt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getCharacter() {
		return character;
	}
	public void setCharacter(String character) {
		this.character = character;
	}
	public String getRun_time() {
		return run_time;
	}
	public void setRun_time(String run_time) {
		this.run_time = run_time;
	}
	public String getPd() {
		return pd;
	}
	public void setPd(String pd) {
		this.pd = pd;
	}
	public String getPhoto_upfile() {
		return photo_upfile;
	}
	public void setPhoto_upfile(String photo_upfile) {
		this.photo_upfile = photo_upfile;
	}
	public String getPhoto_svrfile() {
		return photo_svrfile;
	}
	public void setPhoto_svrfile(String photo_svrfile) {
		this.photo_svrfile = photo_svrfile;
	}
	public String getUpfile() {
		return upfile;
	}
	public void setUpfile(String upfile) {
		this.upfile = upfile;
	}
	public String getSvrfile() {
		return svrfile;
	}
	public void setSvrfile(String svrfile) {
		this.svrfile = svrfile;
	}
	public String getUrlfile() {
		return urlfile;
	}
	public void setUrlfile(String urlfile) {
		this.urlfile = urlfile;
	}
	public String getUrlfile2() {
		return urlfile2;
	}
	public void setUrlfile2(String urlfile2) {
		this.urlfile2 = urlfile2;
	}
	public String getUrlfile3() {
		return urlfile3;
	}
	public void setUrlfile3(String urlfile3) {
		this.urlfile3 = urlfile3;
	}
	public String getSpeed1() {
		return speed1;
	}
	public void setSpeed1(String speed1) {
		this.speed1 = speed1;
	}
	public String getSpeed2() {
		return speed2;
	}
	public void setSpeed2(String speed2) {
		this.speed2 = speed2;
	}
	public String getSpeed3() {
		return speed3;
	}
	public void setSpeed3(String speed3) {
		this.speed3 = speed3;
	}
	public String getFilechk() {
		return filechk;
	}
	public void setFilechk(String filechk) {
		this.filechk = filechk;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getFlv() {
		return flv;
	}
	public void setFlv(String flv) {
		this.flv = flv;
	}
	public String getWeb_view() {
		return web_view;
	}
	public void setWeb_view(String web_view) {
		this.web_view = web_view;
	}
	public String getSize_chk() {
		return size_chk;
	}
	public void setSize_chk(String size_chk) {
		this.size_chk = size_chk;
	}
	public String getVod_ment() {
		return vod_ment;
	}
	public void setVod_ment(String vod_ment) {
		this.vod_ment = vod_ment;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getLdate() {
		return ldate;
	}
	public void setLdate(String ldate) {
		this.ldate = ldate;
	}
	public String getPhoto_url() {
		return photo_url;
	}
	public void setPhoto_url(String photo_url) {
		this.photo_url = photo_url;
	}
	public String getHotvod() {
		return hotvod;
	}
	public void setHotvod(String hotvod) {
		this.hotvod = hotvod;
	}
	public String getHotdate() {
		return hotdate;
	}
	public void setHotdate(String hotdate) {
		this.hotdate = hotdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getCode_name() {
		return code_name;
	}

	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
}
