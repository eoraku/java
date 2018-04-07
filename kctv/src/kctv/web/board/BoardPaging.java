package kctv.web.board;

import java.util.ArrayList;

/**
 * <pre>
 * kctv.web.board
 * BoardPaging.java
 * </pre>
 * <pre>
 * 게시글 페이징을 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class BoardPaging {
	int pageCurrent; //현재 페이지
	int pageBegin; //페이지 시작
	int pageEnd; //페이지 끝
	int pageMax; //끝 페이지
	int pageView; //페이지 개수
	
	String prev = "";
	String next = "";
	
	public ArrayList<Pages> pages;
	
	public class Pages{
		int pageNo;
		String pageLink;
		boolean isCurrent;

		public Pages(int pageNo, boolean isCurrent,int pageSize,int pageView){
			this.pageNo=pageNo;
			this.pageLink="&pageNo="+pageNo;
			//this.pageLink="pageNo="+pageNo+"&schType="+schType+"&schText="+schText;
			//this.pageLink="pageNo="+pageNo+"&pageSize="+pageSize+"&pageView="+pageView;
			this.isCurrent=isCurrent;
		}

		public int getPageNo() {
			return pageNo;
		}

		public void setPageNo(int pageNo) {
			this.pageNo = pageNo;
		}

		public String getPageLink() {
			return pageLink;
		}

		public void setPageLink(String pageLink) {
			this.pageLink = pageLink;
		}
		
		public boolean getIsCurrent() {
			return isCurrent;
		}

		public void setIsCurrent(boolean isCurrent) {
			this.isCurrent = isCurrent;
		}
	}
	
	public BoardPaging(int pageNo,int rowTotal){
		initialize(pageNo,rowTotal,20,10);
	}
	
	public BoardPaging(int pageNo,int rowTotal,int pageSize){
		initialize(pageNo,rowTotal,pageSize,10);
	}
	
	public BoardPaging(int pageNo,int rowTotal,int pageSize,int pageCnt){
		initialize(pageNo,rowTotal,pageSize,pageCnt);
	}
	
	private void initialize(int pageNo,int rowTotal,int pageSize,int pageCnt){
		pages = new ArrayList<Pages>();
		pageView=pageCnt;
		pageMax=(int)Math.ceil((float)rowTotal/(float)pageSize);
		
		/*System.out.println("rowCnt/pageSize:"+((float)rowCnt/(float)pageSize));
		System.out.println("rowCnt:"+rowCnt);
		System.out.println("pageSize:"+pageSize);
		System.out.println("pageMax:"+pageMax);
		System.out.println("pageCnt:"+pageCnt);*/
		
		if(pageNo<1 || pageNo>pageMax)
			pageCurrent=1;
		else
			pageCurrent=pageNo;
		
		//System.out.println("pageCurrent:"+pageCurrent);
		
		int tmp = (int)Math.ceil(pageView/2);
		
		//System.out.println("tmp:"+tmp);
		
		if(pageCurrent>tmp)
			if(pageMax<=pageView)
				pageBegin=1;
			else
				pageBegin=pageCurrent-tmp;
		else
			pageBegin=1;
		
		//System.out.println("pageBegin:"+pageBegin);
		
		if(pageMax<=pageView)
			pageEnd=pageMax;
		else{
			pageEnd=pageBegin+pageView-1;
			if(pageEnd>pageMax){
				pageEnd=pageMax;
				pageBegin=pageEnd-9;
				if(pageBegin<1) pageBegin=1;
			}
		}
		
		//System.out.println("pageEnd:"+pageEnd);
		
		for(int i=pageBegin;i<=pageEnd;i++,pageBegin++){
			pages.add(new Pages(pageBegin,(pageCurrent==pageBegin),pageSize,pageView));
		}
		
		if(pageCurrent>1)
			prev="&pageNo="+(pageCurrent-1);
		
		if(pageCurrent<pageEnd)
			next="&pageNo="+(pageCurrent+1);
		
		//System.out.println("--------------------");
	}
	
	public int getPageCurrent() {
		return pageCurrent;
	}

	public void setPageCurrent(int pageCurrent) {
		this.pageCurrent = pageCurrent;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getPageMax() {
		return pageMax;
	}

	public void setPageMax(int pageMax) {
		this.pageMax = pageMax;
	}

	public int getPageView() {
		return pageView;
	}

	public void setPageView(int pageView) {
		this.pageView = pageView;
	}

	public String getPrev() {
		return prev;
	}

	public void setPrev(String prev) {
		this.prev = prev;
	}

	public String getNext() {
		return next;
	}

	public void setNext(String next) {
		this.next = next;
	}

	public ArrayList<Pages> getPages() {
		return pages;
	}

	public void setPages(ArrayList<Pages> pages) {
		this.pages = pages;
	}
}
