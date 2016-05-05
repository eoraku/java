package kctv.web.board;

import java.util.ArrayList;
import java.util.List;

import kctv.web.common.Common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

/**
 * <pre>
 * kctv.web.board
 * BoardJobinfo.java
 * </pre>
 * <pre>
 * 게시판 추가 /삭제 와 관련한 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 30.
 * @version: 
 */
public class BoardJobinfo implements IBoard {
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	public BoardJobinfo(){}
	
	public BoardJobinfo(SqlMapClientTemplate sqlMapClientTemplate){
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
	
	@SuppressWarnings("rawtypes")
	public ArrayList listIndex(int maxLen){
		return cutStrNotice((ArrayList)sqlMapClientTemplate.queryForList("indexListNotice"),maxLen);
	}
	
	@SuppressWarnings("rawtypes")
	public ArrayList cutStrNotice(ArrayList list,int maxLen){
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