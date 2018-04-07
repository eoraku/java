package kctv.web.admin;

/**
 * <pre>
 * kctv.web.admin
 * JctvNews1.java
 * </pre>
 * <pre>
 * 1차 기사를 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class JctvNews1 {
	int num;
	String userid;
	String name;
	String title;
	String sendtime;
	String receivetime;
	String passwd;
	String upfile;
	String svrfile; //wmv파일
	String upfile2;
	String svrfile2;//이미지파일
	String urlname;
	String maincd;
	String subcd;
	String ldate;
	String group_flag;
	String news_goal;
	String vcr;
	String sound;
	String content;
	
	public JctvNews1(){
		
	}
	
	public JctvNews1(String title, String ldate){
		this.title = title;
		this.ldate = ldate;
	}
	
	public JctvNews1(int num, String userid, String name, String title, String content, String dateTime, String svrfile, String groupName, String eng_chi){
		String [] tmp = dateTime.split(" ");
		if(dateTime.length()>14)
			dateTime = dateTime.substring(0,14);
		this.num = num;
		this.userid = userid;
		this.name = name;
		this.title = title;
		this.content = content;
		this.sendtime = tmp[0];
		this.receivetime = tmp[1];
		this.svrfile = svrfile;
		this.ldate = tmp[0].replace("-", "").substring(0,8);
		this.group_flag = getGroupFlag(groupName);
		this.maincd = eng_chi;
		this.vcr = "7";
		this.sound = "6";
	}
	
	public JctvNews1(int num, String userid, String name, String title, String content, String dateTime, String svrfile2, String groupFlag, String eng_chi, String vcr, String sound, String newsGoal){
		String [] tmp = dateTime.split(" ");
		if(dateTime.length()>14)
			dateTime = dateTime.substring(0,14);
		this.num = num;
		this.userid = userid;
		this.name = name;
		this.title = title;
		this.content = content;
		this.sendtime = tmp[0];
		this.receivetime = tmp[1];
		this.svrfile2 = svrfile2;
		this.ldate = tmp[0].replace("-", "").substring(0,8);
		this.group_flag = groupFlag;
		this.maincd = eng_chi;
		this.vcr = vcr;
		this.sound = sound;
		this.news_goal = newsGoal;
	}
	
	public boolean haveImage(){
		if(this.svrfile2 != null && this.svrfile2.length()>0) return true;
		else return false;
	}
	
	private String getGroupFlag(String str){
		String groupFlag="";
		if(str.equals("정치"))
			groupFlag="1";
		else if(str.equals("경제"))
			groupFlag="2";
		else if(str.equals("사회"))
			groupFlag="3";
		else if(str.equals("문화"))
			groupFlag="4";
		else if(str.equals("문화/생활"))
			groupFlag="4";
		else if(str.equals("행정"))
			groupFlag="5";
		else if(str.equals("관광"))
			groupFlag="6";
		else if(str.equals("교육"))
			groupFlag="7";
		else if(str.equals("체육"))
			groupFlag="8";
		return groupFlag;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getGroup_flag() {
		return group_flag;
	}
	public void setGroup_flag(String group_flag) {
		this.group_flag = group_flag;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
