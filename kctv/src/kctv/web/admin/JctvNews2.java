package kctv.web.admin;

import java.util.Date;
import java.util.Locale;

/**
 * <pre>
 * kctv.web.admin
 * JctvNews2.java
 * </pre>
 * <pre>
 * 2차 기사를 위한 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 27.
 * @version: 
 */
public class JctvNews2 {
	int num;
	int day_no;
	String userid;
	String name;
	String title;
	String content;
	String sendtime;
	String receivetime;
	String passwd;
	String flv;
	String modify2;
	String upfile;
	String svrfile;
	String upfile2;
	String svrfile2; //이미지 파일
	String urlname;
	String maincd;
	String subcd;
	String ldate;
	String degree;
	String view_date;
	int woosun_no;
	String run_time;
	String news_goal;
	String vcr;
	String sound;
	String web_view;
	String group_flag;
	String hot_flag;
	String eng;
	int news_hit;
	String vod;
	String chi;
	String content_clob;
	
	public JctvNews2(){
		
	}
	
	public JctvNews2(String title, String ldate){
		this.title = title;
		this.ldate = ldate;
	}
	
	public JctvNews2(int num, String userid, String name, String title, String contents, String news_goal, String sendtime, String receivetime, String svrfile2, String ldate, String groupFlag, String maincd1, String vcr, String sound){
		String datetime = sendtime.replace("-", "") + receivetime.replace(":", "");
		this.num = num;
		this.userid =userid;
		this.name = name;
		this.title = title;
		this.content_clob = contents;
		if(contents.length()>400)
			this.content = contents.substring(0,400);
		else
			this.content = contents;
		this.news_goal = news_goal;
		this.sendtime = datetime;
		this.receivetime = (new java.text.SimpleDateFormat("yyyyMMddHHmmss",Locale.KOREA)).format(new Date());
		this.svrfile2 = svrfile2;
		this.ldate = ldate;
		this.group_flag = groupFlag;
		if(maincd1 != null && maincd1.trim().equals("eng")){
			this.eng = "1";
			this.chi = null;
		}
		else if(maincd1 != null && maincd1.trim().equals("chi")){
			this.eng = null;
			this.chi = "1";
		}else{
			this.eng = null;
			this.chi = null;
		}
		this.vcr = vcr;
		this.sound = sound;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getDay_no() {
		return day_no;
	}
	public void setDay_no(int day_no) {
		this.day_no = day_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public String getReceivetime() {
		return receivetime;
	}
	public void setReceivetime(String receivetime) {
		this.receivetime = receivetime;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getFlv() {
		return flv;
	}
	public void setFlv(String flv) {
		this.flv = flv;
	}
	public String getModify2() {
		return modify2;
	}
	public void setModify2(String modify2) {
		this.modify2 = modify2;
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
	public String getUpfile2() {
		return upfile2;
	}
	public void setUpfile2(String upfile2) {
		this.upfile2 = upfile2;
	}
	public String getSvrfile2() {
		return svrfile2;
	}
	public void setSvrfile2(String svrfile2) {
		this.svrfile2 = svrfile2;
	}
	public String getUrlname() {
		return urlname;
	}
	public void setUrlname(String urlname) {
		this.urlname = urlname;
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
	public String getLdate() {
		return ldate;
	}
	public void setLdate(String ldate) {
		this.ldate = ldate;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getView_date() {
		return view_date;
	}
	public void setView_date(String view_date) {
		this.view_date = view_date;
	}
	public int getWoosun_no() {
		return woosun_no;
	}
	public void setWoosun_no(int woosun_no) {
		this.woosun_no = woosun_no;
	}
	public String getRun_time() {
		return run_time;
	}
	public void setRun_time(String run_time) {
		this.run_time = run_time;
	}
	public String getNews_goal() {
		return news_goal;
	}
	public void setNews_goal(String news_goal) {
		this.news_goal = news_goal;
	}
	public String getVcr() {
		return vcr;
	}
	public void setVcr(String vcr) {
		this.vcr = vcr;
	}
	public String getSound() {
		return sound;
	}
	public void setSound(String sound) {
		this.sound = sound;
	}
	public String getWeb_view() {
		return web_view;
	}
	public void setWeb_view(String web_view) {
		this.web_view = web_view;
	}
	public String getGroup_flag() {
		return group_flag;
	}
	public void setGroup_flag(String group_flag) {
		this.group_flag = group_flag;
	}
	public String getHot_flag() {
		return hot_flag;
	}
	public void setHot_flag(String hot_flag) {
		this.hot_flag = hot_flag;
	}
	public String getEng() {
		return eng;
	}
	public void setEng(String eng) {
		this.eng = eng;
	}
	public int getNews_hit() {
		return news_hit;
	}
	public void setNews_hit(int news_hit) {
		this.news_hit = news_hit;
	}
	public String getVod() {
		return vod;
	}
	public void setVod(String vod) {
		this.vod = vod;
	}
	public String getChi() {
		return chi;
	}
	public void setChi(String chi) {
		this.chi = chi;
	}
	public String getContent_clob() {
		return content_clob;
	}
	public void setContent_clob(String content_clob) {
		this.content_clob = content_clob;
	}	
}
