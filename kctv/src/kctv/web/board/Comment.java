package kctv.web.board;

/**
 * <pre>
 * kctv.web.board
 * Comment.java
 * </pre>
 * <pre>
 * 게시판 댓글 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 30.
 * @version: 
 */
public class Comment {
	int comment_uid;
	int comment_board_uid;
	String comment_contents;
	String comment_userid;
	String comment_name;
	String comment_passwd;
	String comment_regdate;
	String comment_ip;
	
	String boardId;
	
	boolean viewDel = false;
	
	public void setViewDel(String userid){
		if(comment_userid.equals(userid))
			this.viewDel = true;
		else
			this.viewDel = false;
	}
	
	public boolean getViewDel(){
		return this.viewDel;
	}
	
	public int getComment_uid() {
		return comment_uid;
	}
	public void setComment_uid(int comment_uid) {
		this.comment_uid = comment_uid;
	}
	public int getComment_board_uid() {
		return comment_board_uid;
	}
	public void setComment_board_uid(int comment_board_uid) {
		this.comment_board_uid = comment_board_uid;
	}
	public String getComment_contents() {
		return comment_contents;
	}
	public void setComment_contents(String comment_contents) {
		this.comment_contents = comment_contents;
	}
	public String getComment_userid() {
		return comment_userid;
	}
	public void setComment_userid(String comment_userid) {
		this.comment_userid = comment_userid;
	}
	public String getComment_name() {
		return comment_name;
	}
	public void setComment_name(String comment_name) {
		this.comment_name = comment_name;
	}
	public String getComment_passwd() {
		return comment_passwd;
	}
	public void setComment_passwd(String comment_passwd) {
		this.comment_passwd = comment_passwd;
	}
	public String getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(String comment_regdate) {
		this.comment_regdate = comment_regdate;
	}
	public String getComment_ip() {
		return comment_ip;
	}
	public void setComment_ip(String comment_ip) {
		this.comment_ip = comment_ip;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
}
