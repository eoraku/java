package kctv.web.schedule;

/**
 * <pre>
 * kctv.web.schedule
 * Schedule.java
 * </pre>
 * <pre>
 * 편성표 스케쥴 데이터 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class Schedule {
	String pk_date;
	String pk_time;
	String program;
	
	public Schedule(String time, String program){
		this.pk_time=time;
		this.program=program;
	}
	
	public Schedule(String date, String time, String program){
		this.pk_date=date;
		this.pk_time=time;
		this.program=program;
	}
	
	public String getPk_date() {
		return pk_date;
	}
	public void setPk_date(String pk_date) {
		this.pk_date = pk_date;
	}
	public String getPk_time() {
		return pk_time;
	}
	public void setPk_time(String pk_time) {
		this.pk_time = pk_time;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
}
