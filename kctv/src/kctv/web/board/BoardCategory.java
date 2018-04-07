package kctv.web.board;

/**
 * <pre>
 * kctv.web.board
 * BoardCategory.java
 * </pre>
 * <pre>
 * 게시판 카테고리 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class BoardCategory {
	int cate_uid;
	String cate_name;
	String boardId;
	
	public int getCate_uid() {
		return cate_uid;
	}
	public void setCate_uid(int cate_uid) {
		this.cate_uid = cate_uid;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
}
