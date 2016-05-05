package kctv.web.board;

import java.util.ArrayList;
import java.util.List;

import kctv.web.common.Common;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

/**
 * <pre>
 * kctv.web.board
 * BoardNotice.java
 * </pre>
 * <pre>
 * 공지사항 게시판 컨트롤러 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 18.
 * @version: 
 */
public class BoardNotice implements IBoard {
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public BoardNotice(){}
	
	public BoardNotice(SqlMapClientTemplate sqlMapClientTemplate){
		this.sqlMapClientTemplate=sqlMapClientTemplate;
	}

	@Override
	public List<Board> listBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addBoard(Board board) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean deleteBoard(Board board) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateBoard(Board board) {
		// TODO Auto-generated method stub
		return false;
	}
	
	/**
	 * @function : 공지사항 리스트 가져오기
	 * @process  : 
	 * 
	 * @MethodName : listIndex
	 * @param maxRow
	 * @param maxLen
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public ArrayList listIndex(int maxRow, int maxLen){
		return cutStrNotice((ArrayList)sqlMapClientTemplate.queryForList("indexListNotice",maxRow),maxLen);
	}
	
	/**
	 * @function : String 길이 조절
	 * @process  : 
	 * 
	 * @MethodName : cutStrNotice
	 * @param list
	 * @param maxLen
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	private ArrayList cutStrNotice(ArrayList list,int maxLen){
		String title;
		
		for(int i=0;i<list.size(); i++){
			title=((Board)list.get(i)).getBoard_title();
			if(title.length()>maxLen){
				((Board)list.get(i)).setBoard_title(Common.cutStr(title, null, maxLen, 0, true, true));
			}
		}
		return list;
	}
}
