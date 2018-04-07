package kctv.web.board;

/**
 * <pre>
 * kctv.web.board
 * Board.java
 * </pre>
 * <pre>
 * 게시판 모델 클래스
 * board_is_delflag 추가
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class Board {
	int board_uid;
	int board_fid;
	int board_step;
	int board_depth;
	String board_name;
	String board_email;
	String board_passwd;
	String board_title;
	String board_contents;
	String board_regdate;
	String board_modifydate;
	String board_homepage;
	String board_ip;
	int board_hit;
	int board_vote;
	int board_comment_cnt;
	int board_cate_uid;
	String board_userid;
	String board_group_id;
	String board_is_secret;
	String board_is_file;
	String board_is_html;
	String board_is_notice;
	private String board_is_delflag;	//2013.12.18 추가
	
	String cate_name;
	String board_id;
	
	int pds_uid;
	String pds_file_name2;
	
	String new_icon;
	
	String leftSpace;
	String viewHref;
	String comments;
	String fileLink;
	
	public int getBoard_uid() {
		return board_uid;
	}
	public void setBoard_uid(int board_uid) {
		this.board_uid = board_uid;
	}
	public int getBoard_fid() {
		return board_fid;
	}
	public void setBoard_fid(int board_fid) {
		this.board_fid = board_fid;
	}
	public int getBoard_step() {
		return board_step;
	}
	public void setBoard_step(int board_step) {
		this.board_step = board_step;
	}
	public int getBoard_depth() {
		return board_depth;
	}
	public void setBoard_depth(int board_depth) {
		this.board_depth = board_depth;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_email() {
		return board_email;
	}
	public void setBoard_email(String board_email) {
		this.board_email = board_email;
	}
	public String getBoard_passwd() {
		return board_passwd;
	}
	public void setBoard_passwd(String board_passwd) {
		this.board_passwd = board_passwd;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_contents() {
		return board_contents;
	}
	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}
	public String getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(String board_regdate) {
		this.board_regdate = board_regdate;
	}
	public String getBoard_modifydate() {
		return board_modifydate;
	}
	public void setBoard_modifydate(String board_modifydate) {
		this.board_modifydate = board_modifydate;
	}
	public String getBoard_homepage() {
		return board_homepage;
	}
	public void setBoard_homepage(String board_homepage) {
		this.board_homepage = board_homepage;
	}
	public String getBoard_ip() {
		return board_ip;
	}
	public void setBoard_ip(String board_ip) {
		this.board_ip = board_ip;
	}
	public int getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	public int getBoard_vote() {
		return board_vote;
	}
	public void setBoard_vote(int board_vote) {
		this.board_vote = board_vote;
	}
	public int getBoard_comment_cnt() {
		return board_comment_cnt;
	}
	public void setBoard_comment_cnt(int board_comment_cnt) {
		this.board_comment_cnt = board_comment_cnt;
	}
	public int getBoard_cate_uid() {
		return board_cate_uid;
	}
	public void setBoard_cate_uid(int board_cate_uid) {
		this.board_cate_uid = board_cate_uid;
	}
	public String getBoard_userid() {
		return board_userid;
	}
	public void setBoard_userid(String board_userid) {
		this.board_userid = board_userid;
	}
	public String getBoard_group_id() {
		return board_group_id;
	}
	public void setBoard_group_id(String board_group_id) {
		this.board_group_id = board_group_id;
	}
	public String getBoard_is_secret() {
		return board_is_secret;
	}
	public void setBoard_is_secret(String board_is_secret) {
		this.board_is_secret = board_is_secret;
	}
	public String getBoard_is_file() {
		return board_is_file;
	}
	public void setBoard_is_file(String board_is_file) {
		this.board_is_file = board_is_file;
	}
	public String getBoard_is_html() {
		return board_is_html;
	}
	public void setBoard_is_html(String board_is_html) {
		this.board_is_html = board_is_html;
	}
	public String getBoard_is_notice() {
		return board_is_notice;
	}
	public void setBoard_is_notice(String board_is_notice) {
		this.board_is_notice = board_is_notice;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public int getPds_uid() {
		return pds_uid;
	}
	public void setPds_uid(int pds_uid) {
		this.pds_uid = pds_uid;
	}
	public String getPds_file_name2() {
		return pds_file_name2;
	}
	public void setPds_file_name2(String pds_file_name2) {
		this.pds_file_name2 = pds_file_name2;
	}
	public String getNew_icon() {
		return new_icon;
	}
	public void setNew_icon(String new_icon) {
		this.new_icon = new_icon;
	}
	public String getLeftSpace() {
		return leftSpace;
	}
	public void setLeftSpace(String leftSpace) {
		this.leftSpace = leftSpace;
	}
	public String getViewHref() {
		return viewHref;
	}
	public void setViewHref(String viewHref) {
		this.viewHref = viewHref;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getFileLink() {
		return fileLink;
	}
	public void setFileLink(String fileLink) {
		this.fileLink = fileLink;
	}
	public String getBoard_is_delflag() {
		return board_is_delflag;
	}
	public void setBoard_is_delflag(String board_is_delflag) {
		this.board_is_delflag = board_is_delflag;
	}

}
