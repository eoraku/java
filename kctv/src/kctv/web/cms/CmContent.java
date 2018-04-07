package kctv.web.cms;

/**
 * <pre>
 * kctv.web.cms
 * CmContent.java
 * </pre>
 * <pre>
 * CM_CONTENTS를 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class CmContent {
	int cmme_uid;
	int frame_id;
	int type;
	String charge;
	int is_hit;
	int hit;
	String contents;
	String board_id;
	String exefile;
	String regdate;
	String modifydate;
	String adad_id;
	int ahead_type;
	String ahead_contents;
	
	public int getCmme_uid() {
		return cmme_uid;
	}
	public void setCmme_uid(int cmme_uid) {
		this.cmme_uid = cmme_uid;
	}
	public int getFrame_id() {
		return frame_id;
	}
	public void setFrame_id(int frame_id) {
		this.frame_id = frame_id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	public int getIs_hit() {
		return is_hit;
	}
	public void setIs_hit(int is_hit) {
		this.is_hit = is_hit;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getExefile() {
		return exefile;
	}
	public void setExefile(String exe_file) {
		this.exefile = exe_file;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getModifydate() {
		return modifydate;
	}
	public void setModifydate(String modifydate) {
		this.modifydate = modifydate;
	}
	public String getAdad_id() {
		return adad_id;
	}
	public void setAdad_id(String adad_id) {
		this.adad_id = adad_id;
	}
	public int getAhead_type() {
		return ahead_type;
	}
	public void setAhead_type(int ahead_type) {
		this.ahead_type = ahead_type;
	}
	public String getAhead_contents() {
		return ahead_contents;
	}
	public void setAhead_contents(String ahead_contents) {
		this.ahead_contents = ahead_contents;
	}
}
