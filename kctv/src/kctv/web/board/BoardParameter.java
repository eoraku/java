package kctv.web.board;

import kctv.web.common.Common;

/**
 * <pre>
 * kctv.web.board
 * BoardParameter.java
 * </pre>
 * <pre>
 * 게시판 검색을 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class BoardParameter {
	String boardId;
	int maxUid;
	int pageNo;
	int pageSize;
	int rowBegin;
	int rowEnd;
	int buid;
	int cuid;
	String guid;
	String schType;
	String schText;
	
	String listField1="";
	String listField2="";
	String listJoin="";
	String fileJoin="";
	String listWhere="";
	String fileOrder="";
	
	boolean viewBtnInit=false;
	boolean viewBtnView=false;
	boolean viewBtnWrite=false;
	boolean viewBtnReply=false;
	boolean viewBtnComment=false;
	boolean viewBtnEdit=false;
	boolean viewBtnDel=false;
	
	public BoardParameter(){
	}
	
	public BoardParameter(String boardId){
		initialize();
		
		this.boardId = boardId;
	}
	
	public BoardParameter(String boardId,int buid){
		initialize();
		
		this.boardId = boardId;
		this.buid=buid;
	}
	
	public BoardParameter(String boardId,int buid, String schType, String schText){
		initialize();
		
		this.boardId = boardId;
		this.buid=buid;
		this.schType = schType;
		this.schText = schText;
	}
	
	public BoardParameter(String boardId, boolean isCategory, int cuid, boolean isGroup, String guid, boolean isFile, int pageNo, int pageSize){
		initialize();
		
		this.cuid = cuid;
		this.guid = guid;
		this.boardId = boardId;
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.rowBegin = ((pageNo-1)*pageSize)+1;
		this.rowEnd = pageNo*pageSize;
		
		setQuery(isCategory, isGroup, isFile, schType, schText);
	}
	
	public BoardParameter(String boardId, boolean isCategory, int cuid, boolean isGroup, String guid, boolean isFile, int pageNo, int pageSize, String schType, String schText){
		initialize();
		
		this.cuid = cuid;
		this.guid = guid;
		this.boardId = boardId;
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.rowBegin = ((pageNo-1)*pageSize)+1;
		this.rowEnd = pageNo*pageSize;
		this.schType = schType;
		this.schText = schText;
		
		setQuery(isCategory, isGroup, isFile, schType, schText);
	}
	
	private void initialize(){
		listField1=",cate_name";
		listField2=",0 cate_name";
		listJoin="";
		listWhere="";
	}
	
	private void setQuery(boolean isCategory, boolean isGroup, boolean isFile, String schType, String schText){
		if(isCategory){
			listField1 = ",cate_name";
			listField2 = ",b.cate_name";
			listJoin = " left join "+boardId+"_category b on a.board_cate_uid=b.cate_uid";
			listWhere = "";
			
			if(cuid>0){
				listWhere = " where board_cate_uid="+cuid+" ";
			}
		}
		
		if(isGroup && !guid.equals("")){
			if(listWhere.equals(""))
				listWhere = " where board_group_id="+guid+" ";
			else
				listWhere = listWhere+" and board_group_id="+guid+" ";
		}
		
		if(isFile){
			listField1 += ",nvl(pds_uid,0) pds_uid,nvl(pds_file_name2,'0') pds_file_name2";
			fileJoin += " c left join "+boardId+"_pds f on c.board_uid=f.pds_board_uid";
			fileOrder += " order by board_is_notice desc,board_fid desc, board_step asc";
		}else{
			listField1 += ",0 pds_uid,'' pds_file_name2";
		}
		
		if(!schType.equals("") && !schText.equals("")){
			if(listWhere.equals(""))
				listWhere=" where board_"+schType+" like '%"+schText+"%'";
			else
				listWhere=listWhere+" and board_"+schType+" like '%"+schText+"%'";
			setViewBtnInit(true);
		}

		if(!boardId.equals("BD_cablefq")){
			String date = Common.getDateFromDay("yyyy-MM-dd", -366);
			if(listWhere.equals(""))
				listWhere = "where board_regdate > '" + date + "'";
			else
				listWhere = listWhere + "and board_regdate > '" + date + "'";
		}
			
		/*System.out.println("listField1:"+listField1);
		System.out.println("listField2:"+listField2);
		System.out.println("listJoin:"+listJoin);
		System.out.println("listWhere:"+listWhere);*/
	}
	
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public int getMaxUid() {
		return maxUid;
	}

	public void setMaxUid(int maxUid) {
		this.maxUid = maxUid;
	}

	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getRowBegin() {
		return rowBegin;
	}

	public void setRowBegin(int rowBegin) {
		this.rowBegin = rowBegin;
	}

	public int getRowEnd() {
		return rowEnd;
	}
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}
	
	public int getBuid() {
		return buid;
	}

	public void setBuid(int buid) {
		this.buid = buid;
	}

	public int getCuid() {
		return cuid;
	}

	public void setCuid(int cuid) {
		this.cuid = cuid;
	}

	public String getGuid() {
		return guid;
	}

	public void setGuid(String guid) {
		this.guid = guid;
	}

	public String getSchType() {
		return schType;
	}

	public void setSchType(String schType) {
		this.schType = schType;
	}

	public String getSchText() {
		return schText;
	}

	public void setSchText(String schText) {
		this.schText = schText;
	}

	public boolean getViewBtnInit() {
		return viewBtnInit;
	}

	public void setViewBtnInit(boolean viewBtnInit) {
		this.viewBtnInit = viewBtnInit;
	}

	public boolean isViewBtnView() {
		return viewBtnView;
	}

	public void setViewBtnView(boolean viewBtnView) {
		this.viewBtnView = viewBtnView;
	}

	public boolean getViewBtnWrite() {
		return viewBtnWrite;
	}

	public void setViewBtnWrite(boolean viewBtnWrite) {
		this.viewBtnWrite = viewBtnWrite;
	}

	public boolean getViewBtnReply() {
		return viewBtnReply;
	}

	public void setViewBtnReply(boolean viewBtnReply) {
		this.viewBtnReply = viewBtnReply;
	}

	public boolean getViewBtnComment() {
		return viewBtnComment;
	}

	public void setViewBtnComment(boolean viewBtnComment) {
		this.viewBtnComment = viewBtnComment;
	}

	public boolean getViewBtnEdit() {
		return viewBtnEdit;
	}

	public void setViewBtnEdit(boolean viewBtnEdit) {
		this.viewBtnEdit = viewBtnEdit;
	}

	public boolean isViewBtnDel() {
		return viewBtnDel;
	}

	public void setViewBtnDel(boolean viewBtnDel) {
		this.viewBtnDel = viewBtnDel;
	}

	public String getlistWhere() {
		return listWhere;
	}

	public void setlistWhere(String whereCategory) {
		this.listWhere = whereCategory;
	}
}
