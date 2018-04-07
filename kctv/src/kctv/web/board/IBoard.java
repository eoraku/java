package kctv.web.board;

import java.util.List;

/**
 * <pre>
 * kctv.web.board
 * IBoard.java
 * </pre>
 * <pre>
 * 게시판 추가 삭제 관련 인터페이스 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public interface IBoard {
	public List<Board> listBoard();
	public void addBoard(Board board);
	public boolean deleteBoard(Board board);
	public boolean updateBoard(Board board);
}
